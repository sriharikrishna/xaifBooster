#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/Scope.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"
#include "xaifBooster/system/inc/ArrayAccess.hpp"
#include "xaifBooster/system/inc/Argument.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorSaxpy.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"
#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/ArgumentSubstitute.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/BasicBlockElementAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationTapeAdjoint { 

  BasicBlockAlg::BasicBlockAlg(BasicBlock& theContaining) : 
    xaifBooster::BasicBlockAlgBase(theContaining),
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg(theContaining) { 
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
    for (PlainBasicBlock::BasicBlockElementList::const_iterator li=myBasicBlockElementList.begin();
         li!=myBasicBlockElementList.end();
         li++)
      (*(li))->printXMLHierarchy(os);
    os << pm.indent()
       << "</"
       << PlainBasicBlock::ourXAIFName
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
  BasicBlockAlg::addInlinableSubroutineCall(const std::string& aSubroutineName) { 
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* aNewCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall(aSubroutineName));
    myBasicBlockElementList.push_back(aNewCall_p);
    return *aNewCall_p;									     
  } 

  const Assignment& 
  BasicBlockAlg::addConstantAssignment(const BaseConstant& theConstant) { 
    Assignment* theNewAssignment_p(new Assignment(false,false));
    theNewAssignment_p->setId("tape_adjoint_constant_assignment");
    myBasicBlockElementList.push_back(theNewAssignment_p);
    Constant* theConstantRHS_p(new Constant(theConstant.getType(),false));
    theConstantRHS_p->setFromString(theConstant.toString());
    theConstantRHS_p->setId(theNewAssignment_p->getRHS().getNextVertexId());
    theNewAssignment_p->getRHS().supplyAndAddVertexInstance(*theConstantRHS_p);
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
    theNewAssignment_p->getLHS().supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
    theNewAssignment_p->getLHS().getAliasMapKey().setTemporary();
    theNewAssignment_p->getLHS().getDuUdMapKey().setTemporary();
    return *theNewAssignment_p;									     
  } 

  void BasicBlockAlg::reinterpretArrayAccess(const Variable& theOriginalVariable,
					     Variable& theNewVariable) { 
    theOriginalVariable.copyMyselfInto(theNewVariable);
    if (!theOriginalVariable.hasArrayAccess())
      return;
    // otherwise we will replace index expressions: 
    ArrayAccess::IndexListType& theNewIndexList(theNewVariable.getArrayAccess().getIndexList());
    const ArrayAccess::IndexListType& theOriginalIndexList(theOriginalVariable.getArrayAccess().getIndexList());
    ArrayAccess::IndexListType::reverse_iterator aNewIndexListTypeI=theNewIndexList.rbegin() ;
    for (ArrayAccess::IndexListType::const_reverse_iterator anOriginalIndexListTypeCI=theOriginalIndexList.rbegin();
	 anOriginalIndexListTypeCI!=theOriginalIndexList.rend();
	 ++anOriginalIndexListTypeCI,
	   ++aNewIndexListTypeI) { 
      // now we have two cases, essentially the expression is a single vertex with a constant 
      // (this discounts constant expressions, this is a todo which might be dealt with later or 
      // it may be completelt superceded by a TBR analysis)
      const Expression& theIndexExpression(**anOriginalIndexListTypeCI);
      if (theIndexExpression.numVertices()==1
	  && 
	  !(*(theIndexExpression.vertices().first)).isArgument()) { 
	// do nothing
	continue;
      }
      // it is a variable or expression whose value we pushed and now want to pop
      // and replace. First clear the old index expression that we copied into aNewIndexListTypeI
      (*aNewIndexListTypeI)->clear();
      // pop the value
      xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& thePopCall(addInlinableSubroutineCall("pop_i"));
      thePopCall.setId("inline_pop_i");
      Variable& theInlineVariable(thePopCall.addArgumentSubstitute(1).getVariable());
      // give it a name etc.
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
      // pass it on to the variable and relinquish ownership
      theInlineVariable.supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
      theInlineVariable.getAliasMapKey().setTemporary();
      theInlineVariable.getDuUdMapKey().setTemporary();
      // create a copy of the variable in the indexExpression: 
      Argument& theNewArgument(*new Argument);
      // relinquish ownership to the index expression: 
      (*aNewIndexListTypeI)->supplyAndAddVertexInstance(theNewArgument);
      theNewArgument.setId(1);
      theInlineVariable.copyMyselfInto(theNewArgument.getVariable());
    } // end for i
  } 

  void BasicBlockAlg::algorithm_action_4() { // adjoin the DerivativePropagators
    for(PlainBasicBlock::BasicBlockElementList::const_iterator i=getContaining().getBasicBlockElementList().begin();
	i!=getContaining().getBasicBlockElementList().end();
	++i) { 
      dynamic_cast<BasicBlockElementAlg&>((**i).getBasicBlockElementAlgBase()).insertYourself(getContaining());
    } 
    for(SequencePList::const_reverse_iterator aSequencePListI=getUniqueSequencePList().rbegin();
	aSequencePListI!=getUniqueSequencePList().rend();
	++aSequencePListI) { 
      const xaifBoosterDerivativePropagator::DerivativePropagator& aDerivativePropagator((*aSequencePListI)->myDerivativePropagator);
      for(xaifBoosterDerivativePropagator::DerivativePropagator::EntryPList::const_reverse_iterator entryPListI=
	    aDerivativePropagator.getEntryPList().rbegin();
	  entryPListI!= aDerivativePropagator.getEntryPList().rend();
	  ++entryPListI) {
	// retrieve stored index values if needed starting with the target: 
	// take care of target address if needed: 
	const Variable& theOriginalTarget((*entryPListI)->getTarget());
	// this is either the original target
	// or it is the replaced target in case of ArrayAccesses
	Variable theActualTarget;
	reinterpretArrayAccess(theOriginalTarget,theActualTarget); 
	xaifBoosterDerivativePropagator::DerivativePropagatorEntry::FactorList aFactorList;
	(*entryPListI)->getFactors(aFactorList);
	for (xaifBoosterDerivativePropagator::DerivativePropagatorEntry::FactorList::reverse_iterator aFactorListI=aFactorList.rbegin();
	     aFactorListI!=aFactorList.rend();
	     ++aFactorListI) { 
	  if ((*aFactorListI).getKind()==xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::ZERO_FACTOR) { 
	    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theSubroutineCall(addInlinableSubroutineCall("ZeroDeriv"));
	    theSubroutineCall.setId("inline_zeroderiv");
	    theActualTarget.copyMyselfInto(theSubroutineCall.addArgumentSubstitute(1).getVariable());
	    break; 
	  } // ZERO_FACTOR
	  else { 
	    const Variable& theOriginalSource((*aFactorListI).getSource());
	    // this is either the original source
	    // or it is the replaced target in case of ArrayAccesses
	    Variable theActualSource;
	    reinterpretArrayAccess(theOriginalSource,theActualSource); 
	    // deal with the other cases: 
	    switch((*aFactorListI).getKind()) { 
	    case xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::UNIT_FACTOR: // the SetDeriv in tlm
	      { 
		/** 
		 * The inlinable call incDeriv(y,x) is supposed to do x.d+=y.d
		 */
		xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theSetDerivCall(addInlinableSubroutineCall("IncDeriv"));
		theSetDerivCall.setId("inline_IncDeriv");
		theActualTarget.copyMyselfInto(theSetDerivCall.addArgumentSubstitute(1).getVariable());
		theActualSource.copyMyselfInto(theSetDerivCall.addArgumentSubstitute(2).getVariable());
		xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theZeroDerivCall(addInlinableSubroutineCall("ZeroDeriv"));
		theZeroDerivCall.setId("inline_zeroderiv");
		theActualTarget.copyMyselfInto(theZeroDerivCall.addArgumentSubstitute(1).getVariable());
		break; 
	      } 
	    case xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::CONSTANT_FACTOR: 
	    case xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::VARIABLE_FACTOR: // both represent some saxpy or sax 
	      { 
		const Variable* theFactorVariable_p=0; // here is where we keep the factor variable
		if ((*aFactorListI).getKind()==xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::CONSTANT_FACTOR) { 
		  const Assignment& theConstantAssignment(addConstantAssignment((*aFactorListI).getConstant()));
		  theFactorVariable_p=&theConstantAssignment.getLHS();
		} 
		else { 
		  xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theZeroDerivCall(addInlinableSubroutineCall("Pop"));
		  theZeroDerivCall.setId("inline_pop");
		  Variable* theInlineVariable_p(&(theZeroDerivCall.addArgumentSubstitute(1).getVariable()));
		  // give it a name etc.
		  // create a new symbol and add a new VariableSymbolReference in the Variable
		  VariableSymbolReference* theNewVariableSymbolReference_p=
		    new VariableSymbolReference(getContaining().getScope().
						getSymbolTable().
						addUniqueAuxSymbol(SymbolKind::VARIABLE,
								   SymbolType::REAL_STYPE,
								   SymbolShape::SCALAR,
								   false),
						getContaining().getScope());
		  theNewVariableSymbolReference_p->setId("1");
		  // pass it on to the variable and relinquish ownership
		  theInlineVariable_p->supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
		  theInlineVariable_p->getAliasMapKey().setTemporary();
		  theInlineVariable_p->getDuUdMapKey().setTemporary();
		  theFactorVariable_p=theInlineVariable_p;
		} 
		/** 
		 * The inlinable call saxpy(a,x,y) is supposed to do y.d=y.d+a*x.d which in reverse means
		 * we have to switch arguments properly
		 */
		xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theSaxpyCall(addInlinableSubroutineCall("Saxpy"));
		theSaxpyCall.setId("inline_saxpy");
		theFactorVariable_p->copyMyselfInto(theSaxpyCall.addArgumentSubstitute(1).getVariable());
		theActualTarget.copyMyselfInto(theSaxpyCall.addArgumentSubstitute(2).getVariable());
		theActualSource.copyMyselfInto(theSaxpyCall.addArgumentSubstitute(3).getVariable());
		if (!(*entryPListI)->isIncremental()) { 
		  xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theZeroDerivCall(addInlinableSubroutineCall("ZeroDeriv"));
		  theZeroDerivCall.setId("inline_zeroderiv");
		  theActualTarget.copyMyselfInto(theZeroDerivCall.addArgumentSubstitute(1).getVariable());
		}
		break; 
	      } 
	    default: 
	      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::algorithm_action_4: cannot handle factor kind " 
					 << (*aFactorListI).getKind()); 
	      break; 
	    } // end switch 
	  } // end else (other versions)
	} // end for FactorList
      } // end for DerivativePropagatorEntry list
    } // end for SeqyencePList 
  } // end of algorithm_action_4 
  
} // end of namespace
