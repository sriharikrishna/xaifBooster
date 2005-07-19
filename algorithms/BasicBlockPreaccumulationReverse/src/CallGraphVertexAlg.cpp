#include "xaifBooster/system/inc/CallGraphVertex.hpp"
#include "xaifBooster/system/inc/SymbolType.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

#include "xaifBooster/algorithms/CodeReplacement/inc/Replacement.hpp"
#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"
#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/ArgumentSubstitute.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/CallGraphVertexAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationReverse { 

  CallGraphVertexAlg::CallGraphVertexAlg(CallGraphVertex& theContaining) : 
    xaifBoosterControlFlowReversal::CallGraphVertexAlg(theContaining), 
    // JU: this is iffy. Ideally I don't want to get into accessing theContaining 
    // here since it opens the door to ordering problems between the ctors.
    myReplacementList(theContaining.getControlFlowGraph().getSymbolReference().getSymbol(),
		      theContaining.getControlFlowGraph().getSymbolReference().getScope(),
		      theContaining.getControlFlowGraph().getScope(),
                      "reverse_subroutine_template",
		      theContaining.getControlFlowGraph().getArgumentList()),
    myCFGStoreArguments_p(0),
    myCFGStoreResults_p(0),
    myCFGRestoreArguments_p(0),
    myCFGRestoreResults_p(0) { 
  }

  CallGraphVertexAlg::~CallGraphVertexAlg() { 
    if (myCFGStoreArguments_p)
      delete myCFGStoreArguments_p;
    if (myCFGStoreResults_p)
      delete myCFGStoreResults_p;
    if (myCFGRestoreArguments_p)
      delete myCFGRestoreArguments_p;
    if (myCFGRestoreResults_p) 
      delete myCFGRestoreResults_p;
  } 

  void
  CallGraphVertexAlg::printXMLHierarchy(std::ostream& os) const { 
    myReplacementList.printXMLHierarchy(os);
    //  getContaining().CallGraphVertex::printXMLHierarchyImpl(os);
  } // end of CallGraphVertexAlg::printXMLHierarchy
  
  std::string 
  CallGraphVertexAlg::debug () const { 
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulationReverse::CallGraphVertexAlg[" << this
 	<< "]" << std::ends;  
    return out.str();
  } // end of CallGraphVertexAlg::debug

  void 
  CallGraphVertexAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  void 
  CallGraphVertexAlg::algorithm_action_4() { 
    xaifBoosterControlFlowReversal::CallGraphVertexAlg::algorithm_action_4(); 
    myReplacementList.setAnnotation(getContaining().getControlFlowGraph().getAnnotation());
    myReplacementList.setId(getContaining().getControlFlowGraph().getId());
    myCFGStoreArguments_p=new ControlFlowGraph(getContaining().getControlFlowGraph().getSymbolReference().getSymbol(),
					       getContaining().getControlFlowGraph().getSymbolReference().getScope(),
					       getContaining().getControlFlowGraph().getScope(),
					       false);
    myCFGStoreResults_p=new ControlFlowGraph(getContaining().getControlFlowGraph().getSymbolReference().getSymbol(),
					     getContaining().getControlFlowGraph().getSymbolReference().getScope(),
					     getContaining().getControlFlowGraph().getScope(),
					     false);
    myCFGRestoreArguments_p=new ControlFlowGraph(getContaining().getControlFlowGraph().getSymbolReference().getSymbol(),
						 getContaining().getControlFlowGraph().getSymbolReference().getScope(),
						 getContaining().getControlFlowGraph().getScope(),
						 false);
    myCFGRestoreResults_p=new ControlFlowGraph(getContaining().getControlFlowGraph().getSymbolReference().getSymbol(),
					       getContaining().getControlFlowGraph().getSymbolReference().getScope(),
					       getContaining().getControlFlowGraph().getScope(),
					       false);
    ReplacementId theId;
    for (theId.reset();
	 !theId.atEnd();
	 ++theId) { 
      xaifBoosterCodeReplacement::Replacement& theReplacement(myReplacementList.addReplacement(*theId));
      switch(*theId) { 
      case ReplacementId::ORIGINAL: 
	theReplacement.setControlFlowGraphBase(getContaining().getControlFlowGraph());
	theReplacement.setPrintVersion(xaifBoosterCodeReplacement::PrintVersion::ORIGINAL);
	break;
      case ReplacementId::TAPING:
	if (hasTapingControlFlowGraph())
	  theReplacement.setReversibleControlFlowGraph(getTapingControlFlowGraph());
	theReplacement.setPrintVersion(xaifBoosterCodeReplacement::PrintVersion::AUGMENTED);
	break;
      case ReplacementId::ADJOINT:
	if (hasAdjointControlFlowGraph())
	  theReplacement.setReversibleControlFlowGraph(getAdjointControlFlowGraph());
	theReplacement.setPrintVersion(xaifBoosterCodeReplacement::PrintVersion::ADJOINT);
	break;
      case ReplacementId::STOREARGUMENT: 
	theReplacement.setControlFlowGraphBase(*myCFGStoreArguments_p);
	handleCheckPointing("cp_arg_store",
			    SideEffectListType::READ_LIST,
			    *myCFGStoreArguments_p,
			    false);
	break;
      case ReplacementId::STORERESULT: 
	theReplacement.setControlFlowGraphBase(*myCFGStoreResults_p);
	// JU: result checkpoints can't be stored on a stack
	handleCheckPointing("cp_res_store",
			    SideEffectListType::MOD_LIST,
			    *myCFGStoreResults_p, 
			    false);
	break;
      case ReplacementId::RESTOREARGUMENT: 
	theReplacement.setControlFlowGraphBase(*myCFGRestoreArguments_p);
	handleCheckPointing("cp_arg_restore",
			    SideEffectListType::READ_LIST,
			    *myCFGRestoreArguments_p,
			    true);
	break;
      case ReplacementId::RESTORERESULT: 
	theReplacement.setControlFlowGraphBase(*myCFGRestoreResults_p);
	// JU: result checkpoints can't be stored on a stack
	handleCheckPointing("cp_res_restore",
			    SideEffectListType::MOD_LIST,
			    *myCFGRestoreResults_p,
			    false);
	break;
      default: 
	THROW_LOGICEXCEPTION_MACRO("CallGraphVertexAlg::algorithm_action_4: no handler for ReplacementID  "
				   << ReplacementId::toString(*theId));
	break;
      }// end switch
    } // end for 	
  } 

  BasicBlock& 
  CallGraphVertexAlg::initCheckPointCFG(ControlFlowGraph& aCheckPointCFG) { 
    // make an Entry
    Entry& theEntry(*(new Entry));
    aCheckPointCFG.supplyAndAddVertexInstance(theEntry);
    theEntry.setId(aCheckPointCFG.getNextVertexId());
    theEntry.setAnnotation("cp_entry");
    // make an Exit
    Exit& theExit(*(new Exit));
    aCheckPointCFG.supplyAndAddVertexInstance(theExit);
    theExit.setId(aCheckPointCFG.getNextVertexId());
    theExit.setAnnotation("cp_exit");
    // make a BasicBlock
    // the basic block scopes should be that of the original subroutine
    try { 
      getContaining().getControlFlowGraph().getScope();
    }
    catch (...) { 
      THROW_LOGICEXCEPTION_MACRO("CallGraphVertexAlg::initCheckPointCFG: unable to get the scope from arguments for "
				 << getContaining().getSubroutineName().c_str()); 
    }
    BasicBlock& theBasicBlock(*(new BasicBlock(getContaining().getControlFlowGraph().getScope(),
					       false)));
    aCheckPointCFG.supplyAndAddVertexInstance(theBasicBlock);
    theBasicBlock.setId(aCheckPointCFG.getNextVertexId());
    theBasicBlock.setAnnotation("cp_basicblock");
    theBasicBlock.getId();
    // connect them:
    aCheckPointCFG.addEdge(theEntry,theBasicBlock).setId(aCheckPointCFG.getNextEdgeId());
    aCheckPointCFG.addEdge(theBasicBlock,theExit).setId(aCheckPointCFG.getNextEdgeId());
    return theBasicBlock;
  } 

  void 
  CallGraphVertexAlg::handleCheckPointing(const std::string& aSubroutineNameBase,
					  SideEffectListType::SideEffectListType_E aSideEffectListType,
					  ControlFlowGraph& theCFG,
					  bool reverse) { 
    // initialize
    BasicBlock& theBasicBlock(initCheckPointCFG(theCFG));
    const SideEffectList::VariablePList& 
      theVariablePList(getContaining().
		       getControlFlowGraph().
		       getSideEffectList(aSideEffectListType).
		       getVariablePList());
    if (reverse) { 
      for (SideEffectList::VariablePList::const_reverse_iterator i=theVariablePList.rbegin();
	   i!=theVariablePList.rend();
	   ++i) { 
	handleCheckPoint(aSubroutineNameBase,
			 theBasicBlock,
			 **i);
      } // end for 
    }
    else { 
      for (SideEffectList::VariablePList::const_iterator i=theVariablePList.begin();
	   i!=theVariablePList.end();
	   ++i) { 
	handleCheckPoint(aSubroutineNameBase,
			 theBasicBlock,
			 **i);
      } // end for 
    }
  } 

  void 
  CallGraphVertexAlg::handleCheckPoint(const std::string& aSubroutineNameBase,
				       BasicBlock& theBasicBlock,
				       const Variable& aVariable) { 
    addCheckPointingInlinableSubroutineCall(aSubroutineNameBase+"_"+
					    SymbolType::toString(aVariable.getVariableSymbolReference().getSymbol().getSymbolType())+"_"+
					    SymbolShape::toString(aVariable.getVariableSymbolReference().getSymbol().getSymbolShape()),
					    theBasicBlock,
					    aVariable.getVariableSymbolReference().getSymbol(),
					    aVariable.getVariableSymbolReference().getScope());
  }

  void 
  CallGraphVertexAlg::addCheckPointingInlinableSubroutineCall(const std::string& aSubroutineName,
							      BasicBlock& theBasicBlock,
							      const Symbol& theSymbol,
							      const Scope& theScope) { 
    std::string  theName(aSubroutineName);
    // a suffix indicating an active argument
    if (theSymbol.getActiveTypeFlag())
      theName.append("_a");
    // make the new call 
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& aNewCall(*(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall(theName)));
    // add it to the basic block
    theBasicBlock.supplyAndAddBasicBlockElementInstance(aNewCall);
    // give it the onstrcuted name as an ID extended by 
    aNewCall.setId(theName);
    // get the empty Variable
    Variable& theInlineVariable(aNewCall.addArgumentSubstitute(1).getVariable());
    // make a reference and give it the argument name etc.
    VariableSymbolReference& theNewVariableSymbolReference(*(new VariableSymbolReference(theSymbol,
											 theScope)));
    theNewVariableSymbolReference.setId("1");
    theNewVariableSymbolReference.setAnnotation("xaifBoosterBasicBlockPreaccumulationReverse::CallGraphVertexAlg::addCheckPointingInlinableSubroutineCall");
    // pass it on to the variable and relinquish ownership
    theInlineVariable.supplyAndAddVertexInstance(theNewVariableSymbolReference);
    theInlineVariable.getAliasMapKey().setTemporary();
    theInlineVariable.getDuUdMapKey().setTemporary();
  } 

} // end of namespace 
