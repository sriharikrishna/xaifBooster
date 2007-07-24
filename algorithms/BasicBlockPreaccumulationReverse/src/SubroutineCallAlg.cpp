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
#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/system/inc/BasicBlockElement.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/SubroutineCall.hpp"
#include "xaifBooster/algorithms/TypeChange/inc/SymbolAlg.hpp"
#include "xaifBooster/algorithms/TypeChange/inc/ConcreteArgumentAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/SubroutineCallAlg.hpp"
#include "xaifBooster/algorithms/CodeReplacement/inc/ConceptuallyStaticInstances.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationReverse { 

  SubroutineCallAlg::SubroutineCallAlg(SubroutineCall& theContaining) : 
    xaifBoosterTypeChange::SubroutineCallAlg(theContaining),
    xaifBoosterBasicBlockPreaccumulationTape::SubroutineCallAlg(theContaining),
    xaifBoosterBasicBlockPreaccumulationTapeAdjoint::SubroutineCallAlg(theContaining){ 
  }

  void
  SubroutineCallAlg::printXMLHierarchy(std::ostream& os) const { 
    switch(xaifBoosterCodeReplacement::ConceptuallyStaticInstances::instance()->getPrintVersion()) { 
    case xaifBoosterCodeReplacement::PrintVersion::ORIGINAL: { 
      // pick a path:
      dynamic_cast<const xaifBoosterBasicBlockPreaccumulationTapeAdjoint::SubroutineCallAlg*>(this)->
	xaifBoosterTypeChange::SubroutineCallAlg::printXMLHierarchy(os);
      break;
    }
    case xaifBoosterCodeReplacement::PrintVersion::AUGMENTED: 
      xaifBoosterBasicBlockPreaccumulationTape::SubroutineCallAlg::printXMLHierarchy(os);
      break;
    case xaifBoosterCodeReplacement::PrintVersion::ADJOINT: 
      xaifBoosterBasicBlockPreaccumulationTapeAdjoint::SubroutineCallAlg::printXMLHierarchy(os);
      break;
    default: 
      THROW_LOGICEXCEPTION_MACRO("SubroutineCallAlg::printXMLHierarchy: cannot handle PrintVersion "
				 << xaifBoosterCodeReplacement::PrintVersion::toString(xaifBoosterCodeReplacement::ConceptuallyStaticInstances::instance()->
							   getPrintVersion()).c_str());
      break;
    } // end switch
  } // end of SubroutineCallAlg::printXMLHierarchy
  
  std::string SubroutineCallAlg::debug () const { 
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulationReverse::SubroutineCallAlg[" << this
 	<< "]" << std::ends;  
    return out.str();
  } // end of SubroutineCallAlg::debug

  void SubroutineCallAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  void SubroutineCallAlg::algorithm_action_1() { 
    // pick a path
    dynamic_cast<xaifBoosterBasicBlockPreaccumulationTapeAdjoint::SubroutineCallAlg*>(this)->xaifBoosterTypeChange::SubroutineCallAlg::algorithm_action_1();
  }

  void SubroutineCallAlg::algorithm_action_2() { 
    // get the symbol's algorithm object
    xaifBoosterTypeChange::SymbolAlg& theSymbolAlg(dynamic_cast<xaifBoosterTypeChange::SymbolAlg&>(getContainingSubroutineCall().
												   getSymbolReference().getSymbol().getSymbolAlgBase()));
    if (theSymbolAlg.hasRepresentativeConstPattern()) { 
      // we ask this because the routine may in effect not be called anywhere
      // and so we would never get a representative
      // do a check on the const pattern:
      xaifBoosterTypeChange::SignaturePattern thisCallsConstPattern;
      thisCallsConstPattern.setSize(getContainingSubroutineCall().
				    getConcreteArgumentPList().
				    size());
      if (thisCallsConstPattern.getSize()!=theSymbolAlg.getRepresentativeConstPattern().getSize()) { 
	THROW_LOGICEXCEPTION_MACRO("SubroutineCallAlg::algorithm_action_1: argument count inconsistent between calls for "
				   << getContainingSubroutineCall().getSymbolReference().debug().c_str());
      } 
      for (SubroutineCall::ConcreteArgumentPList::const_iterator concreteArgumentPI=
	     getContainingSubroutineCall().getConcreteArgumentPList().begin();
	   concreteArgumentPI!=getContainingSubroutineCall().getConcreteArgumentPList().end();
	   ++concreteArgumentPI) { 
	// get alg
	xaifBoosterTypeChange::ConcreteArgumentAlg& theArgAlg(dynamic_cast<xaifBoosterTypeChange::ConcreteArgumentAlg&>((*concreteArgumentPI)->getConcreteArgumentAlgBase()));
	if ((*concreteArgumentPI)->isConstant()
	    && 
	    ! theArgAlg.hasReplacement())
	  // no need to track a constant that is replaced anyway
	  thisCallsConstPattern.trackAt((*concreteArgumentPI)->getPosition());
      } 
      if (thisCallsConstPattern!=theSymbolAlg.getRepresentativeConstPattern()) { 
	THROW_LOGICEXCEPTION_MACRO("SubroutineCallAlg::algorithm_action_2: inconsistent const patterns in position(s) "
				   << thisCallsConstPattern.discrepancyPositions(theSymbolAlg.getRepresentativeConstPattern()).c_str()
				   << " for call to subroutine " 
				   << getContainingSubroutineCall().getSymbolReference().debug().c_str());
      }
    }
  }

} // end of namespace
