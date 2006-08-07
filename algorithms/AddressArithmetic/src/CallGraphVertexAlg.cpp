#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/GraphVizDisplay.hpp"
#include "xaifBooster/system/inc/CallGraphVertex.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/ArrayAccess.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagator.hpp"
#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorEntry.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"

#include "xaifBooster/algorithms/AddressArithmetic/inc/CallGraphVertexAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterAddressArithmetic { 

  bool CallGraphVertexAlg::ourUserDecidesFlag=false;

  bool CallGraphVertexAlg::ourIgnoranceFlag=false;

  void CallGraphVertexAlg::setUserDecides(){
    ourUserDecidesFlag=true;
  }
  
  void CallGraphVertexAlg::setIgnorance() {
    ourIgnoranceFlag=true;
  }

  CallGraphVertexAlg::CallGraphVertexAlg(CallGraphVertex& theContaining) : 
    xaifBoosterControlFlowReversal::CallGraphVertexAlg(theContaining){
  }

  CallGraphVertexAlg::~CallGraphVertexAlg() {
  }

  void
  CallGraphVertexAlg::findUnknownVariablesInExpression(const Expression& anExpression,
						       const xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theKnownVariables,
						       xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theUnknownVariables) {
    Expression::ConstVertexIteratorPair aConstVertexIteratorPair(anExpression.vertices());
    Expression::ConstVertexIterator 
      anExpressionVertexI(aConstVertexIteratorPair.first),
      anExpressionVertexEndI(aConstVertexIteratorPair.second);
    for (;anExpressionVertexI!=anExpressionVertexEndI;++anExpressionVertexI) { 
      if ((*anExpressionVertexI).isArgument()) { 
	// try to find it in theKnownVariables
	bool foundIt=false;
	for (xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList::const_iterator aKnownVariablesI=theKnownVariables.begin();
	     aKnownVariablesI!=theKnownVariables.end();
	     ++aKnownVariablesI) { 
	  if ((*aKnownVariablesI)->equivalenceSignature()
	      ==
	      dynamic_cast<const Argument&>(*anExpressionVertexI).getVariable().equivalenceSignature()) { 
	    foundIt=true;
	    break;
	  }
	} 
	if (!foundIt) { 
	  // try to find it in theUnknownVariables
	  foundIt=false;
	  for (xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList::const_iterator anUnknownVariablesI=theUnknownVariables.begin();
	       anUnknownVariablesI!=theUnknownVariables.end();
	       ++anUnknownVariablesI) { 
	    if ((*anUnknownVariablesI)->equivalenceSignature()==dynamic_cast<const Argument&>(*anExpressionVertexI).getVariable().equivalenceSignature()) { 
	      foundIt=true;
	      break;
	    }
	  } 
	  if (!foundIt) { 
	    theUnknownVariables.push_back(&(dynamic_cast<const Argument&>(*anExpressionVertexI).getVariable()));
	  }
	} 
      } 
    } 
  } 

  void
  CallGraphVertexAlg::findUnknownVariablesInDerivativePropagatorIndexExpressions(const BasicBlock& theOriginalBasicBlock,
										 const xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theKnownVariables,
										 xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theUnknownVariables) {
    // we get the sequences
    const xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::SequencePList& aSequencePList(dynamic_cast<xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg&>(theOriginalBasicBlock.getBasicBlockAlgBase()).
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
	      // it has array access
	      const ArrayAccess::IndexListType& anIndexList((*aFactorListI).getSource().getArrayAccess().getIndexList());
	      for (ArrayAccess::IndexListType::const_iterator anIndexListI=anIndexList.begin();
		   anIndexListI!=anIndexList.end();
		   ++anIndexListI) { 
		findUnknownVariablesInExpression(**anIndexListI,
						 theKnownVariables,
						 theUnknownVariables);
	      }
	    } 
	  }
	}
	// there will always be a target:
	if ((*entryPListI)->getTarget().hasArrayAccess()) { 
	  // it has array access
	  const ArrayAccess::IndexListType anIndexList=(*entryPListI)->getTarget().getArrayAccess().getIndexList();
	  for (ArrayAccess::IndexListType::const_iterator anIndexListI=anIndexList.begin();
	       anIndexListI!=anIndexList.end();
	       ++anIndexListI) { 
	    findUnknownVariablesInExpression(**anIndexListI,
					     theKnownVariables,
					     theUnknownVariables);
	  }
	} 
      } 
    }
  } 

  void
  CallGraphVertexAlg::findUnknownVariablesInReversibleControlFlowGraphVertex(const xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex& aReversibleControlFlowGraphVertex,
									     const xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theKnownVariables,
									     xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theUnknownVariables) { 
    switch (aReversibleControlFlowGraphVertex.getKind()) { 
    case xaifBoosterControlFlowReversal::ControlFlowGraphVertexAlg::BASICBLOCK:{ 
      const BasicBlock& theOriginalBasicBlock(dynamic_cast<const BasicBlock&>(aReversibleControlFlowGraphVertex.getOriginalVertex()));
      findUnknownVariablesInDerivativePropagatorIndexExpressions(theOriginalBasicBlock,
								 theKnownVariables,
								 theUnknownVariables);
      break;
    } 
    case xaifBoosterControlFlowReversal::ControlFlowGraphVertexAlg::FORLOOP: { 
      const ForLoop& theOriginalForLoop(dynamic_cast<const ForLoop&>(aReversibleControlFlowGraphVertex.getOriginalVertex()));
      // figure this out for the init
      CallGraphVertexAlg::findUnknownVariablesInExpression(theOriginalForLoop.getInitialization().getAssignment().getRHS(),
							   theKnownVariables,
							   theUnknownVariables);
      // the condition
      CallGraphVertexAlg::findUnknownVariablesInExpression(theOriginalForLoop.getCondition().getExpression(),
							   theKnownVariables,
							   theUnknownVariables);
      // and the update
      CallGraphVertexAlg::findUnknownVariablesInExpression(theOriginalForLoop.getUpdate().getAssignment().getRHS(),
							   theKnownVariables,
							   theUnknownVariables);
      break;
    }
    case xaifBoosterControlFlowReversal::ControlFlowGraphVertexAlg::BRANCH: { 
      const Branch& theOriginalBranch(dynamic_cast<const Branch&>(aReversibleControlFlowGraphVertex.getOriginalVertex()));
      // figure this out for
      // the condition
      CallGraphVertexAlg::findUnknownVariablesInExpression(theOriginalBranch.getCondition().getExpression(),
							   theKnownVariables,
							   theUnknownVariables);
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
					  BasicBlock& aBasicBlock_r,
					  unsigned int aTopLevelForLoopLineNumber) { 
    static std::list<const Symbol*> ourPushAllSymbolPList;
    static std::list<const Symbol*> ourIgnoreAllSymbolPList;
    if (ourIgnoranceFlag) { 
      return;
    }
    // has it been pushed already?
    for (BasicBlock::BasicBlockElementList::const_iterator pushIterator=aBasicBlock_r.getBasicBlockElementList().begin();
	 pushIterator!=aBasicBlock_r.getBasicBlockElementList().end();
	 ++pushIterator) { 
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
      std::string variableName(anUnknownVariable.getVariableSymbolReference().getSymbol().getId());
      // strip the trailing _[0-9]* from the variableName
      std::string variableNameStripped(variableName,0,variableName.find_last_of('_'));
      std::cout << "Explicit loop reversal for top level loop line "
		<< aTopLevelForLoopLineNumber
		<< " push/pop non-loop variable "
		<< variableNameStripped.c_str()
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
      theInlinableSubroutineCall_p = new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push");
      break;
    case SymbolType::BOOL_STYPE:
      theInlinableSubroutineCall_p = new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_b");
      break;
    case SymbolType::STRING_STYPE:
      theInlinableSubroutineCall_p = new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_s");
      break;
    default:
      THROW_LOGICEXCEPTION_MACRO("CallGraphVertexAlg::pushUnknownVariables: don't know what to do with variable of type " 
				 << SymbolType::toString(anUnknownVariable.getType()));
      break;
    } 
    theInlinableSubroutineCall_p->setId("_addressArithmetic_" + theInlinableSubroutineCall_p->getSubroutineName());
    anUnknownVariable.copyMyselfInto(theInlinableSubroutineCall_p->addConcreteArgument(1).getArgument().getVariable());
    aBasicBlock_r.supplyAndAddBasicBlockElementInstance(*theInlinableSubroutineCall_p);
  }
  
  void 
  CallGraphVertexAlg::pushUnknownVariables(const xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theUnknownVariables,
					   BasicBlock& aBasicBlock_r,
					   unsigned int aTopLevelForLoopLineNumber) { 
    for (xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList::const_iterator theUnknownVariables_cit=theUnknownVariables.begin();
	 theUnknownVariables_cit!=theUnknownVariables.end();
	 ++theUnknownVariables_cit) { 
      pushUnknownVariable(**theUnknownVariables_cit,
			  aBasicBlock_r,
			  aTopLevelForLoopLineNumber);
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
    if (hasTapingControlFlowGraph()) { 
      xaifBoosterControlFlowReversal::ReversibleControlFlowGraph::VertexIteratorPair aVertexIteratorPair(getTapingControlFlowGraph().vertices());
      xaifBoosterControlFlowReversal::ReversibleControlFlowGraph::VertexIterator 
	aReversibleControlFlowGraphVertexI(aVertexIteratorPair.first),
	aReversibleControlFlowGraphVertexEndI(aVertexIteratorPair.second);
      for (;aReversibleControlFlowGraphVertexI!=aReversibleControlFlowGraphVertexEndI ;++aReversibleControlFlowGraphVertexI) {
	if ((*aReversibleControlFlowGraphVertexI).getReversalType()==ForLoopReversalType::EXPLICIT) { 
	  xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList theUnknownVariables;
	  const xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theKnownVariables((*aReversibleControlFlowGraphVertexI).getKnownLoopVariables());
	  findUnknownVariablesInReversibleControlFlowGraphVertex(*aReversibleControlFlowGraphVertexI,
								 theKnownVariables,
								 theUnknownVariables);
	  if (!theUnknownVariables.empty()) { 
	    // get the taping point
	    BasicBlock& aBasicBlock(dynamic_cast<BasicBlock&>((*aReversibleControlFlowGraphVertexI).
							      getTopExplicitLoop().
							      getTopExplicitLoopAddressArithmetic().
							      getNewVertex()));
	    // tape the unknown variables
	    pushUnknownVariables(theUnknownVariables,
				 aBasicBlock,
				 (dynamic_cast<const ForLoop&>((*aReversibleControlFlowGraphVertexI).getTopExplicitLoop().getOriginalVertex())).getLineNumber());
	  } 
	}
      }
      // we are done pushing everything 
      // and now we can create the corresponding pops in reverse order:
      xaifBoosterControlFlowReversal::ReversibleControlFlowGraph::VertexPPairList& theOriginalReverseVertexPPairList(getTapingControlFlowGraph().getOriginalReverseVertexPPairList());
      for (xaifBoosterControlFlowReversal::ReversibleControlFlowGraph::VertexPPairList::iterator aVertexPPairListI=theOriginalReverseVertexPPairList.begin();
	   aVertexPPairListI!=theOriginalReverseVertexPPairList.end();
	   ++aVertexPPairListI) { 
	if ((*aVertexPPairListI).first->getReversalType()==ForLoopReversalType::EXPLICIT
	    && 
	    (*aVertexPPairListI).first==&((*aVertexPPairListI).first->getTopExplicitLoop())) { 
	  // this is a top explicit loop
	  BasicBlock& aPushBasicBlock(dynamic_cast<BasicBlock&>((*aVertexPPairListI).first->
								getTopExplicitLoopAddressArithmetic().
								getNewVertex()));
	  // find the counterpart in the adjoint graph:
	  // this is a loop, its counterpart is an ENDLOOP which is the original to the adjoint FORLOOP;
	  // BTW it doesn't work the other way round since we don't set up counterpart in the adjoint graph
	  xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex& theEndLoopCounterPart((*aVertexPPairListI).first->getCounterPart());
	  xaifBoosterControlFlowReversal::ReversibleControlFlowGraph::VertexPPairList::iterator anInnerVertexPPairListI=theOriginalReverseVertexPPairList.begin();
	  for (;
	       anInnerVertexPPairListI!=theOriginalReverseVertexPPairList.end();
	       ++anInnerVertexPPairListI) { 
	    if ((*anInnerVertexPPairListI).first==&theEndLoopCounterPart)
	      break;
	  }
	  if (anInnerVertexPPairListI==theOriginalReverseVertexPPairList.end())
	    THROW_LOGICEXCEPTION_MACRO("CallGraphVertexAlg::algorithm_action_5: ENDLOOP " 
				       << theEndLoopCounterPart.getOriginalVertex().debug().c_str()
				       << " not in the vertex pair list");
	  xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex& theReverseLoop(*(*anInnerVertexPPairListI).second);
	  // this one has a corresponding BasicBlock for the address arithmetic variables: 
	  BasicBlock& aPopBasicBlock(dynamic_cast<BasicBlock&>(theReverseLoop.
							       getTopExplicitLoopAddressArithmetic().
							       getNewVertex()));
	  BasicBlock::BasicBlockElementList::const_reverse_iterator pushIteratorEnd=aPushBasicBlock.getBasicBlockElementList().rend();
	  for (BasicBlock::BasicBlockElementList::const_reverse_iterator pushIterator=aPushBasicBlock.getBasicBlockElementList().rbegin();
	       pushIterator!=pushIteratorEnd;
	       ++pushIterator) { 
	    createPopFromPush(dynamic_cast<xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall&>(**pushIterator),
			      aPopBasicBlock);
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

} // end of namespace
