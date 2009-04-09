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

#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/Scope.hpp"
#include "xaifBooster/system/inc/SubroutineCall.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"
#include "xaifBooster/system/inc/ArrayAccess.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"

#include "xaifBooster/algorithms/AdjointUtils/inc/BasicBlockPrintVersion.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/BasicBlockElementAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationTapeAdjoint { 

  BasicBlockAlg::BasicBlockAlg(BasicBlock& theContaining) : 
    xaifBooster::BasicBlockAlgBase(theContaining),
    xaifBoosterBasicBlockPreaccumulationTape::BasicBlockAlg(theContaining) { 
  }

  BasicBlockAlg::~BasicBlockAlg() { 
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

  void
  BasicBlockAlg::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << PlainBasicBlock::ourXAIFName.c_str()
       << " " 
       << PlainBasicBlock::our_myId_XAIFName.c_str()
       << "=\"" 
       << getContaining().getId().c_str()
       << "\" " 
       << ObjectWithAnnotation::our_myAnnotation_XAIFName.c_str() 
       << "=\""
       << getContaining().getAnnotation().c_str()
       << "\" " 
       << PlainBasicBlock::our_myScopeId_XAIFName.c_str() 
       << "=\""
       << getContaining().getScope().getId().c_str()
       << "\">" 
       << std::endl;
    const PlainBasicBlock::BasicBlockElementList& aBasicBlockElementList(getBasicBlockElementList(xaifBoosterAdjointUtils::BasicBlockPrintVersion::get()));
    for (PlainBasicBlock::BasicBlockElementList::const_iterator li=aBasicBlockElementList.begin();
	 li!=aBasicBlockElementList.end();
	 li++)
      (*(li))->printXMLHierarchy(os);
    os << pm.indent()
       << "</"
       << PlainBasicBlock::ourXAIFName.c_str()
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of BasicBlockAlg::printXMLHierarchy
  
  std::string BasicBlockAlg::debug () const { 
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg[" << this
	<< "]" << std::ends;  
    return out.str();
  } // end of BasicBlockAlg::debug

  void BasicBlockAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& 
  BasicBlockAlg::addInlinableSubroutineCall(const std::string& aSubroutineName,
					    const ForLoopReversalType::ForLoopReversalType_E& aReversalType) { 
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* aNewCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall(aSubroutineName));
    getBasicBlockElementList(aReversalType).push_back(aNewCall_p);
    return *aNewCall_p;									     
  } 
  
  SubroutineCall& 
  BasicBlockAlg::addSubroutineCall(const Symbol& aSubroutineNameSymbol,
				   const Scope& aSubroutineNameScope,
				   ActiveUseType::ActiveUseType_E anActiveUse,
				   const ForLoopReversalType::ForLoopReversalType_E& aReversalType) { 
    SubroutineCall* aNewCall_p(new SubroutineCall(aSubroutineNameSymbol,
						  aSubroutineNameScope,
						  anActiveUse,
						  true));
    aNewCall_p->setId("reverse_call");
    getBasicBlockElementList(aReversalType).push_back(aNewCall_p);
    return *aNewCall_p;									     
  } 

  void BasicBlockAlg::reinterpretArrayAccess(const Variable& theOriginalVariable,
					     Variable& theNewVariable,
					     const ForLoopReversalType::ForLoopReversalType_E& aReversalType) { 
    DBG_MACRO(DbgGroup::CALLSTACK, "xaifBoosterBasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg::reinterpretArrayAccess");
    theOriginalVariable.copyMyselfInto(theNewVariable);
    if (!theOriginalVariable.hasArrayAccess() || aReversalType==ForLoopReversalType::EXPLICIT)
      return;
    // otherwise we will replace index expressions: 
    ArrayAccess::IndexTripletListType& theNewIndexTripletList(theNewVariable.getArrayAccess().getIndexTripletList());
    const ArrayAccess::IndexTripletListType& theOriginalIndexTripletList(theOriginalVariable.getArrayAccess().getIndexTripletList());
    ArrayAccess::IndexTripletListType::reverse_iterator aNewIndexTripletListTypeI=theNewIndexTripletList.rbegin() ;
    for (ArrayAccess::IndexTripletListType::const_reverse_iterator anOriginalIndexTripletListTypeCI=theOriginalIndexTripletList.rbegin();
	 anOriginalIndexTripletListTypeCI!=theOriginalIndexTripletList.rend();
	 ++anOriginalIndexTripletListTypeCI,
	   ++aNewIndexTripletListTypeI) { 
      for (IndexTriplet::IndexPairList::const_iterator anIndexPairListCI=(*anOriginalIndexTripletListTypeCI)->getIndexPairList().begin();
	   anIndexPairListCI!=(*anOriginalIndexTripletListTypeCI)->getIndexPairList().end();
	   ++anIndexPairListCI) { 
	// now we have two cases, essentially the expression is a single vertex with a constant 
	// (this discounts constant expressions, this is a todo which might be dealt with later or 
	// it may be completelt superceded by a TBR analysis)
	const Expression& theIndexExpression (*((*anIndexPairListCI).second));
        if (!theIndexExpression.isConstant()) {
	  // it is a variable or expression whose value we pushed and now want to pop and replace.
	  // First clear the old index expression that we copied into aNewIndexTripletListTypeI
	  (*aNewIndexTripletListTypeI)->getExpression((*anIndexPairListCI).first).clear();

          const Variable* thePoppedAddressVariable_p = NULL;
          if (theIndexExpression.numVertices() == 1) {
            // In this case, the address variable has already been popped, and so we must just find the variable it has been popped into
            const Variable& theAddressVariable (dynamic_cast<const Argument&>(theIndexExpression.getMaxVertex()).getVariable());
            // find the popped factor variable from the correlation list
            DBG_MACRO(DbgGroup::DATA,"BasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg::reinterpretArrayAccess: "
                                     << "Trying to find " << theAddressVariable.debug() << ":");
            VariablePPairList::const_iterator avCorI;
            for (avCorI = myAddressVariableCorList.begin(); avCorI != myAddressVariableCorList.end(); ++avCorI) {
              DBG_MACRO(DbgGroup::DATA,"BasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg::reinterpretArrayAccess: "
                                       << "      trying " << (*avCorI).first->debug());
              if (theAddressVariable.equivalentTo(*(*avCorI).first))
                break;
            }
            if (avCorI == myAddressVariableCorList.end())
              THROW_LOGICEXCEPTION_MACRO("xaifBoosterBasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg::reinterpretArrayAccess: "
                                         << "could not correlate pushed address variable with popped address variable");
            thePoppedAddressVariable_p = (*avCorI).second;
          } // end if expression has only 1 vertex
          else { // more than one vertex in index expression => an assignment was created in taping phase and only the LHS was pushed
            thePoppedAddressVariable_p = &addAddressPop(aReversalType);
          } // end if >1 vertex

          // create a copy of the variable in the indexExpression: 
          Argument& theNewArgument (*new Argument);
          // relinquish ownership to the index expression: 
          (*aNewIndexTripletListTypeI)->getExpression((*anIndexPairListCI).first).supplyAndAddVertexInstance(theNewArgument);
          theNewArgument.setId(1);
          thePoppedAddressVariable_p->copyMyselfInto(theNewArgument.getVariable());
        } // end if index expression is non-constant
      } // end for all index pairs
    } // end for all index triplets
  } // end BasicBlockAlg::reinterpretArrayAccess()

  void BasicBlockAlg::algorithm_action_5() { // adjoin the DerivativePropagators
    DBG_MACRO(DbgGroup::CALLSTACK, "xaifBoosterBasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg::algorithm_action_5(adjoin propagators)");
    if (getContaining().getBasicBlockElementList().empty())
      return;
    // mesh the BasicBlockElements with the Sequences
    PlainBasicBlock::BasicBlockElementList::const_reverse_iterator aBasicBlockElementListRI=getContaining().getBasicBlockElementList().rbegin();
    SequencePList::const_reverse_iterator aSequencePListRI = myUniqueSequencePList.rbegin();
    SequencePList::const_reverse_iterator aSequencePListRend = myUniqueSequencePList.rend();
    std::list<PerSequenceData*>::const_reverse_iterator seqDataPListRI = myPerSequenceDataPList.rbegin();
    bool noSequence=false;
    if (aSequencePListRI==aSequencePListRend)
      // we don't have any sequence left, meaning there is either no sequence at all 
      // or we are at the end where there is a bit left without a sequence
      noSequence=true;
    bool done=false; // are we all done?
    while (!done) { 
      // deal with the bit outside the current Sequence
      while (noSequence ||
	     (*aSequencePListRI)->myLastElement_p!=(*aBasicBlockElementListRI)) { 
	// let the stuff outside the sequence insert itself 
	dynamic_cast<BasicBlockElementAlg&>((**aBasicBlockElementListRI).getBasicBlockElementAlgBase()).insertYourself(getContaining());
	++aBasicBlockElementListRI;
	if (aBasicBlockElementListRI==getContaining().getBasicBlockElementList().rend()) { 
	  done=true;
	  break;
	}
      } // end while
	// now we are done or (*aSequencePListRI)->myLastElement_p==(*aBasicBlockElementListRI))
      while (!done  // this implies noSequence=false
	     && 
	     (*aSequencePListRI)->myFirstElement_p!=(*aBasicBlockElementListRI)) { 
	// this should bring us to the begin of the sequence
	++aBasicBlockElementListRI;
	if (aBasicBlockElementListRI==getContaining().getBasicBlockElementList().rend()) { 
	  done=true;
	  break;
	}
      }
      if (!done) { 
        // pop all of the address variables
        for (VariablePList::const_reverse_iterator pushedAddVarPrI = (*seqDataPListRI)->myPushedAddressVariablesPList.rbegin();
             pushedAddVarPrI != (*seqDataPListRI)->myPushedAddressVariablesPList.rend(); ++pushedAddVarPrI) {
          const Variable& thePoppedAddressVariable (addAddressPop(ForLoopReversalType::ANONYMOUS));
          DBG_MACRO(DbgGroup::DATA,"BasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg::algorithm_action_5: "
                                   << "Popping address into variable " << thePoppedAddressVariable.debug());
          //addAddressPop(ForLoopReversalType::EXPLICIT);
          // we push to the front so that when we search from the beginning we find the most recent addition,
          // which should be the appropriate one for the occurance of this variable in this sequence
          myAddressVariableCorList.push_front(std::make_pair(*pushedAddVarPrI,&thePoppedAddressVariable));
        }
        // pop all of the factor variables
        for (VariablePList::const_reverse_iterator pushedFacVarPrI = (*seqDataPListRI)->myPushedFactorVariablesPList.rbegin();
             pushedFacVarPrI != (*seqDataPListRI)->myPushedFactorVariablesPList.rend(); ++pushedFacVarPrI) {
          // the inlinable call needs a temporary which contains the factor
          const Symbol& aTemporarySymbol (getContaining().getScope().getSymbolTable().addUniqueAuxSymbol(SymbolKind::VARIABLE,
                                                                                                         SymbolType::REAL_STYPE,
                                                                                                         SymbolShape::SCALAR,
                                                                                                         false));
          // Anonymous version
          const Variable& thePoppedFactorVariable (addFactorPop(aTemporarySymbol,
                                                                ForLoopReversalType::ANONYMOUS));
          // Explicit version (we can use the same symbol for the popped factor variable)
          addFactorPop(aTemporarySymbol,
              	       ForLoopReversalType::EXPLICIT);
          myFactorVariableCorList.push_back(std::make_pair(*pushedFacVarPrI,&thePoppedFactorVariable));
        } // end for all pushed factor variables

	const xaifBoosterDerivativePropagator::DerivativePropagator& aDerivativePropagator((*aSequencePListRI)->myDerivativePropagator);
	for(xaifBoosterDerivativePropagator::DerivativePropagator::EntryPList::const_reverse_iterator entryPListI=
	      aDerivativePropagator.getEntryPList().rbegin();
	    entryPListI!= aDerivativePropagator.getEntryPList().rend();
	    ++entryPListI) {
	  reinterpretDerivativePropagatorEntry(**entryPListI);
	} // end for DerivativePropagatorEntry list
	++aSequencePListRI;
        ++seqDataPListRI;
	if (aSequencePListRI==aSequencePListRend)
	  // there is no sequence left
	  noSequence=true;
      } // end of if (!done)
    } // end while (!done)
  } // end BasicBlockAlg::algorithm_action_5()

  void BasicBlockAlg::addZeroDeriv(Variable& theTarget,
				   const ForLoopReversalType::ForLoopReversalType_E& aReversalType) { 
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theSubroutineCall(addInlinableSubroutineCall("ZeroDeriv",
														 aReversalType));
    theSubroutineCall.setId("inline_zeroderiv");
    theTarget.copyMyselfInto(theSubroutineCall.addConcreteArgument(1).getArgument().getVariable());
  } 

  void BasicBlockAlg::addUnitFactor(Variable& theSource,
				    Variable& theTarget,
				    const ForLoopReversalType::ForLoopReversalType_E& aReversalType) { 
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theSetDerivCall(addInlinableSubroutineCall("IncDeriv",
                                                                                                               aReversalType));
    theSetDerivCall.setId("inline_IncDeriv");
    theTarget.copyMyselfInto(theSetDerivCall.addConcreteArgument(1).getArgument().getVariable());
    theSource.copyMyselfInto(theSetDerivCall.addConcreteArgument(2).getArgument().getVariable());
  } // end BasicBlockAlg::addUnitFactor()

  void BasicBlockAlg::addNegativeUnitFactor(Variable& theSource,
                                            Variable& theTarget,
                                            const ForLoopReversalType::ForLoopReversalType_E& aReversalType) { 
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theDecDerivCall (addInlinableSubroutineCall("DecDeriv",
                                                                                                                aReversalType));
    theDecDerivCall.setId("inline_DecDeriv");
    theTarget.copyMyselfInto(theDecDerivCall.addConcreteArgument(1).getArgument().getVariable());
    theSource.copyMyselfInto(theDecDerivCall.addConcreteArgument(2).getArgument().getVariable());
  } // end BasicBlockAlg::addNegativeUnitFactor()

  const Variable& BasicBlockAlg::addFactorPop(const Symbol& aTemporarySymbol,
					      const ForLoopReversalType::ForLoopReversalType_E& aReversalType) { 
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theFactorPopCall (addInlinableSubroutineCall("Pop",
                                                                                                                 aReversalType));
    theFactorPopCall.setId("inline_pop");
    Variable& theInlineVariable(theFactorPopCall.addConcreteArgument(1).getArgument().getVariable());
    // give it a name etc.
    // create a new symbol and add a new VariableSymbolReference in the Variable
    VariableSymbolReference* theNewVariableSymbolReference_p=
      new VariableSymbolReference(aTemporarySymbol,
				  getContaining().getScope());
    theNewVariableSymbolReference_p->setId("1");
    theNewVariableSymbolReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg::addFactorPop");
    // pass it on to the variable and relinquish ownership
    theInlineVariable.supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
    theInlineVariable.getAliasMapKey().setTemporary();
    theInlineVariable.getDuUdMapKey().setTemporary();
    return theInlineVariable;
  } 

  const Variable& BasicBlockAlg::addAddressPop(const ForLoopReversalType::ForLoopReversalType_E& aReversalType) {
    // pop the value
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theAddressPopCall (addInlinableSubroutineCall("pop_i",
                                                                                                                  aReversalType));
    theAddressPopCall.setId("inline_pop_i");
    Variable& thePoppedAddressVariable (theAddressPopCall.addConcreteArgument(1).getArgument().getVariable());
    // give it a name etc.
    // create a new symbol and add a new VariableSymbolReference in the Variable
    VariableSymbolReference* theNewVariableSymbolReference_p =
      new VariableSymbolReference(getContaining().getScope().getSymbolTable().addUniqueAuxSymbol(SymbolKind::VARIABLE,
                                                                                                 SymbolType::INTEGER_STYPE,
                                                                                                 SymbolShape::SCALAR,
                                                                                                 false),
                                  getContaining().getScope());
    theNewVariableSymbolReference_p->setId("1");
    theNewVariableSymbolReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg::addAddressPop");
    // pass it on to the variable and relinquish ownership
    thePoppedAddressVariable.supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
    thePoppedAddressVariable.getAliasMapKey().setTemporary();
    thePoppedAddressVariable.getDuUdMapKey().setTemporary();
    return thePoppedAddressVariable;
  } // end BasicBlockAlg::addAddressPop()

  void BasicBlockAlg::addSaxpy(const Variable& theSource,
			       const Variable& theTarget,
			       const Variable& theFactor,
			       const ForLoopReversalType::ForLoopReversalType_E& aReversalType) { 
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theSaxpyCall(addInlinableSubroutineCall("Saxpy",
													    aReversalType));
    theSaxpyCall.setId("inline_saxpy");
    theFactor.copyMyselfInto(theSaxpyCall.addConcreteArgument(1).getArgument().getVariable());
    theTarget.copyMyselfInto(theSaxpyCall.addConcreteArgument(2).getArgument().getVariable());
    theSource.copyMyselfInto(theSaxpyCall.addConcreteArgument(3).getArgument().getVariable());
  }

  void BasicBlockAlg::addSaxpy(const Variable& theSource,
                               const Variable& theTarget,
                               const Constant& theFactor,
                               const ForLoopReversalType::ForLoopReversalType_E& aReversalType) { 
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theSaxpyCall (addInlinableSubroutineCall("Saxpy",
													     aReversalType));
    theSaxpyCall.setId("inline_saxpy");
    ConcreteArgument& theNewArgument (theSaxpyCall.addConcreteArgument(1));
    theNewArgument.makeConstant(theFactor.getType());
    theNewArgument.getConstant().setFromString(theFactor.toString());
    theTarget.copyMyselfInto(theSaxpyCall.addConcreteArgument(2).getArgument().getVariable());
    theSource.copyMyselfInto(theSaxpyCall.addConcreteArgument(3).getArgument().getVariable());
  }

  void BasicBlockAlg::reinterpretDerivativePropagatorEntry(const xaifBoosterDerivativePropagator::DerivativePropagatorEntry& aDerivativePropagatorEntry) { 
    DBG_MACRO(DbgGroup::CALLSTACK, "xaifBoosterBasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg::reinterpretDerivativePropagatorEntry");
    // retrieve stored index values if needed starting with the target: 
    // take care of target address if needed: 
    const Variable& theOriginalTarget(aDerivativePropagatorEntry.getTarget());
    // this is either the original target
    // or it is the replaced target in case of ArrayAccesses
    Variable theActualTargetAnonymous,theActualTargetExplicit;
    reinterpretArrayAccess(theOriginalTarget,theActualTargetAnonymous,ForLoopReversalType::ANONYMOUS); 
    reinterpretArrayAccess(theOriginalTarget,theActualTargetExplicit,ForLoopReversalType::EXPLICIT); 
    xaifBoosterDerivativePropagator::DerivativePropagatorEntry::FactorList aFactorList;
    aDerivativePropagatorEntry.getFactors(aFactorList);
    for (xaifBoosterDerivativePropagator::DerivativePropagatorEntry::FactorList::reverse_iterator aFactorListI=aFactorList.rbegin();
	 aFactorListI!=aFactorList.rend();
	 ++aFactorListI) {
      // ZeroDerivs don't really have a factor and thus no source
      if ((*aFactorListI).getKind() != xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::ZERO_FACTOR) {
	const Variable& theOriginalSource((*aFactorListI).getSource());
	// this is either the original source
	// or it is the replaced target in case of ArrayAccesses
	Variable theActualSourceAnonymous,theActualSourceExplicit;
	reinterpretArrayAccess(theOriginalSource,theActualSourceAnonymous,ForLoopReversalType::ANONYMOUS); 
	reinterpretArrayAccess(theOriginalSource,theActualSourceExplicit,ForLoopReversalType::EXPLICIT); 
	// deal with the other cases: 
	switch((*aFactorListI).getKind()) {
        // SetDeriv or IncDeriv in tangent-linear mode
	case xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::UNIT_FACTOR: {
	    addUnitFactor(theActualSourceAnonymous,
                          theActualTargetAnonymous,
                          ForLoopReversalType::ANONYMOUS);
	    addUnitFactor(theActualSourceExplicit,
                          theActualTargetExplicit,
                          ForLoopReversalType::EXPLICIT);
	    break; 
	} 
        // SetNegDeriv or DecDeriv in tangent-linear mode
	case xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::NEGATIVE_UNIT_FACTOR: {
	    addNegativeUnitFactor(theActualSourceAnonymous,
                                  theActualTargetAnonymous,
                                  ForLoopReversalType::ANONYMOUS);
	    addNegativeUnitFactor(theActualSourceExplicit,
                                  theActualTargetExplicit,
                                  ForLoopReversalType::EXPLICIT);
	    break; 
	}
	case xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::CONSTANT_FACTOR: {
	  /**
	   * The inlinable call saxpy(a,x,y) is supposed to do y.d=y.d+a*x.d which in reverse means
	   * we have to switch arguments properly
	   */
          addSaxpy(theActualSourceAnonymous,
                   theActualTargetAnonymous,
                   (*aFactorListI).getConstant(),
                   ForLoopReversalType::ANONYMOUS);
          addSaxpy(theActualSourceExplicit,
                   theActualTargetExplicit,
                   (*aFactorListI).getConstant(),
                   ForLoopReversalType::EXPLICIT);
	  break;
	} // end case CONSTANT_FACTOR
	case xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::VARIABLE_FACTOR: // both represent some saxpy or sax 
	  {
            // find the popped factor variable from the correlation list
            VariablePPairList::const_iterator fvCorI;
            for (fvCorI = myFactorVariableCorList.begin(); fvCorI != myFactorVariableCorList.end(); ++fvCorI)
              if ((*aFactorListI).getVariable().equivalentTo(*(*fvCorI).first))
                break;
            if (fvCorI == myFactorVariableCorList.end())
              THROW_LOGICEXCEPTION_MACRO("xaifBoosterBasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg::reinterpretDerivativePropagatorEntry: "
                                         << "could not correlate pushed factor variable with popped factor variable");
            const Variable& thePoppedFactorVariable (*(*fvCorI).second);
	    /** 
	     * The inlinable call saxpy(a,x,y) is supposed to do y.d=y.d+a*x.d which in reverse means
	     * we have to switch arguments properly
	     */
	    addSaxpy(theActualSourceAnonymous,
		     theActualTargetAnonymous,
		     thePoppedFactorVariable,
		     ForLoopReversalType::ANONYMOUS);
	    addSaxpy(theActualSourceExplicit,
		     theActualTargetExplicit,
		     thePoppedFactorVariable,
		     ForLoopReversalType::EXPLICIT);
	    break; 
	  } 
	default: 
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::reinterpretDerivativePropagatorEntry: cannot handle factor kind " 
				     << (*aFactorListI).getKind()); 
	  break; 
	} // end switch 
      } // end if NOT ZeroDeriv
      // we follow all non-incremental propagations with a ZeroDeriv
      if (!aDerivativePropagatorEntry.isIncremental()) {
        addZeroDeriv(theActualTargetAnonymous,ForLoopReversalType::ANONYMOUS);
        addZeroDeriv(theActualTargetExplicit,ForLoopReversalType::EXPLICIT);
      } // end if non-incremental
    } // end for FactorList
  }

  const PlainBasicBlock::BasicBlockElementList& 
  BasicBlockAlg::getBasicBlockElementList(const ForLoopReversalType::ForLoopReversalType_E& aReversalType) const { 
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

  PlainBasicBlock::BasicBlockElementList& 
  BasicBlockAlg::getBasicBlockElementList(const ForLoopReversalType::ForLoopReversalType_E& aReversalType) { 
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

} // end namespace xaifBoosterBasicBlockPreaccumulationTapeAdjoint

