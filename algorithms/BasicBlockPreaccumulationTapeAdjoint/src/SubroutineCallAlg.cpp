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

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/SubroutineCallAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/BasicBlockAlg.hpp"

namespace xaifBoosterBasicBlockPreaccumulationTapeAdjoint {  

  SubroutineCallAlg::SubroutineCallAlg(const SubroutineCall& theContainingSubroutineCall) : 
    xaifBoosterLinearization::SubroutineCallAlg(theContainingSubroutineCall),
    BasicBlockElementAlg(theContainingSubroutineCall) { 
  }

//   void SubroutineCallAlg::printXMLHierarchy(std::ostream& os) const { 
//     SubroutineCallAlgBase::printXMLHierarchy(os);
//   }

  std::string 
  SubroutineCallAlg::debug() const { 
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulationTapeAdjoint::SubroutineCallAlg["
	<< this 
	<< ","
 	<< SubroutineCallAlgBase::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  }

  void SubroutineCallAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  void SubroutineCallAlg::insertYourself(const BasicBlock& theBasicBlock) { 
    BasicBlockAlg& theBasicBlockAlg(dynamic_cast<BasicBlockAlg&>(theBasicBlock.getBasicBlockAlgBase()));
//    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theRevModeCall(theBasicBlockAlg.addInlinableSubroutineCall("adjoint_mode"));
//    theRevModeCall.setId("inline_adjoint_mode");
    SubroutineCall& theNewSubroutineCall(theBasicBlockAlg.addSubroutineCall(getContainingSubroutineCall().getSymbolReference().getSymbol(),
									    getContainingSubroutineCall().getSymbolReference().getScope(),
									    getContainingSubroutineCall().getActiveUse(),
									    theBasicBlockAlg.getReversalType()));
    const SubroutineCall::ConcreteArgumentPList& theOldConcreteArgumentPList(getContainingSubroutineCall().getConcreteArgumentPList());
    SubroutineCall::ConcreteArgumentPList& theNewConcreteArgumentPList(theNewSubroutineCall.getConcreteArgumentPList());
    for (SubroutineCall::ConcreteArgumentPList::const_iterator theOldConcreteArgumentPListI=theOldConcreteArgumentPList.begin();
	 theOldConcreteArgumentPListI!=theOldConcreteArgumentPList.end();
	 ++theOldConcreteArgumentPListI) { 
      ConcreteArgument* theNewConcreteArgument_p(new ConcreteArgument((*theOldConcreteArgumentPListI)->getPosition()));
      theNewConcreteArgumentPList.push_back(theNewConcreteArgument_p);
      (*theOldConcreteArgumentPListI)->copyMyselfInto(*theNewConcreteArgument_p);
    } // end for
    // reapply any argument conversions we may need
    dynamic_cast<xaifBoosterLinearization::SubroutineCallAlg&>(theNewSubroutineCall.getSubroutineCallAlgBase()).xaifBoosterLinearization::SubroutineCallAlg::algorithm_action_1();
//    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theRestoreModeCall(theBasicBlockAlg.addInlinableSubroutineCall("restore_mode"));
//    theRestoreModeCall.setId("inline_restore_mode");
  } 
  
} // end of namespace 
