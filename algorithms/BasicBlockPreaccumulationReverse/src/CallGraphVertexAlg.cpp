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
  
  std::string CallGraphVertexAlg::debug () const { 
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulationReverse::CallGraphVertexAlg[" << this
 	<< "]" << std::ends;  
    return out.str();
  } // end of CallGraphVertexAlg::debug

  void CallGraphVertexAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  void CallGraphVertexAlg::algorithm_action_4() { 
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
	theReplacement.setReversibleControlFlowGraph(getTapingControlFlowGraph());
	theReplacement.setPrintVersion(xaifBoosterCodeReplacement::PrintVersion::AUGMENTED);
	break;
      case ReplacementId::ADJOINT:
	theReplacement.setReversibleControlFlowGraph(getAdjointControlFlowGraph());
	theReplacement.setPrintVersion(xaifBoosterCodeReplacement::PrintVersion::ADJOINT);
	break;
      case ReplacementId::STOREARGUMENT: 
	theReplacement.setControlFlowGraphBase(*myCFGStoreArguments_p);
	handleCheckPointing("cp_arg_store",
			    IntentType::OUT_ITYPE,
			    *myCFGStoreArguments_p,
			    false);
	break;
      case ReplacementId::STORERESULT: 
	theReplacement.setControlFlowGraphBase(*myCFGStoreResults_p);
	handleCheckPointing("cp_res_store",
			    IntentType::IN_ITYPE,
			    *myCFGStoreResults_p, 
			    false);
	break;
      case ReplacementId::RESTOREARGUMENT: 
	theReplacement.setControlFlowGraphBase(*myCFGRestoreArguments_p);
	handleCheckPointing("cp_arg_restore",
			    IntentType::OUT_ITYPE,
			    *myCFGRestoreArguments_p,
			    true);
	break;
      case ReplacementId::RESTORERESULT: 
	theReplacement.setControlFlowGraphBase(*myCFGRestoreResults_p);
	handleCheckPointing("cp_res_restore",
			    IntentType::IN_ITYPE,
			    *myCFGRestoreResults_p,
			    true);
	break;
      default: 
	THROW_LOGICEXCEPTION_MACRO("CallGraphVertexAlg::algorithm_action_4: no handler for ReplacementID  "
				   << ReplacementId::toString(*theId));
	break;
      }// end switch
    } // end for 	
  } 

  BasicBlock& CallGraphVertexAlg::initCheckPointCFG(ControlFlowGraph& aCheckPointCFG) { 
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

  void CallGraphVertexAlg::handleCheckPointing(const std::string& aSubroutineNameBase,
					       IntentType::IntentType_E theExcludedIntent,
					       ControlFlowGraph& theCFG,
					       bool reverse) { 
    // initialize
    BasicBlock& theBasicBlock(initCheckPointCFG(theCFG));
    const ArgumentList::ArgumentSymbolReferencePList& theArgumentSymbolReferenceList(getContaining().getControlFlowGraph().getArgumentList().getArgumentSymbolReferencePList());
    if (reverse) { 
      for (ArgumentList::ArgumentSymbolReferencePList::const_reverse_iterator i=theArgumentSymbolReferenceList.rbegin();
	   i!=theArgumentSymbolReferenceList.rend();
	   ++i) { 
	handleCheckPoint(aSubroutineNameBase,
			 theExcludedIntent,
			 theBasicBlock,
			 **i);
      } // end for 
    }
    else { 
      for (ArgumentList::ArgumentSymbolReferencePList::const_iterator i=theArgumentSymbolReferenceList.begin();
	   i!=theArgumentSymbolReferenceList.end();
	   ++i) { 
	handleCheckPoint(aSubroutineNameBase,
			 theExcludedIntent,
			 theBasicBlock,
			 **i);
      } // end for 
    }
  } 

  void CallGraphVertexAlg::handleCheckPoint(const std::string& aSubroutineNameBase,
					    IntentType::IntentType_E theExcludedIntent,
					    BasicBlock& theBasicBlock,
					    const ArgumentSymbolReference& theArgumentSymbolReference) { 
    if (theArgumentSymbolReference.getIntent()!=theExcludedIntent) { 
      // all non-out parameters will be stored:
      addCheckPointingInlinableSubroutineCall(aSubroutineNameBase+"_"+
					      SymbolType::toString(theArgumentSymbolReference.getSymbol().getSymbolType())+"_"+
					      SymbolShape::toString(theArgumentSymbolReference.getSymbol().getSymbolShape()),
					      theBasicBlock,
					      theArgumentSymbolReference.getSymbol(),
					      theArgumentSymbolReference.getScope());
    } // end if 
  }

  void CallGraphVertexAlg::addCheckPointingInlinableSubroutineCall(const std::string& aSubroutineName,
								   BasicBlock& theBasicBlock,
								   const Symbol& theSymbol,
								   const Scope& theScope) { 
    // make the new call 
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& aNewCall(*(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall(aSubroutineName)));
    // add it to the basic block
    theBasicBlock.supplyAndAddBasicBlockElementInstance(aNewCall);
    // give it an ID
    aNewCall.setId(aSubroutineName);
    // get the empty Variable
    Variable& theInlineVariable(aNewCall.addArgumentSubstitute(1).getVariable());
    // make a reference and give it the argument name etc.
    VariableSymbolReference& theNewVariableSymbolReference(*(new VariableSymbolReference(theSymbol,
											 theScope)));
    theNewVariableSymbolReference.setId("1");
    // pass it on to the variable and relinquish ownership
    theInlineVariable.supplyAndAddVertexInstance(theNewVariableSymbolReference);
    theInlineVariable.getAliasMapKey().setTemporary();
    theInlineVariable.getDuUdMapKey().setTemporary();
  } 

} // end of namespace 
