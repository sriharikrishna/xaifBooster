#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/Scope.hpp"
#include "xaifBooster/system/inc/SubroutineCall.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"
#include "xaifBooster/system/inc/ArrayAccess.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"

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

  BasicBlockAlg::~BasicBlockAlg() { 
    for (PlainBasicBlock::BasicBlockElementList::const_iterator li=myBasicBlockElementListAnonymousReversal.begin();
         li!=myBasicBlockElementListAnonymousReversal.end();
         li++) { 
      if (*li)
	delete *li;
    } 
    for (PlainBasicBlock::BasicBlockElementList::const_iterator li=myBasicBlockElementListAnonymousReversal.begin();
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
    const PlainBasicBlock::BasicBlockElementList& aBasicBlockElementList(getBasicBlockElementList(getReversalType()));
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
						  false));
    aNewCall_p->setId("reverse_call");
    getBasicBlockElementList(aReversalType).push_back(aNewCall_p);
    return *aNewCall_p;									     
  } 

  const Assignment& 
  BasicBlockAlg::addConstantAssignment(const BaseConstant& theConstant,
				       const Symbol& aTemporarySymbol,
				       const Scope& theScopeOfTheTemporarySymbol,
				       const ForLoopReversalType::ForLoopReversalType_E& aReversalType) { 
    Assignment* theNewAssignment_p(new Assignment(false));
    theNewAssignment_p->setId("tape_adjoint_constant_assignment");
    getBasicBlockElementList(aReversalType).push_back(theNewAssignment_p);
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
    theNewVariableSymbolReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg::addConstantAssignment");
    // pass it on to the LHS and relinquish ownership
    theNewAssignment_p->getLHS().supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
    theNewAssignment_p->getLHS().getAliasMapKey().setTemporary();
    theNewAssignment_p->getLHS().getDuUdMapKey().setTemporary();
    return *theNewAssignment_p;									     
  } 

  void BasicBlockAlg::reinterpretArrayAccess(const Variable& theOriginalVariable,
					     Variable& theNewVariable,
					     const ForLoopReversalType::ForLoopReversalType_E& aReversalType) { 
    theOriginalVariable.copyMyselfInto(theNewVariable);
    if (!theOriginalVariable.hasArrayAccess() || aReversalType==ForLoopReversalType::EXPLICIT)
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
      xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& thePopCall(addInlinableSubroutineCall("pop_i",
													    aReversalType));
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
      theNewVariableSymbolReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg::reinterpretArrayAccess");
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
    if (getContaining().getBasicBlockElementList().empty())
      return;
    // mesh the BasicBlockElements with the Sequences
    PlainBasicBlock::BasicBlockElementList::const_reverse_iterator aBasicBlockElementListRI=getContaining().getBasicBlockElementList().rbegin();
    SequencePList::const_reverse_iterator aSequencePListRI=getUniqueSequencePList().rbegin();
    bool noSequence=false;
    if (aSequencePListRI==getUniqueSequencePList().rend())
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
	const xaifBoosterDerivativePropagator::DerivativePropagator& aDerivativePropagator((*aSequencePListRI)->myDerivativePropagator);
	for(xaifBoosterDerivativePropagator::DerivativePropagator::EntryPList::const_reverse_iterator entryPListI=
	      aDerivativePropagator.getEntryPList().rbegin();
	    entryPListI!= aDerivativePropagator.getEntryPList().rend();
	    ++entryPListI) {
	  reinterpretDerivativePropagatorEntry(**entryPListI);
	} // end for DerivativePropagatorEntry list
	++aSequencePListRI;
	if (aSequencePListRI==getUniqueSequencePList().rend())
	  // there is no sequence left
	  noSequence=true;
      } // end of if (!done)
    } // end while (!done)
  } // end of algorithm_action_4 

  void BasicBlockAlg::addZeroDeriv(Variable& theTarget,
				   const ForLoopReversalType::ForLoopReversalType_E& aReversalType) { 
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theSubroutineCall(addInlinableSubroutineCall("ZeroDeriv",
														 aReversalType));
    theSubroutineCall.setId("inline_zeroderiv");
    theTarget.copyMyselfInto(theSubroutineCall.addArgumentSubstitute(1).getVariable());
  } 

  void BasicBlockAlg::addUnitFactor(Variable& theSource,
				    Variable& theTarget,
				    const ForLoopReversalType::ForLoopReversalType_E& aReversalType) { 
    /** 
     * The inlinable call incDeriv(y,x) is supposed to do x.d+=y.d
     * HOWEVER, this should not happen when y and x are the same
     * so we make an educated guess based on the alias information
     * and add a checker if we can't decide. 
     */
    if (ConceptuallyStaticInstances::instance()->getCallGraph().getAliasMap().mayAlias(theTarget.getAliasMapKey(),
										       theSource.getAliasMapKey())) { 
      xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theSetDerivCall(addInlinableSubroutineCall("CondIncZeroDeriv",
														 aReversalType));
      theSetDerivCall.setId("inline_CondIncZeroDeriv");
      theTarget.copyMyselfInto(theSetDerivCall.addArgumentSubstitute(1).getVariable());
      theSource.copyMyselfInto(theSetDerivCall.addArgumentSubstitute(2).getVariable());
    }
    else { 
      xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theSetDerivCall(addInlinableSubroutineCall("IncDeriv",
														 aReversalType));
      theSetDerivCall.setId("inline_IncDeriv");
      theTarget.copyMyselfInto(theSetDerivCall.addArgumentSubstitute(1).getVariable());
      theSource.copyMyselfInto(theSetDerivCall.addArgumentSubstitute(2).getVariable());
      xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theZeroDerivCall(addInlinableSubroutineCall("ZeroDeriv",
														  aReversalType));
      theZeroDerivCall.setId("inline_zeroderiv");
      theTarget.copyMyselfInto(theZeroDerivCall.addArgumentSubstitute(1).getVariable());
    }
  } 

  const Variable& BasicBlockAlg::addFactorPop(const Symbol& aTemporarySymbol,
					      const Scope& theScopeOfTheTemporarySymbol,
					      const ForLoopReversalType::ForLoopReversalType_E& aReversalType) { 
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theZeroDerivCall(addInlinableSubroutineCall("Pop",
														aReversalType));
    theZeroDerivCall.setId("inline_pop");
    Variable& theInlineVariable(theZeroDerivCall.addArgumentSubstitute(1).getVariable());
    // give it a name etc.
    // create a new symbol and add a new VariableSymbolReference in the Variable
    VariableSymbolReference* theNewVariableSymbolReference_p=
      new VariableSymbolReference(aTemporarySymbol,
				  getContaining().getScope());
    theNewVariableSymbolReference_p->setId("1");
    theNewVariableSymbolReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg::algorithm_action_4");
    // pass it on to the variable and relinquish ownership
    theInlineVariable.supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
    theInlineVariable.getAliasMapKey().setTemporary();
    theInlineVariable.getDuUdMapKey().setTemporary();
    return theInlineVariable;
  } 

  void BasicBlockAlg::addSaxpy(const Variable& theSource,
			       const Variable& theTarget,
			       const Variable& theFactor,
			       const xaifBoosterDerivativePropagator::DerivativePropagatorEntry& aDerivativePropagatorEntry,
			       const ForLoopReversalType::ForLoopReversalType_E& aReversalType) { 
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theSaxpyCall(addInlinableSubroutineCall("Saxpy",
													    aReversalType));
    theSaxpyCall.setId("inline_saxpy");
    theFactor.copyMyselfInto(theSaxpyCall.addArgumentSubstitute(1).getVariable());
    theTarget.copyMyselfInto(theSaxpyCall.addArgumentSubstitute(2).getVariable());
    theSource.copyMyselfInto(theSaxpyCall.addArgumentSubstitute(3).getVariable());
    if (!aDerivativePropagatorEntry.isIncremental()) { 
      xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theZeroDerivCall(addInlinableSubroutineCall("ZeroDeriv",
														  aReversalType));
      theZeroDerivCall.setId("inline_zeroderiv");
      theTarget.copyMyselfInto(theZeroDerivCall.addArgumentSubstitute(1).getVariable());
    }
  }

  void BasicBlockAlg::reinterpretDerivativePropagatorEntry(const xaifBoosterDerivativePropagator::DerivativePropagatorEntry& aDerivativePropagatorEntry) { 
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
      if ((*aFactorListI).getKind()==xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::ZERO_FACTOR) { 
	addZeroDeriv(theActualTargetAnonymous,ForLoopReversalType::ANONYMOUS);
	addZeroDeriv(theActualTargetExplicit,ForLoopReversalType::EXPLICIT);
	break; 
      } // ZERO_FACTOR
      else { 
	const Variable& theOriginalSource((*aFactorListI).getSource());
	// this is either the original source
	// or it is the replaced target in case of ArrayAccesses
	Variable theActualSourceAnonymous,theActualSourceExplicit;
	reinterpretArrayAccess(theOriginalSource,theActualSourceAnonymous,ForLoopReversalType::ANONYMOUS); 
	reinterpretArrayAccess(theOriginalSource,theActualSourceExplicit,ForLoopReversalType::EXPLICIT); 
	// deal with the other cases: 
	switch((*aFactorListI).getKind()) { 
	case xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::UNIT_FACTOR: // the SetDeriv in tlm
	  { 
	    addUnitFactor(theActualSourceAnonymous,theActualTargetAnonymous,ForLoopReversalType::ANONYMOUS);
	    addUnitFactor(theActualSourceExplicit,theActualTargetExplicit,ForLoopReversalType::EXPLICIT);
	    break; 
	  } 
	case xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::CONSTANT_FACTOR: 
	case xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::VARIABLE_FACTOR: // both represent some saxpy or sax 
	  { 
	    // the inlinable call needs a temporary which contains the factor
	    const Symbol& aTemporarySymbol(getContaining().getScope().
					   getSymbolTable().
					   addUniqueAuxSymbol(SymbolKind::VARIABLE,
							      SymbolType::REAL_STYPE,
							      SymbolShape::SCALAR,
							      false));
	    const Variable* theFactorVariable_p=0; // here is where we keep the factor variable
	    if ((*aFactorListI).getKind()==xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::CONSTANT_FACTOR) { 
	      // do the anonymous version
	      const Assignment& theConstantAssignment(addConstantAssignment((*aFactorListI).getConstant(),
									    aTemporarySymbol,
									    getContaining().getScope(),			    
									    ForLoopReversalType::ANONYMOUS));
	      theFactorVariable_p=&theConstantAssignment.getLHS();
	      // do the explicit version - we can of course use the same symbol so 
	      // theFactorVariable_p is identical
	      addConstantAssignment((*aFactorListI).getConstant(),
				    aTemporarySymbol,
				    getContaining().getScope(),			    
				    ForLoopReversalType::EXPLICIT);
	    } 
	    else { 
	      // do the anonymous version
	      theFactorVariable_p=&(addFactorPop(aTemporarySymbol,
						 getContaining().getScope(),			    
						 ForLoopReversalType::ANONYMOUS));
	      // do the explicit version - we can of course use the same symbol so 
	      // theFactorVariable_p is identical
	      addFactorPop(aTemporarySymbol,
			   getContaining().getScope(),			    
			   ForLoopReversalType::EXPLICIT);
	    } 
	    /** 
	     * The inlinable call saxpy(a,x,y) is supposed to do y.d=y.d+a*x.d which in reverse means
	     * we have to switch arguments properly
	     */
	    // do the anonymous version
	    addSaxpy(theActualSourceAnonymous,
		     theActualTargetAnonymous,
		     *theFactorVariable_p,
		     aDerivativePropagatorEntry,
		     ForLoopReversalType::ANONYMOUS);
	    // do the explicit version
	    addSaxpy(theActualSourceExplicit,
		     theActualTargetExplicit,
		     *theFactorVariable_p,
		     aDerivativePropagatorEntry,
		     ForLoopReversalType::EXPLICIT);
	    break; 
	  } 
	default: 
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::algorithm_action_4: cannot handle factor kind " 
				     << (*aFactorListI).getKind()); 
	  break; 
	} // end switch 
      } // end else (other versions)
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

  ForLoopReversalType::ForLoopReversalType_E BasicBlockAlg::getReversalType() const { 
    return ForLoopReversalType::ANONYMOUS;
  } 
  
} // end of namespace
