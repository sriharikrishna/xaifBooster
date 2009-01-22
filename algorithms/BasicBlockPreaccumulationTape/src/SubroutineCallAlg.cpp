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
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/ControlFlowGraph.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"

#include "xaifBooster/algorithms/TypeChange/inc/ConcreteArgumentAlg.hpp"
#include "xaifBooster/algorithms/TypeChange/inc/SymbolAlg.hpp"
#include "xaifBooster/algorithms/TypeChange/inc/BasicBlockAlgParameter.hpp"

#include "xaifBooster/algorithms/AdjointUtils/inc/BasicBlockPrintVersion.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/SubroutineCallAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/BasicBlockAlg.hpp"

namespace xaifBoosterBasicBlockPreaccumulationTape {  

  SubroutineCallAlg::SubroutineCallAlg(const SubroutineCall& theContainingSubroutineCall) : 
    xaifBoosterTypeChange::SubroutineCallAlg(theContainingSubroutineCall) { 
  }

  SubroutineCallAlg::~SubroutineCallAlg() { 
    for (PlainBasicBlock::BasicBlockElementList::iterator aBasicBlockElementListI = myAfterCallIndexPushes.begin();
	 aBasicBlockElementListI != myAfterCallIndexPushes.end();
	 ++aBasicBlockElementListI) {
      if (*aBasicBlockElementListI)
	delete *aBasicBlockElementListI;
    }
  } 

