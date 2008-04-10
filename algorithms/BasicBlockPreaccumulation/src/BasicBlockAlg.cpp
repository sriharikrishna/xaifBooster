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

#include "xaifBooster/algorithms/CrossCountryInterface/inc/EliminationException.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/AccumulationGraph.hpp"
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

  // parameters for simulated annealing
  int BasicBlockAlg::ourIterationsParameter=5000;
  double BasicBlockAlg::ourGamma=5.0;

  BasicBlockAlg::Sequence::Sequence() :
    myFirstElement_p(0),
    myLastElement_p(0),
    myBestElimination_p(0) {
    myComputationalGraph_p=ourPrivateLinearizedComputationalGraphAlgFactory_p->makeNewPrivateLinearizedComputationalGraph();
  }
  
  BasicBlockAlg::Sequence::~Sequence() { 
    for (InlinableSubroutineCallPList::iterator i=myAllocationList.begin();
	 i!=myAllocationList.end();
	 ++i) 
      if (*i)
	delete *i;
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
    for (EliminationPList::iterator i = myEliminationPList.begin(); i != myEliminationPList.end(); ++i)
      if (*i)
	delete *i;
    if (myComputationalGraph_p)
      delete myComputationalGraph_p;
  }

  xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& 
  BasicBlockAlg::Sequence::addAllocation(const VariableSymbolReference& toBeAllocated,
					 const Variable& variableToMatch) { 
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theSRCall_p=new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("oad_AllocateMatching"); 
    myAllocationList.push_back(theSRCall_p);
    // first argument
    Variable& toBeAllocatedVariable(theSRCall_p->addConcreteArgument(1).getArgument().getVariable());
    VariableSymbolReference* 
      tobeAllocateVariableSymbolReference_p(new VariableSymbolReference(toBeAllocated.getSymbol(),
									toBeAllocated.getScope()));
    tobeAllocateVariableSymbolReference_p->setId("1");
    tobeAllocateVariableSymbolReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::Sequence::addAllocation");
    toBeAllocatedVariable.supplyAndAddVertexInstance(*tobeAllocateVariableSymbolReference_p);
    toBeAllocatedVariable.getAliasMapKey().setTemporary();
    toBeAllocatedVariable.getDuUdMapKey().setTemporary();
    // second argument
    variableToMatch.copyMyselfInto(theSRCall_p->addConcreteArgument(2).getArgument().getVariable());
    return *theSRCall_p;
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

  const BasicBlockAlg::Sequence::InlinableSubroutineCallPList& BasicBlockAlg::Sequence::getAllocationList() const { 
    return myAllocationList;
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

  xaifBoosterCrossCountryInterface::Elimination& BasicBlockAlg::Sequence::addNewElimination(xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& lcg) { 
	  Elimination* theElimination_p = new xaifBoosterCrossCountryInterface::Elimination (lcg);
    myEliminationPList.push_back(theElimination_p);
    return *theElimination_p;
  }

  void BasicBlockAlg::Sequence::setBestResult() {
    if (myEliminationPList.empty())
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::Sequence::setBestResult() : no eliminations, thus no results");
    myBestElimination_p = *(myEliminationPList.begin());
    for (EliminationPList::iterator i = ++(myEliminationPList.begin()); i != myEliminationPList.end(); ++i) { 
      if ((*i)->getEliminationResult().getCounter() < myBestElimination_p->getEliminationResult().getCounter())
	myBestElimination_p = *i;
    }
  } 

  const xaifBoosterCrossCountryInterface::Elimination& BasicBlockAlg::Sequence::getBestElimination() const {
    if (!myBestElimination_p)
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::Sequence::getBestResult: myBestElimination_p not set");
    return *myBestElimination_p;
  }

  const xaifBoosterCrossCountryInterface::Elimination::EliminationResult& BasicBlockAlg::Sequence::getBestResult() const {
    if (!myBestElimination_p)
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::Sequence::getBestResult: myBestElimination_p not set");
    return myBestElimination_p->getEliminationResult();
  } 

  BasicBlockAlg::Sequence::EliminationPList& BasicBlockAlg::Sequence::getEliminationPList() {
    if (myEliminationPList.empty())
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::Sequence::getEliminationPList: myEliminationP:List is empty");
    return myEliminationPList;
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

  BasicBlockAlg::BasicBlockAlg(BasicBlock& theContaining) :
    xaifBooster::BasicBlockAlgBase(theContaining),
    xaifBoosterTypeChange::BasicBlockAlg(theContaining),
    myBestSequenceHolder_p(0),
    mySequenceHolderPVector(PreaccumulationMode::ourModeCount) { 
    mySequenceHolderPVector[PreaccumulationMode::STATEMENT]=new SequenceHolder(true);
    mySequenceHolderPVector[PreaccumulationMode::MAX_GRAPH]=new SequenceHolder(false);
    mySequenceHolderPVector[PreaccumulationMode::MAX_GRAPH_SCARSE]=new SequenceHolder(false);
    mySequenceHolderPVector[PreaccumulationMode::MAX_GRAPH_SCARSE_REROUTING_MIX]=new SequenceHolder(false);
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
	  for (Sequence::InlinableSubroutineCallPList::const_iterator ali=aSequence_p->getAllocationList().begin();
	       ali!=aSequence_p->getAllocationList().end();
	       ++ali) 
	    (*(ali))->printXMLHierarchy(os);
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
	  for(Sequence::AssignmentPList::const_iterator eli=theEndList.begin();
	      eli!=theEndList.end();
	      ++eli) 
	    (*(eli))->printXMLHierarchy(os);
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
      std::string theVertexShape("ellipse");
      std::string theVertexGroupname("intermediates");
      std::string vertexFixedSize("false");
      const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList& theDepVertexPList(myG.getDependentList());
      for (xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList::const_iterator aDepVertexPListI(theDepVertexPList.begin());
	   aDepVertexPListI!=theDepVertexPList.end();
	   ++aDepVertexPListI) { 
	if (thePrivateLinearizedComputationalGraphVertex_p==*(aDepVertexPListI)) {
	  // cast it first
	  const PrivateLinearizedComputationalGraphVertex& myPrivateVertex(dynamic_cast<const PrivateLinearizedComputationalGraphVertex&>(**aDepVertexPListI));
	  std::ostringstream oss;
	  oss << myPrivateVertex.getOriginalVariable().getVariableSymbolReference().getSymbol().getId().c_str();
	  if (myPrivateVertex.getOriginalVariable().getDuUdMapKey().getKind()==InfoMapKey::SET)
	    oss  << " k=" 
		 << myPrivateVertex.getOriginalVariable().getDuUdMapKey().getKey();
	  oss << " d" << std::ends;
	  theVertexKind=oss.str();
	  theVertexShape = "invtriangle";
          theVertexGroupname = "dependents";
          vertexFixedSize = "true";
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
	  oss << myPrivateVertex.getOriginalVariable().getVariableSymbolReference().getSymbol().getId().c_str();
	  if (myPrivateVertex.getOriginalVariable().getDuUdMapKey().getKind()==InfoMapKey::SET)
	    oss  << " k=" 
		 << myPrivateVertex.getOriginalVariable().getDuUdMapKey().getKey();
	  oss << " i" << std::ends;
	  theVertexKind=oss.str();
	  theVertexShape = "triangle";
          theVertexGroupname = "independents";
          vertexFixedSize = "true";
	  break;
	}
      }
      out << "["
	  << "fixedsize=" << vertexFixedSize.c_str() << ","
	  << "fontsize=8,"
	  << "group=\"" << theVertexGroupname.c_str() << "\","
	  << "shape=" << theVertexShape.c_str() << ","
	  << "label=\"" << theVertexKind.c_str() << "\""
	  << "]";
    }
    const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& myG;
  }; // end class PrivateLinearizedComputationalGraphVertexLabelWriter

  class PrivateLinearizedComputationalGraphEdgeLabelWriter {
  public:
    PrivateLinearizedComputationalGraphEdgeLabelWriter(const PrivateLinearizedComputationalGraph& g) : myG(g) {};
    template <class BoostIntenalEdgeDescriptor>
    void operator()(std::ostream& out, const BoostIntenalEdgeDescriptor& v) const {
      const PrivateLinearizedComputationalGraphEdge* thePrivateLinearizedComputationalGraphEdge_p=
	dynamic_cast<const PrivateLinearizedComputationalGraphEdge*>(boost::get(boost::get(BoostEdgeContentType(),
											     myG.getInternalBoostGraph()),
										  v));
      std::string theColor ("");
      if (thePrivateLinearizedComputationalGraphEdge_p->getEdgeLabelType() == LinearizedComputationalGraphEdge::UNIT_LABEL)
	theColor = "red";
      else if (thePrivateLinearizedComputationalGraphEdge_p->getEdgeLabelType() == LinearizedComputationalGraphEdge::CONSTANT_LABEL)
	theColor = "blue";
      else
	theColor = "black";

      out << "["
	  << "color=" << theColor.c_str()
	  << ",fontsize=8"
	  << ",labelfloat=false"
	  << ",label=\"" << thePrivateLinearizedComputationalGraphEdge_p << "\""
	  << "]";
    }
    const PrivateLinearizedComputationalGraph& myG;
  }; // end class PrivateLinearizedComputationalGraphEdgeLabelWriter

  class PrivateLinearizedComputationalGraphPropertiesWriter {
  public:
    PrivateLinearizedComputationalGraphPropertiesWriter(const PrivateLinearizedComputationalGraph& g) : myG(g) {};
    void operator()(std::ostream& out) const {
      out << "rankdir=BT;" << std::endl;
    }
    const PrivateLinearizedComputationalGraph& myG;
  }; // end class PrivateLinearizedComputationalGraphPropertiesWriter

  class LinearizedComputationalGraphVertexLabelWriter {
  public:
    LinearizedComputationalGraphVertexLabelWriter(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& g) : myG(g) {};
    template <class BoostIntenalVertexDescriptor>
    void operator()(std::ostream& out, 
		    const BoostIntenalVertexDescriptor& v) const {
    }
    const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& myG;
  }; // end class LinearizedComputationalGraphVertexLabelWriter

  class LinearizedComputationalGraphEdgeLabelWriter {
  public:
    LinearizedComputationalGraphEdgeLabelWriter(const LinearizedComputationalGraph& g) : myG(g) {};
    template <class BoostIntenalEdgeDescriptor>
    void operator()(std::ostream& out, const BoostIntenalEdgeDescriptor& v) const {
      const LinearizedComputationalGraphEdge* theLCGEdge_p =
	dynamic_cast<const LinearizedComputationalGraphEdge*>(boost::get(boost::get(BoostEdgeContentType(),
										    myG.getInternalBoostGraph()),
									 v));
      if (theLCGEdge_p->getEdgeLabelType() == LinearizedComputationalGraphEdge::UNIT_LABEL)
	out << "[color=\"red\"]";
      else if (theLCGEdge_p->getEdgeLabelType() == LinearizedComputationalGraphEdge::CONSTANT_LABEL)
	out << "[color=\"blue\"]";
    }
    const LinearizedComputationalGraph& myG;
  }; // end class LinearizedComputationalGraphEdgeLabelWriter

  class LinearizedComputationalGraphPropertiesWriter {
  public:
    LinearizedComputationalGraphPropertiesWriter(const LinearizedComputationalGraph& g) : myG(g) {};
    void operator()(std::ostream& out) const {
      out << "rankdir=BT;" << std::endl;
    }
    const LinearizedComputationalGraph& myG;
  }; // end class LinearizedComputationalGraphPropertiesWriter

  class AccumulationGraphVertexLabelWriter {
  public:
    AccumulationGraphVertexLabelWriter(const AccumulationGraph& g) : myG(g) {};
    template <class BoostIntenalVertexDescriptor>
    void operator()(std::ostream& out, 
		    const BoostIntenalVertexDescriptor& v) const {
      const AccumulationGraphVertex* theAccumulationGraphVertex_p =
	dynamic_cast<const AccumulationGraphVertex*>(boost::get(boost::get(BoostVertexContentType(),
									   myG.getInternalBoostGraph()),
								v));
      std::ostringstream labelStream;
      std::string FixedSize("false"), theFontSize, theShape, theGroupname, theColor, theLabel;

      // set shape
      if (theAccumulationGraphVertex_p->hasRemainderGraphEdge()) {
	theGroupname = "RemainderGraphEdges";
	theShape = "box";
      }
      else if (myG.numInEdgesOf(*theAccumulationGraphVertex_p)) {
	theGroupname = "Intermediate ops";
	theShape = "circle";
      }
      else { // leaves
	theShape = "egg";
	theGroupname = "leaves";
      }

      // set label, font size, fixed size
      if (myG.numInEdgesOf(*theAccumulationGraphVertex_p)) { // ops
	theFontSize = "25";
	FixedSize = "true";
	if (theAccumulationGraphVertex_p->getOperation() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::ADD_OP)
	  labelStream << "+" << std::ends;
	else if (theAccumulationGraphVertex_p->getOperation() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::MULT_OP)
	  labelStream << "*" << std::ends;
      }	
      else { // leaves
	FixedSize = "false";
	switch(theAccumulationGraphVertex_p->getPartialDerivativeKind()) {
	  case PartialDerivativeKind::LINEAR_ONE: {
	    theFontSize = "16";
	    labelStream << "1" << std::ends;
	    break;
	  } // end case LINEAR_ONE
	  case PartialDerivativeKind::LINEAR_MINUS_ONE: {
	    theFontSize = "16";
	    labelStream << "-1" << std::ends;
	    break;
	  } // end case LINEAR_MINUS_ONE
	  case PartialDerivativeKind::LINEAR: {
	    theFontSize = "16";
	    labelStream << theAccumulationGraphVertex_p->getValue() << std::ends;
	    break;
	  } // end case LINEAR
	  case PartialDerivativeKind::NONLINEAR: {
	    theFontSize = "8";
	    labelStream << &theAccumulationGraphVertex_p->getLHSVariable() << std::ends;
	    break;
	  } // end case NONLINEAR
	  default:
	    THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::AccumulationGraphVertexLabelWriter: partial derivative type on AccumulationGraphVertex is NOT_SET");
	    break;
	} // end switch on PDK
      }

      // set color according to PartialDerivativeKind
      switch(theAccumulationGraphVertex_p->getPartialDerivativeKind()) {
	case PartialDerivativeKind::LINEAR_ONE:
	  theColor = "red";
	  break;
	case PartialDerivativeKind::LINEAR_MINUS_ONE:
	  theColor = "pink";
	  break;
	case PartialDerivativeKind::LINEAR:
	  theColor = "blue";
	  break;
	case PartialDerivativeKind::NONLINEAR:
	  theColor = "black";
	  break;
	case PartialDerivativeKind::PASSIVE:
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::AccumulationGraphVertexLabelWriter: partial derivative type on AccumulationGraph vertex is PASSIVE");
	  break;
	case PartialDerivativeKind::NOT_SET:
	  theColor = "green";
	  break;
	default:
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::AccumulationGraphVertexLabelWriter: unknown partial derivative type on AccumulationGraph vertex");
	  break;
      } // end switch on vertex PartialDerivativeKind

      out << "["
          << "group=\"" << theGroupname.c_str() << "\","
	  << "fixedsize=" << FixedSize.c_str() << ","
          << "fontsize=" << theFontSize.c_str() << ","
          << "shape=" << theShape.c_str() << ","
          << "color=" << theColor.c_str() << ","
	  << "label=\"" << labelStream.str().c_str() << "\""
	  << "]";
    }
    const AccumulationGraph& myG;
  }; // end class AccumulationGraphVertexLabelWriter

  class AccumulationGraphEdgeLabelWriter {
  public:
    AccumulationGraphEdgeLabelWriter(const AccumulationGraph& g) : myG(g) {};
    template <class BoostIntenalEdgeDescriptor>
    void operator()(std::ostream& out,
		    const BoostIntenalEdgeDescriptor& v) const {
    }
    const AccumulationGraph& myG;
  }; // end class AccumulationGraphEdgeLabelWriter

  class AccumulationGraphPropertiesWriter {
  public:
    AccumulationGraphPropertiesWriter(const AccumulationGraph& g) : myG(g) {};
    void operator()(std::ostream& out) const {
      out << "rankdir=BT;" << std::endl;
    }
    const AccumulationGraph& myG;
  }; // end class AccumulationGraphPropertiesWriter

  void 
  BasicBlockAlg::algorithm_action_3() {
    DBG_MACRO(DbgGroup::CALLSTACK, "BasicBlockAlg::algorithm_action_3: invoked for " << debug().c_str());
    if (ourPreaccumulationMode==PreaccumulationMode::MAX_GRAPH_SCARSE_REROUTING_MIX)
      algorithm_action_3_perSequence(PreaccumulationMode::MAX_GRAPH_SCARSE_REROUTING_MIX);
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
  BasicBlockAlg::fillDependentsList(PrivateLinearizedComputationalGraph& theComputationalGraph) {
    // now look at all the vertices in the dependent list 
    // and remove the ones not needed as indicated by 
    // the duud information:
    const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList& theDepVertexPList(theComputationalGraph.getDependentList());
    for (xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList::const_iterator aDepVertexPListI(theDepVertexPList.begin());
	 aDepVertexPListI!=theDepVertexPList.end();) { 
      // cast it first
      const PrivateLinearizedComputationalGraphVertex& myPrivateVertex(dynamic_cast<const PrivateLinearizedComputationalGraphVertex&>(**aDepVertexPListI));
      // advance the iterator before we delete anything:
      ++aDepVertexPListI;
      // all the dependent ones should have the LHS set
	const StatementIdSetMapKey& aDuUdMapKey(myPrivateVertex.getOriginalVariable().getDuUdMapKey()); 
      if (aDuUdMapKey.getKind()==InfoMapKey::TEMP_VAR) { 
	// now the assumption is that temporaries are local to the flattened Sequence
	// and we can remove: 
	theComputationalGraph.removeFromDependentList(myPrivateVertex);
	continue;
      }
      DuUdMapUseResult theDuUdMapUseResult(ConceptuallyStaticInstances::instance()->getCallGraph().getDuUdMap().use(aDuUdMapKey,
														    myPrivateVertex.getStatementId(),
														    theComputationalGraph.getStatementIdLists()));
      if (theDuUdMapUseResult.myAnswer==DuUdMapUseResult::AMBIGUOUS_INSIDE 
	  || 
	  theDuUdMapUseResult.myAnswer==DuUdMapUseResult::UNIQUE_INSIDE) { 
	if (!theComputationalGraph.numOutEdgesOf(myPrivateVertex)) { 
	  if (theDuUdMapUseResult.myActiveUse!=ActiveUseType::PASSIVEUSE) { 
	      // if the use is not strictly passive then in case of UNIQUE_INSIDE this vertex 
	    // should not be maximal and in case of AMBIGUOUS_INSIDE there should have 
	    // been a split. 
	    THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::fixUpDependentsList: attempting to remove a maximal vertex "
				       << myPrivateVertex.getOriginalVariable().debug().c_str()
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
		    << myPrivateVertex.getOriginalVariable().debug().c_str()
		    << " list size: " << theDepVertexPList.size()); 
	  theComputationalGraph.removeFromDependentList(myPrivateVertex);
	  continue;
	}
      }
      if (DbgLoggerManager::instance()->isSelected(DbgGroup::DATA)) { 
	if (theComputationalGraph.numOutEdgesOf(myPrivateVertex)) { 
	  DBG_MACRO(DbgGroup::DATA, "BasicBlockAlg::fixUpDependentsList: non-maximal dependent " << myPrivateVertex.getOriginalVariable().debug().c_str()); 
	}
	else { 
	  DBG_MACRO(DbgGroup::DATA, "BasicBlockAlg::fixUpDependentsList: keeping regular dependent " << myPrivateVertex.getOriginalVariable().debug().c_str()); 
	}
      } 
    }
  } // end BasicBlockAlg::fillDependentsList()

  void 
  BasicBlockAlg::algorithm_action_3_perSequence(PreaccumulationMode::PreaccumulationMode_E thisMode) { 	  
    BasicBlockAlg::SequenceHolder& aSequenceHolder(getSequenceHolder(thisMode));
    aSequenceHolder.myBasicBlockOperations.reset();
    for (SequenceHolder::SequencePList::iterator aSequencePListI=aSequenceHolder.getUniqueSequencePList().begin();
	 aSequencePListI!=aSequenceHolder.getUniqueSequencePList().end();
	 ++aSequencePListI) { // outer loop over all items in myUniqueSequencePList
      Sequence& currentSequence (**aSequencePListI);
      PrivateLinearizedComputationalGraph& theComputationalGraph=*(currentSequence.myComputationalGraph_p);
      fillIndependentsList(theComputationalGraph);
      fillDependentsList(theComputationalGraph);
      if (currentSequence.myComputationalGraph_p->numVertices()) {

	// hand off to transformation engine, which will make JAEs and a remainder graph
	runElimination(currentSequence, 
		       aSequenceHolder,
		       thisMode);

	AccumulationGraph theAccumulationGraph;
	RemainderEdge2AccumulationVertex_map theRemainderEdge2AccumulationVertexMap;

	// Populate the accumulation graph and theRemainderEdge2AccumulationVertexMap,
	buildAccumulationGraph(currentSequence,
			       theAccumulationGraph,
			       theRemainderEdge2AccumulationVertexMap);

	if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS) && theAccumulationGraph.numVertices())
	  GraphVizDisplay::show(theAccumulationGraph,
				"AccumulationGraph",
				AccumulationGraphVertexLabelWriter(theAccumulationGraph),
				AccumulationGraphEdgeLabelWriter(theAccumulationGraph),
				AccumulationGraphPropertiesWriter(theAccumulationGraph));

	generateAccumulationExpressions(currentSequence,
					theAccumulationGraph,
					theRemainderEdge2AccumulationVertexMap);

	// generate propagators from the remainder graph
	makePropagationVariables(currentSequence);
	generateRemainderGraphPropagators(currentSequence, 
					  theRemainderEdge2AccumulationVertexMap);

	//debuging print statements with results
	DBG_MACRO(DbgGroup::METRIC, "SeqeunceHolder metrics: " << aSequenceHolder.myBasicBlockOperations.debug().c_str()
				 << " for " << aSequenceHolder.debug().c_str()
				 << " in BasicBlockAlg " << this);
      } // end if LCG has vertices
    } // end iterate over sequences
  } // end BasicBlockAlg::algorithm_action_3_perSequence()

  void BasicBlockAlg::runElimination(Sequence& aSequence, 
				     SequenceHolder& aSequenceHolder,
				     PreaccumulationMode::PreaccumulationMode_E thisMode){
    PrivateLinearizedComputationalGraph& theComputationalGraph=*(aSequence.myComputationalGraph_p);
    if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {     
      GraphVizDisplay::show(theComputationalGraph,
			    "OriginalFlattenedPLCG",
			    PrivateLinearizedComputationalGraphVertexLabelWriter(theComputationalGraph),
			    PrivateLinearizedComputationalGraphEdgeLabelWriter(theComputationalGraph),
			    PrivateLinearizedComputationalGraphPropertiesWriter(theComputationalGraph));
    }

    switch (thisMode) {
    case PreaccumulationMode::MAX_GRAPH_SCARSE: { 
      // JU: there is currently only 1 choice
      xaifBoosterCrossCountryInterface::Elimination& anElimination(aSequence.addNewElimination(theComputationalGraph));
      anElimination.initAsScarceElimination();
      try {
	anElimination.eliminate();	
      }
      catch(xaifBoosterCrossCountryInterface::EliminationException e) { 
	THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::runElimination: exception thrown from within compute_partial_elimination_sequence:" 
				   << e.getReason().c_str());
      }
      aSequence.setBestResult(); 
      if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {
	GraphVizDisplay::show(anElimination.getEliminationResult().myRemainderLCG,
			      "RemainderLCG",
			      LinearizedComputationalGraphVertexLabelWriter(anElimination.getEliminationResult().myRemainderLCG),
			      LinearizedComputationalGraphEdgeLabelWriter(anElimination.getEliminationResult().myRemainderLCG),
			      LinearizedComputationalGraphPropertiesWriter(anElimination.getEliminationResult().myRemainderLCG));
      }
      DBG_MACRO(DbgGroup::METRIC, "Sequence metrics: compute_partial_elimination_sequence " 
		<< anElimination.getEliminationResult().getCounter().debug().c_str()
		<< "  number of JAE: " << anElimination.getEliminationResult().myJAEList.getGraphList().size() 
		<< " R graph edges: " << anElimination.getEliminationResult().myRemainderLCG.numEdges() 
		<< " for " << aSequenceHolder.debug().c_str() 
		<< " in BasicBlockAlg " << this);
      break;
    } // end case PreaccumulationMode::MAX_GRAPH_SCARSE
    case PreaccumulationMode::MAX_GRAPH_SCARSE_REROUTING_MIX: {
      // JU: there is currently only 1 choice
      xaifBoosterCrossCountryInterface::Elimination& anElimination(aSequence.addNewElimination(theComputationalGraph));
      anElimination.initAsScarceTransformation();
      try {
	anElimination.eliminate();	
      }
      catch(xaifBoosterCrossCountryInterface::EliminationException e) { 
	THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::runElimination: exception thrown from within compute_partial_transformation_sequence:" 
				   << e.getReason().c_str());
      }
      aSequence.setBestResult(); 
      if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {
	GraphVizDisplay::show(anElimination.getEliminationResult().myRemainderLCG,
			      "RemainderLCG",
			      LinearizedComputationalGraphVertexLabelWriter(anElimination.getEliminationResult().myRemainderLCG),
			      LinearizedComputationalGraphEdgeLabelWriter(anElimination.getEliminationResult().myRemainderLCG),
			      LinearizedComputationalGraphPropertiesWriter(anElimination.getEliminationResult().myRemainderLCG));
      }
      DBG_MACRO(DbgGroup::METRIC, "Sequence metrics: compute_partial_transformation_sequence " << anElimination.getEliminationResult().getCounter().debug().c_str()
		<< "  number of JAE: " << anElimination.getEliminationResult().myJAEList.getGraphList().size() 
		<< " R graph edges: " << anElimination.getEliminationResult().myRemainderLCG.numEdges()
		<< " number of reroutings: " << anElimination.getEliminationResult().myNumReroutings
		<< " for " << aSequenceHolder.debug().c_str() 
		<< " in BasicBlockAlg " << this);
      break;
    }
    default: { // non-scarce
      // JU: the first one is the default: 
      xaifBoosterCrossCountryInterface::Elimination& regular_Elimination (aSequence.addNewElimination(theComputationalGraph));
      regular_Elimination.initAsRegular();

      if (ourChooseAlgFlag) {
        xaifBoosterCrossCountryInterface::Elimination& lsavertex_Elimination (aSequence.addNewElimination(theComputationalGraph));
        lsavertex_Elimination.initAsLSAVertex(BasicBlockAlg::ourIterationsParameter, BasicBlockAlg::ourGamma);

        xaifBoosterCrossCountryInterface::Elimination& lsaface_Elimination (aSequence.addNewElimination(theComputationalGraph));
        lsaface_Elimination.initAsLSAFace(BasicBlockAlg::ourIterationsParameter, BasicBlockAlg::ourGamma);
      }
      for (Sequence::EliminationPList::iterator elim_i = aSequence.getEliminationPList().begin(); elim_i != aSequence.getEliminationPList().end(); ++elim_i) { 
	try {
	  (*elim_i)->eliminate();
        }
        catch(...) { 
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::runEliminationNonScarse: exception thrown from within angel while running Elimination::eliminate()"
				     << (*elim_i)->getDescription());
        }
        DBG_MACRO(DbgGroup::METRIC, "Sequence metrics: " << (*elim_i)->getDescription() << " " << (*elim_i)->getEliminationResult().getCounter().debug().c_str() << " in BasicBlockAlg " << this);
	//if (!ourChooseAlgFlag)
	//  break;
      }
      aSequence.setBestResult();

      if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {
	GraphVizDisplay::show(aSequence.getBestResult().myRemainderLCG,
			      "RemainderLCG",
			      LinearizedComputationalGraphVertexLabelWriter(aSequence.getBestResult().myRemainderLCG),
			      LinearizedComputationalGraphEdgeLabelWriter(aSequence.getBestResult().myRemainderLCG),
			      LinearizedComputationalGraphPropertiesWriter(aSequence.getBestResult().myRemainderLCG));
      }

      DBG_MACRO(DbgGroup::METRIC, "Sequence metrics: best is: " << aSequence.getBestResult().getCounter().debug().c_str() << " in BasicBlockAlg " << this);
      break;
    } // end default
    } // end switch (thisMode)

    aSequenceHolder.myBasicBlockOperations.incrementBy(aSequence.getBestResult().getCounter());
  } // end BasicBlockAlg::runElimination()

  void BasicBlockAlg::buildAccumulationGraph(const Sequence& aSequence,
					     AccumulationGraph& theAccumulationGraph,
					     RemainderEdge2AccumulationVertex_map& theRemainderEdge2AccumulationVertexMap) {
    theAccumulationGraph.clear();

    LCGe_to_ACCv_map theLCGe_to_ACCv_map;
    LCGe_to_ACCv_map::const_iterator lcgE2accVMapI;

    // First iterate through the original edges and create corresponding accumulation graph vertices 
    const PrivateLinearizedComputationalGraph& theOriginalPLCG (*aSequence.myComputationalGraph_p);
    PrivateLinearizedComputationalGraph::ConstEdgeIteratorPair aPLCGeIPair (theOriginalPLCG.edges());
    for (PrivateLinearizedComputationalGraph::ConstEdgeIterator PLCGeI (aPLCGeIPair.first), PLCGeIEnd (aPLCGeIPair.second);
	 PLCGeI != PLCGeIEnd; ++PLCGeI) {
      const PrivateLinearizedComputationalGraphEdge& currentPLCGEdge (dynamic_cast<const PrivateLinearizedComputationalGraphEdge&>(*PLCGeI));
      // handle regular edge (no parallels)
      if (!currentPLCGEdge.getParallels().size()) {
	AccumulationGraphVertex* theNewAccVertex_p (NULL);
	if (currentPLCGEdge.isDirectCopyEdge())
	  theNewAccVertex_p = new AccumulationGraphVertex;
	else
	  theNewAccVertex_p = new AccumulationGraphVertex (currentPLCGEdge.getLinearizedExpressionEdge());
	// add the new AccVertex to the graph and map this PLCG edge to it
	theAccumulationGraph.supplyAndAddVertexInstance(*theNewAccVertex_p);
	theLCGe_to_ACCv_map[&*PLCGeI] = theNewAccVertex_p;
      } // end regular edge (no parallels)
      // handle edge with parallels
      else {
	//std::cout << "There are parallel edges!" << std::endl;
	// deal with the initial edge
	AccumulationGraphVertex* theNewAccVertex_p = new AccumulationGraphVertex (currentPLCGEdge.getLinearizedExpressionEdge());
	theAccumulationGraph.supplyAndAddVertexInstance(*theNewAccVertex_p);
	// create the add vertex and connect the initial vertex to it.  also map current PLCGedge to the add vertex
	AccumulationGraphVertex* theNewAccAddVertex_p = new AccumulationGraphVertex(xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::ADD_OP);
	theAccumulationGraph.supplyAndAddVertexInstance(*theNewAccAddVertex_p);
	theAccumulationGraph.addEdge(*theNewAccVertex_p, *theNewAccAddVertex_p);
	theLCGe_to_ACCv_map[&*PLCGeI] = theNewAccAddVertex_p;
	// iterate over parallels: create the new vertex for the parallel edge and connect it up
	for (PrivateLinearizedComputationalGraphEdge::ExpressionEdgePList::const_iterator parallelI = currentPLCGEdge.getParallels().begin();
	     parallelI != currentPLCGEdge.getParallels().end(); ++parallelI) {
	  AccumulationGraphVertex* theNewParallelAccVertex_p = new AccumulationGraphVertex (**parallelI);
	  theAccumulationGraph.supplyAndAddVertexInstance(*theNewParallelAccVertex_p);
	  theAccumulationGraph.addEdge(*theNewParallelAccVertex_p, *theNewAccAddVertex_p);
	} // end iterate over parallel edges
      } // end handle edge with parallels
    } // end all edges in theOriginalPLCG

    // used for references that occur across different JAEs and for resolving remainder graph references
    JAEv_to_ACCv_map theInterJAEvertexMap;
    JAEv_to_ACCv_map::const_iterator jaeV2accVMapI;

    // iterate over all JAEs
    const xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& theJAEList (aSequence.getBestResult().myJAEList);
    for(xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList::GraphList::const_iterator JAEit = theJAEList.getGraphList().begin();
	JAEit != theJAEList.getGraphList().end(); ++JAEit) {
      const xaifBoosterCrossCountryInterface::JacobianAccumulationExpression& theCurrentJAE (*(*JAEit));
      JAEv_to_ACCv_map theIntraJAEvertexMap; // used for creating the edges that occur within this JAE

      // iterate over all vertices in this JAE
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstVertexIteratorPair aJAEvPair (theCurrentJAE.vertices());
      for (xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstVertexIterator aJAEvI(aJAEvPair.first), aJAEvIEnd(aJAEvPair.second);
	   aJAEvI != aJAEvIEnd; ++aJAEvI) {
	const xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& theCurrentJAEVertex (*aJAEvI);

	switch (theCurrentJAEVertex.getReferenceType()) {
	  case xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::INTERNAL_REF: {
	    // find the source vertex using theInterJAEvertexMap
	    if ((jaeV2accVMapI = theInterJAEvertexMap.find(&theCurrentJAEVertex.getInternalReference())) == theInterJAEvertexMap.end())
	      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::buildAccumulationGraph: could not find AccumulationGraphVertex for internal JAE vertex reference in theInterJAEvertexMap");
	    // simply map to the corresponding vertex.  No need to create a new one...
	    theIntraJAEvertexMap[&theCurrentJAEVertex] = jaeV2accVMapI->second;
	    break;
	  } // end INTERNAL_REF
	  case xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::EXTERNAL_REF: {
	    // find the corresponding AccVertex (it must have been created in the first step
	    if ((lcgE2accVMapI = theLCGe_to_ACCv_map.find(&theCurrentJAEVertex.getExternalReference())) == theLCGe_to_ACCv_map.end())
	      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::buildAccumulationGraph: could not find AccumulationGraphVertex for PLCG edge referred to by internal JAE vertex reference");
	    theIntraJAEvertexMap[&theCurrentJAEVertex] = lcgE2accVMapI->second;
	    // handle maximal JAE vertex
	    if (!theCurrentJAE.numOutEdgesOf(theCurrentJAEVertex))
	      theInterJAEvertexMap[&theCurrentJAEVertex] = lcgE2accVMapI->second;
	    break;
	  } // end EXTERNAL_REF
	  case xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::OPERATION: {
	    AccumulationGraphVertex* theNewAccVertex_p = new AccumulationGraphVertex (theCurrentJAEVertex.getOperation());
	    // create the new AccumulationGraphVertex and add it to the map
	    theAccumulationGraph.supplyAndAddVertexInstance(*theNewAccVertex_p);
	    theIntraJAEvertexMap[&theCurrentJAEVertex] = theNewAccVertex_p;
	    // add to the inter map if this is the maximal vertex
	    if (!theCurrentJAE.numOutEdgesOf(theCurrentJAEVertex))
	      theInterJAEvertexMap[&theCurrentJAEVertex] = theNewAccVertex_p;
	    break;
	  } // end OPERATION
	  default :
	    THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::buildAccumulationGraph: unknown JAE vertex type");
	    break;
	} // end switch on (*aJAEvI).getReferenceType()
      } // end iterate over JAE vertices

      // create edges resulting from connections within this JAE (INTRA)
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstEdgeIteratorPair aJAEePair (theCurrentJAE.edges());
      for (xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstEdgeIterator aJAEeI(aJAEePair.first), aJAEeIEnd(aJAEePair.second);
	   aJAEeI != aJAEeIEnd; ++aJAEeI) {
	// find the source and target of the new edge from theIntraJAEvertexMap
	if ((jaeV2accVMapI = theIntraJAEvertexMap.find(&theCurrentJAE.getSourceOf(*aJAEeI))) == theIntraJAEvertexMap.end())
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::buildAccumulationGraph: could not find AccumulationGraphVertex for internal JAE vertex reference in theInterJAEvertexMap");
	const AccumulationGraphVertex& theSourceAccVertex (*jaeV2accVMapI->second);
	if ((jaeV2accVMapI = theIntraJAEvertexMap.find(&theCurrentJAE.getTargetOf(*aJAEeI))) == theIntraJAEvertexMap.end())
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::buildAccumulationGraph: could not find AccumulationGraphVertex for internal JAE vertex reference in theInterJAEvertexMap");
	const AccumulationGraphVertex& theTargetAccVertex (*jaeV2accVMapI->second);
	// create the edge in the accumulation graph
	theAccumulationGraph.addEdge(theSourceAccVertex, theTargetAccVertex);
      } // end iterate over JAE edges

    } // end iterate over JAEs

    // Populate remainder graph map
    const EdgeCorrelationList& theEdgeCorrelationList = aSequence.getBestResult().myEdgeCorrelationList;
    for (EdgeCorrelationList::const_iterator ecI = theEdgeCorrelationList.begin(); ecI != theEdgeCorrelationList.end(); ecI++) {
      AccumulationGraphVertex* theAccVertex_p (NULL);
      if ((*ecI).myType == EdgeCorrelationEntry::LCG_EDGE) {
	// find the corresponding AccVertex in thePLCGe_to_ACCv_map
	if ((lcgE2accVMapI = theLCGe_to_ACCv_map.find((*ecI).myEliminationReference.myOriginalEdge_p)) == theLCGe_to_ACCv_map.end())
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::buildAccumulationGraph: could not find AccumulationGraphVertex for external JAE vertex reference (to original PLCG edge) in thePLCGe_to_ACCv_map");
	theAccVertex_p = lcgE2accVMapI->second;
      } // end LCG_EDGE ref
      else if ((*ecI).myType == EdgeCorrelationEntry::JAE_VERT) {
	// find the corresponding AccVertex in theInterJAEvertexMap
	if ((jaeV2accVMapI = theInterJAEvertexMap.find((*ecI).myEliminationReference.myJAEVertex_p)) == theInterJAEvertexMap.end())
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::buildAccumulationGraph: could not find AccumulationGraphVertex for internal JAE vertex reference in theInterJAEvertexMap");
	theAccVertex_p = jaeV2accVMapI->second;
      } // end JAE_VERT ref
      else THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::buildAccumulationGraph: EdgeCorrelationEntry has invalid type");

      theRemainderEdge2AccumulationVertexMap[(*ecI).myRemainderGraphEdge_p] = theAccVertex_p;
      theAccVertex_p->setRemainderGraphEdge(*(*ecI).myRemainderGraphEdge_p);
    } // end iterate over theEdgeCorrelationList

  } // end BasicBlockAlg::buildAccumulationGraph()

  void BasicBlockAlg::generateAccumulationExpressions(Sequence& aSequence,
						      AccumulationGraph& theAccumulationGraph,
						      const RemainderEdge2AccumulationVertex_map& theRemainderEdge2AccumulationVertexMap) {
    //traverse graph bottom up
    theAccumulationGraph.initVisit();
    bool done = false; 
    while (!done) {
      done = true;
      //iterate over all Accumulation vertices
      AccumulationGraph::VertexIteratorPair aAccVitPair (theAccumulationGraph.vertices());
      AccumulationGraph::VertexIterator aAccVit (aAccVitPair.first), aAccVitEnd (aAccVitPair.second);
      for(; aAccVit != aAccVitEnd; ++aAccVit) {
	AccumulationGraphVertex& currentAccV = *aAccVit;

	// skip visited and leaves
	if (currentAccV.wasVisited()) continue;
	if (!theAccumulationGraph.numInEdgesOf(currentAccV)) {
	  currentAccV.setVisited();
	  continue;
	}

	// ensure there are exactly two predecessors and check whether both predecessors have been visited
	AccumulationGraph::InEdgeIteratorPair iei_pair (theAccumulationGraph.getInEdgesOf(currentAccV));
	AccumulationGraph::InEdgeIterator iei (iei_pair.first), ie_end (iei_pair.second);
	int numPreds = 0;
	for (; iei != ie_end; ++iei) {
	  numPreds++;
	  if (!theAccumulationGraph.getSourceOf(*iei).wasVisited())
	    break;
	}
	if (iei != ie_end) {
	  done = false; // we are not done yet, because there is an unvisited predecessor
	  continue;
	}
	if (numPreds != 2) THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::propagateAccumulationGraphPDKs: non-leaf acc vertex doesn't have exactly two preds");

	// visit this vertex (at this point we know that all predecessors have been visited
	currentAccV.setVisited();

	// determine the PDK for this vertex and compute its value unless it's NONLINEAR
	evaluateAccVertex(currentAccV, theAccumulationGraph);
	// skip this vertex if its value has been determined (either pre-computed constant or LHSVariable)
	if (currentAccV.getPartialDerivativeKind() != PartialDerivativeKind::NONLINEAR
	 || currentAccV.hasLHSVariable())
	  continue;

	// we only generate an assignment for vertices that have more than one outedge (intermediate value) or correspond to a remainder graph edge
	if (theAccumulationGraph.numOutEdgesOf(currentAccV) > 1
	 || currentAccV.hasRemainderGraphEdge()) {
	  Assignment& theNewAssignment = aSequence.appendEndAssignment();
	  theNewAssignment.setId(makeUniqueId());
	  Scope& theGlobalScope(ConceptuallyStaticInstances::instance()->getCallGraph().getScopeTree().getGlobalScope());
	  VariableSymbolReference* theVariableSymbolReference_p =
	   new VariableSymbolReference(theGlobalScope.getSymbolTable().addUniqueAuxSymbol(SymbolKind::VARIABLE,
											  SymbolType::REAL_STYPE,
											  SymbolShape::SCALAR,
											  false),
				       theGlobalScope);
	  theVariableSymbolReference_p->setId("1");
	  theVariableSymbolReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::generateAccumulationExpressions::JAE_LHS");
	  theNewAssignment.getLHS().supplyAndAddVertexInstance(*theVariableSymbolReference_p);
	  theNewAssignment.getLHS().getAliasMapKey().setTemporary();
	  theNewAssignment.getLHS().getDuUdMapKey().setTemporary();
	  buildAccumulationAssignmentRecursively(theAccumulationGraph,
						 theNewAssignment,
						 currentAccV);
	  currentAccV.setLHSVariable(theNewAssignment.getLHS());
	} // end if assignment needs to be created
      } // end iterate over all vertices
    } // end while (!done)
    theAccumulationGraph.finishVisit();
  } // end BasicBlockAlg::generateAccumulationExpressions()

  void BasicBlockAlg::evaluateAccVertex(AccumulationGraphVertex& theAccVertex,
					const AccumulationGraph& theAccumulationGraph) {
    // get the two predecessors
    AccumulationGraph::ConstInEdgeIteratorPair iei_pair (theAccumulationGraph.getInEdgesOf(theAccVertex));
    AccumulationGraph::ConstInEdgeIterator iei (iei_pair.first);
    const AccumulationGraphVertex& firstPredV (theAccumulationGraph.getSourceOf(*iei));
    ++iei;
    const AccumulationGraphVertex& secondPredV (theAccumulationGraph.getSourceOf(*iei));

    // ensure the predecessors have reasonable PDKs
    if (firstPredV.getPartialDerivativeKind() == PartialDerivativeKind::NOT_SET
     || secondPredV.getPartialDerivativeKind() == PartialDerivativeKind::NOT_SET) {
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::evaluateAccVertex: predecessor PartialDerivativeKind is NOT_SET"); }

    // ADDITION
    if (theAccVertex.getOperation() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::ADD_OP) {
      // a vertex with a nonlinear contribution will be nonlinear (value cannot be pre-computed)
      if (firstPredV.getPartialDerivativeKind() == PartialDerivativeKind::NONLINEAR
       || secondPredV.getPartialDerivativeKind() == PartialDerivativeKind::NONLINEAR) {
	// set the PDK
	theAccVertex.setPartialDerivativeKind(PartialDerivativeKind::NONLINEAR);

	// determine whether a LHS variable can be determined for this vertex
	// this will be the case iff one or the other has a PDK of zero
	if (firstPredV.getPartialDerivativeKind() == PartialDerivativeKind::PASSIVE) { // (0 + x)
	  if (secondPredV.hasLHSVariable())
	    theAccVertex.setLHSVariable(secondPredV.getLHSVariable());
	} // end first PDK is PASSIVE
	else if (secondPredV.getPartialDerivativeKind() == PartialDerivativeKind::PASSIVE) { // (x + 0)
	  if (firstPredV.hasLHSVariable())
	    theAccVertex.setLHSVariable(firstPredV.getLHSVariable());
	} // end second PDK is PASSIVE
      } // end result is NONLINEAR
      else { // the value can be computed
	switch (firstPredV.getPartialDerivativeKind()) {
	  case PartialDerivativeKind::PASSIVE: {
	    switch (secondPredV.getPartialDerivativeKind()) {
	      case PartialDerivativeKind::PASSIVE: {			// (0 + 0)
		theAccVertex.setPartialDerivativeKind(PartialDerivativeKind::PASSIVE);
		DBG_MACRO(DbgGroup::WARNING, "BasicBlockAlg::evaluateAccVertex: This vertex evaluates to have PASSIVE PDK (0 + 0)");
		break;
	      } // end 0 + 0
	      case PartialDerivativeKind::LINEAR_ONE:			// (0 + 1)
		theAccVertex.setPartialDerivativeKind(PartialDerivativeKind::LINEAR_ONE);
		break;
	      case PartialDerivativeKind::LINEAR_MINUS_ONE:		// (0 + -1)
		theAccVertex.setPartialDerivativeKind(PartialDerivativeKind::LINEAR_MINUS_ONE);
		break;
	      case PartialDerivativeKind::LINEAR: {			// (0 + c)
		theAccVertex.setPartialDerivativeKind(PartialDerivativeKind::LINEAR);
		theAccVertex.setValue(secondPredV.getValue());
		break;
	      }
	      default:
		THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::evaluateAccVertex: predecessor has invalid PDK");
		break;
	    } // end switch (secondPDK) {
	    break;
	  } // end case firstPDK == PASSIVE
	  case PartialDerivativeKind::LINEAR_ONE: {
	    switch (secondPredV.getPartialDerivativeKind()) {
	      case PartialDerivativeKind::PASSIVE:			// (1 + 0)
		theAccVertex.setPartialDerivativeKind(PartialDerivativeKind::LINEAR_ONE);
		break;
	      case PartialDerivativeKind::LINEAR_ONE: {			// (1 + 1)
		theAccVertex.setPartialDerivativeKind(PartialDerivativeKind::LINEAR);
		theAccVertex.setValue(2);
		break;
	      }
	      case PartialDerivativeKind::LINEAR_MINUS_ONE: {		// (1 + -1)
		theAccVertex.setPartialDerivativeKind(PartialDerivativeKind::PASSIVE);
		DBG_MACRO(DbgGroup::WARNING, "BasicBlockAlg::evaluateAccVertex: This vertex evaluates to have PASSIVE PDK (1 + -1)");
		break;
	      } // end (1 + -1)
	      case PartialDerivativeKind::LINEAR: {			// (1 + c)
		theAccVertex.setPartialDerivativeKind(PartialDerivativeKind::LINEAR);
		theAccVertex.setValue(1 + secondPredV.getValue());
		break;
	      }
	      default:
		THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::evaluateAccVertex: predecessor has invalid PDK");
		break;
	    } // end switch (secondPDK) {
	    break;
	  } // end case firstPDK == LINEAR_ONE
	  case PartialDerivativeKind::LINEAR_MINUS_ONE: {
	    switch (secondPredV.getPartialDerivativeKind()) {
	      case PartialDerivativeKind::PASSIVE:			// (-1 + 0)
		theAccVertex.setPartialDerivativeKind(PartialDerivativeKind::LINEAR_MINUS_ONE);
		break;
	      case PartialDerivativeKind::LINEAR_ONE: {			// (-1 + 1)
		theAccVertex.setPartialDerivativeKind(PartialDerivativeKind::PASSIVE);
		DBG_MACRO(DbgGroup::WARNING, "BasicBlockAlg::evaluateAccVertex: This vertex evaluates to have PASSIVE PDK (-1 + 1)");
		break;
	      } // end (-1 + 1)
	      case PartialDerivativeKind::LINEAR_MINUS_ONE: {		// (-1 + -1)
		theAccVertex.setPartialDerivativeKind(PartialDerivativeKind::LINEAR);
		theAccVertex.setValue(-2);
		break;
	      }
	      case PartialDerivativeKind::LINEAR: {			// (-1 + c)
		theAccVertex.setPartialDerivativeKind(PartialDerivativeKind::LINEAR);
		theAccVertex.setValue(-1 + secondPredV.getValue());
		break;
	      }
	      default:
		THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::evaluateAccVertex: predecessor has invalid PDK");
		break;
	    } // end switch (secondPDK) {
	    break;
	  } // end case firstPDK == LINEAR_MINUS_ONE
	  case PartialDerivativeKind::LINEAR: {
	    theAccVertex.setPartialDerivativeKind(PartialDerivativeKind::LINEAR);
	    switch (secondPredV.getPartialDerivativeKind()) {
	      case PartialDerivativeKind::PASSIVE:			// (c + 0)
		theAccVertex.setValue(firstPredV.getValue());
		break;
	      case PartialDerivativeKind::LINEAR_ONE:			// (c + 1)
		theAccVertex.setValue(firstPredV.getValue() + 1);
		break;
	      case PartialDerivativeKind::LINEAR_MINUS_ONE:		// (c + -1)
		theAccVertex.setValue(firstPredV.getValue() + -1);
		break;
	      case PartialDerivativeKind::LINEAR:			// (c + c)
		theAccVertex.setValue(firstPredV.getValue() + secondPredV.getValue());
		break;
	      default:
		THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::evaluateAccVertex: predecessor has invalid PDK");
		break;
	    } // end switch (secondPDK) {
	    break;
	  } // end case firstPDK == LINEAR
	  default:
	    THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::evaluateAccVertex: predecessor has invalid PDK");
	    break;
	} // end switch (firstPDK)
      } // end if the value can be computed (not nonlinear)
    } // end ADDITION

    // MULTIPLICATION
    else if (theAccVertex.getOperation() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::MULT_OP) {
      // The result is PASSIVE if either PDK is PASSIVE
      if (firstPredV.getPartialDerivativeKind() == PartialDerivativeKind::PASSIVE
       || secondPredV.getPartialDerivativeKind() == PartialDerivativeKind::PASSIVE) {
	theAccVertex.setPartialDerivativeKind(PartialDerivativeKind::PASSIVE);
	DBG_MACRO(DbgGroup::WARNING, "BasicBlockAlg::evaluateAccVertex: This vertex evaluates to have PASSIVE PDK (0 * x) or (x * 0)");
      } // end result is PASSIVE
      // neither is zero and at least one is nonlinear
      else if (firstPredV.getPartialDerivativeKind() == PartialDerivativeKind::NONLINEAR
	    || secondPredV.getPartialDerivativeKind() == PartialDerivativeKind::NONLINEAR) {
	theAccVertex.setPartialDerivativeKind(PartialDerivativeKind::NONLINEAR);
	// determine whether a LHS variable can be determined for this vertex
	// this will be the case iff one or the other has a PDK of LINEAR_ONE
	if (firstPredV.getPartialDerivativeKind() == PartialDerivativeKind::LINEAR_ONE) {
	  if (secondPredV.hasLHSVariable())
	    theAccVertex.setLHSVariable(secondPredV.getLHSVariable());
	} // end first PDK is LINEAR_ONE
	else if (secondPredV.getPartialDerivativeKind() == PartialDerivativeKind::LINEAR_ONE) {
	  if (firstPredV.hasLHSVariable())
	    theAccVertex.setLHSVariable(firstPredV.getLHSVariable());
	} // end second PDK is LINEAR_ONE
      } // end result is NONLINEAR
      else { // result can be computed (is nonzero and not nonlinear)
	switch (firstPredV.getPartialDerivativeKind()) {
	  case PartialDerivativeKind::LINEAR_ONE: {
	    switch (secondPredV.getPartialDerivativeKind()) {
	      case PartialDerivativeKind::LINEAR_ONE:			// (1 * 1)
		theAccVertex.setPartialDerivativeKind(PartialDerivativeKind::LINEAR_ONE);
		break;
	      case PartialDerivativeKind::LINEAR_MINUS_ONE:		// (1 * -1)
		theAccVertex.setPartialDerivativeKind(PartialDerivativeKind::LINEAR_MINUS_ONE);
		break;
	      case PartialDerivativeKind::LINEAR: {			// (1 * c)
		theAccVertex.setPartialDerivativeKind(PartialDerivativeKind::LINEAR);
		theAccVertex.setValue(secondPredV.getValue());
		break;
	      }
	      default:
		THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::evaluateAccVertex: predecessor has invalid PDK");
		break;
	    } // end switch (secondPDK) {
	    break;
	  } // end case firstPDK == LINEAR_ONE
	  case PartialDerivativeKind::LINEAR_MINUS_ONE: {
	    switch (secondPredV.getPartialDerivativeKind()) {
	      case PartialDerivativeKind::LINEAR_ONE:			// (-1 * 1)
		theAccVertex.setPartialDerivativeKind(PartialDerivativeKind::LINEAR_MINUS_ONE);
		break;
	      case PartialDerivativeKind::LINEAR_MINUS_ONE:		// (-1 * -1)
		theAccVertex.setPartialDerivativeKind(PartialDerivativeKind::LINEAR_ONE);
		break;
	      case PartialDerivativeKind::LINEAR: {			// (-1 * c)
		theAccVertex.setPartialDerivativeKind(PartialDerivativeKind::LINEAR);
		theAccVertex.setValue(-1 * secondPredV.getValue());
		break;
	      }
	      default:
		THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::evaluateAccVertex: predecessor has invalid PDK");
		break;
	    } // end switch (secondPDK) {
	    break;
	  } // end case firstPDK == LINEAR_MINUS_ONE
	  case PartialDerivativeKind::LINEAR: {
	    theAccVertex.setPartialDerivativeKind(PartialDerivativeKind::LINEAR);
	    switch (secondPredV.getPartialDerivativeKind()) {
	      case PartialDerivativeKind::LINEAR_ONE:			// (c * 1)
		theAccVertex.setValue(firstPredV.getValue());
		break;
	      case PartialDerivativeKind::LINEAR_MINUS_ONE:		// (c * -1)
		theAccVertex.setValue(firstPredV.getValue() * -1);
		break;
	      case PartialDerivativeKind::LINEAR:			// (c * c)
		theAccVertex.setValue(firstPredV.getValue() * secondPredV.getValue());
		break;
	      default:
		THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::evaluateAccVertex: predecessor has invalid PDK");
		break;
	    } // end switch (secondPDK) {
	    break;
	  } // end case firstPDK == LINEAR
	  default:
	    THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::evaluateAccVertex: predecessor has invalid PDK");
	    break;
	} // end switch (firstPDK)
      } // end if result is nonzero
    } // end MULTIPLICATION

    else THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::evaluateAccVertex: Accumulation vertex has unknown operation (neither addition nor multiplication");
  } // end BasicBlockAlg::evaluateAccVertex()

  const ExpressionVertex& BasicBlockAlg::buildAccumulationAssignmentRecursively(const AccumulationGraph& theAccumulationGraph,
										Assignment& theNewAssignment,
										const AccumulationGraphVertex& theAccVertex) {
    // vertex has LHS variable
    if (theAccVertex.hasLHSVariable()) {
      Argument* theNewArgument_p = new Argument();
      theAccVertex.getLHSVariable().copyMyselfInto(theNewArgument_p->getVariable());
      theNewArgument_p->setId(theNewAssignment.getRHS().getNextVertexId());
      theNewAssignment.getRHS().supplyAndAddVertexInstance(*theNewArgument_p);
      return *theNewArgument_p;
    }

    // vertex has a pre-computed value
    else if (theAccVertex.getPartialDerivativeKind() != PartialDerivativeKind::NONLINEAR) {
      Constant* theNewConstant_p (NULL);
      switch (theAccVertex.getPartialDerivativeKind()) {
	case PartialDerivativeKind::PASSIVE: {
	  theNewConstant_p = new Constant(SymbolType::INTEGER_STYPE, false);
	  theNewConstant_p->setint(0);
	  break;
	} // end case PASSIVE
	case PartialDerivativeKind::LINEAR_ONE: {
	  theNewConstant_p = new Constant(SymbolType::INTEGER_STYPE, false);
	  theNewConstant_p->setint(1);
	  break;
	} // end case LINEAR_ONE
	case PartialDerivativeKind::LINEAR_MINUS_ONE: {
	  theNewConstant_p = new Constant(SymbolType::INTEGER_STYPE, false);
	  theNewConstant_p->setint(-1);
	  break;
	} // end case LINEAR_MINUS_ONE
	case PartialDerivativeKind::LINEAR: {
	  theNewConstant_p = new Constant(SymbolType::REAL_STYPE, false);
	  theNewConstant_p->setdouble(theAccVertex.getValue());
	  break;
	} // end case LINEAR
	default:
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::buildAccumulationAssignmentRecursively: predecessor with pre-computed value has unexpected PDK ("
				     << PartialDerivativeKind::toString(theAccVertex.getPartialDerivativeKind())
				     << ")");
	  break;
      } // end switch (pred PDK)
      theNewConstant_p->setId(theNewAssignment.getRHS().getNextVertexId());
      theNewAssignment.getRHS().supplyAndAddVertexInstance(*theNewConstant_p);
      return *theNewConstant_p;
    } // end pred with pre-computed value

    AccumulationGraph::ConstInEdgeIteratorPair iei_pair (theAccumulationGraph.getInEdgesOf(theAccVertex));

    // TEST FOR SHORT-CIRCUIT: extract predecessors 
    AccumulationGraph::ConstInEdgeIterator inEdge_i (iei_pair.first);
    const AccumulationGraphVertex& firstPred (theAccumulationGraph.getSourceOf(*inEdge_i));
    ++inEdge_i;
    const AccumulationGraphVertex& secondPred (theAccumulationGraph.getSourceOf(*inEdge_i));

    // MULTIPLICATION: we know that if one is LINEAR_ONE, the other must be NONLINEAR (or we would have a value for this vertex)
    if (theAccVertex.getOperation() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::MULT_OP) {
      // firstPred is LINEAR_ONE: short-circuit call on secondPred
      if (firstPred.getPartialDerivativeKind() == PartialDerivativeKind::LINEAR_ONE)
	return buildAccumulationAssignmentRecursively(theAccumulationGraph,
						      theNewAssignment,
						      secondPred);
      // secondPred is LINEAR_ONE: short-circuit call on firstPred
      else if (secondPred.getPartialDerivativeKind() == PartialDerivativeKind::LINEAR_ONE)
	return buildAccumulationAssignmentRecursively(theAccumulationGraph,
						      theNewAssignment,
						      firstPred);
    } // end multiplication short-circuit check

    // ADDITION: we know that if one is PASSIVE, the other must be NONLINEAR (or we would have a value for this vertex)
    else if (theAccVertex.getOperation() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::ADD_OP) {
      // firstPred is PASSIVE: short-circuit call on secondPred
      if (firstPred.getPartialDerivativeKind() == PartialDerivativeKind::PASSIVE)
	return buildAccumulationAssignmentRecursively(theAccumulationGraph,
						      theNewAssignment,
						      secondPred);
      // secondPred is PASSIVE: short-circuit call on firstPred
      else if (secondPred.getPartialDerivativeKind() == PartialDerivativeKind::PASSIVE)
	return buildAccumulationAssignmentRecursively(theAccumulationGraph,
						      theNewAssignment,
						      firstPred);
    } // end addition short-circuit check
    else THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::buildAccumulationAssignmentRecursively: Trying to build an assignment on a vertex that is neither add nor mult");

    // we can't short-circuit, so call recursively on BOTH predecessors
    // At this point, we have no pre-computed value and no LHSVariable, so we must be an operation 
    Intrinsic* theNewIntrinsic_p (NULL);
    if (theAccVertex.getOperation() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::MULT_OP)
      theNewIntrinsic_p = new Intrinsic ("mul_scal_scal");
    else if (theAccVertex.getOperation() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::ADD_OP)
      theNewIntrinsic_p = new Intrinsic ("add_scal_scal");
    theNewIntrinsic_p->setId(theNewAssignment.getRHS().getNextVertexId());
    theNewAssignment.getRHS().supplyAndAddVertexInstance(*theNewIntrinsic_p);

    // iterate over all predecessors (operands) and add them as children to this operation
    unsigned int position = 1;
    for (AccumulationGraph::ConstInEdgeIterator iei (iei_pair.first), ie_end (iei_pair.second); iei != ie_end; ++iei) {
      // recursive call
      const ExpressionVertex& thePredExpressionVertex = buildAccumulationAssignmentRecursively(theAccumulationGraph,
											       theNewAssignment,
											       theAccumulationGraph.getSourceOf(*iei));
      ExpressionEdge& theNewExpressionEdge (theNewAssignment.getRHS().addEdge(thePredExpressionVertex,
									      *theNewIntrinsic_p));
      theNewExpressionEdge.setId(theNewAssignment.getRHS().getNextEdgeId());
      theNewExpressionEdge.setPosition(position++);
    } // end iterate over predecessors
    return *theNewIntrinsic_p;
  } // end BasicBlockAlg::buildAccumulationAssignmentRecursively()

  void BasicBlockAlg::makePropagationVariables(Sequence& aSequence) {
    const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& theRemainderLCG (aSequence.getBestResult().myRemainderLCG);
    const AliasMap& theAliasMap(ConceptuallyStaticInstances::instance()->getCallGraph().getAliasMap());

    // Traverse remainder graph in topological order, checking each edge for aliasing conflicts between the source and the target
    theRemainderLCG.initVisit();
    bool done = false; 
    while (!done) {
      done = true;
      //iterate over all vertices
      xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstVertexIteratorPair aVertexIP (theRemainderLCG.vertices());
      xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstVertexIterator anLCGVertI (aVertexIP.first), anLCGvertEndI (aVertexIP.second);
      for(; anLCGVertI != anLCGvertEndI; ++anLCGVertI) {
	if ((*anLCGVertI).wasVisited()) continue;
	// check whether all predecessors have been visited
	xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstInEdgeIteratorPair iei_pair (theRemainderLCG.getInEdgesOf(*anLCGVertI));
	xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstInEdgeIterator iei (iei_pair.first), ie_end (iei_pair.second);
	for (; iei != ie_end; ++iei)
	  if (!theRemainderLCG.getSourceOf(*iei).wasVisited()) break;
	if (iei != ie_end) // skip this vertex if a predecessor hasn't been visited
	  done = false;
	else { // all preds visited, so visit this vertex
	  (*anLCGVertI).setVisited();
	  const PrivateLinearizedComputationalGraphVertex& theOriginalSourceV = aSequence.getBestElimination().rVertex2oVertex(*anLCGVertI);
	  xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstOutEdgeIteratorPair oei_pair (theRemainderLCG.getOutEdgesOf(*anLCGVertI));
	  for (xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstOutEdgeIterator oei (oei_pair.first), oe_end (oei_pair.second); oei != oe_end; ++oei) {
	    const PrivateLinearizedComputationalGraphVertex& theOriginalTargetV = aSequence.getBestElimination().rVertex2oVertex(theRemainderLCG.getTargetOf(*oei));
	    if (theOriginalSourceV.hasOriginalVariable() && theOriginalTargetV.hasOriginalVariable()
	     && theAliasMap.mayAlias(theOriginalSourceV.getOriginalVariable().getAliasMapKey(),
				     theOriginalTargetV.getOriginalVariable().getAliasMapKey())) {
	      theOriginalSourceV.createOrReplacePropagationVariable();
	      // set the deriv of the new prop variable to that of the original variable
	      aSequence.myDerivativePropagator.addSetDerivToEntryPList(theOriginalSourceV.getPropagationVariable(),
								       theOriginalSourceV.getOriginalVariable());
	      break; // no need to continue with this vertex once the propagation vertex has been replaced
            } // end if possible alias conflict
	  } // end all successors
	} // end visit this vertex
      } // end all vertices
    } // end while (!done)
    theRemainderLCG.finishVisit();
  } // end BasicBlockAlg::makePropagationVariables()

  void BasicBlockAlg::generateRemainderGraphPropagators(Sequence& aSequence, 
							const RemainderEdge2AccumulationVertex_map& theRemainderEdge2AccumulationVertexMap) { 
    const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& theRemainderGraph (aSequence.getBestResult().myRemainderLCG);
    aSequence.getBestResult().myRemainderLCG.initVisit();
    bool done = false;
    while(!done) {
      done = true;
      xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstVertexIteratorPair aVertexIP(theRemainderGraph.vertices());
      for(xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstVertexIterator anLCGVertI(aVertexIP.first),anLCGvertEndI(aVertexIP.second);
	  anLCGVertI != anLCGvertEndI; ++anLCGVertI) {
	const LinearizedComputationalGraphVertex& theRemainderTargetV = *anLCGVertI;
	// skip visited vertices
	if (theRemainderTargetV.wasVisited()) continue;
	// skip minimal vertices
	if (!theRemainderGraph.numInEdgesOf(theRemainderTargetV)) {
	  theRemainderTargetV.setVisited();
	  continue;
	}
	// check whether predecessors have been visited
	xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstInEdgeIteratorPair inEdgeIP (theRemainderGraph.getInEdgesOf(theRemainderTargetV));
	xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstInEdgeIterator iei (inEdgeIP.first), ie_end (inEdgeIP.second);
	for (; iei != ie_end; ++iei) // break on unvisited predecessor
	  if (!theRemainderGraph.getSourceOf(*iei).wasVisited()) break;
	if (iei != ie_end) // skip this vertex if a predecessor hasn't been visited
	  done = false;
	else { // all preds visited, so visit this vertex
	  theRemainderTargetV.setVisited();
	  const PrivateLinearizedComputationalGraphVertex& theOriginalTargetV (aSequence.getBestElimination().rVertex2oVertex(theRemainderTargetV));
	  bool foundNonzeroFactor = false;
	  //reset inedge iterators and make propagator for every inedge
	  xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstInEdgeIterator iei (inEdgeIP.first), ie_end (inEdgeIP.second);
	  for (; iei != ie_end; ++iei) {
	    // Find the AccumulationGraphVertex that corresponds to this RemainderGraphEdge
	    RemainderEdge2AccumulationVertex_map::const_iterator map_it;
	    if ((map_it = theRemainderEdge2AccumulationVertexMap.find(&*iei)) == theRemainderEdge2AccumulationVertexMap.end())
	      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::generateRemainderGraphPropagators: could not find AccumulationGraphVertex for RemaindergraphEdge in theRemainderEdge2AccumulationVertexMap");
	    const AccumulationGraphVertex& theAccVertex (*map_it->second);
            const PrivateLinearizedComputationalGraphVertex& theOriginalSourceV (aSequence.getBestElimination().rVertex2oVertex(theRemainderGraph.getSourceOf(*iei)));

	    // check whether the factor is PASSIVE
	    if (theAccVertex.getPartialDerivativeKind() == PartialDerivativeKind::PASSIVE) continue;
	    else foundNonzeroFactor = true;

	    // we can do a setderiv iff the factor is unit and theRemainderTargetV has only one inedge
	    if (theAccVertex.getPartialDerivativeKind() == PartialDerivativeKind::LINEAR_ONE
	     && theRemainderGraph.numInEdgesOf(theRemainderTargetV) == 1)
	      aSequence.myDerivativePropagator.addSetDerivToEntryPList(theOriginalTargetV.getPropagationVariable(),
								       theOriginalSourceV.getPropagationVariable());
	    else // we'll do a sax/saxpy
	      propagateOnRemainderGraphEdge(theOriginalSourceV,
					    theOriginalTargetV,
					    aSequence,
					    theAccVertex);
	  } // end all inedges
	  if (!foundNonzeroFactor)
	    aSequence.myDerivativePropagator.addZeroDerivToEntryPList(theOriginalTargetV.getPropagationVariable());
	} // end visit
      } // end iterate over all vertices
    } // end while(!done)
    aSequence.getBestResult().myRemainderLCG.finishVisit();
  } // end BasicBlockAlg::generateRemainderGraphPropagators()

  void BasicBlockAlg::propagateOnRemainderGraphEdge(const PrivateLinearizedComputationalGraphVertex& theOriginalSourceV,
						    const PrivateLinearizedComputationalGraphVertex& theOriginalTargetV,
						    Sequence& aSequence,
						    const AccumulationGraphVertex& theAccVertex) {
    xaifBoosterDerivativePropagator::DerivativePropagatorSaxpy* theSaxpy_p (0);

    // make a new SAX if there's no SAX yet or if there is one and we can't add to it
    if (!theOriginalTargetV.hasSAX() || !doesPermitNarySax()) {
      switch (theAccVertex.getPartialDerivativeKind()) {
	case PartialDerivativeKind::LINEAR_ONE: {
	  Constant theTempConstant (SymbolType::INTEGER_STYPE, false);
	  theTempConstant.setId(1);
	  theTempConstant.setint(1);
	  theSaxpy_p = &(aSequence.myDerivativePropagator.addSaxpyToEntryPList(theTempConstant,
									       theOriginalSourceV.getPropagationVariable(),
									       theOriginalTargetV.getPropagationVariable()));
	  break;
	} // end case LINEAR_ONE
	case PartialDerivativeKind::LINEAR_MINUS_ONE: {
	  Constant theTempConstant (SymbolType::INTEGER_STYPE, false);
	  theTempConstant.setId(1);
	  theTempConstant.setint(-1);
	  theSaxpy_p = &(aSequence.myDerivativePropagator.addSaxpyToEntryPList(theTempConstant,
									       theOriginalSourceV.getPropagationVariable(),
									       theOriginalTargetV.getPropagationVariable()));
	  break;
	} // end case LINEAR_MINUS_ONE
	case PartialDerivativeKind::LINEAR: {
	  Constant theTempConstant (SymbolType::REAL_STYPE, false);
	  theTempConstant.setId(1);
	  theTempConstant.setdouble(theAccVertex.getValue());
	  theSaxpy_p = &(aSequence.myDerivativePropagator.addSaxpyToEntryPList(theTempConstant,
									       theOriginalSourceV.getPropagationVariable(),
									       theOriginalTargetV.getPropagationVariable()));
	  break;
	} // end case LINEAR
	case PartialDerivativeKind::NONLINEAR: {
	  theSaxpy_p = &(aSequence.myDerivativePropagator.addSaxpyToEntryPList(theAccVertex.getLHSVariable(),
									       theOriginalSourceV.getPropagationVariable(),
									       theOriginalTargetV.getPropagationVariable()));
	  break;
	} // end case NONLINEAR
	default:
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::generateRemainderGraphPropagators: invalid PDK ("
				  << PartialDerivativeKind::toString(theAccVertex.getPartialDerivativeKind())
				  << ") for saxpy factor");
	  break;
      } // end switch on PDK
    } // end no SAX yet or if there is one and we can't add to it
    else { // there is already a SAX and we allow nary SAX
      theSaxpy_p = &theOriginalTargetV.getSAX();
      switch (theAccVertex.getPartialDerivativeKind()) {
	case PartialDerivativeKind::LINEAR_ONE: {
	  Constant theTempConstant (SymbolType::INTEGER_STYPE, false);
	  theTempConstant.setId(1);
	  theTempConstant.setint(1);
	  theSaxpy_p->addAX(theTempConstant,
			    theOriginalSourceV.getPropagationVariable());
	  break;
	} // end case LINEAR_ONE
	case PartialDerivativeKind::LINEAR_MINUS_ONE: {
	  Constant theTempConstant (SymbolType::INTEGER_STYPE, false);
	  theTempConstant.setId(1);
	  theTempConstant.setint(-1);
	  theSaxpy_p->addAX(theTempConstant,
			    theOriginalSourceV.getPropagationVariable());
	  break;
	} // end case LINEAR_MINUS_ONE
	case PartialDerivativeKind::LINEAR: {
	  Constant theTempConstant (SymbolType::REAL_STYPE, false);
	  theTempConstant.setId(1);
	  theTempConstant.setdouble(theAccVertex.getValue());
	  theSaxpy_p->addAX(theTempConstant,
			    theOriginalSourceV.getPropagationVariable());
	  break;
	} // end case LINEAR
	case PartialDerivativeKind::NONLINEAR: {
	  theSaxpy_p->addAX(theAccVertex.getLHSVariable(),
			    theOriginalSourceV.getPropagationVariable());
	  break;
	} // end case NONLINEAR
	default:
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::generateRemainderGraphPropagators: invalid PDK ("
				  << PartialDerivativeKind::toString(theAccVertex.getPartialDerivativeKind())
				  << ") for saxpy factor");
	  break;
      } // end switch on PDK
    } // end there is already a SAX and we allow nary SAX

    // if this SAX is the first one, set it as SAX (as opposed to SAXPY)
    if (!theOriginalTargetV.hasSAX()) { 
      theSaxpy_p->useAsSax();
      theOriginalTargetV.setSAX(*theSaxpy_p);
    }
  } // end BasicBlockAlg::propagateOnRemainderGraphEdge()

  void BasicBlockAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  PrivateLinearizedComputationalGraph& 
  BasicBlockAlg::getComputationalGraph(const Assignment& theAssignment,
				       BasicBlockAlg::SequenceHolder& aSequenceHolder) { 
    DBG_MACRO(DbgGroup::CALLSTACK, "BasicBlockAlg::SequenceHolder::getComputationalGraph entering with "
	      << debug().c_str());
    Sequence* theSequence_p=0;
    if(aSequenceHolder.getBasicBlockElementSequencePPairList().empty()) { 
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

  const StatementIdList& BasicBlockAlg::getAssignmentIdList()const { 
    return myAssignmentIdList;
  } 

  void BasicBlockAlg::addMyselfToAssignmentIdList(const Assignment& anAssignment, const SequenceHolder& aSequenceHolder) {
    if (isRepresentativeSequenceHolder(aSequenceHolder))
      myAssignmentIdList.push_back(anAssignment.getId());
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
    case PreaccumulationMode::MAX_GRAPH_SCARSE_REROUTING_MIX: 
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

} // end namespace xaifBoosterBasicBlockPreaccumulation
 
