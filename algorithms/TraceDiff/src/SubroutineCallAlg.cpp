// ========== begin copyright notice ==============
// This file is part of 
// ---------------
// xaifBooster
// ---------------
// Distributed under the BSD license as follows:
// Copyright (c) 2005, The University of Chicago
// All rights reserved.
//
// Redistribution and use in source and binary forms, 
// with or without modification, are permitted provided that the following conditions are met:
//
//    - Redistributions of source code must retain the above copyright notice, 
//      this list of conditions and the following disclaimer.
//    - Redistributions in binary form must reproduce the above copyright notice, 
//      this list of conditions and the following disclaimer in the documentation 
//      and/or other materials provided with the distribution.
//    - Neither the name of The University of Chicago nor the names of its contributors 
//      may be used to endorse or promote products derived from this software without 
//      specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
// OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
// SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
// LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
// General Information:
// xaifBooster is intended for the transformation of 
// numerical programs represented as xml files according 
// to the XAIF schema. It is part of the OpenAD framework. 
// The main application is automatic 
// differentiation, i.e. the generation of code for 
// the computation of derivatives. 
// The following people are the principal authors of the 
// current version: 
// 	Uwe Naumann
//	Jean Utke
// Additional contributors are: 
//	Andrew Lyons
//	Peter Fine
//
// For more details about xaifBooster and its use in OpenAD please visit:
//   http://www.mcs.anl.gov/openad
//
// This work is partially supported by:
// 	NSF-ITR grant OCE-0205590
// ========== end copyright notice ==============
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/SubroutineCall.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/ArrayAccess.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"

#include "xaifBooster/algorithms/CodeReplacement/inc/ConceptuallyStaticInstances.hpp"

#include "xaifBooster/algorithms/TypeChange/inc/ConcreteArgumentAlg.hpp"
#include "xaifBooster/algorithms/TypeChange/inc/SymbolAlg.hpp"
#include "xaifBooster/algorithms/TypeChange/inc/BasicBlockAlgParameter.hpp"

#include "xaifBooster/algorithms/AdjointUtils/inc/BasicBlockPrintVersion.hpp"

#include "xaifBooster/algorithms/TraceDiff/inc/SubroutineCallAlg.hpp"
#include "xaifBooster/algorithms/TraceDiff/inc/Helpers.hpp"

namespace xaifBoosterTraceDiff {  

  SubroutineCallAlg::SubroutineCallAlg(const SubroutineCall& theContainingSubroutineCall) : 
    xaifBoosterTypeChange::SubroutineCallAlg(theContainingSubroutineCall) { 
  }

  SubroutineCallAlg::~SubroutineCallAlg() { 
    for (PlainBasicBlock::BasicBlockElementList::iterator aBasicBlockElementListI=
	   myCallTraces.begin();
	 aBasicBlockElementListI!=myCallTraces.end();
	 ++aBasicBlockElementListI) {
      if (*aBasicBlockElementListI)
	delete *aBasicBlockElementListI;
    }
    for (PlainBasicBlock::BasicBlockElementList::iterator aBasicBlockElementListI=
	   myReturnTraces.begin();
	 aBasicBlockElementListI!=myReturnTraces.end();
	 ++aBasicBlockElementListI) {
      if (*aBasicBlockElementListI)
	delete *aBasicBlockElementListI;
    }
  } 

  void
  SubroutineCallAlg::printXMLHierarchy(std::ostream& os) const { 
    if (xaifBoosterCodeReplacement::ConceptuallyStaticInstances::instance()->getPrintVersion()
	==
	xaifBoosterCodeReplacement::PrintVersion::ORIGINAL) { 
      xaifBoosterTypeChange::SubroutineCallAlg::printXMLHierarchy(os);
    }
    else { 
      // call traces 
      for (PlainBasicBlock::BasicBlockElementList::const_iterator aBasicBlockElementListI
	     =myCallTraces.begin();
	   aBasicBlockElementListI!=myCallTraces.end();
	   ++aBasicBlockElementListI) {
	if (*aBasicBlockElementListI) { 
	  (*aBasicBlockElementListI)->printXMLHierarchy(os);
	} 
      }
      // the call
      xaifBoosterTypeChange::SubroutineCallAlg::printXMLHierarchy(os);
      // return traces 
      for (PlainBasicBlock::BasicBlockElementList::const_iterator aBasicBlockElementListI
	     =myReturnTraces.begin();
	   aBasicBlockElementListI!=myReturnTraces.end();
	   ++aBasicBlockElementListI) {
	if (*aBasicBlockElementListI) { 
	  (*aBasicBlockElementListI)->printXMLHierarchy(os);
	} 
      }
    }
  } // end of BasicBlockAlg::printXMLHierarchy
  
