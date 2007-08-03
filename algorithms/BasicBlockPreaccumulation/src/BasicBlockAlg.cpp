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

#include <sstream>

#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/ActiveUseType.hpp"
#include "xaifBooster/system/inc/GraphVizDisplay.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/Intrinsic.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/Constant.hpp"

#include "xaifBooster/algorithms/TypeChange/inc/BasicBlockAlgParameter.hpp"

#include "xaifBooster/algorithms/Linearization/inc/ExpressionEdgeAlg.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorSaxpy.hpp"
#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorSetDeriv.hpp"

#include "xaifBooster/algorithms/CrossCountryInterface/inc/EliminationMethods.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/EliminationException.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdge.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertex.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PreaccumulationCounter.hpp" 
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdgeAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertexAlgFactory.hpp"


using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  unsigned int BasicBlockAlg::ourAssignmentCounter=0;
  unsigned int BasicBlockAlg::ourSequenceCounter=0;

  bool BasicBlockAlg::ourPermitNarySaxFlag=false;
  bool BasicBlockAlg::ourChooseAlgFlag=false;
  bool BasicBlockAlg::ourRuntimeCountersFlag=false;

  // PreaccumulationMode::PreaccumulationMode_E BasicBlockAlg::ourPreaccumulationMode(PreaccumulationMode::PICK_BEST);
  PreaccumulationMode::PreaccumulationMode_E BasicBlockAlg::ourPreaccumulationMode(PreaccumulationMode::MAX_GRAPH);

  PrivateLinearizedComputationalGraphAlgFactory* BasicBlockAlg::ourPrivateLinearizedComputationalGraphAlgFactory_p= PrivateLinearizedComputationalGraphAlgFactory::instance();
  PrivateLinearizedComputationalGraphEdgeAlgFactory* BasicBlockAlg::ourPrivateLinearizedComputationalGraphEdgeAlgFactory_p= PrivateLinearizedComputationalGraphEdgeAlgFactory::instance();
  PrivateLinearizedComputationalGraphVertexAlgFactory* BasicBlockAlg::ourPrivateLinearizedComputationalGraphVertexAlgFactory_p=PrivateLinearizedComputationalGraphVertexAlgFactory::instance();

  BasicBlockAlg::ComputeEliminationSequence_fpList BasicBlockAlg::ourNonScarseEliminations_fpList;
  int BasicBlockAlg::ourIterationsParameter=5000;
  double BasicBlockAlg::ourGamma=5.0;

  BasicBlockAlg::Sequence::EliminationResult::EliminationResult() : 
    myCountedFlag(false) { 
  }

  void BasicBlockAlg::Sequence::EliminationResult::countPreaccumulationOperations() const {
    myCounter.jacInc(myRemainderGraph.numEdges());
    bool usesRemainderGraph(myCounter.getJacValue()!=0);
    for(xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList::GraphList::const_iterator it=
	  myJAEList.getGraphList().begin();
	it!=myJAEList.getGraphList().end();
	++it) {
      const xaifBoosterCrossCountryInterface::JacobianAccumulationExpression& theExpression(*(*it));
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstVertexIteratorPair testPair(theExpression.vertices());
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstVertexIterator testVertexI(testPair.first), testVertexIEnd(testPair.second);
      if(!usesRemainderGraph && theExpression.isJacobianEntry()) {
	myCounter.jacInc();
      }
      //goes through every vertex in each graph
      for (;testVertexI!=testVertexIEnd; ++testVertexI) {
	//if the vertex is an operation then figure out which one it is and increment the counter
	if ((*testVertexI).getReferenceType() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::OPERATION) {
	  if ((*testVertexI).getOperation() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::MULT_OP) 
	    myCounter.mulInc();
	  if ((*testVertexI).getOperation() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::ADD_OP) 
	    myCounter.addInc();
	}
      }
    }
  }

  const PreaccumulationCounter& BasicBlockAlg::Sequence::EliminationResult::getCounter() const { 
    if (!myCountedFlag) { 
      countPreaccumulationOperations();
      if (myCounter.getJacValue()+myCounter.getAddValue()+myCounter.getMulValue()==0) 	
	THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::Sequence::EliminationResult::getCounter: nothing counted");
      myCountedFlag=true;
    }
    return myCounter; 
  } 

  BasicBlockAlg::Sequence::Sequence() :
    myFirstElement_p(0),
    myLastElement_p(0),
    myBestEliminationResult_p(0) {
    myComputationalGraph_p=ourPrivateLinearizedComputationalGraphAlgFactory_p->makeNewPrivateLinearizedComputationalGraph();
  }
  
  BasicBlockAlg::Sequence::~Sequence() { 
    for (AssignmentPList::iterator i=myFrontAssignmentList.begin();
	 i!=myFrontAssignmentList.end();
	 ++i) 
      if (*i)
	delete *i;
    for (AssignmentPList::iterator i=myEndAssignmentList.begin();
	 i!=myEndAssignmentList.end();
	 ++i) 
      if (*i)
	delete *i;
    if (myComputationalGraph_p)
      delete myComputationalGraph_p;
    for (EliminationResultPList::iterator i=myEliminationResultPList.begin();
	 i!=myEliminationResultPList.end();
	 ++i)
      if (*i)
	delete *i;
  }

  Assignment& BasicBlockAlg::Sequence::appendFrontAssignment() { 
    Assignment* theAssignment_p=new Assignment(true);
    myFrontAssignmentList.push_back(theAssignment_p);
    return *theAssignment_p;
  }

  Assignment& BasicBlockAlg::Sequence::appendEndAssignment() { 
    Assignment* theAssignment_p=new Assignment(true);
    myEndAssignmentList.push_back(theAssignment_p);
    return *theAssignment_p;
  }

  const BasicBlockAlg::Sequence::AssignmentPList& BasicBlockAlg::Sequence::getFrontAssignmentList() const { 
    return myFrontAssignmentList;
  }

  const BasicBlockAlg::Sequence::AssignmentPList& BasicBlockAlg::Sequence::getEndAssignmentList() const { 
    return myEndAssignmentList;
  }

  std::string BasicBlockAlg::Sequence::debug() const { 
    std::ostringstream out;
    out << "Sequence[" << this
	<< ",myFirstElement_p=" << myFirstElement_p
	<< ",myLastElement_p=" << myLastElement_p
	<< "]" << std::ends;  
    return out.str();
  } 

  BasicBlockAlg::Sequence::EliminationResult& BasicBlockAlg::Sequence::addNewEliminationResult() { 
    EliminationResult* theResult_p=new  EliminationResult;
    myEliminationResultPList.push_back(theResult_p);
    return *theResult_p;
  }

  void BasicBlockAlg::Sequence::setBestResult() {
    if (myEliminationResultPList.empty())
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::Sequence::setBestResult:  no results");
    myBestEliminationResult_p=*(myEliminationResultPList.begin());
    for (EliminationResultPList::iterator i=++(myEliminationResultPList.begin());
	 i!=myEliminationResultPList.end();
	 ++i) { 
      if ((*i)->getCounter()<myBestEliminationResult_p->getCounter())
	myBestEliminationResult_p=*i;
    }
  } 

  const BasicBlockAlg::Sequence::EliminationResult& BasicBlockAlg::Sequence::getBestResult() const {
    if (!myBestEliminationResult_p)
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::Sequence::getBestResult:  not set");
    return *myBestEliminationResult_p;
  } 

  BasicBlockAlg::SequenceHolder::SequenceHolder(bool flatten) : 
    myLimitToStatementLevelFlag(flatten) {
  }
  
  BasicBlockAlg::SequenceHolder::~SequenceHolder() {
    for(SequencePList::iterator i=myUniqueSequencePList.begin();
	i!=myUniqueSequencePList.end();
	++i)
      if (*i) // should always be true
	delete *i;
  }
  
  std::string BasicBlockAlg::SequenceHolder::debug() const { 
    std::ostringstream out;
    out << "SequenceHolder[" << this 
	<< ",myLimitToStatementLevelFlag=" << myLimitToStatementLevelFlag
	<< "]" << std::ends;  
    return out.str();
  } 

  bool BasicBlockAlg::isRepresentativeSequenceHolder(const SequenceHolder& aSequenceHolder) const { 
    if(!myRepresentativeSequence_p) 
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::isRepresentativeSequenceHolder:  no representative set");
    return (myRepresentativeSequence_p==&aSequenceHolder);
  }

  void BasicBlockAlg::incrementGlobalAssignmentCounter(const SequenceHolder& aSequenceHolder) { 
    if (isRepresentativeSequenceHolder(aSequenceHolder))
      ourAssignmentCounter++;
  } 
  
  void BasicBlockAlg::incrementGlobalSequenceCounter(const SequenceHolder& aSequenceHolder) {
    if (isRepresentativeSequenceHolder(aSequenceHolder))
      ourSequenceCounter++;
  } 

  BasicBlockAlg::SequenceHolder::BasicBlockElementSequencePPairList& 
  BasicBlockAlg::SequenceHolder::getBasicBlockElementSequencePPairList() { 
    return myBasicBlockElementSequencePPairList;
  } 

  const BasicBlockAlg::SequenceHolder::BasicBlockElementSequencePPairList& 
  BasicBlockAlg::SequenceHolder::getBasicBlockElementSequencePPairList() const { 
    return myBasicBlockElementSequencePPairList;
  } 

  BasicBlockAlg::SequenceHolder::SequencePList& 
  BasicBlockAlg::SequenceHolder::getUniqueSequencePList() { 
    return myUniqueSequencePList;
  } 

  void BasicBlockAlg::SequenceHolder::splitComputationalGraph(const Assignment& theAssignment) { 
    DBG_MACRO(DbgGroup::CALLSTACK, "BasicBlockAlg::SequenceHolder::splitComputationalGraph entering");
    if(!myBasicBlockElementSequencePPairList.size()) { 
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::SequenceHolder::splitComputationalGraph: must be initialized unless called out of order");
    }
    for (BasicBlockElementSequencePPairList::iterator i=myBasicBlockElementSequencePPairList.begin();
	 i!=myBasicBlockElementSequencePPairList.end();
	 ++i) { 
      if ((*i).first==&theAssignment) { 
	if((*i).second) { // this should always be true
	  // reset the current sequence's last element
	  // which must be by definition the direct predecessor
	  --i;
	  BasicBlockElement* thePredecessorAssignment_p=(*i).first;
	  //reset iterator
	  ++i;
	  (*i).second->myLastElement_p=thePredecessorAssignment_p;
	}
	// now make a new one for this assignment
	(*i).second=new Sequence;
	ourSequenceCounter++;
	(*i).second->myFirstElement_p=(*i).second->myLastElement_p=&theAssignment;
	myUniqueSequencePList.push_back((*i).second);
	DBG_MACRO(DbgGroup::CALLSTACK, "BasicBlockAlg::SequenceHolder::splitComputationalGraph leaving");
	return; 
      } 
    } // end if 
    THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::splitComputationalGraph: couldn't find"
			       << theAssignment.debug().c_str());
  }

  xaifBoosterDerivativePropagator::DerivativePropagator& 
  BasicBlockAlg::SequenceHolder::getDerivativePropagator(const Assignment& theAssignment) { 
    Sequence* theSequence_p=0;
    for (BasicBlockElementSequencePPairList::iterator i=myBasicBlockElementSequencePPairList.begin();
	 i!=myBasicBlockElementSequencePPairList.end();
	 ++i) 
      if ((*i).first==&theAssignment) { 
	if((*i).second)
	  theSequence_p=(*i).second;
      } // end if 
    if (!theSequence_p)
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::getDerivativePropagator: no Sequence exists for element "
				 << theAssignment.debug().c_str());
    return theSequence_p->myDerivativePropagator;
  }

  bool BasicBlockAlg::SequenceHolder::doesLimitToStatementLevel() const { 
    return myLimitToStatementLevelFlag;
  }

  unsigned int BasicBlockAlg::SequenceHolder::getAssignmentCounter() { 
    return ourAssignmentCounter;
  }
  
  unsigned int BasicBlockAlg::SequenceHolder::getSequenceCounter() { 
    return ourSequenceCounter;
  }

  BasicBlockAlg::IntermediateReferences::~IntermediateReferences() { 
    for (VarPLCGPPairList::iterator i = myVarPLCGPPairList.begin();
	 i!=myVarPLCGPPairList.end();
	 ++i) { 
      if ((*i).first)
	delete (*i).first;
    } 
  } 

  const Variable& BasicBlockAlg::IntermediateReferences::getVariable(const PrivateLinearizedComputationalGraphVertex& theVertex) { 
    if (theVertex.hasLHSVariable())
      return theVertex.getLHSVariable();
    // see if we have it in the list: 
    for (VarPLCGPPairList::iterator i = myVarPLCGPPairList.begin();
	 i!=myVarPLCGPPairList.end();
	 ++i) { 
      if ((*i).second==&theVertex)
	return *((*i).first);
    }
    // not found, make a new one: 
    Variable* theNewVariable_p(new Variable);
    myVarPLCGPPairList.push_back(VarPLCGPPair(theNewVariable_p,&theVertex));
    Scope& theGlobalScope(ConceptuallyStaticInstances::instance()->
			  getCallGraph().getScopeTree().getGlobalScope());
    VariableSymbolReference* theVariableSymbolReference_p=
      new VariableSymbolReference(theGlobalScope.getSymbolTable().
				  addUniqueAuxSymbol(SymbolKind::VARIABLE,
						     SymbolType::REAL_STYPE,
						     SymbolShape::SCALAR,
						     true),
				  theGlobalScope);
    theVariableSymbolReference_p->setId("1");
    theVariableSymbolReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::IntermediateReferences::getVariable");
    theNewVariable_p->supplyAndAddVertexInstance(*theVariableSymbolReference_p);
    theNewVariable_p->getAliasMapKey().setTemporary();
    theNewVariable_p->getDuUdMapKey().setTemporary();
    return *theNewVariable_p;
  } 

  BasicBlockAlg::BasicBlockAlg(BasicBlock& theContaining) :
    xaifBooster::BasicBlockAlgBase(theContaining),
    xaifBoosterTypeChange::BasicBlockAlg(theContaining),
    myBestSequenceHolder_p(0),
    mySequenceHolderPVector(PreaccumulationMode::ourModeCount) { 
    mySequenceHolderPVector[PreaccumulationMode::STATEMENT]=new SequenceHolder(true);
    mySequenceHolderPVector[PreaccumulationMode::MAX_GRAPH]=new SequenceHolder(false);
    mySequenceHolderPVector[PreaccumulationMode::MAX_GRAPH_SCARSE]=new SequenceHolder(false);
    // we must choose one SequenceHolder to do the things 
    // that are common across all the variants,
    // in particular the steps that can be done only once
    // such as redoing the activity determination and the
    // linearization. The latter items should be done 
    // on the flattening version which is why we pick that one 
    // as the representative. 
    if (ourPreaccumulationMode==PreaccumulationMode::PICK_BEST) 
      myRepresentativeSequence_p=mySequenceHolderPVector[PreaccumulationMode::MAX_GRAPH];
    else 
      myRepresentativeSequence_p=mySequenceHolderPVector[ourPreaccumulationMode];
  }

  BasicBlockAlg::~BasicBlockAlg() {
    for (SequenceHolderPVector::iterator i=mySequenceHolderPVector.begin();
	 i!=mySequenceHolderPVector.end();
	 ++i)
      if (*i)
	delete (*i);
  } // end of BasicBlockAlg::~BasicBlockAlg()

  PrivateLinearizedComputationalGraphAlgFactory* 
  BasicBlockAlg::getPrivateLinearizedComputationalGraphAlgFactory() {
    return ourPrivateLinearizedComputationalGraphAlgFactory_p; 
  }

  PrivateLinearizedComputationalGraphEdgeAlgFactory* 
  BasicBlockAlg::getPrivateLinearizedComputationalGraphEdgeAlgFactory() {
    return ourPrivateLinearizedComputationalGraphEdgeAlgFactory_p; 
  }

  PrivateLinearizedComputationalGraphVertexAlgFactory* 
  BasicBlockAlg::getPrivateLinearizedComputationalGraphVertexAlgFactory() {
    return ourPrivateLinearizedComputationalGraphVertexAlgFactory_p;  
  }

  void  
  BasicBlockAlg::setPrivateLinearizedComputationalGraphAlgFactory(PrivateLinearizedComputationalGraphAlgFactory* thePrivateLinearizedComputationalGraphAlgFactory) {
    ourPrivateLinearizedComputationalGraphAlgFactory_p=thePrivateLinearizedComputationalGraphAlgFactory;  
  }

  void  
  BasicBlockAlg::setPrivateLinearizedComputationalGraphEdgeAlgFactory( PrivateLinearizedComputationalGraphEdgeAlgFactory *thePrivateLinearizedComputationalGraphEdgeAlgFactory) {
    ourPrivateLinearizedComputationalGraphEdgeAlgFactory_p = thePrivateLinearizedComputationalGraphEdgeAlgFactory;  
  }

  void  
  BasicBlockAlg::setPrivateLinearizedComputationalGraphVertexAlgFactory(PrivateLinearizedComputationalGraphVertexAlgFactory *thePrivateLinearizedComputationalGraphVertexAlgFactory) {
    ourPrivateLinearizedComputationalGraphVertexAlgFactory_p = thePrivateLinearizedComputationalGraphVertexAlgFactory; 
  }

  void
  BasicBlockAlg::printXMLHierarchy(std::ostream& os) const { 
    printXMLHierarchyImpl(os,
			  printerWrapper);
  }

  void BasicBlockAlg::printXMLHierarchyImpl(std::ostream& os,
					    BasicBlockAlg::PrintDerivativePropagator_fp aPrintDerivativePropagator_fp) const { 
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
    for (PlainBasicBlock::BasicBlockElementList::const_iterator li=getContaining().getBasicBlockElementList().begin();
	 li!=getContaining().getBasicBlockElementList().end();
	 li++) { 
      // do we have a sequence for this element?
      Sequence* aSequence_p=0;
      for (SequenceHolder::BasicBlockElementSequencePPairList::const_iterator pli=
	     getBestSequenceHolder().getBasicBlockElementSequencePPairList().begin();
	   pli!=getBestSequenceHolder().getBasicBlockElementSequencePPairList().end();
	   pli++) { 
	if((*pli).first==*li) { 
	  if ((*pli).second) 
	    aSequence_p=(*pli).second;
	  break;
	}
      }
      if (aSequence_p) { 
	// we have a sequence.
	// Is it the first element?
	if (*li==aSequence_p->myFirstElement_p) { 
	  // print all the stuff before the first element
	  const Sequence::AssignmentPList& theFrontList(aSequence_p->getFrontAssignmentList());
	  for(Sequence::AssignmentPList::const_iterator fli=theFrontList.begin();
	      fli!=theFrontList.end();
	      ++fli) 
	    (*(fli))->printXMLHierarchy(os);
	}
	// print the element 
	(*(li))->printXMLHierarchy(os);
	// Is it the last element?
	if (*li==aSequence_p->myLastElement_p) { 
	  // print all the stuff after the last element
	  const Sequence::AssignmentPList& theEndList(aSequence_p->getEndAssignmentList());
	  for(Sequence::AssignmentPList::const_iterator fli=theEndList.begin();
	      fli!=theEndList.end();
	      ++fli) 
	    (*(fli))->printXMLHierarchy(os);
	  // that includes the accumulator
	  (aPrintDerivativePropagator_fp)(os,
					  *this,
					  aSequence_p->myDerivativePropagator);
	}
      }// end if have sequence
      else 
	// have no sequence, just print the element
	(*(li))->printXMLHierarchy(os);
    } // end for all BasicBlockElement instances
    if(ourRuntimeCountersFlag) {
      for(PlainBasicBlock::BasicBlockElementList::const_iterator myRuntimeCounterCallListI = myRuntimeCounterCallList.begin();
	  myRuntimeCounterCallListI != myRuntimeCounterCallList.end();
	  ++myRuntimeCounterCallListI) {
	(*(myRuntimeCounterCallListI))->printXMLHierarchy(os);
      }
    }
    os << pm.indent()
       << "</"
       << PlainBasicBlock::ourXAIFName.c_str()
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of BasicBlockAlg::printXMLHierarchyImpl

  std::string BasicBlockAlg::debug () const { 
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg[" << this
	<< ",myContaining="
	<< getContaining().debug().c_str();
    out << "]" << std::ends;  
    return out.str();
  } // end of BasicBlockAlg::debug

  void
  BasicBlockAlg::algorithm_action_2() {
    static unsigned int recursionGuard=0;
    try { 
      recursionGuard++;
      if (recursionGuard>1)
	THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::algorithm_action_2: recursive invocation not allowed");
      DBG_MACRO(DbgGroup::CALLSTACK, "BasicBlockAlg::algorithm_action_2(flatten)");
      
      // the BasicBlock instance will be used in AssignmentAlg::algorithm_action_1:
      // because of virtual function use on the system structural level we cannot 
      // invoke directly and need to rely on GenericTraverseInvoke
      // In order to pass parameters through BasicBlockParameter
      // we have to make sure that this method is never invoked recursively
      xaifBoosterTypeChange::BasicBlockAlgParameter::instance().set(*this);	// in BasicBlockAlg::algorithm_action_2() 
    } 
    catch (...) { 
      recursionGuard--;
      throw;
    }
    recursionGuard--;
  }

  class PrivateLinearizedComputationalGraphVertexLabelWriter {
  public:
    PrivateLinearizedComputationalGraphVertexLabelWriter(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& g) : myG(g) {};
    template <class BoostIntenalVertexDescriptor>
    void operator()(std::ostream& out, 
		    const BoostIntenalVertexDescriptor& v) const {
      const PrivateLinearizedComputationalGraphVertex* thePrivateLinearizedComputationalGraphVertex_p=
	dynamic_cast<const PrivateLinearizedComputationalGraphVertex*>(boost::get(boost::get(BoostVertexContentType(),
											     myG.getInternalBoostGraph()),
										  v));
      std::string theVertexKind("");
      const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList& theDepVertexPList(myG.getDependentList());
      for (xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList::const_iterator aDepVertexPListI(theDepVertexPList.begin());
	   aDepVertexPListI!=theDepVertexPList.end();
	   ++aDepVertexPListI) { 
	if (thePrivateLinearizedComputationalGraphVertex_p==*(aDepVertexPListI)) {
	  // cast it first
	  const PrivateLinearizedComputationalGraphVertex& myPrivateVertex(dynamic_cast<const PrivateLinearizedComputationalGraphVertex&>(**aDepVertexPListI));
	  std::ostringstream oss;
	  oss << myPrivateVertex.getLHSVariable().getVariableSymbolReference().getSymbol().getId().c_str();
	  if (myPrivateVertex.getLHSVariable().getDuUdMapKey().getKind()==InfoMapKey::SET)
	    oss  << " k=" 
		 << myPrivateVertex.getLHSVariable().getDuUdMapKey().getKey();
	  oss << " d" << std::ends;
	  theVertexKind=oss.str();
	  break;
	}
      }
      const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList& theIndepVertexPList(myG.getIndependentList());
      for (xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList::const_iterator aIndepVertexPListI(theIndepVertexPList.begin());
	   aIndepVertexPListI!=theIndepVertexPList.end();
	   ++aIndepVertexPListI) { 
	if (thePrivateLinearizedComputationalGraphVertex_p==*(aIndepVertexPListI)) {
	  // cast it first
	  const PrivateLinearizedComputationalGraphVertex& myPrivateVertex(dynamic_cast<const PrivateLinearizedComputationalGraphVertex&>(**aIndepVertexPListI));
	  std::ostringstream oss;
	  oss << myPrivateVertex.getRHSVariable().getVariableSymbolReference().getSymbol().getId().c_str();
	  if (myPrivateVertex.getRHSVariable().getDuUdMapKey().getKind()==InfoMapKey::SET)
	    oss  << " k=" 
		 << myPrivateVertex.getRHSVariable().getDuUdMapKey().getKey();
	  oss << " i" << std::ends;
	  theVertexKind=oss.str();
	  break;
	}
      }
      out << "[label=\"" 
	  << theVertexKind.c_str() 
	  << "\"]";
    }
    const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& myG;
  };

  class PrivateLinearizedComputationalGraphEdgeLabelWriter {
  public:
    PrivateLinearizedComputationalGraphEdgeLabelWriter(const PrivateLinearizedComputationalGraph& g) : myG(g) {};
    template <class BoostIntenalEdgeDescriptor>
    void operator()(std::ostream& out, const BoostIntenalEdgeDescriptor& v) const {
      const PrivateLinearizedComputationalGraphEdge* thePrivateLinearizedComputationalGraphEdge_p=
	dynamic_cast<const PrivateLinearizedComputationalGraphEdge*>(boost::get(boost::get(BoostEdgeContentType(),
											     myG.getInternalBoostGraph()),
										  v));
      if (thePrivateLinearizedComputationalGraphEdge_p->hasUnitLabel()) { 
	out << "[color=\"red\"]";
      }
    }
    const PrivateLinearizedComputationalGraph& myG;
  };



  void 
  BasicBlockAlg::algorithm_action_3() {
    DBG_MACRO(DbgGroup::CALLSTACK, "BasicBlockAlg::algorihm_action_3: invoked for "
	      << debug().c_str());
    if ((ourPreaccumulationMode==PreaccumulationMode::MAX_GRAPH)
	||
        (ourPreaccumulationMode==PreaccumulationMode::PICK_BEST))
      algorithm_action_3_perSequence(PreaccumulationMode::MAX_GRAPH); 
    if ((ourPreaccumulationMode==PreaccumulationMode::MAX_GRAPH_SCARSE)
	||
        (ourPreaccumulationMode==PreaccumulationMode::PICK_BEST))
      algorithm_action_3_perSequence(PreaccumulationMode::MAX_GRAPH_SCARSE); 
    if ((ourPreaccumulationMode==PreaccumulationMode::STATEMENT)
	||
        (ourPreaccumulationMode==PreaccumulationMode::PICK_BEST))
      algorithm_action_3_perSequence(PreaccumulationMode::STATEMENT); 
    if (ourPreaccumulationMode!=PreaccumulationMode::PICK_BEST)
      myBestSequenceHolder_p=mySequenceHolderPVector[ourPreaccumulationMode];
    else { 
      myBestSequenceHolder_p=&(getSequenceHolder(PreaccumulationMode::MAX_GRAPH));
      if (getSequenceHolder(PreaccumulationMode::MAX_GRAPH_SCARSE).myBasicBlockOperations
	  <
	  myBestSequenceHolder_p->myBasicBlockOperations)
	myBestSequenceHolder_p=&(getSequenceHolder(PreaccumulationMode::MAX_GRAPH_SCARSE));
      if (getSequenceHolder(PreaccumulationMode::STATEMENT).myBasicBlockOperations
	  <
	  myBestSequenceHolder_p->myBasicBlockOperations)
	myBestSequenceHolder_p=&(getSequenceHolder(PreaccumulationMode::STATEMENT));
    }
    DBG_MACRO(DbgGroup::METRIC, "BasicBlock metrics: best is " 
	      << myBestSequenceHolder_p->myBasicBlockOperations.debug().c_str() 
	      << " in SequenceHolder " 
	      << myBestSequenceHolder_p->debug().c_str()
	      << " in BasicBlockAlg " 
	      << this);
    if(ourRuntimeCountersFlag) {
      //Insert Macros into the code that will be expanded to count multiplications and additions
      //Multiplication counter
      xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theSubroutineCall_p;
      theSubroutineCall_p=new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("countmult");
      theSubroutineCall_p->setId("inline_countmult");
      theSubroutineCall_p->addConcreteArgument(1).makeConstant(SymbolType::INTEGER_STYPE).setint(myBestSequenceHolder_p->myBasicBlockOperations.getMulValue());
      // save it in the list
      myRuntimeCounterCallList.push_back(theSubroutineCall_p);
      //Addition Counter
      theSubroutineCall_p=new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("countadd");
      theSubroutineCall_p->setId("inline_countadd");
      theSubroutineCall_p->addConcreteArgument(1).makeConstant(SymbolType::INTEGER_STYPE).setint(myBestSequenceHolder_p->myBasicBlockOperations.getAddValue());
      // save it in the list
      myRuntimeCounterCallList.push_back(theSubroutineCall_p);
    }
  }

  void
  BasicBlockAlg::fillIndependentsList(PrivateLinearizedComputationalGraph& theComputationalGraph) {
    PrivateLinearizedComputationalGraph::VertexIteratorPair p(theComputationalGraph.vertices());
    PrivateLinearizedComputationalGraph::VertexIterator it(p.first),endIt(p.second);
    for (;it!=endIt;++it) { 
      // here we should have constants etc. already removed
      // JU: this is temporary until we have r/w analysis
      if (!theComputationalGraph.numInEdgesOf(*it)) {
	theComputationalGraph.addToIndependentList(*it);
      }
    } 
  }

  void
  BasicBlockAlg::fillDependentsList(PrivateLinearizedComputationalGraph& theComputationalGraph,
				    BasicBlockAlg::VariableCPList& theDepVertexPListCopyWithoutRemovals) {
    // now look at all the vertices in the dependent list 
    // and remove the ones not needed as indicated by 
    // the duud information:
    const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList& theDepVertexPList(theComputationalGraph.getDependentList());
    for (xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList::const_iterator aDepVertexPListI(theDepVertexPList.begin());
	 aDepVertexPListI!=theDepVertexPList.end();) { 
      // cast it first
      const PrivateLinearizedComputationalGraphVertex& myPrivateVertex(dynamic_cast<const PrivateLinearizedComputationalGraphVertex&>(**aDepVertexPListI));
      // copy it
      theDepVertexPListCopyWithoutRemovals.push_back(&(myPrivateVertex.getLHSVariable()));
      // advance the iterator before we delete anything:
      ++aDepVertexPListI;
      // all the dependent ones should have the LHS set
      const DuUdMapKey& aDuUdMapKey(myPrivateVertex.getLHSVariable().getDuUdMapKey()); 
      if (aDuUdMapKey.getKind()==InfoMapKey::TEMP_VAR) { 
	// now the assumption is that temporaries are local to the flattened Sequence
	// and we can remove: 
	theComputationalGraph.removeFromDependentList(myPrivateVertex);
	continue;
      }
      DuUdMapUseResult theDuUdMapUseResult(ConceptuallyStaticInstances::instance()->
					   getCallGraph().getDuUdMap().use(aDuUdMapKey,
									   theComputationalGraph.getStatementIdLists()));
      if (theDuUdMapUseResult.myAnswer==DuUdMapUseResult::AMBIGUOUS_INSIDE 
	  || 
	  theDuUdMapUseResult.myAnswer==DuUdMapUseResult::UNIQUE_INSIDE) { 
	if (!theComputationalGraph.numOutEdgesOf(myPrivateVertex)) { 
	  if (theDuUdMapUseResult.myActiveUse!=ActiveUseType::PASSIVEUSE) { 
	    // if the use is no strictly passive then in case of UNIQUE_INSIDE this vertex 
	    // should not be maximal and in case of AMBIGUOUS_INSIDE there should have 
	    // been a split. 
	    THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::fixUpDependentsList: attempting to remove a maximal vertex "
				       << myPrivateVertex.getLHSVariable().debug().c_str()
				       << " key "
				       << aDuUdMapKey.debug().c_str()
				       << " from the dependent list");
	  }
	  // else do nothing, just leave it. This may indicate some inconsistency in 
	  // the activity results
	}
	else { 
	  // we only use it in the scope of this flattened sequence, therefore remove it
	  DBG_MACRO(DbgGroup::DATA, "BasicBlockAlg::fixUpDependentsList: removing dependent " 
		    << myPrivateVertex.getLHSVariable().debug().c_str()
		    << " list size: " << theDepVertexPList.size()); 
	  theComputationalGraph.removeFromDependentList(myPrivateVertex);
	  continue;
	}
      }
      if (DbgLoggerManager::instance()->isSelected(DbgGroup::DATA)) { 
	if (theComputationalGraph.numOutEdgesOf(myPrivateVertex)) { 
	  DBG_MACRO(DbgGroup::DATA, "BasicBlockAlg::fixUpDependentsList: non-maximal dependent " 
		    << myPrivateVertex.getLHSVariable().debug().c_str()); 
	}
	else { 
	  DBG_MACRO(DbgGroup::DATA, "BasicBlockAlg::fixUpDependentsList: keeping regular dependent " 
		    << myPrivateVertex.getLHSVariable().debug().c_str()); 
	}
      } 
    }
  }

  void 
  BasicBlockAlg::graphFilter(VariableHashTable& theListOfAlreadyAssignedSources,
			     Sequence& aSequence,
			     VariableCPList& theDepVertexPListCopyWithoutRemovals,
			     SequenceHolder& aSequenceHolder) { 
    PrivateLinearizedComputationalGraph& theComputationalGraph(*(aSequence.myComputationalGraph_p)); 
    // try to find collapsed vertices which are 
    // either singleton vertices, or 
    // vertices that occur in theComputationalGraph 
    // dependent AND independent list.
    // first filter out singleton vertices:
    xaifBoosterDerivativePropagator::DerivativePropagator::EntryPList::iterator aDPBeginI(aSequence.myDerivativePropagator.getEntryPList().begin());
    bool findNext=true;
    while (findNext) {
      PrivateLinearizedComputationalGraph::VertexIteratorPair aVertexIteratorPair(theComputationalGraph.vertices());
      PrivateLinearizedComputationalGraph::VertexIterator aVertexI(aVertexIteratorPair.first),endAVertexI(aVertexIteratorPair.second);
      findNext=false;
      for (;aVertexI!=endAVertexI;++aVertexI) {
	if (!(theComputationalGraph.numOutEdgesOf(*aVertexI)+theComputationalGraph.numInEdgesOf(*aVertexI))) { 
	  // a singleton
	  findNext=true;
	  // remove this vertex in the dependent/independent lists
	  theComputationalGraph.removeFromDependentList(*aVertexI);
	  theComputationalGraph.removeFromIndependentList(*aVertexI);
	  handleCollapsedVertex(dynamic_cast<PrivateLinearizedComputationalGraphVertex&>(*aVertexI),
				theDepVertexPListCopyWithoutRemovals,
				theListOfAlreadyAssignedSources,
				aSequence,
				aDPBeginI);
	  // remove it from the graph
	  theComputationalGraph.removeAndDeleteVertex(*aVertexI);
	  // need to break out here because we removed the vertex
	  break;
	} // end if 
      } // end for 
    } // end while 
    // now deal with the remaining graph and possible
    // non-singleton collapsed vertices:
    PrivateLinearizedComputationalGraph::VertexIteratorPair anotherVertexIteratorPair(theComputationalGraph.vertices());
    PrivateLinearizedComputationalGraph::VertexIterator anotherVertexI(anotherVertexIteratorPair.first),endAnotherVertexI(anotherVertexIteratorPair.second);
    for (;anotherVertexI!=endAnotherVertexI;++anotherVertexI) {
      // try to locate it in the dependent list: 
      bool located=false; 
      const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList&  theDependentList(theComputationalGraph.getDependentList());
      for(xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList::const_iterator theVertexPointerListI=
	    theDependentList.begin();
	  theVertexPointerListI!=theDependentList.end();
	  ++theVertexPointerListI) { 
	if(&(*anotherVertexI)==*theVertexPointerListI) { 
	  located=true;
	  break;
	}
      }
      if (!located)
	break;
      located=false; 
      const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList&  theIndependentList(theComputationalGraph.getIndependentList());
      for(xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList::const_iterator theVertexPointerListI=
	    theIndependentList.begin();
	  theVertexPointerListI!=theIndependentList.end();
	  ++theVertexPointerListI) { 
	if(&(*anotherVertexI)==*theVertexPointerListI) { 
	  located=true;
	  break;
	}
      }
      if (!located)
	break;
      // if we are here then we found a collapsed vertex.
      handleCollapsedVertex(dynamic_cast<PrivateLinearizedComputationalGraphVertex&>(*anotherVertexI),
			    theDepVertexPListCopyWithoutRemovals,
			    theListOfAlreadyAssignedSources,
			    aSequence,
			    aDPBeginI);
    } // end for 
  }			    

  void 
  BasicBlockAlg::algorithm_action_3_perSequence(PreaccumulationMode::PreaccumulationMode_E thisMode) { 	  
    BasicBlockAlg::SequenceHolder& aSequenceHolder(getSequenceHolder(thisMode));
    aSequenceHolder.myBasicBlockOperations.reset();
    for (SequenceHolder::SequencePList::iterator aSequencePListI=aSequenceHolder.getUniqueSequencePList().begin();
	 aSequencePListI!=aSequenceHolder.getUniqueSequencePList().end();
	 ++aSequencePListI) { // outer loop over all items in myUniqueSequencePList
      PrivateLinearizedComputationalGraph& theComputationalGraph=*((*aSequencePListI)->myComputationalGraph_p);
      fillIndependentsList(theComputationalGraph);
      // we need a complete copy to ensure correctness in case of overwritten (local) independents
      VariableCPList theDepVertexPListCopyWithoutRemovals;
      fillDependentsList(theComputationalGraph,theDepVertexPListCopyWithoutRemovals);
      // UN: this is used to keep track of those independent variables
      // that were already assigned to temporary variables to ensure correctness
      // of the Jacobian accumulation code.
      VariableHashTable theListOfAlreadyAssignedSources;
      graphFilter(theListOfAlreadyAssignedSources,
		  **aSequencePListI,
		  theDepVertexPListCopyWithoutRemovals,
		  aSequenceHolder);
      if ((*aSequencePListI)->myComputationalGraph_p->numVertices()) {
	runElimination(**aSequencePListI, 
		       theDepVertexPListCopyWithoutRemovals, 
		       aSequenceHolder,
		       thisMode);
	generate(theListOfAlreadyAssignedSources,
		 **aSequencePListI, 
		 theDepVertexPListCopyWithoutRemovals, 
		 aSequenceHolder);
      }
    } // end for
  }

  void 
  BasicBlockAlg::runAngelNonScarse(Sequence& aSequence){
    if (ourNonScarseEliminations_fpList.empty()) { 
      // the first one is the default: 
      ourNonScarseEliminations_fpList.
	push_back(std::pair<std::string,ComputeEliminationSequence_fp>(std::string("default vertex / edge elimination"), 
								       &xaifBoosterCrossCountryInterface::compute_elimination_sequence));
      ourNonScarseEliminations_fpList.
	push_back(std::pair<std::string,ComputeEliminationSequence_fp>(std::string("LSA vertex elimination"), 
								       &xaifBoosterCrossCountryInterface::compute_elimination_sequence_lsa_vertex));
      ourNonScarseEliminations_fpList.
	push_back(std::pair<std::string,ComputeEliminationSequence_fp>(std::string("LSA face elimination"), 
								       &xaifBoosterCrossCountryInterface::compute_elimination_sequence_lsa_face));
    }
    PrivateLinearizedComputationalGraph& theComputationalGraph=*(aSequence.myComputationalGraph_p);
    for (ComputeEliminationSequence_fpList::iterator elimMethodI=ourNonScarseEliminations_fpList.begin();
	 elimMethodI!=ourNonScarseEliminations_fpList.end();
	 ++elimMethodI) { 
      Sequence::EliminationResult& aResult(aSequence.addNewEliminationResult());
      try { 
	(*((*elimMethodI).second))(theComputationalGraph, 
				   ourIterationsParameter, 
				   ourGamma, 
				   aResult.myJAEList);
      }
      catch(...) { 
	THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::runAngelNonScarse: exception thrown from within angel while running "
				   << (*elimMethodI).first.c_str());
      }
      DBG_MACRO(DbgGroup::METRIC, "Seqeunce metrics: " << (*elimMethodI).first.c_str() << " " << aResult.getCounter().debug().c_str() << " in BasicBlockAlg " << this);
      if (!ourChooseAlgFlag)
	break; 
    }
    aSequence.setBestResult();
    DBG_MACRO(DbgGroup::METRIC, "Seqeunce metrics: best is: " << aSequence.getBestResult().getCounter().debug().c_str() << " in BasicBlockAlg " << this);
  }


  void BasicBlockAlg::runElimination(Sequence& aSequence, 
				     VariableCPList& theDepVertexPListCopyWithoutRemovals, 
				     SequenceHolder& aSequenceHolder,
				     PreaccumulationMode::PreaccumulationMode_E thisMode){
    PrivateLinearizedComputationalGraph& theComputationalGraph=*(aSequence.myComputationalGraph_p);
    if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {     
      GraphVizDisplay::show(theComputationalGraph,
			    "flattened",
			    PrivateLinearizedComputationalGraphVertexLabelWriter(theComputationalGraph),
			    PrivateLinearizedComputationalGraphEdgeLabelWriter(theComputationalGraph));
    }
    if (thisMode==PreaccumulationMode::MAX_GRAPH_SCARSE) { 
      // there is currently only 1 choice:
      Sequence::EliminationResult& aResult(aSequence.addNewEliminationResult());
      try { 
	xaifBoosterCrossCountryInterface::compute_partial_elimination_sequence(theComputationalGraph, 
										 ourIterationsParameter, 
										 ourGamma, 
										 aResult.myJAEList, 
										 aResult.myRemainderGraph, 
										 aResult.myVertexCorrelationList, 
										 aResult.myEdgeCorrelationList);
      }
      catch(xaifBoosterCrossCountryInterface::EliminationException e) { 
	THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::runElimination: exception thrown from within compute_partial_elimination_sequence:" 
				   << e.getReason().c_str());
      }
      if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {
	GraphVizDisplay::show(aResult.myRemainderGraph, "remainderGraph");
      }
      aSequence.setBestResult(); 
      DBG_MACRO(DbgGroup::METRIC, "Seqeunce metrics: compute_partial_elimination_sequence " 
		<< aResult.getCounter().debug().c_str() 
		<< "  number of JAE: " << aResult.myJAEList.getGraphList().size() 
		<< " R graph edges: " << aResult.myRemainderGraph.numEdges() 
		<< " for " << aSequenceHolder.debug().c_str() 
		<< " in BasicBlockAlg " << this);
    }
    else  
      runAngelNonScarse(aSequence);
    aSequenceHolder.myBasicBlockOperations.incrementBy(aSequence.getBestResult().getCounter());
  }

  void BasicBlockAlg::generate(BasicBlockAlg::VariableHashTable& theListOfAlreadyAssignedSources,
			       Sequence& aSequence, 
			       VariableCPList& theDepVertexPListCopyWithoutRemovals, 
			       SequenceHolder& aSequenceHolder) {
    // keep track of what bits we already made into real variables
    InternalReferenceConcretizationList theInternalReferenceConcretizationList;
    // the list to distinguish SAX from SAXPY or alternatively collect into n-ary SAX: 
    VarDevPropPPairList theListOfAlreadyAssignedDependents;
    const xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& theBestVersion(aSequence.getBestResult().myJAEList);
    for(xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList::GraphList::const_iterator it=theBestVersion.getGraphList().begin();
	it!=theBestVersion.getGraphList().end();
	++it) { 
      // make a new assignment which is going to contain the JAE:  
      Assignment& aNewAssignment=aSequence.appendEndAssignment();
      aNewAssignment.setId(makeUniqueId());
      // make a new LHS: 
      Variable& theLHS(aNewAssignment.getLHS());
      Scope& theGlobalScope(ConceptuallyStaticInstances::instance()->
			    getCallGraph().getScopeTree().getGlobalScope());
      VariableSymbolReference* theVariableSymbolReference_p=
	new VariableSymbolReference(theGlobalScope.getSymbolTable().
				    addUniqueAuxSymbol(SymbolKind::VARIABLE,
						       SymbolType::REAL_STYPE,
						       SymbolShape::SCALAR,
						       false),
				    theGlobalScope);
      // JU: this assignment of the vertex Id might have to change 
      // if we create vector assignments as auxilliary variables...
      theVariableSymbolReference_p->setId("1");
      theVariableSymbolReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::algorithm_action_3::JAE_LHS");
      theLHS.supplyAndAddVertexInstance(*theVariableSymbolReference_p);
      theLHS.getAliasMapKey().setTemporary();
      theLHS.getDuUdMapKey().setTemporary();
      const xaifBoosterCrossCountryInterface::JacobianAccumulationExpression& theExpression(*(*it));
      // iterate through all vertices bottom up
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstVertexIteratorPair aPair(theExpression.vertices());
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstVertexIterator aJacExprVertexI(aPair.first), aJacExprVertexIEnd(aPair.second);
      // find the maximal vertex
      for (;aJacExprVertexI!=aJacExprVertexIEnd; ++aJacExprVertexI) { 
	if (!theExpression.numOutEdgesOf(*aJacExprVertexI))
	  break;
      } // end for
      VertexPairList theVertexPairList;
      traverseAndBuildJacobianAccumulationsFromBottomUp(*aJacExprVertexI,
							theExpression,
							aNewAssignment,
							theInternalReferenceConcretizationList,
							theVertexPairList);
      // add the LHS to the tracking list: 
      theInternalReferenceConcretizationList.push_back(InternalReferenceConcretization(&*aJacExprVertexI,&theLHS));
      if (theExpression.isJacobianEntry()) {
	generateSimplePropagator(getVariableWithAliasCheck(theListOfAlreadyAssignedSources,
							   theDepVertexPListCopyWithoutRemovals,
							   dynamic_cast<const PrivateLinearizedComputationalGraphVertex&>(theExpression.getIndependent()).getRHSVariable(),
							   aSequence),
				 dynamic_cast<const PrivateLinearizedComputationalGraphVertex&>(theExpression.getDependent()).getLHSVariable(),
				 theListOfAlreadyAssignedSources,
				 aSequence, 
				 theDepVertexPListCopyWithoutRemovals,
				 theListOfAlreadyAssignedDependents,
				 theLHS);
      } // end if is JacobianEntry
    } // end for 
    // look for a remainder graph
    if (!aSequence.getBestResult().myEdgeCorrelationList.empty()) 
      generateRemainderGraphPropagators(theListOfAlreadyAssignedSources,
					aSequence, 
					theDepVertexPListCopyWithoutRemovals,
					theListOfAlreadyAssignedDependents,
					theInternalReferenceConcretizationList);
    //debuging print statements with results
    DBG_MACRO(DbgGroup::METRIC, "SeqeunceHolder metrics: " << aSequenceHolder.myBasicBlockOperations.debug().c_str() << " for " << aSequenceHolder.debug().c_str() << " in BasicBlockAlg " << this);
  }

  const Variable& BasicBlockAlg::getVariableWithAliasCheck(BasicBlockAlg::VariableHashTable& theListOfAlreadyAssignedSources,
							   VariableCPList& theDepVertexPListCopyWithoutRemovals,
							   const Variable& theIndepVariable,
							   BasicBlockAlg::Sequence& aSequence) { 
    // assign source to temporary if aliased by some
    // dependent
    // use temporary in DerivativePropagator
    // temporary currently lives in global scope 
    const Variable* theIndepVariableContainer_cp=0;
    if (isAliased(theIndepVariable,
		  theDepVertexPListCopyWithoutRemovals)) { 
      // make a Variable (container) for use in the saxpys:
      Variable* theIndepVariableContainer_p = new Variable;
      // was this actual indepenent already assigned?
      // Note, that at this point they should indeed all be syntactically distinct 
      if (!(theListOfAlreadyAssignedSources.hasElement(theIndepVariable.equivalenceSignature()))) {
	// no, we have to make a new assignment
	// this will be the lhs:
	Variable theTarget;
	Scope& theGlobalScope(ConceptuallyStaticInstances::instance()->
			      getCallGraph().getScopeTree().getGlobalScope());
	VariableSymbolReference* theTemporaryVariableReference_p=
	  new VariableSymbolReference(theGlobalScope.getSymbolTable().
				      addUniqueAuxSymbol(SymbolKind::VARIABLE,
							 SymbolType::REAL_STYPE,
							 SymbolShape::SCALAR,
							 true),
				      theGlobalScope);
	theTemporaryVariableReference_p->setId("1");
	theTemporaryVariableReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::getVariableWithAliasCheck");
	theTarget.supplyAndAddVertexInstance(*theTemporaryVariableReference_p);
	theTarget.getAliasMapKey().setTemporary();
	theTarget.getDuUdMapKey().setTemporary();
	// copy the new temporary into the container
	theTarget.copyMyselfInto(*theIndepVariableContainer_p);
	// "theTarget" is only local but the DerivativePropagatorSetDeriv 
	// ctor performs a deep copy and owns the new instance so we are fine
	// the theListOfAlreadyAssignedSources needs to contain the 
	// address of the copy.
	theListOfAlreadyAssignedSources.
	  addElement(theIndepVariable.equivalenceSignature(),
		     &(aSequence.myDerivativePropagator.addSetDerivToEntryPList(theTarget,
										theIndepVariable).getTarget()));
      } // end if (wasn't assigned before)  
      else {
	// yes, it was assigned before
	// copy the previously created temporary into the container
	(theListOfAlreadyAssignedSources.getElement(theIndepVariable.equivalenceSignature()))->
	  copyMyselfInto(*theIndepVariableContainer_p); 
      }
      // point to the new or previously created temporary
      theIndepVariableContainer_cp=theIndepVariableContainer_p;
    } // end if isAliased
    else { // not aliased
      // point to the original independent
      theIndepVariableContainer_cp=&theIndepVariable;
    }
    return *theIndepVariableContainer_cp;
  }

  void BasicBlockAlg::generateRemainderGraphPropagators(VariableHashTable& theListOfAlreadyAssignedSources,
							Sequence& aSequence, 
							VariableCPList& theDepVertexPListCopyWithoutRemovals,
							VarDevPropPPairList& theListOfAlreadyAssignedDependents,
							const InternalReferenceConcretizationList& theInternalReferenceConcretizationList) { 
    typedef std::list<const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex*> LinearizedComputationalGraphVertexPList; 
    LinearizedComputationalGraphVertexPList workList;
    IntermediateReferences theIntermediateReferences;
    bool done=false; 
    aSequence.getBestResult().myRemainderGraph.initVisit();
    while (!done) { 
      //  worklist population: 
      const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& theRemainderGraph(aSequence.getBestResult().myRemainderGraph);
      xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstVertexIteratorPair aVertexIP(theRemainderGraph.vertices());
      xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstVertexIterator anLCGVertI(aVertexIP.first),anLCGvertEndI(aVertexIP.second);
      for(; anLCGVertI!=anLCGvertEndI; ++anLCGVertI) {
	if (!(*anLCGVertI).wasVisited()) { // we are not done with this vertex
	  // look at all the incoming edges: 
	  xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstInEdgeIteratorPair anEdgeIP(theRemainderGraph.getInEdgesOf(*anLCGVertI));
	  xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstInEdgeIterator anLCGEdgeI(anEdgeIP.first),anLCGEdgeEndI(anEdgeIP.second);
	  for (; anLCGEdgeI!=anLCGEdgeEndI; ++ anLCGEdgeI) { 
	    if (!(*anLCGEdgeI).wasVisited())
	      break; 
	  }
	  // only when all in edges are visited can we work in this vertex
	  if (anLCGEdgeI==anLCGEdgeEndI) 
	    workList.push_back(&(*anLCGVertI));
	}
      }
      for (LinearizedComputationalGraphVertexPList::iterator workListI=workList.begin(); 
	   workListI!=workList.end(); 
	   ++workListI) { 
	// find this vertex (source) in the correlation list: 
	const xaifBoosterCrossCountryInterface::VertexCorrelationEntry* theSourceCorr_p(0);
	for (xaifBoosterCrossCountryInterface::VertexCorrelationList::const_iterator vertexCorrListI=aSequence.getBestResult().myVertexCorrelationList.begin();
	     vertexCorrListI!=aSequence.getBestResult().myVertexCorrelationList.end();
	     ++vertexCorrListI) { 
	  if ((*vertexCorrListI).myRemainderVertex_p==*workListI) { 
	    theSourceCorr_p=&(*vertexCorrListI);
	    break; 
	  }
	} 
	if (!theSourceCorr_p) 
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::generateRemainderGraphPropagators: source vertex not found in correlation list");
	// look at all outgoing edges: 
	xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstOutEdgeIteratorPair anEdgeIP(theRemainderGraph.getOutEdgesOf(**workListI));
	xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstOutEdgeIterator anLCGEdgeI(anEdgeIP.first),anLCGEdgeEndI(anEdgeIP.second);
	for (; anLCGEdgeI!=anLCGEdgeEndI; ++anLCGEdgeI) { 
	  const xaifBoosterCrossCountryInterface::VertexCorrelationEntry* theTargetCorr_p(0);
	  const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theTargetVertex(theRemainderGraph.getTargetOf(*anLCGEdgeI));
	  // find the target in the correlation list
	  for (xaifBoosterCrossCountryInterface::VertexCorrelationList::const_iterator vertexCorrListI=aSequence.getBestResult().myVertexCorrelationList.begin();
	       vertexCorrListI!=aSequence.getBestResult().myVertexCorrelationList.end();
	       ++vertexCorrListI) { 
	    if ((*vertexCorrListI).myRemainderVertex_p==&theTargetVertex) { 
	      theTargetCorr_p=&(*vertexCorrListI);
	      break; 
	    }
	  } 
	  if (!theTargetCorr_p) 
	    THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::generateRemainderGraphPropagators: target vertex not found in correlation list");
	  // find the edge in the correlation list
	  const xaifBoosterCrossCountryInterface::EdgeCorrelationEntry* theEdgeCorr_p(0);
	  for (xaifBoosterCrossCountryInterface::EdgeCorrelationList::const_iterator edgeCorrListI=aSequence.getBestResult().myEdgeCorrelationList.begin();
	       edgeCorrListI!=aSequence.getBestResult().myEdgeCorrelationList.end();
	       ++edgeCorrListI) { 
	    if ((*edgeCorrListI).myRemainderGraphEdge_p==&(*anLCGEdgeI)) { 
	      theEdgeCorr_p=&(*edgeCorrListI);
	      break; 
	    }
	  } 
	  if (!theEdgeCorr_p) 
	    THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::generateRemainderGraphPropagators: edge not found in correlation list");
	  theEdgeCorr_p->myRemainderGraphEdge_p->setVisited();
	  generateRemainderGraphEdgePropagator(*theSourceCorr_p,
					       *theTargetCorr_p,
					       *theEdgeCorr_p,
					       theListOfAlreadyAssignedSources,
					       aSequence,
					       theDepVertexPListCopyWithoutRemovals,
					       theListOfAlreadyAssignedDependents,
					       theIntermediateReferences,
					       theInternalReferenceConcretizationList); 
	  theEdgeCorr_p->myRemainderGraphEdge_p->setVisited();
	}
	theSourceCorr_p->myRemainderVertex_p->setVisited();
      }
      if (workList.empty())
	done=true;
      else
	workList.clear();
    }
    aSequence.getBestResult().myRemainderGraph.finishVisit();
  } 

  void BasicBlockAlg::generateRemainderGraphEdgePropagator(const xaifBoosterCrossCountryInterface::VertexCorrelationEntry& theSource, 
							   const xaifBoosterCrossCountryInterface::VertexCorrelationEntry& theTarget, 
							   const xaifBoosterCrossCountryInterface::EdgeCorrelationEntry& theEdge,
							   BasicBlockAlg::VariableHashTable& theListOfAlreadyAssignedSources,
							   Sequence& aSequence,
							   BasicBlockAlg::VariableCPList& theDepVertexPListCopyWithoutRemovals,
							   VarDevPropPPairList& theListOfAlreadyAssignedDependents,
							   IntermediateReferences& theIntermediateReferences,
							   const InternalReferenceConcretizationList& theInternalReferenceConcretizationList) {
    
    // figure out who holds the edge label: 
    const Variable& theEdgeLabelVariable(getEdgeLabel(theEdge,theInternalReferenceConcretizationList,aSequence));
    // figure out what the source is:
    const Variable* theSourceVariable_p(0);
    if (aSequence.getBestResult().myRemainderGraph.numInEdgesOf(*(theSource.myRemainderVertex_p))) { 
      theSourceVariable_p=&(theIntermediateReferences.getVariable(dynamic_cast<const PrivateLinearizedComputationalGraphVertex&>(*(theSource.myOriginalVertex_p))));
    }
    else { 
      theSourceVariable_p=&(getVariableWithAliasCheck(theListOfAlreadyAssignedSources,
						      theDepVertexPListCopyWithoutRemovals,
						      dynamic_cast<const PrivateLinearizedComputationalGraphVertex&>(*(theSource.myOriginalVertex_p)).getRHSVariable(),
						      aSequence));
    }
    // figure out what the target is:
    const Variable& theTargetVariable(theIntermediateReferences.getVariable(dynamic_cast<const PrivateLinearizedComputationalGraphVertex&>(*(theTarget.myOriginalVertex_p))));
    switch(theEdge.myType) { 
    case xaifBoosterCrossCountryInterface::EdgeCorrelationEntry::LCG_EDGE : 
      generateSimplePropagatorFromEdge(*theSourceVariable_p,
				       theTargetVariable,
				       theListOfAlreadyAssignedSources,
				       aSequence,
				       theDepVertexPListCopyWithoutRemovals,
				       theListOfAlreadyAssignedDependents,
				       theEdgeLabelVariable,
				       dynamic_cast<const PrivateLinearizedComputationalGraphEdge&>(*(theEdge.myEliminationReference.myOriginalEdge_p)));
      break;
    case xaifBoosterCrossCountryInterface::EdgeCorrelationEntry::JAE_VERT : { 
      generateSimplePropagator(*theSourceVariable_p,
			       theTargetVariable,
			       theListOfAlreadyAssignedSources,
			       aSequence,
			       theDepVertexPListCopyWithoutRemovals,
			       theListOfAlreadyAssignedDependents,
			       theEdgeLabelVariable);
      break;
    }
    default: 
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::generateRemainderGraphEdgePropagator: unknown type");
      break;
    }
  } 

  const Variable& BasicBlockAlg::getEdgeLabel(const xaifBoosterCrossCountryInterface::EdgeCorrelationEntry& theEdge,
					      const InternalReferenceConcretizationList& theInternalReferenceConcretizationList,
					      Sequence& aSequence) { 
    switch(theEdge.myType) { 
    case xaifBoosterCrossCountryInterface::EdgeCorrelationEntry::LCG_EDGE : {
      const PrivateLinearizedComputationalGraphEdge& thePrivateEdge(dynamic_cast<const PrivateLinearizedComputationalGraphEdge&>(*(theEdge.myEliminationReference.myOriginalEdge_p)));
      if (thePrivateEdge.isDirectCopyEdge()) { 
	// this is the stupid solution for now
	Assignment& aNewAssignment=aSequence.appendFrontAssignment();
	aNewAssignment.setId(makeUniqueId());
	// make a new LHS: 
	Variable& theLHS(aNewAssignment.getLHS());
	Scope& theGlobalScope(ConceptuallyStaticInstances::instance()->
			      getCallGraph().getScopeTree().getGlobalScope());
	VariableSymbolReference* theVariableSymbolReference_p=
	  new VariableSymbolReference(theGlobalScope.getSymbolTable().
				      addUniqueAuxSymbol(SymbolKind::VARIABLE,
							 SymbolType::REAL_STYPE,
							 SymbolShape::SCALAR,
							 false),
				      theGlobalScope);
	// JU: this assignment of the vertex Id might have to change 
	// if we create vector assignments as auxilliary variables...
	theVariableSymbolReference_p->setId("1");
	theVariableSymbolReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::algorithm_action_3::JAE_LHS");
	theLHS.supplyAndAddVertexInstance(*theVariableSymbolReference_p);
	theLHS.getAliasMapKey().setTemporary();
	theLHS.getDuUdMapKey().setTemporary();
	// add the constant '1' to the assignment
	Constant* theConstant_p=new Constant(SymbolType::INTEGER_STYPE,
					     false);
	// set the value
	theConstant_p->setint(1);
	// set the vertex id
	theConstant_p->setId(aNewAssignment.getRHS().getNextVertexId());
	// add it to RHS
	aNewAssignment.getRHS().supplyAndAddVertexInstance(*theConstant_p);
	return theLHS;
      }
      else
	return thePrivateEdge.getAssignmentFromEdge().getLHS();
      break;
    }
    case xaifBoosterCrossCountryInterface::EdgeCorrelationEntry::JAE_VERT : {
      // this is similar to what we do in traverseFromBottomUp
      const xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& theReferredToVertex(*(theEdge.myEliminationReference.myJAEVertex_p));
      // this has to be a maximal vertex in one of previous 
      // expressions in the list that we tracked already: 
      InternalReferenceConcretizationList::const_iterator it;
      for (it=theInternalReferenceConcretizationList.begin();
	   it!=theInternalReferenceConcretizationList.end();
	   ++it) 
	if ((*it).first==&theReferredToVertex) 
	  break;
      if (it==theInternalReferenceConcretizationList.end()) 
	THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::getEdgeLabel: unknown JAE_VERT reference");
      return *((*it).second);
      break;
    }
    default: 
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::getEdgeLabel: unknown type");
      break;
    }
  } 

  void BasicBlockAlg::generateSimplePropagatorFromEdge(const Variable& theSourceVariable,
						       const Variable& theTargetVariable,
						       BasicBlockAlg::VariableHashTable& theListOfAlreadyAssignedSources,
						       Sequence& aSequence,
						       BasicBlockAlg::VariableCPList& theDepVertexPListCopyWithoutRemovals,
						       VarDevPropPPairList& theListOfAlreadyAssignedDependents,
						       const Variable& theLocalJacobianEntry,
						       const PrivateLinearizedComputationalGraphEdge& thePrivateEdge) { 
    generateSimplePropagator(theSourceVariable,
			     theTargetVariable,
			     theListOfAlreadyAssignedSources,
			     aSequence,
			     theDepVertexPListCopyWithoutRemovals,
			     theListOfAlreadyAssignedDependents,
			     theLocalJacobianEntry);
    if(!thePrivateEdge.getParallels().empty()) { 
      for (PrivateLinearizedComputationalGraphEdge::ExpressionEdgePList::const_iterator i=thePrivateEdge.getParallels().begin();
	   i!=thePrivateEdge.getParallels().end();
	   ++i) { 
	generateSimplePropagator(theSourceVariable,
				 theTargetVariable,
				 theListOfAlreadyAssignedSources,
				 aSequence,
				 theDepVertexPListCopyWithoutRemovals,
				 theListOfAlreadyAssignedDependents,
				 dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>((*i)->getExpressionEdgeAlgBase()).
				 getConcretePartialAssignment().getLHS());
      }
    }
  }

  void BasicBlockAlg::generateSimplePropagator(const Variable& theIndepVariable,
					       const Variable& theDependent,
					       BasicBlockAlg::VariableHashTable& theListOfAlreadyAssignedSources,
					       Sequence& aSequence,
					       BasicBlockAlg::VariableCPList& theDepVertexPListCopyWithoutRemovals,
					       VarDevPropPPairList& theListOfAlreadyAssignedDependents,
					       const Variable& theLocalJacobianEntry) { 
    // make the entry to the DerivativePropagator
    // UN: use the  variable in the container theIndepVariableContainer_p 
    // instead of original independent
    bool found=false;
    VarDevPropPPairList::iterator aVarDevPropPPairListI=theListOfAlreadyAssignedDependents.begin();
    for (; 
	 aVarDevPropPPairListI!=theListOfAlreadyAssignedDependents.end(); 
	 ++aVarDevPropPPairListI) { 
      if ((*aVarDevPropPPairListI).first==&theDependent){ 
	found=true;
	break;
      } 
    }
    xaifBoosterDerivativePropagator::DerivativePropagatorSaxpy* theSaxpy_p(0);
    if (!found 
	||
	(found && !doesPermitNarySax())) { 
      theSaxpy_p=&(aSequence.myDerivativePropagator.
		   addSaxpyToEntryPList(theLocalJacobianEntry,
					theIndepVariable,
					theDependent));
    }
    else { 
      theSaxpy_p=(*aVarDevPropPPairListI).second;
      theSaxpy_p->addAX(theLocalJacobianEntry,
			theIndepVariable);
    } 
    if (!found) { 
      theSaxpy_p->useAsSax();
      theListOfAlreadyAssignedDependents.
	push_back(VarDevPropPPair(&theDependent,
				  theSaxpy_p));
    }
  }

  void BasicBlockAlg::handleCollapsedVertex(PrivateLinearizedComputationalGraphVertex& theCollapsedVertex,
					    BasicBlockAlg::VariableCPList& theDepVertexPListCopyWithoutRemovals,
					    BasicBlockAlg::VariableHashTable& theListOfAlreadyAssignedSources,
					    BasicBlockAlg::Sequence& aSequence,
					    xaifBoosterDerivativePropagator::DerivativePropagator::EntryPList::iterator& aDPBeginI) { 
    aSequence.myDerivativePropagator.
      addSetDerivToEntryPList(theCollapsedVertex.getLHSVariable(),
			      getVariableWithAliasCheck(theListOfAlreadyAssignedSources,
							theDepVertexPListCopyWithoutRemovals,
							theCollapsedVertex.getRHSVariable(),
							aSequence),
			      aDPBeginI);
  }

  void BasicBlockAlg::traverseAndBuildJacobianAccumulationsFromBottomUp(const xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& theVertex,
									const xaifBoosterCrossCountryInterface::JacobianAccumulationExpression& theExpression,
									Assignment& theNewAssignment,
									const InternalReferenceConcretizationList& theInternalReferenceConcretizationList,
									VertexPairList& theVertexPairList) { 
    xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstInEdgeIteratorPair pi(theExpression.getInEdgesOf(theVertex));
    xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstInEdgeIterator aJacExprEdgeI(pi.first),aJacExprEdgeIEnd(pi.second);
    for (;aJacExprEdgeI!=aJacExprEdgeIEnd ;++aJacExprEdgeI)
      traverseAndBuildJacobianAccumulationsFromBottomUp(theExpression.getSourceOf(*aJacExprEdgeI),
							theExpression,
							theNewAssignment,
							theInternalReferenceConcretizationList,
							theVertexPairList); 
    // we add this vertex depending on its type
    ExpressionVertex* theNewExpressionVertex_p(0);
    switch (theVertex.getReferenceType()) { 
    case xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::INTERNAL_REF: 
      {
	const xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& theReferredToVertex(theVertex.getInternalReference());
	// this has to be a maximal vertex in one of previous 
	// expressions in the list that we tracked already: 
	InternalReferenceConcretizationList::const_iterator it;
	for (it=theInternalReferenceConcretizationList.begin();
	     it!=theInternalReferenceConcretizationList.end();
	     ++it) 
	  if ((*it).first==&theReferredToVertex) 
	    break;
	if (it==theInternalReferenceConcretizationList.end()) 
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::traverseFromBottomUp: unknown internal reference");
	// we make the new Argument
	Argument* theInternalArgument_p=new Argument();
	theNewExpressionVertex_p=theInternalArgument_p;
	(*it).second->copyMyselfInto(theInternalArgument_p->getVariable());
	theNewExpressionVertex_p->setId(theNewAssignment.getRHS().getNextVertexId());
	theNewAssignment.getRHS().supplyAndAddVertexInstance(*theNewExpressionVertex_p);
	break;
      } 
    case xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::EXTERNAL_REF: 
      { 
	// we know that we can do the following cast
	// since we handed PrivateLinearizedComputationalGraphEdges
	// to Angel in the first place
	const PrivateLinearizedComputationalGraphEdge& thePrivateEdge(dynamic_cast<const PrivateLinearizedComputationalGraphEdge&>(theVertex.getExternalReference()));
	if(!thePrivateEdge.getParallels().empty()) { 
	  unsigned int position;
	  Intrinsic* theIntrinsic_p=0;
	  for (PrivateLinearizedComputationalGraphEdge::ExpressionEdgePList::const_iterator i=thePrivateEdge.getParallels().begin();
	       i!=thePrivateEdge.getParallels().end();
	       ++i) { 
	    Argument* theExternalArgument_p=new Argument();
	    dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>((*i)->getExpressionEdgeAlgBase()).
	      getConcretePartialAssignment().getLHS().copyMyselfInto(theExternalArgument_p->getVariable());
	    theExternalArgument_p->setId(theNewAssignment.getRHS().getNextVertexId());
	    theNewAssignment.getRHS().supplyAndAddVertexInstance(*theExternalArgument_p);
	    if (theIntrinsic_p) { // have one addition already
	      ExpressionEdge& theNewEdge(theNewAssignment.getRHS().addEdge(*theIntrinsic_p,
									   *theExternalArgument_p));
	      // make up an ID
	      theNewEdge.setId(theNewAssignment.getRHS().getNextEdgeId());
	      theNewEdge.setPosition(position++);
	    }	      
	    theIntrinsic_p=new Intrinsic("add_scal_scal");
	    position=1; // start a new addition
	    theIntrinsic_p->setId(theNewAssignment.getRHS().getNextVertexId());
	    theNewAssignment.getRHS().supplyAndAddVertexInstance(*theIntrinsic_p);
	    ExpressionEdge& theNewEdge(theNewAssignment.getRHS().addEdge(*theExternalArgument_p,
									 *theIntrinsic_p));
	    // make up an ID
	    theNewEdge.setId(theNewAssignment.getRHS().getNextEdgeId());
	    theNewEdge.setPosition(position++);
	  } // end for 
	  // now deal with this edge
	  ExpressionVertex* theNewVertex_p=0;
	  if (thePrivateEdge.isDirectCopyEdge()) { 
	    // add the constant '1' to the assignment
	    Constant* theConstant_p=new Constant(SymbolType::INTEGER_STYPE,
						 false);
	    // set the value
	    theConstant_p->setint(1);
	    // set the vertex id
	    theConstant_p->setId(theNewAssignment.getRHS().getNextVertexId());
	    // add it to RHS
	    theNewAssignment.getRHS().supplyAndAddVertexInstance(*theConstant_p);
	    theNewVertex_p=theConstant_p;
	  } 
	  else { 
	    Argument* theExternalArgument_p=new Argument();
	    thePrivateEdge.getAssignmentFromEdge().getLHS().copyMyselfInto(theExternalArgument_p->getVariable());
	    theExternalArgument_p->setId(theNewAssignment.getRHS().getNextVertexId());
	    theNewAssignment.getRHS().supplyAndAddVertexInstance(*theExternalArgument_p);
	    theNewVertex_p=theExternalArgument_p;
	  }
	  if (theIntrinsic_p) { // have one addition already
	    ExpressionEdge& theNewEdge(theNewAssignment.getRHS().addEdge(*theNewVertex_p,
									 *theIntrinsic_p));
	    // make up an ID
	    theNewEdge.setId(theNewAssignment.getRHS().getNextEdgeId());
	    theNewEdge.setPosition(position++);
	  }
	  theNewExpressionVertex_p=theIntrinsic_p;	      
	} // end if 
	else { 
	  if (thePrivateEdge.isDirectCopyEdge()) { 
	    // add the constant '1' to the assignment
	    Constant* theConstant_p=new Constant(SymbolType::INTEGER_STYPE,
						 false);
	    // set the value
	    theConstant_p->setint(1);
	    theNewExpressionVertex_p=theConstant_p;
	  } // end if 
	  else { 
	    // we make the new Argument
	    // use the LHS of the local elementary partial assignment
	    Argument* theExternalArgument_p=new Argument();
	    theNewExpressionVertex_p=theExternalArgument_p;
	    thePrivateEdge.getAssignmentFromEdge().getLHS().copyMyselfInto(theExternalArgument_p->getVariable());
	  } // end else
	  theNewExpressionVertex_p->setId(theNewAssignment.getRHS().getNextVertexId());
	  theNewAssignment.getRHS().supplyAndAddVertexInstance(*theNewExpressionVertex_p);
	} // end else 
	break;
      } 
    case xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::OPERATION: 
      { 
	std::string anOpName;
	switch (theVertex.getOperation()) { 
	case xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::ADD_OP: 
	  anOpName="add_scal_scal";
	  break;
	case xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::MULT_OP: 
	  anOpName="mul_scal_scal";
	  break;
	default: 
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::traverseFromBottomUp: unknown operation");
	  break;
	} // end switch 
	Intrinsic* theIntrinsic_p=new Intrinsic(anOpName);
	theNewExpressionVertex_p=theIntrinsic_p;
	theNewExpressionVertex_p->setId(theNewAssignment.getRHS().getNextVertexId());
	theNewAssignment.getRHS().supplyAndAddVertexInstance(*theNewExpressionVertex_p);
	break;
      } 
    default :
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::traverseFromBottomUp: unknown vertex type");
      break;
    } // end switch 
    theVertexPairList.push_back(VertexPair(&theVertex,theNewExpressionVertex_p));
    if (theVertex.getReferenceType()==xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::OPERATION) { 
      // add the edges
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstInEdgeIteratorPair pe(theExpression.getInEdgesOf(theVertex));
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstInEdgeIterator ite(pe.first),aJacExprEdgeIEnd(pe.second);
      // JU: this is the position hack talked about in the todo item.
      unsigned int position=1;
      for (;ite!=aJacExprEdgeIEnd ;++ite) { 
	const ExpressionVertex *theConcreteSourceVertex_p(0);
	const xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& 
	  theJacobianAccumulationExpressionSourceVertex(theExpression.getSourceOf(*ite));
	for (VertexPairList::const_iterator li=theVertexPairList.begin();
	     li!=theVertexPairList.end();
	     ++li) { 
	  if (&theJacobianAccumulationExpressionSourceVertex == (*li).first) { 
	    theConcreteSourceVertex_p=(*li).second;
	    break;
	  }
	} // end for all vertex pairs in vertex map
	if (!theConcreteSourceVertex_p)
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::traverseFromBottomUp: could not find source");
	ExpressionEdge& theNewEdge(theNewAssignment.getRHS().addEdge(*theConcreteSourceVertex_p,
								     *theNewExpressionVertex_p));
	// make up an ID
	theNewEdge.setId(theNewAssignment.getRHS().getNextEdgeId());
	theNewEdge.setPosition(position++);
      } // end for all abstract edges
    } 
  } 

  void BasicBlockAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  PrivateLinearizedComputationalGraph& 
  BasicBlockAlg::getComputationalGraph(const Assignment& theAssignment,
				       BasicBlockAlg::SequenceHolder& aSequenceHolder) { 
    DBG_MACRO(DbgGroup::CALLSTACK, "BasicBlockAlg::SequenceHolder::getComputationalGraph entering with "
	      << debug().c_str());
    Sequence* theSequence_p=0;
    if(!aSequenceHolder.getBasicBlockElementSequencePPairList().size()) { 
      // not initialized
      for (PlainBasicBlock::BasicBlockElementList::const_iterator i=
	     getContaining().getBasicBlockElementList().begin();
	   i!=getContaining().getBasicBlockElementList().end();
	   ++i)
	aSequenceHolder.getBasicBlockElementSequencePPairList().push_back(BasicBlockElementSequencePPair(*i,0));
    }
    for (SequenceHolder::BasicBlockElementSequencePPairList::iterator i=
	   aSequenceHolder.getBasicBlockElementSequencePPairList().begin();
	 i!=aSequenceHolder.getBasicBlockElementSequencePPairList().end();
	 ++i) 
      if ((*i).first==&theAssignment) { 
	if(!(*i).second) { // nothing assigned yet
	  incrementGlobalAssignmentCounter(aSequenceHolder);
	  if(i!=aSequenceHolder.getBasicBlockElementSequencePPairList().begin()) { 
	    // have a predecessor: 
	    --i;
	    if(!(*i).second ||
	       aSequenceHolder.doesLimitToStatementLevel()) { 
	      // either nothing assigned yet which means this is not an 
	      // assignment (unless we call this out of order) this is how 
	      // we handle splits for subroutine calls
	      // OR
	      // we intend to not flatten at all and keep one assignment per sequence
	      // while leaving the rest of the code unchanged
	      theSequence_p=new Sequence;
	      incrementGlobalSequenceCounter(aSequenceHolder);
	      theSequence_p->myFirstElement_p=theSequence_p->myLastElement_p=&theAssignment;
	      aSequenceHolder.getUniqueSequencePList().push_back(theSequence_p);
	    } 
	    else { 
	      // have something assigned which means this 
	      // assignment is directly following its predecessor
	      // so we use the same triple
	      theSequence_p=(*i).second;
	      theSequence_p->myLastElement_p=&theAssignment;
	    }
	    // go back to the requesting assignment: 
	    ++i;
	  } 
	  else { // have no predecessor
	    theSequence_p=new Sequence;
	    incrementGlobalSequenceCounter(aSequenceHolder);
	    theSequence_p->myFirstElement_p=theSequence_p->myLastElement_p=&theAssignment;
	    aSequenceHolder.getUniqueSequencePList().push_back(theSequence_p);
	  }
	  (*i).second=theSequence_p;
	} // end if nothing assigned
	else
	  theSequence_p=(*i).second;
	break;
      } // end if 
    if (!theSequence_p)
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::SequenceHolder::getComputationalGraph: this basic block does not have element "
				 << theAssignment.debug().c_str());
    DBG_MACRO(DbgGroup::CALLSTACK, "BasicBlockAlg::SequenceHolder::getComputationalGraph leaving with "
	      << debug().c_str());
    return *(theSequence_p->myComputationalGraph_p);
  } 

  bool BasicBlockAlg::isAliased(const Variable& theIndepVariable,
				const BasicBlockAlg::VariableCPList& theDependentList) { 
    AliasMap& theAliasMap(ConceptuallyStaticInstances::instance()->
			  getCallGraph().getAliasMap());
    for (VariableCPList::const_iterator li=theDependentList.begin();
	 li!=theDependentList.end();
	 ++li) { 
      if (theAliasMap.mayAlias(theIndepVariable.getAliasMapKey(),
			       (*li)->getAliasMapKey()))
	return true;
    } // end for 
    return false;
  } // end of BasicBlockAlg::isAliased

  const BasicBlock&
  BasicBlockAlg::getContaining() const {
    return dynamic_cast<const BasicBlock&>(myContaining);
  }

  void BasicBlockAlg::permitNarySax() { 
    ourPermitNarySaxFlag=true;
  }
  
  bool BasicBlockAlg::doesPermitNarySax() { 
    return ourPermitNarySaxFlag;
  }

  const PreaccumulationCounter& BasicBlockAlg::getBasicBlockOperations() const {
    return getBestSequenceHolder().myBasicBlockOperations;
  }

  const DuUdMapDefinitionResult::StatementIdList& BasicBlockAlg::getAssignmentIdList()const { 
    return ourAssignmentIdList;
  } 

  void BasicBlockAlg::addMyselfToAssignmentIdList(const Assignment& anAssignment, const SequenceHolder& aSequenceHolder) {
    if (isRepresentativeSequenceHolder(aSequenceHolder))
      ourAssignmentIdList.push_back(anAssignment.getId());
  }

  void BasicBlockAlg::setAllAlgorithms(){
    ourChooseAlgFlag = true;
  }

  void BasicBlockAlg::setRuntimeCounters(){
    ourRuntimeCountersFlag = true;
  }
  std::string BasicBlockAlg::makeUniqueId() { 
    static unsigned anId=0;
    std::ostringstream ostr;
    ostr << "_jacobian_accumulation_" << anId++ << std::ends;
    return ostr.str();
  }
  

  BasicBlockAlg::SequenceHolder& 
  BasicBlockAlg::getSequenceHolder(PreaccumulationMode::PreaccumulationMode_E aMode) { 
    switch(aMode) { 
    case PreaccumulationMode::STATEMENT: 
    case PreaccumulationMode::MAX_GRAPH: 
    case PreaccumulationMode::MAX_GRAPH_SCARSE: 
      break; 
    default: 
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::getSequenceHolder: no logic for Mode "
				 << PreaccumulationMode::toString(aMode).c_str());
      break; 
    }
    // so the compiler is happy
    return *(mySequenceHolderPVector[aMode]);
  }

  const BasicBlockAlg::SequenceHolder& BasicBlockAlg::getBestSequenceHolder() const { 
    if (!myBestSequenceHolder_p)
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::SequenceHolder::getBestSequenceHolder: not determined");
    return *myBestSequenceHolder_p;
  } 

  BasicBlockAlg::SequenceHolder& BasicBlockAlg::getBestSequenceHolder() { 
    if (!myBestSequenceHolder_p)
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::SequenceHolder::getBestSequenceHolder: not determined");
    return *myBestSequenceHolder_p;
  } 

  void BasicBlockAlg::forcePreaccumulationMode(PreaccumulationMode::PreaccumulationMode_E aMode) { 
    PreaccumulationMode::checkValid(aMode);
    ourPreaccumulationMode=aMode;
  } 

  PreaccumulationMode::PreaccumulationMode_E BasicBlockAlg::getPreaccumulationMode() { 
    return ourPreaccumulationMode;
  } 

  BasicBlockAlg::SequenceHolder& BasicBlockAlg::getRepresentativeSequenceHolder() { 
    if(!myRepresentativeSequence_p) 
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::getRepresentativeSequenceHolder:  no representative set");
    return *myRepresentativeSequence_p;
  } 

} // end of namespace xaifBoosterAngelInterfaceAlgorithms 
