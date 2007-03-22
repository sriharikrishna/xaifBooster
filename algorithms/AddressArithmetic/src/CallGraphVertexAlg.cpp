#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/GraphVizDisplay.hpp"
#include "xaifBooster/system/inc/CallGraphVertex.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/ArrayAccess.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagator.hpp"
#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorEntry.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"

#include "xaifBooster/algorithms/AddressArithmetic/inc/CallGraphVertexAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterAddressArithmetic { 

  bool CallGraphVertexAlg::ourUserDecidesFlag=false;

  bool CallGraphVertexAlg::ourIgnoranceFlag=false;

  std::string CallGraphVertexAlg::ourTopLevelRoutineName;

  const CallGraphVertex* CallGraphVertexAlg::ourTopLevelRoutine_p(0);

  void CallGraphVertexAlg::setUserDecides(){
    ourUserDecidesFlag=true;
  }
  
  void CallGraphVertexAlg::setIgnorance() {
    ourIgnoranceFlag=true;
  }

  CallGraphVertexAlg::CallGraphVertexAlg(CallGraphVertex& theContaining) : 
    xaifBoosterControlFlowReversal::CallGraphVertexAlg(theContaining),
    myOnlyUnderTopLevelRoutineFlag(false) {
  }

  CallGraphVertexAlg::~CallGraphVertexAlg() {
  }

  void
  CallGraphVertexAlg::findUnknownVariablesInExpression(const Expression& anExpression,
						       const xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theKnownVariables,
						       CallGraphVertexAlg::UnknownVarInfoList& theUnknownVariables,
						       bool thisIsCF,
						       xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex& theContainingVertex) {
    Expression::ConstVertexIteratorPair aConstVertexIteratorPair(anExpression.vertices());
    Expression::ConstVertexIterator 
      anExpressionVertexI(aConstVertexIteratorPair.first),
      anExpressionVertexEndI(aConstVertexIteratorPair.second);
    for (;anExpressionVertexI!=anExpressionVertexEndI;++anExpressionVertexI) { 
      CallGraphVertexAlg::findUnknownVariablesInExpressionVertex((*anExpressionVertexI),
								 theKnownVariables,
								 theUnknownVariables,
								 thisIsCF,
								 theContainingVertex);
    }
  }

  void
  CallGraphVertexAlg::findUnknownVariablesInExpressionVertex(const ExpressionVertex& anExpressionVertex,
							     const xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theKnownVariables,
							     CallGraphVertexAlg::UnknownVarInfoList& theUnknownVariables,
							     bool thisIsCF,
							     xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex& theContainingVertex) {
    if (!anExpressionVertex.isArgument()) 
      return; 
    const Argument& anArgument(dynamic_cast<const Argument&>(anExpressionVertex));
    // try to find it in theKnownVariables
    bool foundIt=false;
    bool locallyRedefined=false; // assume it is not 
    for (xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList::const_iterator aKnownVariablesI=theKnownVariables.begin();
	 aKnownVariablesI!=theKnownVariables.end();
	 ++aKnownVariablesI) { 
      // std::cout << "comparing known " << (*aKnownVariablesI)->equivalenceSignature() << " with unknown " << anArgument.getVariable().equivalenceSignature() << std::endl; 
      if ((*aKnownVariablesI)->equivalenceSignature()
	  ==
	  anArgument.getVariable().equivalenceSignature()) { 
	foundIt=true;
	break;
      }
    } 
    CallGraphVertexAlg::UnknownVarInfoList theUnknownIndexVariables;
    if (!foundIt) { 
      // see if this is quasi constant
      bool quasiConstantFlag(isQuasiConstant(anArgument.getVariable()));
      if (!quasiConstantFlag) {
	// possible errors:
	// check that we don't have redefinitions within the same scope
	// if we are in an index use
	if (!thisIsCF) { 
	  if (theContainingVertex.hasEnclosingControlFlow()) { 
	    if (definesUnderControlFlowGraphVertex(anArgument.getVariable(),
						   theContainingVertex.getEnclosingControlFlow().getOriginalVertex())) { 
	      THROW_LOGICEXCEPTION_MACRO("CallGraphVertexAlg::findUnknownVariablesInExpressionVertex: index variable "
					 << anArgument.getVariable().getVariableSymbolReference().getSymbol().getId().c_str()
					 << " redefined in "
					 << Symbol::stripFrontEndDecorations(getContaining().getSubroutineName().c_str(),true)
					 << " under the enclosing control flow vertex");
	    }
	  }
	  else { 
	    if (definesUnderControlFlowGraphVertex(anArgument.getVariable(),
						   theContainingVertex.getOriginalVertex())) { 
	      THROW_LOGICEXCEPTION_MACRO("CallGraphVertexAlg::findUnknownVariablesInExpressionVertex: index variable "
					 << anArgument.getVariable().getVariableSymbolReference().getSymbol().getId().c_str()
					 << " redefined in same block in routine "
					 << Symbol::stripFrontEndDecorations(getContaining().getSubroutineName().c_str(),true));
	    }
	  }
	}
	// see if it is an array of some sort:
	if (!anArgument.getVariable().hasArrayAccess() 
	    &&  
	    anArgument.getVariable().getVariableSymbolReference().getSymbol().getSymbolShape()!=SymbolShape::SCALAR)
	  THROW_LOGICEXCEPTION_MACRO("CallGraphVertexAlg::findUnknownVariablesInExpressionVertex: variable " 
				     << anArgument.getVariable().getVariableSymbolReference().getSymbol().getId().c_str()
				     << " (plain name: "
				     << anArgument.getVariable().getVariableSymbolReference().getSymbol().plainName().c_str()
				     << ") is a complete array used in routine "
				     << Symbol::stripFrontEndDecorations(getContaining().getSubroutineName().c_str(),true)
				     << " under top loop on line "
				     << dynamic_cast<const ForLoop&>(theContainingVertex.getTopExplicitLoop().getOriginalVertex()).getLineNumber());
	if (anArgument.getVariable().hasArrayAccess()) { 
	  findUnknownVariablesInArrayAccess(anArgument.getVariable().getArrayAccess(),
					    theKnownVariables,
					    theUnknownIndexVariables,
					    thisIsCF,
					    theContainingVertex);
	  if (!theUnknownIndexVariables.empty()) { 
	    DBG_MACRO(DbgGroup::ERROR,
		      "CallGraphVertexAlg::findUnknownVariablesInExpressionVertex: expression "
		      //		      << anArgument.getVariable().getVariableSymbolReference().getSymbol().getId().c_str()
		      << anArgument.getVariable().equivalenceSignature().c_str()
		      << " (plain name: "
		      << anArgument.getVariable().getVariableSymbolReference().getSymbol().plainName().c_str()
		      << ") is an array with unknown indices used in routine "
		      << Symbol::stripFrontEndDecorations(getContaining().getSubroutineName().c_str(),true)
		      << " under top loop on line "
		      << dynamic_cast<const ForLoop&>(theContainingVertex.getTopExplicitLoop().getOriginalVertex()).getLineNumber());
	  }
	}
	// see if it is redefined under the top level loop
	locallyRedefined=(definesUnderControlFlowGraphVertex(anArgument.getVariable(),theContainingVertex.getTopExplicitLoop().getOriginalVertex())>0);
	// try to find it in theUnknownVariables
	foundIt=false;
	for (CallGraphVertexAlg::UnknownVarInfoList::const_iterator anUnknownVariablesI=theUnknownVariables.begin();
	     anUnknownVariablesI!=theUnknownVariables.end();
	     ++anUnknownVariablesI) { 
	  // std::cout << "comparing old unknown variable " << (*anUnknownVariablesI).myVariable_p->equivalenceSignature() << " with new unknown " << anArgument.getVariable().equivalenceSignature() << std::endl; 
	  if ((*anUnknownVariablesI).myVariable_p->equivalenceSignature()==anArgument.getVariable().equivalenceSignature() 
	      &&
	      (!locallyRedefined
	       ||
	       (*anUnknownVariablesI).myContainingVertex_p==&theContainingVertex)
	      ) {
	    // we match the signature and then decide if we need to keep just one 
	    // representation when it is not defined within the top level loop 
	    // or else we need to keep one per control flow decision 
	    // or one for each index use.
	    foundIt=true;
	    break;
	  }
	}
      }
      else {
	// if it is quasiconstant, then we should find it in the checkpoint
	foundIt=true;
      }
    } 
    if (!foundIt) { 
      theUnknownVariables.push_back(UnknownVarInfo(anArgument.getVariable(),
						   theContainingVertex,
						   // if it is redefined or has index variables then we need to store it locally.
						   (locallyRedefined||anArgument.getVariable().hasArrayAccess()?theContainingVertex:theContainingVertex.getTopExplicitLoop()),
						   thisIsCF));
    }
    if (!theUnknownIndexVariables.empty()) 
      theUnknownVariables.splice(theUnknownVariables.end(),theUnknownIndexVariables);
  }

  void
  CallGraphVertexAlg::findUnknownVariablesInArrayAccess(const ArrayAccess& anArrayAccess,
							const xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theKnownVariables,
							CallGraphVertexAlg::UnknownVarInfoList& theUnknownVariables,
							bool thisIsCF,
							xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex& theContainingVertex) {
    const ArrayAccess::IndexTripletListType& anIndexTripletList(anArrayAccess.getIndexTripletList());
    for (ArrayAccess::IndexTripletListType::const_iterator anIndexTripletListCI=anIndexTripletList.begin();
	 anIndexTripletListCI!=anIndexTripletList.end();
	 ++anIndexTripletListCI) { 
      for (IndexTriplet::IndexPairList::const_iterator anIndexPairListCI=(*anIndexTripletListCI)->getIndexPairList().begin();
	   anIndexPairListCI!=(*anIndexTripletListCI)->getIndexPairList().end();
	   ++anIndexPairListCI) { 
	findUnknownVariablesInExpression(*((*anIndexPairListCI).second),
					 theKnownVariables,
					 theUnknownVariables,
					 thisIsCF,
					 theContainingVertex);
      }
    }
  } 

  void
  CallGraphVertexAlg::findUnknownVariablesInDerivativePropagatorIndexExpressions(xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex& theOriginalBasicBlock,
										 const xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theKnownVariables,
										 CallGraphVertexAlg::UnknownVarInfoList& theUnknownVariables) {
    // we get the sequences
    const xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::SequencePList& 
      aSequencePList(dynamic_cast<xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg&>(theOriginalBasicBlock.getOriginalVertex().getControlFlowGraphVertexAlgBase()).
		     getUniqueSequencePList());
    for (xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::SequencePList::const_iterator aSequencePListI=aSequencePList.begin();
	 aSequencePListI!=aSequencePList.end();
	 ++aSequencePListI) { 
      // get the propagators
      const xaifBoosterDerivativePropagator::DerivativePropagator& aDerivativePropagator((*aSequencePListI)->myDerivativePropagator);
      for(xaifBoosterDerivativePropagator::DerivativePropagator::EntryPList::const_iterator entryPListI=aDerivativePropagator.getEntryPList().begin();
	  entryPListI!= aDerivativePropagator.getEntryPList().end();
	  ++entryPListI) {
	// for each propagator entry
	// first deal with the factors: 
	xaifBoosterDerivativePropagator::DerivativePropagatorEntry::FactorList aFactorList;
	(*entryPListI)->getFactors(aFactorList);
	for (xaifBoosterDerivativePropagator::DerivativePropagatorEntry::FactorList::reverse_iterator aFactorListI=aFactorList.rbegin();
	     aFactorListI!=aFactorList.rend();
	     ++aFactorListI) { 
	  if ((*aFactorListI).getKind()!=xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::ZERO_FACTOR) {
	    // there is a source: 
	    if ((*aFactorListI).getSource().hasArrayAccess()) { 
	      findUnknownVariablesInArrayAccess((*aFactorListI).getSource().getArrayAccess(),
						theKnownVariables,
						theUnknownVariables,
						false,
						theOriginalBasicBlock);
	    }
	  }
	}
	// there will always be a target:
	if ((*entryPListI)->getTarget().hasArrayAccess()) { 
	    findUnknownVariablesInArrayAccess((*entryPListI)->getTarget().getArrayAccess(),
					      theKnownVariables,
					      theUnknownVariables,
					      false,
					      theOriginalBasicBlock);
	} 
      } 
    }
    // check on the subroutine calls 
    const PlainBasicBlock::BasicBlockElementList& theBasicBlockElementList(dynamic_cast<const BasicBlock&>(theOriginalBasicBlock.getOriginalVertex()).getBasicBlockElementList());
    for (PlainBasicBlock::BasicBlockElementList::const_iterator aListI=theBasicBlockElementList.begin();
	 aListI!=theBasicBlockElementList.end();
	 ++aListI) { 
      const SubroutineCall* aSubroutineCall_p=dynamic_cast<const SubroutineCall*>(*aListI);
      if (!aSubroutineCall_p)
	continue; 
      CallGraphVertexAlg::UnknownVarInfoList theUnknownIndexVariables;
      const SubroutineCall::ConcreteArgumentPList& aConcreteArgumentPList(aSubroutineCall_p->getConcreteArgumentPList());
      for (SubroutineCall::ConcreteArgumentPList::const_iterator argIt=aConcreteArgumentPList.begin();
	   argIt!=aConcreteArgumentPList.end();
	   ++argIt) { 
	if ((*argIt)->isArgument() 
	    && 
	    (*argIt)->getArgument().getVariable().hasArrayAccess()) { 
	  findUnknownVariablesInArrayAccess((*argIt)->getArgument().getVariable().getArrayAccess(),
					    theKnownVariables,
					    theUnknownIndexVariables,
					    false,
					    theOriginalBasicBlock);
	}  
      }
      if (!theUnknownIndexVariables.empty()) { 
	DBG_MACRO(DbgGroup::ERROR,
		  "CallGraphVertexAlg::findUnknownVariablesInDerivativePropagatorIndexExpressions: array with unknown indices is used in subroutine call to "
		  << aSubroutineCall_p->getSymbolReference().getSymbol().getId().c_str()
		  << " on line "
		  << aSubroutineCall_p->getLineNumber());
      }
    }
  } 

  void
  CallGraphVertexAlg::findUnknownVariablesInReversibleControlFlowGraphVertex(xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex& aReversibleControlFlowGraphVertex,
									     const xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theKnownVariables,
									     CallGraphVertexAlg::UnknownVarInfoList& theUnknownVariables) { 
    switch (aReversibleControlFlowGraphVertex.getKind()) { 
    case xaifBoosterControlFlowReversal::ControlFlowGraphVertexAlg::BASICBLOCK:{ 
      findUnknownVariablesInDerivativePropagatorIndexExpressions(aReversibleControlFlowGraphVertex,
								 theKnownVariables,
								 theUnknownVariables);
      break;
    } 
    case xaifBoosterControlFlowReversal::ControlFlowGraphVertexAlg::FORLOOP: { 
      const ForLoop& theOriginalForLoop(dynamic_cast<const ForLoop&>(aReversibleControlFlowGraphVertex.getOriginalVertex()));
      // figure this out for the init
      CallGraphVertexAlg::findUnknownVariablesInExpression(theOriginalForLoop.getInitialization().getAssignment().getRHS(),
							   theKnownVariables,
							   theUnknownVariables,
							   true,
							   aReversibleControlFlowGraphVertex);
      // the condition
      CallGraphVertexAlg::findUnknownVariablesInExpression(theOriginalForLoop.getCondition().getExpression(),
							   theKnownVariables,
							   theUnknownVariables,
							   true,
							   aReversibleControlFlowGraphVertex);
      // and the update
      CallGraphVertexAlg::findUnknownVariablesInExpression(theOriginalForLoop.getUpdate().getAssignment().getRHS(),
							   theKnownVariables,
							   theUnknownVariables,
							   true,
							   aReversibleControlFlowGraphVertex);
      break;
    }
    case xaifBoosterControlFlowReversal::ControlFlowGraphVertexAlg::BRANCH: { 
      const Branch& theOriginalBranch(dynamic_cast<const Branch&>(aReversibleControlFlowGraphVertex.getOriginalVertex()));
      // figure this out for
      // the condition
      CallGraphVertexAlg::findUnknownVariablesInExpression(theOriginalBranch.getCondition().getExpression(),
							   theKnownVariables,
							   theUnknownVariables,
							   true,
							   aReversibleControlFlowGraphVertex);
      break;
    }
    case xaifBoosterControlFlowReversal::ControlFlowGraphVertexAlg::ENDLOOP: 
    case xaifBoosterControlFlowReversal::ControlFlowGraphVertexAlg::ENDBRANCH: 
      // do nutzing
      break;
    default:
      THROW_LOGICEXCEPTION_MACRO("CallGraphVertexAlg::findUnknownVariablesInReversibleControlFlowGraphVertex: don't know what to do with " 
				 << xaifBoosterControlFlowReversal::ControlFlowGraphVertexAlg::kindToString(aReversibleControlFlowGraphVertex.getKind()));
      break;
    } 
  } 
  
  void 
  CallGraphVertexAlg::pushUnknownVariable(const Variable& anUnknownVariable,
					  xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex& theTapingVertex) { 
    static std::list<const Symbol*> ourPushAllSymbolPList;
    static std::list<const Symbol*> ourIgnoreAllSymbolPList;
    if (ourIgnoranceFlag) { 
      return;
    }
    // std::cout << "about to push " << anUnknownVariable.equivalenceSignature() << " in " << theTapingVertex.debug().c_str() << std::endl; 
    BasicBlock& thePushBlock(dynamic_cast<BasicBlock&>(theTapingVertex.getStorePlaceholder().getNewVertex()));
    // has it been pushed already?
    for (BasicBlock::BasicBlockElementList::const_iterator pushIterator=thePushBlock.getBasicBlockElementList().begin();
	 pushIterator!=thePushBlock.getBasicBlockElementList().end();
	 ++pushIterator) { 
/* 
      std::cout << "comparing already pushed " 
		<< (*(dynamic_cast<xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall&>(**pushIterator).getArgumentList().begin()))->getArgument().getVariable().equivalenceSignature()
		<< " with to be pushed variable "
		<< anUnknownVariable.equivalenceSignature() 
		<< std::endl; 
*/
      if ((*(dynamic_cast<xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall&>(**pushIterator).getArgumentList().begin()))->getArgument().getVariable().equivalenceSignature()
	  ==anUnknownVariable.equivalenceSignature()) { 
	// already pushed, done
	return;
      } 
    }
    // if the user doesn't decide we always do it
    bool doIt=!ourUserDecidesFlag;
    if(!doIt){ 
      for (std::list<const Symbol*>::iterator i=ourPushAllSymbolPList.begin();
	   i!=ourPushAllSymbolPList.end();
	   ++i) {
	if (&(anUnknownVariable.getVariableSymbolReference().getSymbol())==*i){ 
	  doIt=true;
	  break;
	} 
      }
    }
    bool skipAsking=false;
    if(!doIt){ 
      for (std::list<const Symbol*>::iterator i=ourIgnoreAllSymbolPList.begin();
	   i!=ourIgnoreAllSymbolPList.end();
	   ++i) {
	if (&(anUnknownVariable.getVariableSymbolReference().getSymbol())==*i){ 
	  skipAsking=true;
	  doIt=false;
	  break;
	} 
      }
    }
    if (!skipAsking && !doIt && ourUserDecidesFlag) {
      std::string plainVariableName(anUnknownVariable.getVariableSymbolReference().getSymbol().plainName());
      std::cout << "Explicit loop reversal in "
		<< Symbol::stripFrontEndDecorations(getContaining().getSubroutineName().c_str(),true)
		<< " for top level loop line "
		<< dynamic_cast<const ForLoop&>(theTapingVertex.getTopExplicitLoop().getOriginalVertex()).getLineNumber()
		<< " push/pop non-loop variable "
		<< plainVariableName.c_str()
		<< std::endl;
      bool done=true;
      do { 
	std::cout << "Select (p)ush this instance, (P)ush all instances, (i)gnore this Instance, (I)gnore all instances: ? ";
	char answer;
	std::cin >> answer;
	switch (answer) { 
	case 'p': 
	  doIt=true;
	  done=true;
	  break;
	case 'P': 
	  ourIgnoreAllSymbolPList.push_back(&anUnknownVariable.getVariableSymbolReference().getSymbol());
	  doIt=true;
	  done=true;
	  break;
	case 'i': 
	  done=true;
	  break;
	case 'I': 
	  ourIgnoreAllSymbolPList.push_back(&anUnknownVariable.getVariableSymbolReference().getSymbol());
	  done=true;
	  break;
	default: 
	  std::cout << "invalid input, try again" << std::endl;
	  done=false;
	  break;
	}
      } while (!done);
    }
    if (!doIt)
      return;
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theInlinableSubroutineCall_p(0);
    switch(anUnknownVariable.getType()) { 
    case SymbolType::INTEGER_STYPE:
      theInlinableSubroutineCall_p = new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_i");
      break;
    case SymbolType::REAL_STYPE:
      if (anUnknownVariable.getActiveFlag())
	theInlinableSubroutineCall_p = new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("apush");
      else
	theInlinableSubroutineCall_p = new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push");
      break;
    case SymbolType::BOOL_STYPE:
      theInlinableSubroutineCall_p = new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_b");
      break;
    case SymbolType::STRING_STYPE:
      theInlinableSubroutineCall_p = new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_s");
      break;
    default:
      THROW_LOGICEXCEPTION_MACRO("CallGraphVertexAlg::pushUnknownVariable: don't know what to do with variable of type " 
				 << SymbolType::toString(anUnknownVariable.getType()));
      break;
    } 
    theInlinableSubroutineCall_p->setId("_addressArithmetic_" + theInlinableSubroutineCall_p->getSubroutineName());
    anUnknownVariable.copyMyselfInto(theInlinableSubroutineCall_p->addConcreteArgument(1).getArgument().getVariable());
    thePushBlock.supplyAndAddBasicBlockElementInstance(*theInlinableSubroutineCall_p);
  }
  
  void 
  CallGraphVertexAlg::pushUnknownVariables(const CallGraphVertexAlg::UnknownVarInfoList& theUnknownVariables) { 
    for (CallGraphVertexAlg::UnknownVarInfoList::const_iterator theUnknownVariables_cit=theUnknownVariables.begin();
	 theUnknownVariables_cit!=theUnknownVariables.end();
	 ++theUnknownVariables_cit) { 
      pushUnknownVariable(*((*theUnknownVariables_cit).myVariable_p),
			  *((*theUnknownVariables_cit).myTapingVertex_p));
    } 
  } 

  void 
  CallGraphVertexAlg::createPopFromPush(const xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& aPushCall,
					BasicBlock& aBasicBlock_r) { 
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theInlinableSubroutineCall_p(0);
    const Variable& thePushedVariable((*(aPushCall.getArgumentList().begin()))->getArgument().getVariable());
    switch(thePushedVariable.getType()) { 
    case SymbolType::INTEGER_STYPE:
      theInlinableSubroutineCall_p = new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("pop_i");
      break;
    case SymbolType::REAL_STYPE:
      if (thePushedVariable.getActiveFlag())
	theInlinableSubroutineCall_p = new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("apop");
      else
	theInlinableSubroutineCall_p = new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("pop");
      break;
    case SymbolType::BOOL_STYPE:
      theInlinableSubroutineCall_p = new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("pop_b");
      break;
    case SymbolType::STRING_STYPE:
      theInlinableSubroutineCall_p = new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("pop_s");
      break;
    default:
      THROW_LOGICEXCEPTION_MACRO("CallGraphVertexAlg::createPopFromPush: don't know what to do with variable of type " 
				 << SymbolType::toString(thePushedVariable.getType()));
      break;
    } 
    theInlinableSubroutineCall_p->setId("_addressArithmetic_" + theInlinableSubroutineCall_p->getSubroutineName());
    thePushedVariable.copyMyselfInto(theInlinableSubroutineCall_p->addConcreteArgument(1).getArgument().getVariable());
    aBasicBlock_r.supplyAndAddBasicBlockElementInstance(*theInlinableSubroutineCall_p);
  } 

  
  void CallGraphVertexAlg::algorithm_action_5() {
    DBG_MACRO(DbgGroup::CALLSTACK,
              "xaifBoosterAddressArithmetic::CallGraphVertexAlg::algorithm_action_5(fix address arithmetic) called for: "
              << debug().c_str());
    // iterate through the taping graph if we have one:
    if (!hasTapingControlFlowGraph())
      return;
    xaifBoosterControlFlowReversal::ReversibleControlFlowGraph::VertexIteratorPair aVertexIteratorPair(getTapingControlFlowGraph().vertices());
    xaifBoosterControlFlowReversal::ReversibleControlFlowGraph::VertexIterator 
      aReversibleControlFlowGraphVertexI(aVertexIteratorPair.first),
      aReversibleControlFlowGraphVertexBeginI(aVertexIteratorPair.first),
      aReversibleControlFlowGraphVertexEndI(aVertexIteratorPair.second);
    for (;aReversibleControlFlowGraphVertexI!=aReversibleControlFlowGraphVertexEndI ;++aReversibleControlFlowGraphVertexI) {
      if ((*aReversibleControlFlowGraphVertexI).getReversalType()==ForLoopReversalType::EXPLICIT) { 
	CallGraphVertexAlg::UnknownVarInfoList theUnknownVariables;
	const xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theKnownVariables((*aReversibleControlFlowGraphVertexI).getKnownLoopVariables());
	findUnknownVariablesInReversibleControlFlowGraphVertex(*aReversibleControlFlowGraphVertexI,
							       theKnownVariables,
							       theUnknownVariables);
	if (!theUnknownVariables.empty()) { 
	  // tape the unknown variables
	  pushUnknownVariables(theUnknownVariables);
	} 
      }
    }
    // we are done pushing everything 
    // and now we can create the corresponding pops in reverse order:
    xaifBoosterControlFlowReversal::ReversibleControlFlowGraph::VertexIterator 
      aReversibleControlFlowGraphVertex2I(aReversibleControlFlowGraphVertexBeginI);
    for (;aReversibleControlFlowGraphVertex2I!=aReversibleControlFlowGraphVertexEndI ;++aReversibleControlFlowGraphVertex2I) {
      if ((*aReversibleControlFlowGraphVertex2I).getReversalType()==ForLoopReversalType::EXPLICIT
	  && 
	  (*aReversibleControlFlowGraphVertex2I).hasStorePlaceholder()
	  && 
	  // we don't do BASICBLOCKS because all things are supposed to be covered by control flow vertices 
	  (*aReversibleControlFlowGraphVertex2I).getKind()!=xaifBoosterControlFlowReversal::ControlFlowGraphVertexAlg::BASICBLOCK) { 
	// the push block	
	BasicBlock& aPushBasicBlock(dynamic_cast<BasicBlock&>((*aReversibleControlFlowGraphVertex2I).getStorePlaceholder().getNewVertex()));
	xaifBoosterControlFlowReversal::ReversibleControlFlowGraph::VertexPPairList& theOriginalReverseVertexPPairList(getTapingControlFlowGraph().getOriginalReverseVertexPPairList());
	for (xaifBoosterControlFlowReversal::ReversibleControlFlowGraph::VertexPPairList::iterator aVertexPPairListI=theOriginalReverseVertexPPairList.begin();
	     aVertexPPairListI!=theOriginalReverseVertexPPairList.end();
	     ++aVertexPPairListI) { 
	  // find the corresponding restore block
	  // by going to the counterpart node, finding its equivalent node in the adjoint graph 
	  // and getting that node's restore placeholder: 
	  if ((*aVertexPPairListI).first==&((*aReversibleControlFlowGraphVertex2I).getCounterPart())) { 
	    // the pop block
	    BasicBlock& aPopBasicBlock(dynamic_cast<BasicBlock&>((*aVertexPPairListI).second->getRestorePlaceholder().getNewVertex()));
	    BasicBlock::BasicBlockElementList::const_reverse_iterator pushIteratorEnd=aPushBasicBlock.getBasicBlockElementList().rend();
	    for (BasicBlock::BasicBlockElementList::const_reverse_iterator pushIterator=aPushBasicBlock.getBasicBlockElementList().rbegin();
		 pushIterator!=pushIteratorEnd;
		 ++pushIterator) { 
	      createPopFromPush(dynamic_cast<xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall&>(**pushIterator),
				aPopBasicBlock);
	    }
	    break;
	  } 
	} 
      } 
    } 
  } 

  std::string
  CallGraphVertexAlg::debug() const {
    std::ostringstream out;
    out << "xaifBoosterAddressArithmetic::CallGraphVertexAlg["
        << this
        << "]" << std::ends;
    return out.str();
  }

  void CallGraphVertexAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
  }

  void CallGraphVertexAlg::setTopLevelRoutine(const std::string& theName) { 
    ourTopLevelRoutineName=theName;
  } 

  bool  CallGraphVertexAlg::haveTopLevelRoutineName() { 
    return (!ourTopLevelRoutineName.empty());
  } 

  const CallGraphVertex& CallGraphVertexAlg::getTopLevelRoutine() { 
    if (!ourTopLevelRoutine_p) { 
      if (!haveTopLevelRoutineName())
	THROW_LOGICEXCEPTION_MACRO("CallGraphVertexAlg::getTopLevelRoutine: no top level routine specified");
      ourTopLevelRoutine_p=&(ConceptuallyStaticInstances::instance()->getCallGraph().getSubroutineByPlainName(ourTopLevelRoutineName));
    }
    return *ourTopLevelRoutine_p;
  }

  bool CallGraphVertexAlg::isOnlyUnderTopLevelRoutine() { 
    if (!myOnlyUnderTopLevelRoutineFlag) {
      if (ConceptuallyStaticInstances::instance()->getCallGraph().firstDominatedBySecond(getContaining(),
											 getTopLevelRoutine(),
											 false))
	myOnlyUnderTopLevelRoutineFlag=true;
      else { 
	DBG_MACRO(DbgGroup::DATA,"CallGraphVertexAlg::isOnlyUnderTopLevelRoutine: routine " 
		  << getContaining().getSubroutineName().c_str()
		  << " is not exclusivly called under the top level routine "
		  << ourTopLevelRoutineName.c_str());
      }
    }
    return myOnlyUnderTopLevelRoutineFlag;
  } 

  bool CallGraphVertexAlg::isQuasiConstant(const Variable& theVariable) { 
    // see if it is quasi-constant. 
    // for that we need to know that this procedure is 
    // called only under the top level routine
    // and 
    // the variable needs to occur in the top-level's REF list (or else this has smaller scope)
    // and cannot be in the top-level's MOD list
    if (haveTopLevelRoutineName()
	&& 
	// 	isOnlyUnderTopLevelRoutine() 
	// 	&& 
	getTopLevelRoutine().getControlFlowGraph().getSideEffectList(SideEffectListType::READ_LIST).
	hasElement(theVariable)
	&& 
	!getTopLevelRoutine().getControlFlowGraph().getSideEffectList(SideEffectListType::MOD_LIST).
	hasElement(theVariable)) { 
      ;
      return true;
    }
    if (DbgLoggerManager::instance()->isSelected(DbgGroup::TEMPORARY)) { 
      std::ostringstream dbg;
      dbg << "CallGraphVertexAlg::isQuasiConstant: checking for "
	  << theVariable.getVariableSymbolReference().getSymbol().getId().c_str()
	  << " in "
	  << Symbol::stripFrontEndDecorations(getContaining().getSubroutineName().c_str(),true)
	  << " and decide based on: ";
      if (haveTopLevelRoutineName()) { 
	if (!isOnlyUnderTopLevelRoutine()) 
	  dbg << "not exclusivly called under top level routine";
	else if (!getTopLevelRoutine().getControlFlowGraph().getSideEffectList(SideEffectListType::READ_LIST).
		 hasElement(theVariable))
	  dbg << "not in top level routine READ list";
	else if (getTopLevelRoutine().getControlFlowGraph().getSideEffectList(SideEffectListType::MOD_LIST).
		 hasElement(theVariable))
	  dbg << "in top level routine MOD list";
      }
      else 
	dbg << " no top level routine name";
      dbg << std::ends; 
      DBG_MACRO(DbgGroup::TEMPORARY,dbg.str().c_str());
    }
    return false;
  } 

  int CallGraphVertexAlg::definesUnderControlFlowGraphVertex(const Variable& theVariable,
							     const ControlFlowGraphVertex& theControlFlowGraphVertex) { 

    int defCount=0;
    if (theVariable.getVariableSymbolReference().getSymbol().getSymbolType()==SymbolType::STRING_STYPE) { 
      DBG_MACRO(DbgGroup::ERROR,
		"CallGraphVertexAlg::definesUnderControlFlowGraphVertex: (old OA) skipping definitions check for string variable " 
		<< theVariable.getVariableSymbolReference().getSymbol().getId().c_str()
		<< " (plain name: "
		<< theVariable.getVariableSymbolReference().getSymbol().plainName().c_str()
		<< ") in routine "
		<< Symbol::stripFrontEndDecorations(getContaining().getSubroutineName().c_str(),true));
    }
    else if (theVariable.getDuUdMapKey().getKind()==DuUdMapKey::NO_INFO) { 
      // this problem happens with the old OA because sometimes in multi-vertex index expressions (k+1 as opposed to just k)
      // it does not return proper duud information. 
      DBG_MACRO(DbgGroup::ERROR,
		"CallGraphVertexAlg::definesUnderControlFlowGraphVertex: (old OA) skipping definitions check since no duud key for  non-string variable " 
		<< theVariable.getVariableSymbolReference().getSymbol().getId().c_str()
		<< " (plain name: "
		<< theVariable.getVariableSymbolReference().getSymbol().plainName().c_str()
		<< ") in routine "
		<< Symbol::stripFrontEndDecorations(getContaining().getSubroutineName().c_str(),true));
    } 
    else {
      // check all the definition locations:
      const DuUdMapDefinitionResult::StatementIdList& defChain(ConceptuallyStaticInstances::instance()->
							       getCallGraph().getDuUdMap().getEntry(theVariable.getDuUdMapKey()).getStatementIdList());
      for(DuUdMapDefinitionResult::StatementIdList::const_iterator defChainI=defChain.begin();
	  defChainI!=defChain.end();
	  ++defChainI) {
	if (!(*defChainI).empty()
	    && 
	    getContaining().getControlFlowGraph().firstDominatedBySecond(getContaining().getControlFlowGraph().getContainingVertex(*defChainI),
									 theControlFlowGraphVertex,
									 false)) { 
	  defCount++;
	}
      }
    }
    return defCount;
  }

} // end of namespace