  std::string 
  SubroutineCallAlg::debug() const { 
    std::ostringstream out;
    out << "xaifBoosterTraceDiff::SubroutineCallAlg["
	<< this 
	<< ","
 	<< SubroutineCallAlgBase::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  }

  void SubroutineCallAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  void SubroutineCallAlg::algorithm_action_2() { 
    xaifBoosterTypeChange::SymbolAlg& theSymbolAlg(dynamic_cast<xaifBoosterTypeChange::SymbolAlg&>
						   (getContainingSubroutineCall().
						    getSymbolReference().getSymbol().getSymbolAlgBase()));
    // we don't do this for external calls: 
    if(!theSymbolAlg.isExternal()) { 
      // trace the subroutine call: 
      xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theSubroutineCall_p;
      theSubroutineCall_p=new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("oad_trace_call");
      theSubroutineCall_p->setId("TraceDiff::SubroutineCallAlg::algorithm_action_2");
      myCallTraces.push_back(theSubroutineCall_p);
      ConcreteArgument& theName(theSubroutineCall_p->addConcreteArgument(1));
      theName.makeConstant(SymbolType::STRING_STYPE);
      theName.getConstant().setFromString(getContainingSubroutineCall().getSymbolReference().getSymbol().plainName());
      ConcreteArgument& theOriginalLine(theSubroutineCall_p->addConcreteArgument(2));
      theOriginalLine.makeConstant(SymbolType::INTEGER_STYPE);
      theOriginalLine.getConstant().setint(getContainingSubroutineCall().getLineNumber());
      // for each subroutinecall argument
      // trace a string for the name 
      for (SubroutineCall::ConcreteArgumentPList::const_iterator aConcreteArgumentPListI=
 	     getContainingSubroutineCall().getConcreteArgumentPList().begin();
 	   aConcreteArgumentPListI!=getContainingSubroutineCall().getConcreteArgumentPList().end();
 	   ++aConcreteArgumentPListI) { 
 	if ((*aConcreteArgumentPListI)->isArgument()) { 
	  Helpers::traceArgument((*aConcreteArgumentPListI)->getArgument(),
				 myCallTraces,
				 xaifBoosterTypeChange::BasicBlockAlgParameter::instance().get().getContaining().getScope());
	}
 	if ((*aConcreteArgumentPListI)->isConstant()) { 
	  theSubroutineCall_p=new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("oad_trace_arg");
	  theSubroutineCall_p->setId("TraceDiff::SubroutineCallAlg::algorithm_action_2");
	  myCallTraces.push_back(theSubroutineCall_p);
	  ConcreteArgument& theName(theSubroutineCall_p->addConcreteArgument(1));
	  theName.makeConstant(SymbolType::STRING_STYPE);
	  theName.getConstant().setFromString((*aConcreteArgumentPListI)->getConstant().toString());
	  theSubroutineCall_p=new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("oad_trace_earg");
	  theSubroutineCall_p->setId("TraceDiff::SubroutineCallAlg::algorithm_action_2");
	  myCallTraces.push_back(theSubroutineCall_p);
	}
      } // end for
      // trace the return 
      theSubroutineCall_p=new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("oad_trace_ecall");
      theSubroutineCall_p->setId("TraceDiff::SubroutineCallAlg::algorithm_action_2");
      myReturnTraces.push_back(theSubroutineCall_p);
    } 
  } 

} // end of namespace 