  void
  SubroutineCallAlg::printXMLHierarchy(std::ostream& os) const { 
    // the call
    xaifBoosterTypeChange::SubroutineCallAlg::printXMLHierarchy(os);
    if (xaifBoosterAdjointUtils::BasicBlockPrintVersion::get()==ForLoopReversalType::ANONYMOUS) { 
      // pushes after the call
      for (PlainBasicBlock::BasicBlockElementList::const_iterator aBasicBlockElementListI = myAfterCallIndexPushes.begin();
	   aBasicBlockElementListI != myAfterCallIndexPushes.end();
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
    out << "xaifBoosterBasicBlockPreaccumulationTape::SubroutineCallAlg[" << this 
	<< "," << SubroutineCallAlgBase::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  }

  void SubroutineCallAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  void SubroutineCallAlg::checkAndPush(const Variable& theVariable) { 
    // has it been pushed already? 
    bool pushedAlready=false; 
    for (Expression::VariablePVariableSRPPairList::iterator it=myIndexVariablesPushed.begin();
	 it!=myIndexVariablesPushed.end();
	 ++it) { 
      DBG_MACRO(DbgGroup::DATA, "comparing " << theVariable.debug().c_str() << " to " << ((*it).first)->debug().c_str()); 
      if (theVariable.equivalentTo(*((*it).first))) { 
	pushedAlready=true; 
	break; 
      }
    }
    if (!pushedAlready) { 
      // make the subroutine call: 
      xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theSubroutineCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_i"));
      // save it in the list
      myAfterCallIndexPushes.push_back(theSubroutineCall_p);
      theSubroutineCall_p->setId("SRcall_inline_push_i");
      theVariable.copyMyselfInto(theSubroutineCall_p->addConcreteArgument(1).getArgument().getVariable());
      myIndexVariablesPushed.push_back(Expression::VariablePVariableSRPPair(&theVariable,0));
    }
  } // end SubroutineCallAlg::checkAndPush()

  void SubroutineCallAlg::algorithm_action_4() { 
    xaifBoosterTypeChange::SymbolAlg& theSymbolAlg(dynamic_cast<xaifBoosterTypeChange::SymbolAlg&>
						   (getContainingSubroutineCall().getSymbolReference().getSymbol().getSymbolAlgBase()));
    // we don't do this for external calls: 
    if(!theSymbolAlg.isExternal()) { 
      // for each subroutinecall argument
      // store the index variables via 
      // an InlinableSubroutinecall to push
      // note that here we don't use the fact that we are or are not in an explicit loop
      // store all the ones we have assigned already because of the conversion
      const Expression::VariablePVariableSRPPairList& theTypeChangePairs(mySaveValuesAcrossForTypeChange.getReplacementPairsList()); 
      for (Expression::VariablePVariableSRPPairList::const_iterator pairIt=theTypeChangePairs.begin();
	   pairIt!=theTypeChangePairs.end();
	   ++pairIt) { 
	// make the subroutine call: 
	xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theSubroutineCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_i"));
	// save it in the list
	myAfterCallIndexPushes.push_back(theSubroutineCall_p);
	theSubroutineCall_p->setId("SRcall_inline_push_i");
	// we need to push what we assigned to the temporary prior to the call 
	theSubroutineCall_p->addConcreteArgument(1).getArgument().getVariable().supplyAndAddVertexInstance((*pairIt).second->createCopyOfMyself());
	myIndexVariablesPushed.push_back(Expression::VariablePVariableSRPPair((*pairIt)));
      }
      // now figure out if we need to push more than that
      for (SubroutineCall::ConcreteArgumentPList::const_iterator aConcreteArgumentPListI = getContainingSubroutineCall().getConcreteArgumentPList().begin();
 	   aConcreteArgumentPListI != getContainingSubroutineCall().getConcreteArgumentPList().end();
 	   ++aConcreteArgumentPListI) {
 	if ((*aConcreteArgumentPListI)->isArgument()
 	    && 
 	    (*aConcreteArgumentPListI)->getArgument().getVariable().hasArrayAccess()) {
 	  handleArrayAccessIndices(**aConcreteArgumentPListI); 
 	}
      } // end for
      // now check if any values are required on entry: 
      const ControlFlowGraph& theCalleeCFG (ConceptuallyStaticInstances::instance()->getCallGraph().getSubroutineBySymbolReference(getContainingSubroutineCall().getSymbolReference()).getControlFlowGraph());
      const SideEffectList& theOnEntryList(theCalleeCFG.getSideEffectList(SideEffectListType::ON_ENTRY_LIST));
      if (theOnEntryList.getVariablePList().empty())
	return;
      for (VariablePList::const_iterator i = theOnEntryList.getVariablePList().begin(); i != theOnEntryList.getVariablePList().end(); ++i) {
	ControlFlowGraph::FormalResult theResult(theCalleeCFG.hasFormal((*i)->getVariableSymbolReference()));
	if (theResult.first) { // is a formal
	  const ConcreteArgument& theConcreteArgument(getContainingSubroutineCall().getConcreteArgument(theResult.second));
	  if (theConcreteArgument.isConstant())
	    continue; 
	  checkAndPush(theConcreteArgument.getArgument().getVariable());
	}
	else { // not a formal
	  checkAndPush(**i);
        } // end if/else formal
      } // end iterate over theOnEntryList
    } 
  } // end SubroutineCallAlg::algorithm_action_4()

  void SubroutineCallAlg::handleArrayAccessIndices(ConcreteArgument& theConcreteArgument) {
    const ArrayAccess::IndexTripletListType& theIndexTripletList(theConcreteArgument.getArgument().getVariable().getArrayAccess().getIndexTripletList());
    for (ArrayAccess::IndexTripletListType::const_iterator anIndexTripletListTypeCI=theIndexTripletList.begin();
	 anIndexTripletListTypeCI!=theIndexTripletList.end();
	 ++anIndexTripletListTypeCI) { 
      for (IndexTriplet::IndexPairList::const_iterator anIndexPairListCI=(*anIndexTripletListTypeCI)->getIndexPairList().begin();
	   anIndexPairListCI!=(*anIndexTripletListTypeCI)->getIndexPairList().end();
	   ++anIndexPairListCI) { 
	// now we have two cases, essentially the expression is a single vertex with a constant 
	// (this discounts constant expressions, this is a todo which might be dealt with later or 
	// it may be completly superceded by a TBR analysis)
	const Expression& theIndexExpression(*((*anIndexPairListCI).second));
	if (!theIndexExpression.isConstant()) {
	  Expression::CArgumentPList listToBeAppended;
	  theIndexExpression.appendArguments(listToBeAppended);
	  for (Expression::CArgumentPList::const_iterator argumentI=listToBeAppended.begin(); argumentI!=listToBeAppended.end(); ++argumentI) {
	    checkAndPush((*argumentI)->getVariable());
	  }
	} // end if the index expression is non-const
      }
    }
  } // end SubroutineCallAlg::handleArrayAccessIndices()

  const Expression::VariablePVariableSRPPairList& SubroutineCallAlg::getIndexVariablesPushed() const { 
    return myIndexVariablesPushed;
  } // end SubroutineCallAlg::getIndexVariablesPushed()
  
} // end namespace xaifBoosterBasicBlockPreaccumulationTape

