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
#include <string>
#include <fstream>

#include "xaifBooster/utils/inc/MemCounter.hpp"

#include "xaifBooster/boostWrapper/inc/GraphWrapper.hpp"

#include "xaifBooster/system/inc/CallGraphVertex.hpp"
#include "xaifBooster/system/inc/SymbolType.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

#include "xaifBooster/algorithms/CodeReplacement/inc/Replacement.hpp"
#include "xaifBooster/algorithms/CodeReplacement/inc/ReplacementList.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"

#include "xaifBooster/algorithms/TypeChange/inc/ControlFlowGraphAlg.hpp"
#include "xaifBooster/algorithms/TypeChange/inc/SymbolAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/CallGraphVertexAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationReverse { 
  
  bool CallGraphVertexAlg::runtimeCounters=false;
  bool CallGraphVertexAlg::ourCheckPointToFilesFlag=false;
  bool CallGraphVertexAlg::ourForceAllArgCheckPointFlag=false;

  CallGraphVertexAlg::CallGraphVertexAlg(CallGraphVertex& theContaining) : 
	CallGraphVertexAlgBase(theContaining),
    xaifBoosterPushPop::CallGraphVertexAlg(theContaining), 
    myReplacementList_p(0),
    myCFGStoreArguments_p(0),
    myCFGStoreResults_p(0),
    myCFGRestoreArguments_p(0),
    myCFGRestoreResults_p(0),
    myCFGTimeStepStoreArguments_p(0),
    myCFGTimeStepRestoreArguments_p(0) { 
  }

  CallGraphVertexAlg::~CallGraphVertexAlg() { 
    if (myReplacementList_p)
      delete myReplacementList_p;
    if (myCFGStoreArguments_p)
      delete myCFGStoreArguments_p;
    if (myCFGStoreResults_p)
      delete myCFGStoreResults_p;
    if (myCFGRestoreArguments_p)
      delete myCFGRestoreArguments_p;
    if (myCFGRestoreResults_p) 
      delete myCFGRestoreResults_p;
    if (myCFGTimeStepStoreArguments_p)
      delete myCFGTimeStepStoreArguments_p;
    if (myCFGTimeStepRestoreArguments_p)
      delete myCFGTimeStepRestoreArguments_p;
  } 

  void
  CallGraphVertexAlg::printXMLHierarchy(std::ostream& os) const {
    /*    for(PlainBasicBlock::BasicBlockElementList::const_iterator myBasicBlockElementListI = myBasicBlockElementList.begin();
	  myBasicBlockElementListI != myBasicBlockElementList.end();
	  ++myBasicBlockElementListI)
	  {
	  (*(myBasicBlockElementListI))->printXMLHierarchy(os);
	  }*/

    if (!myReplacementList_p)
      THROW_LOGICEXCEPTION_MACRO("CallGraphVertexAlg::printXMLHierarchy: no replacement list ");
    myReplacementList_p->printXMLHierarchy(os);
    /*  for(PlainBasicBlock::BasicBlockElementList::const_iterator myBasicBlockElementListI = myBasicBlockElementList.begin();
        myBasicBlockElementListI != myBasicBlockElementList.end();
        ++myBasicBlockElementListI)
	{
	(*(myBasicBlockElementListI))->printXMLHierarchy(os);
	}*/
  } // end of CallGraphVertexAlg::printXMLHierarchy
  
  std::string 
  CallGraphVertexAlg::debug () const { 
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulationReverse::CallGraphVertexAlg[" 
	<< this
	<< ", containing="
	<< getContaining().debug().c_str()
 	<< "]" << std::ends;  
    return out.str();
  } // end of CallGraphVertexAlg::debug

  void 
  CallGraphVertexAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  void 
  CallGraphVertexAlg::algorithm_action_5() {
    xaifBoosterAddressArithmetic::CallGraphVertexAlg::algorithm_action_5();
    xaifBoosterControlFlowReversal::CallGraphVertexAlg::algorithm_action_5();
    DBG_MACRO(DbgGroup::CALLSTACK,"xaifBoosterBasicBlockPreaccumulationReverse::CallGraphVertexAlg::algorithm_action_5()");
  }

  void 
  CallGraphVertexAlg::algorithm_action_4() { 
    xaifBoosterControlFlowReversal::CallGraphVertexAlg::algorithm_action_4();
    DBG_MACRO(DbgGroup::CALLSTACK,"xaifBoosterBasicBlockPreaccumulationReverse::CallGraphVertexAlg::algorithm_action_4()");
    // see if we have a replacement symbol for this one: 
    const xaifBoosterTypeChange::SymbolAlg& 
      theSymbolAlg(dynamic_cast<const xaifBoosterTypeChange::SymbolAlg&>(getContaining().
									 getControlFlowGraph().
									 getSymbolReference().
									 getSymbol().
									 getSymbolAlgBase()));
    const SymbolReference* theSymbolReference_p;
    MemCounter myArg;
    MemCounter myTsarg;
    MemCounter myRes;
    MemCounter count;
    ControlFlowGraph::ConstVertexIteratorPair p(getContaining().getControlFlowGraph().vertices());
    ControlFlowGraph::ConstVertexIterator itr(p.first), endIt(p.second);
    for(; itr!= endIt;
	++itr)
      {
	//	    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg* tester2;
	const BasicBlock* tester = dynamic_cast<const BasicBlock*>(&(*itr));
	if(tester != NULL)
	  {
	    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg& tester2(dynamic_cast<xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg&>(tester->getBasicBlockAlgBase()));
	    myPreaccumulationCounter.incrementBy(tester2.getPreaccumulationCounter());
	  }
      }
    DBG_MACRO(DbgGroup::METRIC, "Subroutine Operations "
              << myPreaccumulationCounter.debug());
    if (theSymbolAlg.hasReplacementSymbolReference()) 
      theSymbolReference_p=&(theSymbolAlg.getReplacementSymbolReference());
    else
      theSymbolReference_p=&(getContaining().getControlFlowGraph().getSymbolReference());
    // make the replacement list
    if (!myReplacementList_p) 
      myReplacementList_p=
	new xaifBoosterCodeReplacement::ReplacementList(theSymbolReference_p->getSymbol(),
							theSymbolReference_p->getScope(),
							getContaining().getControlFlowGraph().getScope(),
							"reverse_subroutine_template",
							getContaining().getControlFlowGraph().getArgumentList());
    myReplacementList_p->setAnnotation(getContaining().getControlFlowGraph().getAnnotation());
    myReplacementList_p->setId(getContaining().getControlFlowGraph().getId());
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
    myCFGTimeStepStoreArguments_p=new ControlFlowGraph(getContaining().getControlFlowGraph().getSymbolReference().getSymbol(),
						       getContaining().getControlFlowGraph().getSymbolReference().getScope(),
						       getContaining().getControlFlowGraph().getScope(),
						       false);
    myCFGTimeStepRestoreArguments_p=new ControlFlowGraph(getContaining().getControlFlowGraph().getSymbolReference().getSymbol(),
							 getContaining().getControlFlowGraph().getSymbolReference().getScope(),
							 getContaining().getControlFlowGraph().getScope(),
							 false);
    ReplacementId theId;
    for (theId.reset();
	 !theId.atEnd();
	 ++theId) { 
      xaifBoosterCodeReplacement::Replacement& theReplacement(myReplacementList_p->addReplacement(*theId));
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
      case ReplacementId::STRICTANONYMOUSTAPING:
	if (hasStrictAnonymousTapingControlFlowGraph())
	  theReplacement.setReversibleControlFlowGraph(getStrictAnonymousTapingControlFlowGraph());
	theReplacement.setPrintVersion(xaifBoosterCodeReplacement::PrintVersion::AUGMENTED);
	break;
      case ReplacementId::STRICTANONYMOUSADJOINT:
	if (hasStrictAnonymousAdjointControlFlowGraph())
	  theReplacement.setReversibleControlFlowGraph(getStrictAnonymousAdjointControlFlowGraph());
	theReplacement.setPrintVersion(xaifBoosterCodeReplacement::PrintVersion::ADJOINT);
	break;
      case ReplacementId::STOREARGUMENT: { 
	theReplacement.setControlFlowGraphBase(*myCFGStoreArguments_p);
	BasicBlock& theBasicBlock(initCheckPointCFG(*myCFGStoreArguments_p));

	handleCheckPointing("cp_arg_store",
			    SideEffectListType::READ_LIST,
			    theBasicBlock,
			    false, 
			    count);
        if(runtimeCounters) {
	  xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& aNewCall(*(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("countcheckpoint")));
	  //add it to the basic block
          theBasicBlock.supplyAndAddBasicBlockElementInstance(aNewCall);
	  // give it the onstrcuted name as an ID extended by
	  aNewCall.setId("countcheckpoint");
	}                                                    
	myArg = myArg + count;
	count.reset();
	break;
      }
      case ReplacementId::STORERESULT: { 
	theReplacement.setControlFlowGraphBase(*myCFGStoreResults_p);
	initCheckPointCFG(*myCFGStoreResults_p);
 	// JU: result checkpoints can't be stored on a stack
//	BasicBlock& theBasicBlock(initCheckPointCFG(*myCFGStoreResults_p));
//  	handleCheckPointing("cp_res_store",
//  			    SideEffectListType::MOD_LIST,
// 			    false, 
//			    count);
//	myRes = myRes + count;
//	count.reset();
 	break;
      }
      case ReplacementId::RESTOREARGUMENT: { 
	theReplacement.setControlFlowGraphBase(*myCFGRestoreArguments_p);
	BasicBlock& theBasicBlock(initCheckPointCFG(*myCFGRestoreArguments_p));
	handleCheckPointing("cp_arg_restore",
			    SideEffectListType::READ_LIST,
			    theBasicBlock,
			    // if we write checkpoints to files we want 
			    // to read them in forward order
			    !ourCheckPointToFilesFlag,
			    count);	
	count.reset();
	break;
      }
      case ReplacementId::RESTORERESULT: { 
 	theReplacement.setControlFlowGraphBase(*myCFGRestoreResults_p);
	initCheckPointCFG(*myCFGRestoreResults_p);
 	// JU: result checkpoints can't be stored on a stack
//	BasicBlock& theBasicBlock(initCheckPointCFG(*myCFGRestoreResults_p));
//  	handleCheckPointing("cp_res_restore",
//  			    SideEffectListType::MOD_LIST,
//  			    theBasicBlock,
// 			    false, 
//			    count);
//	count.reset();
 	break;
      }
      case ReplacementId::STORETIMESTEPARGUMENT: { 
	theReplacement.setControlFlowGraphBase(*myCFGTimeStepStoreArguments_p);
	BasicBlock& theBasicBlock(initCheckPointCFG(*myCFGTimeStepStoreArguments_p));
	handleCheckPointing("cp_arg_store",
			    SideEffectListType::MOD_LIST,
			    theBasicBlock,
			    false, 
			    count);
	myTsarg = myTsarg + count;
	count.reset();
	handleCheckPointing("cp_arg_store",
			    SideEffectListType::READ_LOCAL_LIST,
			    theBasicBlock,
			    false, 
			    count);
	myTsarg = myTsarg + count;
	count.reset();
	break;
      }
      case ReplacementId::RESTORETIMESTEPARGUMENT: { 
	theReplacement.setControlFlowGraphBase(*myCFGTimeStepRestoreArguments_p);
	BasicBlock& theBasicBlock(initCheckPointCFG(*myCFGTimeStepRestoreArguments_p));
	if (ourCheckPointToFilesFlag) { 
	  handleCheckPointing("cp_arg_restore",
			      SideEffectListType::MOD_LIST,
			      theBasicBlock,
			      false,
			      count);
	  count.reset();
	  handleCheckPointing("cp_arg_restore",
			      SideEffectListType::READ_LOCAL_LIST,
			      theBasicBlock,
			      false,
			      count);
	  count.reset();
	}
	else { 
	  handleCheckPointing("cp_arg_restore",
			      SideEffectListType::READ_LOCAL_LIST,
			      theBasicBlock,
			      true, 
			      count);
	  count.reset();
	  handleCheckPointing("cp_arg_restore",
			      SideEffectListType::MOD_LIST,
			      theBasicBlock,
			      true, 
			      count);
	  count.reset();
	}
	break;
      }
      default: 
	THROW_LOGICEXCEPTION_MACRO("CallGraphVertexAlg::algorithm_action_4: no handler for ReplacementID  "
				   << ReplacementId::toString(*theId));
	break;
      }// end switch
    } // end for
    if(0) {	    
      DBG_MACRO(DbgGroup::METRIC, "Arg "
		<< myArg.debug());
      myMemCounter = myArg;
    }
    else {
      DBG_MACRO(DbgGroup::METRIC, "Tsarg "
		<< myTsarg.debug());
      myMemCounter = myTsarg;
    }
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
					  BasicBlock& theBasicBlock,
					  bool reverse, MemCounter &count) { 
    // initialize
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
			 **i, count);
      } // end for 
    }
    else { 
      for (SideEffectList::VariablePList::const_iterator i=theVariablePList.begin();
	   i!=theVariablePList.end();
	   ++i) { 
	handleCheckPoint(aSubroutineNameBase,
			 theBasicBlock,
			 **i, count);
      } // end for 
    }
  } 

  void
  CallGraphVertexAlg::handleCheckPoint(const std::string& aSubroutineNameBase,
				       BasicBlock& theBasicBlock,
				       const Variable& aVariable, MemCounter &count) { 
    ControlFlowGraph::FormalResult theResult(getContaining().getControlFlowGraph().hasFormal(aVariable.getVariableSymbolReference()));
    if (theResult.first) { 
      // get the symbol alg
      xaifBoosterTypeChange::ControlFlowGraphAlg& 
	theControlFlowGraphAlg(dynamic_cast<xaifBoosterTypeChange::ControlFlowGraphAlg&>(getContaining().
											 getControlFlowGraph().
											 getControlFlowGraphAlgBase()));
      // see if we skip this because of all constant invocations. 
      DBG_MACRO(DbgGroup::DATA,"CallGraphVertexAlg::handleCheckPoint: checking " << aVariable.debug().c_str() << " for " << debug().c_str());
      if (!ourForceAllArgCheckPointFlag 
	  && 
	  !theControlFlowGraphAlg.getSomewhereVariablePattern().isTracked(theResult.second)) {
	// must always be called with some constant or is head routine or is never called.
	DBG_MACRO(DbgGroup::DATA,"CallGraphVertexAlg::handleCheckPoint: skipping " << aVariable.debug().c_str() << " for " << debug().c_str());
	return; 
      }
      if (theControlFlowGraphAlg.getSomewhereConstPattern().isTracked(theResult.second)) {
	DBG_MACRO(DbgGroup::WARNING, "CallGraphVertexAlg::handleCheckPoint: checkpointing " 
		  << aVariable.getVariableSymbolReference().getSymbol().plainName().c_str() 
		  << " in " 
		  << getContaining().getControlFlowGraph().getSymbolReference().getSymbol().plainName().c_str()
		  << " which may be called with a constant");
      }
    }
    addCheckPointingInlinableSubroutineCall(aSubroutineNameBase+"_"+
					    SymbolType::toString(aVariable.getVariableSymbolReference().getSymbol().getSymbolType())+"_"+
					    SymbolShape::toString(aVariable.getVariableSymbolReference().getSymbol().getSymbolShape()),
					    theBasicBlock,
					    aVariable.getVariableSymbolReference().getSymbol(),
					    aVariable.getVariableSymbolReference().getScope());

    //strcpy("real", test);
    if(SymbolType::toString(aVariable.getVariableSymbolReference().getSymbol().getSymbolType()).compare("real") == 0)
      {
	if( SymbolShape::toString(aVariable.getVariableSymbolReference().getSymbol().getSymbolShape()).compare("scalar") == 0)
	  {
	    count.realScaInc();
	  }
	else if( SymbolShape::toString(aVariable.getVariableSymbolReference().getSymbol().getSymbolShape()).compare("vector") == 0)
	  {
	    count.realVecInc();
	  }
	else
	  count.realMatInc();
	      
	//std::cout << SymbolType::toString(aVariable.getVariableSymbolReference().getSymbol().getSymbolType()) << std::endl;//type int or real
	//std::cout << SymbolShape::toString(aVariable.getVariableSymbolReference().getSymbol().getSymbolShape()) << std::endl;//scalar, vector or matrix
      }
    else if(SymbolShape::toString(aVariable.getVariableSymbolReference().getSymbol().getSymbolShape()).compare("scalar") == 0)
      {
	count.intScaInc();
      }
    else if( SymbolShape::toString(aVariable.getVariableSymbolReference().getSymbol().getSymbolShape()).compare("vector") == 0)
      {
	count.intVecInc();
      }
    else
      count.intMatInc();

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
    Variable& theInlineVariable(aNewCall.addConcreteArgument(1).getArgument().getVariable());
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

  void CallGraphVertexAlg::setRuntimeCounters() {
    runtimeCounters = true;
  }
  
  void
  CallGraphVertexAlg::checkPointToFiles() { 
    ourCheckPointToFilesFlag=true;
  }

  void
  CallGraphVertexAlg::forceAllArgumentCheckpoints() { 
    ourForceAllArgCheckPointFlag=true;
  }

} // end of namespace 
