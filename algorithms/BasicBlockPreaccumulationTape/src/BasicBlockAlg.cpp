#include "xaifBooster/utils/inc/LogicException.hpp"

#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/ArrayAccess.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/Scope.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorSaxpy.hpp"
#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"
#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/ArgumentSubstitute.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/BasicBlockAlg.hpp"


using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationTape { 

  BasicBlockAlg::ReinterpretedDerivativePropagator::ReinterpretedDerivativePropagator(const xaifBoosterDerivativePropagator::DerivativePropagator& aPropagator) : 
    myOriginalPropagator(aPropagator) { 
  } 

  BasicBlockAlg::ReinterpretedDerivativePropagator::~ReinterpretedDerivativePropagator() { 
    for (PlainBasicBlock::BasicBlockElementList::const_iterator li=myBasicBlockElementList.begin();
         li!=myBasicBlockElementList.end();
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
  BasicBlockAlg::ReinterpretedDerivativePropagator::supplyAndAddBasicBlockElementInstance(BasicBlockElement& theBasicBlockElement) { 
    myBasicBlockElementList.push_back(&theBasicBlockElement);
  } 


  const PlainBasicBlock::BasicBlockElementList& 
  BasicBlockAlg::ReinterpretedDerivativePropagator::getBasicBlockElementList() const { 
    return myBasicBlockElementList;
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
	       (*aReinterpretedDerivativePropagatorPListI)->getBasicBlockElementList().begin();
	     aBasicBlockElementListI!=
	       (*aReinterpretedDerivativePropagatorPListI)->getBasicBlockElementList().end();
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
    // for each propagator:
    // create an InlinableSubroutinecall for each Variable in each saxpy element in the propagator
    // and also one for each index of target or source vertices
    // The order is fixed as follows:
    // - pairs of : 
    //   - JacobianEntry value (if variable)
    //   - Source index value (if variable array index)
    // - Target index value (if variable array index) 
    // obviously this order has to be matched by the reverse sweep reading this tape.
    for (SequencePList::const_iterator aSequencePListI=getUniqueSequencePList().begin();
	 aSequencePListI!=getUniqueSequencePList().end();
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
	    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theSubroutineCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push"));
	    // save it in the list
	    aReinterpretedDerivativePropagator_p->supplyAndAddBasicBlockElementInstance(*theSubroutineCall_p);
	    theSubroutineCall_p->setId("inline_push");
	    (*aFactorListI).getVariable().copyMyselfInto(theSubroutineCall_p->addArgumentSubstitute(1).getVariable());
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
      // it may be completelt superceded by a TBR analysis)
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
	  aReinterpretedDerivativePropagator.supplyAndAddBasicBlockElementInstance(*theSubroutineCall_p);
	  theSubroutineCall_p->setId("inline_push_i");
	  dynamic_cast<const Argument&>(*(p.first)).getVariable().copyMyselfInto(theSubroutineCall_p->addArgumentSubstitute(1).getVariable());
	}
      } // has one vertex 
      else {  // has more then one vertex
	// make it
	Assignment* theIndexExpressionAssignment_p(new Assignment(false,false));
	// save it in the list
	aReinterpretedDerivativePropagator.supplyAndAddBasicBlockElementInstance(*theIndexExpressionAssignment_p);
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
	// pass it on to the LHS and relinquish ownership
	theIndexExpressionAssignment_p->getLHS().supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
	theIndexExpressionAssignment_p->getLHS().getAliasMapKey().setTemporary();
	theIndexExpressionAssignment_p->getLHS().getDuUdMapKey().setTemporary();
	// set the RHS
	theIndexExpression.copyMyselfInto(theIndexExpressionAssignment_p->getRHS());
	// make the subroutine call: 
	xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theSubroutineCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_i"));
	// save it in the list
	aReinterpretedDerivativePropagator.supplyAndAddBasicBlockElementInstance(*theSubroutineCall_p);
	theSubroutineCall_p->setId("inline_push_i");
	theIndexExpressionAssignment_p->getLHS().copyMyselfInto(theSubroutineCall_p->addArgumentSubstitute(1).getVariable());
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
