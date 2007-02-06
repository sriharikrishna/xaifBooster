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
#include "xaifBooster/utils/inc/LogicException.hpp"

#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/ArrayAccess.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/Scope.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorSaxpy.hpp"
#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"

#include "xaifBooster/algorithms/Linearization/inc/BasicBlockAlgParameter.hpp"

#include "xaifBooster/algorithms/AdjointUtils/inc/BasicBlockPrintVersion.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/BasicBlockAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationTape { 

  BasicBlockAlg::ReinterpretedDerivativePropagator::ReinterpretedDerivativePropagator(const xaifBoosterDerivativePropagator::DerivativePropagator& aPropagator) : 
    myOriginalPropagator(aPropagator) { 
  } 

  BasicBlockAlg::ReinterpretedDerivativePropagator::~ReinterpretedDerivativePropagator() { 
    for (PlainBasicBlock::BasicBlockElementList::const_iterator li=myBasicBlockElementListAnonymousReversal.begin();
         li!=myBasicBlockElementListAnonymousReversal.end();
         li++) { 
      if (*li)
	delete *li;
    } 
    for (PlainBasicBlock::BasicBlockElementList::const_iterator li=myBasicBlockElementListExplicitReversal.begin();
         li!=myBasicBlockElementListExplicitReversal.end();
         li++) { 
      if (*li)
	delete *li;
    } 
  } 

  const xaifBoosterDerivativePropagator::DerivativePropagator& 
  BasicBlockAlg::ReinterpretedDerivativePropagator::getOriginalDerivativePropagator() const { 
    return myOriginalPropagator;
  }  

  void 
  BasicBlockAlg::ReinterpretedDerivativePropagator::supplyAndAddBasicBlockElementInstance(BasicBlockElement& theBasicBlockElement,
											  const ForLoopReversalType::ForLoopReversalType_E& aReversalType) { 
    switch(aReversalType) { 
    case ForLoopReversalType::ANONYMOUS : 
      myBasicBlockElementListAnonymousReversal.push_back(&theBasicBlockElement);
      break;
    case ForLoopReversalType::EXPLICIT : 
      myBasicBlockElementListExplicitReversal.push_back(&theBasicBlockElement);
      break;
    default: 
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::supplyAndAddBasicBlockElementInstance: unknown reversal type "
				 << ForLoopReversalType::toString(aReversalType).c_str());
      break;
    }      
  } 

  const PlainBasicBlock::BasicBlockElementList& 
  BasicBlockAlg::ReinterpretedDerivativePropagator::getBasicBlockElementList(const ForLoopReversalType::ForLoopReversalType_E& aReversalType) const { 
    switch(aReversalType) { 
    case ForLoopReversalType::ANONYMOUS : 
      return myBasicBlockElementListAnonymousReversal;
      break;
    case ForLoopReversalType::EXPLICIT : 
      return myBasicBlockElementListExplicitReversal;
      break;
    default: 
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::getBasicBlockElementList: unknown reversal type "
				 << ForLoopReversalType::toString(aReversalType).c_str());
      break;
    }      
    // to make the compiler happy:
    return myBasicBlockElementListAnonymousReversal;
  }  

  BasicBlockAlg::BasicBlockAlg(BasicBlock& theContaining) : 
    xaifBooster::BasicBlockAlgBase(theContaining),
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg(theContaining) { 
  }

  BasicBlockAlg::~BasicBlockAlg() {
    for (ReinterpretedDerivativePropagatorPList::iterator aReinterpretedDerivativePropagatorListI=myReinterpretedDerivativePropagatorPList.begin();
	 aReinterpretedDerivativePropagatorListI!=myReinterpretedDerivativePropagatorPList.end();
	 ++aReinterpretedDerivativePropagatorListI) { 
      if (*aReinterpretedDerivativePropagatorListI) 
	delete *aReinterpretedDerivativePropagatorListI;
    }
  }

  void
  BasicBlockAlg::printXMLHierarchy(std::ostream& os) const { 
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::printXMLHierarchyImpl(os,
									       printDerivativePropagatorAsTape);
  } // end of BasicBlockAlg::printXMLHierarchy
  
  void BasicBlockAlg::printDerivativePropagatorAsTape(std::ostream& os,
						      const BasicBlockAlgBase& aBasicBlockAlg, 
						      const xaifBoosterDerivativePropagator::DerivativePropagator& aPropagator) { 
    const BasicBlockAlg& ourAlgorithm(dynamic_cast<const BasicBlockAlg&>(aBasicBlockAlg));
    bool found=false;
    for (ReinterpretedDerivativePropagatorPList::const_iterator aReinterpretedDerivativePropagatorPListI=ourAlgorithm.myReinterpretedDerivativePropagatorPList.begin();
	 aReinterpretedDerivativePropagatorPListI!=ourAlgorithm.myReinterpretedDerivativePropagatorPList.end();
	 ++aReinterpretedDerivativePropagatorPListI) { 
      if (&((*aReinterpretedDerivativePropagatorPListI)->getOriginalDerivativePropagator())==&aPropagator) { 
	// this is the right one: 
	found=true;
	for (PlainBasicBlock::BasicBlockElementList::const_iterator aBasicBlockElementListI=
	       (*aReinterpretedDerivativePropagatorPListI)->getBasicBlockElementList(xaifBoosterAdjointUtils::BasicBlockPrintVersion::get()).begin();
	     aBasicBlockElementListI!=
	       (*aReinterpretedDerivativePropagatorPListI)->getBasicBlockElementList(xaifBoosterAdjointUtils::BasicBlockPrintVersion::get()).end();
	     ++aBasicBlockElementListI)
	  (*(aBasicBlockElementListI))->printXMLHierarchy(os);
	break; 
      } // end if 
    } 
    if (!found) 
      // we didn't find it...
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::printDerivativePropagatorAsTape: didn't find proper ReinterpretedDerivativePropagator");
  }

  void BasicBlockAlg::algorithm_action_4() { 
    static unsigned int recursionGuard=0;
    try { 
      recursionGuard++;
      if (recursionGuard>1)
	THROW_LOGICEXCEPTION_MACRO("xaifBoosterBasicBlockPreaccumulartionTape::BasicBlockAlg::algorithm_action_4: recursive invocation not allowed");
      DBG_MACRO(DbgGroup::CALLSTACK, "xaifBoosterBasicBlockPreaccumulartionTape::BasicBlockAlg::algorithm_action_4");
      
      // the BasicBlock instance will be used in SubroutineCallAlg::algorithm_action_4():
      // because of virtual function use on the system structural level we cannot 
      // invoke directly and need to rely on GenericTraverseInvoke
      // In order to pass parameters through BasicBlockParameter
      // we have to make sure that this method is never invoked recursively
      xaifBoosterLinearization::BasicBlockAlgParameter::instance().set(*this);	// in BasicBlockAlg::algorithm_action_4()
    } 
    catch (...) { 
      recursionGuard--;
      throw;
    }
    recursionGuard--;
    int count = 0;
    // for each propagator:
    // create an InlinableSubroutinecall for each Variable in each saxpy element in the propagator
    // and also one for each index of target or source vertices
    // The order is fixed as follows:
    // - pairs of : 
    //   - JacobianEntry value (if variable)
    //   - Source index value (if variable array index)
    // - Target index value (if variable array index) 
    // obviously this order has to be matched by the reverse sweep reading this tape.
    for (SequenceHolder::SequencePList::const_iterator aSequencePListI=getBestSequenceHolder().getUniqueSequencePList().begin();
	 aSequencePListI!=getBestSequenceHolder().getUniqueSequencePList().end();
	 ++aSequencePListI) {
      // make a reinterpretation instance which refers back to the original one
      ReinterpretedDerivativePropagator* aReinterpretedDerivativePropagator_p(new ReinterpretedDerivativePropagator((*aSequencePListI)->myDerivativePropagator));
      // save it in the list
      myReinterpretedDerivativePropagatorPList.push_back(aReinterpretedDerivativePropagator_p);
      // now look at the original one: 
      const xaifBoosterDerivativePropagator::DerivativePropagator::EntryPList& theEntryPList((*aSequencePListI)->myDerivativePropagator.getEntryPList());
      for (xaifBoosterDerivativePropagator::DerivativePropagator::EntryPList::const_iterator entryPListI=theEntryPList.begin();
	   entryPListI!=theEntryPList.end();
	   ++entryPListI) { 
	xaifBoosterDerivativePropagator::DerivativePropagatorEntry::FactorList aFactorList;
	(*entryPListI)->getFactors(aFactorList);
	for (xaifBoosterDerivativePropagator::DerivativePropagatorEntry::FactorList::iterator aFactorListI=aFactorList.begin();
	     aFactorListI!=aFactorList.end();
	     ++aFactorListI) { 
	  // take care of the value
	  if ((*aFactorListI).getKind()==xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::VARIABLE_FACTOR) { 
	    // make the subroutine call
	    // ANONYMOUS version
	   count++;
	    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theSubroutineCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push"));
	    theSubroutineCall_p->setId("inline_push");
	    (*aFactorListI).getVariable().copyMyselfInto(theSubroutineCall_p->addConcreteArgument(1).getArgument().getVariable());
	    // save it in the list
	    aReinterpretedDerivativePropagator_p->supplyAndAddBasicBlockElementInstance(*theSubroutineCall_p, 
											ForLoopReversalType::ANONYMOUS);
	    // EXPLICIT version
	    theSubroutineCall_p=new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push");
	    theSubroutineCall_p->setId("inline_push");
	    (*aFactorListI).getVariable().copyMyselfInto(theSubroutineCall_p->addConcreteArgument(1).getArgument().getVariable());
	    // save it in the list
	    aReinterpretedDerivativePropagator_p->supplyAndAddBasicBlockElementInstance(*theSubroutineCall_p, 
											ForLoopReversalType::EXPLICIT);
	  }
	  // take care of source the addresses if needed: 
	  if ((*aFactorListI).getKind()!=xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::ZERO_FACTOR) { 
	    // take care of the source address
	    const Variable& theSource((*aFactorListI).getSource());
	    if (theSource.hasArrayAccess()) {
	      reinterpretArrayAccess(*aReinterpretedDerivativePropagator_p,
				     theSource.getArrayAccess()); 
	    } 
	  } // end if 
	} // end for (factor list)
	// take care of target address if needed: 
	const Variable& theTarget((*entryPListI)->getTarget());
	if (theTarget.hasArrayAccess()) {
	  reinterpretArrayAccess(*aReinterpretedDerivativePropagator_p,
				 theTarget.getArrayAccess()); 
	} 
      } // end for (propagator entry list) 
//      std::cout << "count: " << count << std::endl; //Basic block level taping output
    } // end for (sequence list) 
  } 

  void
  BasicBlockAlg::reinterpretArrayAccess(BasicBlockAlg::ReinterpretedDerivativePropagator& aReinterpretedDerivativePropagator,
					const ArrayAccess& theArrayAccess) { 
    const ArrayAccess::IndexListType& theIndexList(theArrayAccess.getIndexList());
    for (ArrayAccess::IndexListType::const_iterator anIndexListTypeCI=theIndexList.begin();
	 anIndexListTypeCI!=theIndexList.end();
	 ++anIndexListTypeCI) { 
      // now we have two cases, essentially the expression is a single vertex with a constant 
      // (this discounts constant expressions, this is a todo which might be dealt with later or 
      // it may be completely superceded by a TBR analysis)
      const Expression& theIndexExpression(**anIndexListTypeCI);
      if (theIndexExpression.numVertices()==1) { 
	// now it could be either a Constant or an Argument
	Expression::ConstVertexIteratorPair p(theIndexExpression.vertices());
	// has only one: 
	if ((*(p.first)).isArgument()) { 
	  // it is a variable whose value we want to push
	  // make it
	  xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theSubroutineCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_i"));
	  // save it in the list
	  aReinterpretedDerivativePropagator.supplyAndAddBasicBlockElementInstance(*theSubroutineCall_p,
										   ForLoopReversalType::ANONYMOUS);
	  theSubroutineCall_p->setId("reinterpretArrayaccess:inline_push_i");
	  dynamic_cast<const Argument&>(*(p.first)).getVariable().copyMyselfInto(theSubroutineCall_p->addConcreteArgument(1).getArgument().getVariable());
	}
      } // has one vertex 
      else {  // has more then one vertex
	// make it
	Assignment* theIndexExpressionAssignment_p(new Assignment(false));
	// save it in the list
	aReinterpretedDerivativePropagator.supplyAndAddBasicBlockElementInstance(*theIndexExpressionAssignment_p,
										 ForLoopReversalType::ANONYMOUS);
	theIndexExpressionAssignment_p->setId("index_expression_assignment_for_taping");
	// create a new symbol and add a new VariableSymbolReference in the Variable
	VariableSymbolReference* theNewVariableSymbolReference_p=
	  new VariableSymbolReference(getContaining().getScope().
				      getSymbolTable().
				      addUniqueAuxSymbol(SymbolKind::VARIABLE,
							 SymbolType::INTEGER_STYPE,
							 SymbolShape::SCALAR,
							 false),
				      getContaining().getScope());
	theNewVariableSymbolReference_p->setId("1");
	theNewVariableSymbolReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulationTape::BasicBlockAlg::reinterpretArrayAccess");
	// pass it on to the LHS and relinquish ownership
	theIndexExpressionAssignment_p->getLHS().supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
	theIndexExpressionAssignment_p->getLHS().getAliasMapKey().setTemporary();
	theIndexExpressionAssignment_p->getLHS().getDuUdMapKey().setTemporary();
	// set the RHS
	theIndexExpression.copyMyselfInto(theIndexExpressionAssignment_p->getRHS(),false,false);
	// make the subroutine call: 
	xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theSubroutineCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_i"));
	// save it in the list
	aReinterpretedDerivativePropagator.supplyAndAddBasicBlockElementInstance(*theSubroutineCall_p, 
										 ForLoopReversalType::ANONYMOUS);
	theSubroutineCall_p->setId("reinterpretArrayaccess:inline_push_i");
	theIndexExpressionAssignment_p->getLHS().copyMyselfInto(theSubroutineCall_p->addConcreteArgument(1).getArgument().getVariable());
      }  // end else has more then one vertex   
    } // end for i
  } // end of BasicBlockAlg::reinterpretArrayAccess

  std::string BasicBlockAlg::debug () const { 
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulationTape::BasicBlockAlg[" << this
 	<< "]" << std::ends;  
    return out.str();
  } // end of BasicBlockAlg::debug

  void BasicBlockAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

} // end of namespace xaifBoosterAngelInterfaceAlgorithms 
