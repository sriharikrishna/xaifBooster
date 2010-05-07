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

#include "xaifBooster/algorithms/AdjointUtils/inc/BasicBlockPrintVersion.hpp"

#include "xaifBooster/algorithms/TypeChange/inc/SymbolAlg.hpp"

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
    } // end switch on aReversalType
  } // end BasicBlockAlg::ReinterpretedDerivativePropagator::supplyAndAddBasicBlockElementInstance()

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
    for (std::list<PerSequenceData*>::const_iterator li = myPerSequenceDataPList.begin(); li != myPerSequenceDataPList.end(); li++) {
      if (*li) {
        if ((*li)->myReinterpretedDerivativePropagator_p)
	  delete (*li)->myReinterpretedDerivativePropagator_p;
        delete *li;
      }
    } // end for all PerSequenceData entries
  } // end BasicBlockAlg::~BasicBlockAlg()

  void
  BasicBlockAlg::printXMLHierarchy(std::ostream& os) const { 
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::printXMLHierarchyImpl(os,
									       printDerivativePropagatorAsTape);
  } // end of BasicBlockAlg::printXMLHierarchy
  
  void BasicBlockAlg::printDerivativePropagatorAsTape(std::ostream& os,
						      const BasicBlockAlgBase& aBasicBlockAlg, 
						      const xaifBoosterDerivativePropagator::DerivativePropagator& aPropagator) { 
    const BasicBlockAlg& ourAlgorithm(dynamic_cast<const BasicBlockAlg&>(aBasicBlockAlg));
    std::list<PerSequenceData*>::const_iterator seqDataPListI;
    for (seqDataPListI = ourAlgorithm.myPerSequenceDataPList.begin(); seqDataPListI != ourAlgorithm.myPerSequenceDataPList.end(); ++seqDataPListI) {
      const ReinterpretedDerivativePropagator& theReinterpretedDerivativePropagator (*(*seqDataPListI)->myReinterpretedDerivativePropagator_p);
      if (&(theReinterpretedDerivativePropagator.getOriginalDerivativePropagator()) == &aPropagator) { 
	// this is the right one: 
	for (PlainBasicBlock::BasicBlockElementList::const_iterator aBasicBlockElementListI=
	       theReinterpretedDerivativePropagator.getBasicBlockElementList(xaifBoosterAdjointUtils::BasicBlockPrintVersion::get()).begin();
	     aBasicBlockElementListI != theReinterpretedDerivativePropagator.getBasicBlockElementList(xaifBoosterAdjointUtils::BasicBlockPrintVersion::get()).end();
	     ++aBasicBlockElementListI)
	  (*(aBasicBlockElementListI))->printXMLHierarchy(os);
	break; 
      } // end if 
    }
    if (seqDataPListI == ourAlgorithm.myPerSequenceDataPList.end()) // we didn't find it...
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::printDerivativePropagatorAsTape: didn't find proper ReinterpretedDerivativePropagator");
  } // end BasicBlockAlg::printDerivativePropagatorAsTape()

  void BasicBlockAlg::algorithm_action_4() { 
    DBG_MACRO(DbgGroup::CALLSTACK, "xaifBoosterBasicBlockPreaccumulationTape::BasicBlockAlg::algorithm_action_4(reinterpret DerivativePropagators as tapings)");
    // for each propagator:
    // create an InlinableSubroutinecall for each Variable in each saxpy element in the propagator
    // and also one for each index of target or source vertices
    // The order is fixed as follows:
    // - pairs of : 
    //   - JacobianEntry value (if variable)
    //   - Source index value (if variable array index)
    // - Target index value (if variable array index) 
    // obviously this order has to be matched by the reverse sweep reading this tape.
    for (SequencePList::const_iterator aSequencePListI = myUniqueSequencePList.begin();
	 aSequencePListI != myUniqueSequencePList.end();
	 ++aSequencePListI) {
      // make a reinterpretation instance which refers back to the original one
      ReinterpretedDerivativePropagator& theReinterpretedDerivativePropagator (*new ReinterpretedDerivativePropagator((*aSequencePListI)->myDerivativePropagator));
      // build the per sequence data
      PerSequenceData* thisSequenceData_p (new PerSequenceData);
      thisSequenceData_p->mySequence_p = *aSequencePListI;
      thisSequenceData_p->myReinterpretedDerivativePropagator_p = &theReinterpretedDerivativePropagator;
      myPerSequenceDataPList.push_back(thisSequenceData_p);

      // create a push for each (unique) factor variable and save it in the list
      const xaifBoosterDerivativePropagator::DerivativePropagator::EntryPList& theEntryPList ((*aSequencePListI)->myDerivativePropagator.getEntryPList());
      for (xaifBoosterDerivativePropagator::DerivativePropagator::EntryPList::const_iterator entryPListI = theEntryPList.begin();
           entryPListI != theEntryPList.end(); ++entryPListI) {
        xaifBoosterDerivativePropagator::DerivativePropagatorEntry::FactorList aFactorList;
        (*entryPListI)->getFactors(aFactorList);
        for (xaifBoosterDerivativePropagator::DerivativePropagatorEntry::FactorList::iterator aFactorListI = aFactorList.begin();
             aFactorListI != aFactorList.end(); ++aFactorListI) {
          if ((*aFactorListI).getKind()==xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::VARIABLE_FACTOR) {
            const Variable& theFactorVariable ((*aFactorListI).getVariable());
	    // check whether this factor variable has already been pushed
            VariablePList::const_iterator pushedFacVarPI;
            for (pushedFacVarPI = thisSequenceData_p->myPushedFactorVariablesPList.begin(); pushedFacVarPI != thisSequenceData_p->myPushedFactorVariablesPList.end(); ++pushedFacVarPI)
              if (theFactorVariable.equivalentTo(**pushedFacVarPI))
                break;
            if (pushedFacVarPI == thisSequenceData_p->myPushedFactorVariablesPList.end()) { // this variable has not yet been pushed
	      if (dynamic_cast<xaifBoosterTypeChange::SymbolAlg&>(theFactorVariable.getVariableSymbolReference().getSymbol().getSymbolAlgBase()).needsAllocation()) {
		pushDimensionsOf(theFactorVariable,theReinterpretedDerivativePropagator,ForLoopReversalType::ANONYMOUS);
		pushDimensionsOf(theFactorVariable,theReinterpretedDerivativePropagator,ForLoopReversalType::EXPLICIT);
	      }
              // ANONYMOUS version
              xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theSubroutineCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_"+SymbolShape::toShortString(theFactorVariable.getEffectiveShape())));
              theSubroutineCall_p->setId("inline_push");
              theFactorVariable.copyMyselfInto(theSubroutineCall_p->addConcreteArgument(1).getArgument().getVariable());
              theReinterpretedDerivativePropagator.supplyAndAddBasicBlockElementInstance(*theSubroutineCall_p,
                                                                                         ForLoopReversalType::ANONYMOUS);
              // EXPLICIT version
              theSubroutineCall_p=new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_"+SymbolShape::toShortString(theFactorVariable.getEffectiveShape()));
              theSubroutineCall_p->setId("inline_push");
              theFactorVariable.copyMyselfInto(theSubroutineCall_p->addConcreteArgument(1).getArgument().getVariable());
              theReinterpretedDerivativePropagator.supplyAndAddBasicBlockElementInstance(*theSubroutineCall_p,
                                                                                         ForLoopReversalType::EXPLICIT);
              thisSequenceData_p->myPushedFactorVariablesPList.push_back(&theFactorVariable);
            }
          } // end if VARIABLE_FACTOR
          if ((*aFactorListI).getKind() != xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::ZERO_FACTOR) { 
            if ((*aFactorListI).getSource().hasArrayAccess()) // push addresses for source
              reinterpretArrayAccess((*aFactorListI).getSource().getArrayAccess(),
                                     *thisSequenceData_p);
          } // end if not ZERO_FACTOR
        } // end for all factors
        if ((*entryPListI)->getTarget().hasArrayAccess()) // push addresses for target
          reinterpretArrayAccess((*entryPListI)->getTarget().getArrayAccess(),
                                 *thisSequenceData_p);
      } // end for all entries
      // now push all of the single-variable address variables (so they aren't intermixed with the other ones for which an assignment was created)
      for (VariablePList::const_iterator pushedAddVarPI = thisSequenceData_p->myPushedAddressVariablesPList.begin();
           pushedAddVarPI != thisSequenceData_p->myPushedAddressVariablesPList.end(); ++pushedAddVarPI) {
        // make the push and save it in the list
        xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theSubroutineCall_p = new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_i");
        theReinterpretedDerivativePropagator.supplyAndAddBasicBlockElementInstance(*theSubroutineCall_p,
                                                                                   ForLoopReversalType::ANONYMOUS);
        theSubroutineCall_p->setId("BasicBlockPreaccumulationTape::BasicBlockAlg::algorithm_action_4():inline_push_i");
        (*pushedAddVarPI)->copyMyselfInto(theSubroutineCall_p->addConcreteArgument(1).getArgument().getVariable());
      } // end for all address variables to be pushed
    } // end for all sequences
  } // end BasicBlockAlg::algorithm_action_4()

  void BasicBlockAlg::pushDimensionsOf(const Variable& theFactorVariable,
				       ReinterpretedDerivativePropagator& theReinterpretedDerivativePropagator,
				       ForLoopReversalType::ForLoopReversalType_E aReversalType) { 
    SymbolShape::SymbolShape_E theShape=theFactorVariable.getEffectiveShape();
    for(unsigned short dim=1;dim<=theShape;++dim) {
      // save the size info
      Assignment* theSizeAssignment_p(new Assignment(false));
      theReinterpretedDerivativePropagator.
	supplyAndAddBasicBlockElementInstance(*theSizeAssignment_p,
					      aReversalType);
      theSizeAssignment_p->setId("size_assignment_for_taping");
      // create a new symbol and add a new VariableSymbolReference in the Variable
      VariableSymbolReference* theNewVariableSymbolReference_p =
	new VariableSymbolReference(getContaining().
				    getScope().
				    getSymbolTable().
				    addUniqueAuxSymbol(SymbolKind::VARIABLE,
						       SymbolType::INTEGER_STYPE,
						       SymbolShape::SCALAR,
						       false),
				    getContaining().getScope());
      theNewVariableSymbolReference_p->setId("1");
      theNewVariableSymbolReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulationTape::BasicBlockAlg::pushDimensionsOf");
      // pass it on to the LHS and relinquish ownership
      theSizeAssignment_p->getLHS().supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
      theSizeAssignment_p->getLHS().getAliasMapKey().setTemporary();
      theSizeAssignment_p->getLHS().getDuUdMapKey().setTemporary();
      // make the RHS
      Expression& theSizeExpression(theSizeAssignment_p->getRHS());
      Argument& theNewArgument(*(new Argument()));
      theNewArgument.setId(theSizeExpression.getNextVertexId());
      theSizeExpression.supplyAndAddVertexInstance(theNewArgument);
      theFactorVariable.copyMyselfInto(theNewArgument.getVariable());
      Constant& theConstant(*new Constant(dim));
      theConstant.setId(theSizeExpression.getNextVertexId());
      theSizeExpression.supplyAndAddVertexInstance(theConstant);
      ExpressionVertex& theSizeIntrinsic=theSizeExpression.addBinaryOpByName("size",
									     theNewArgument,
									     theConstant);
      theSizeIntrinsic.setId(theSizeExpression.getNextVertexId());
      // now make the subroutine call: 
      xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theSubroutineCall_p = 
	new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_i");
      // save it in the list
      theReinterpretedDerivativePropagator.
	supplyAndAddBasicBlockElementInstance(*theSubroutineCall_p,
					      aReversalType);
      theSubroutineCall_p->setId("xaifBoosterBasicBlockPreaccumulationTape::BasicBlockAlg::pushDimensionsOf");
      theSizeAssignment_p->getLHS().copyMyselfInto(theSubroutineCall_p->addConcreteArgument(1).getArgument().getVariable());
    }
  }

  const std::list<BasicBlockAlg::PerSequenceData*>&
  BasicBlockAlg::getPerSequenceDataPList() const {
    return myPerSequenceDataPList;
  } // end BasicBlockAlg::getPerSequenceDataPList()

  void
  BasicBlockAlg::reinterpretArrayAccess(const ArrayAccess& theArrayAccess,
                                        PerSequenceData& aPerSequenceData) {
    const ArrayAccess::IndexTripletListType& theIndexTripletList(theArrayAccess.getIndexTripletList());
    for (ArrayAccess::IndexTripletListType::const_iterator anIndexTripletListTypeCI=theIndexTripletList.begin();
	 anIndexTripletListTypeCI!=theIndexTripletList.end();
	 ++anIndexTripletListTypeCI) { 
      for (IndexTriplet::IndexPairList::const_iterator anIndexPairListCI=(*anIndexTripletListTypeCI)->getIndexPairList().begin();
	   anIndexPairListCI!=(*anIndexTripletListTypeCI)->getIndexPairList().end();
	   ++anIndexPairListCI) { 
	// now we have two cases, essentially the expression is a single vertex with a constant 
	// (this discounts constant expressions, this is a todo which might be dealt with later or 
	// it may be completely superceded by a TBR analysis)
	const Expression& theIndexExpression(*((*anIndexPairListCI).second));
        ReinterpretedDerivativePropagator& theReinterpretedDerivativePropagator (*aPerSequenceData.myReinterpretedDerivativePropagator_p);
        if (!theIndexExpression.isConstant()) {
          xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theSubroutineCall_p;
          if (theIndexExpression.numVertices() == 1) { // only one argument, non-const => push its value
            const Variable& theAddressVariable (dynamic_cast<const Argument&>(theIndexExpression.getMaxVertex()).getVariable());
            // check whether we've already pushed this variable
            VariablePList::const_iterator pushedAddVarPI;
            for (pushedAddVarPI = aPerSequenceData.myPushedAddressVariablesPList.begin(); pushedAddVarPI != aPerSequenceData.myPushedAddressVariablesPList.end(); ++pushedAddVarPI)
              if (theAddressVariable.equivalentTo(**pushedAddVarPI)) {
                DBG_MACRO(DbgGroup::DATA,"BasicBlockPreaccumulationTape::BasicBlockAlg::reinterpretArrayAccess: "
                                         << "address variable " << theAddressVariable.debug() << " already pushed => skipping");
                break;
              }
            if (pushedAddVarPI == aPerSequenceData.myPushedAddressVariablesPList.end()) { // this variable has not yet been pushed
              DBG_MACRO(DbgGroup::DATA,"BasicBlockPreaccumulationTape::BasicBlockAlg::reinterpretArrayAccess: "
                                       << "pushing address variable " << theAddressVariable.debug());
              aPerSequenceData.myPushedAddressVariablesPList.push_back(&theAddressVariable);
            }
          } // end one non-const argument
          else { // more than one argument, and at least one is non-const
            // \todo FIXME: for now we push EVERY address assignment variable.
            // we don't yet hope to identify things like x(i+j) and x(i+j) this will be fixed by the proper push/pop framework
            // make the assignment it and save it in the list
            Assignment* theIndexExpressionAssignment_p(new Assignment(false));
            theReinterpretedDerivativePropagator.supplyAndAddBasicBlockElementInstance(*theIndexExpressionAssignment_p,
                                                                                       ForLoopReversalType::ANONYMOUS);
            theIndexExpressionAssignment_p->setId("index_expression_assignment_for_taping");
            // create a new symbol and add a new VariableSymbolReference in the Variable
            VariableSymbolReference* theNewVariableSymbolReference_p =
             new VariableSymbolReference(getContaining().getScope().getSymbolTable().addUniqueAuxSymbol(SymbolKind::VARIABLE,
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
            theSubroutineCall_p = new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_i");
            // save it in the list
            theReinterpretedDerivativePropagator.supplyAndAddBasicBlockElementInstance(*theSubroutineCall_p,
                                                                                       ForLoopReversalType::ANONYMOUS);
            theSubroutineCall_p->setId("reinterpretArrayaccess:inline_push_i");
            theIndexExpressionAssignment_p->getLHS().copyMyselfInto(theSubroutineCall_p->addConcreteArgument(1).getArgument().getVariable());
          } // end >1 argument
        } // end if index expression is non-constant
      } // loop for index pairs
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

} // end namespace xaifBoosterBasicBlockPreaccumulationTape

