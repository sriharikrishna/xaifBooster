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
#include "xaifBooster/utils/inc/Counter.hpp" 

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

#include "xaifBooster/algorithms/Linearization/inc/ExpressionEdgeAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraph.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorSaxpy.hpp"
#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorSetDeriv.hpp"

#include "xaifBooster/algorithms/CrossCountryInterface/inc/GraphCorrelations.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdge.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertex.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlgParameter.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdgeAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertexAlgFactory.hpp"

/** 
 * the various methods provided by the ANGEL library
 */
namespace angel { 
  extern void compute_elimination_sequence (const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& xgraph,
					    int tasks, 
					    double gamma,
					    xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& expression_list);
  extern void compute_elimination_sequence_lsa_vertex (const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& xgraph,
						       int iterations, 
						       double gamma,
						       xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& expression_list);

  extern void compute_elimination_sequence_lsa_face (const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& xgraph,
						     int iterations, 
						     double gamma,
						     xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& expression_list);

  extern void compute_partial_elimination_sequence (const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& xgraph,
		  int tasks, 
		  double, // for interface unification
		  xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& expression_list,
		  xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& rgraph,
		  xaifBoosterCrossCountryInterface::VertexCorrelationList& v_cor_list,
		  xaifBoosterCrossCountryInterface::EdgeCorrelationList& e_cor_list);
}

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  unsigned int BasicBlockAlg::ourAssignmentCounter=0;
  unsigned int BasicBlockAlg::ourSequenceCounter=0;

  bool BasicBlockAlg::ourPermitNarySaxFlag=false;
  bool BasicBlockAlg::chooseAlg=false;
  bool BasicBlockAlg::useScarce=false;
  bool BasicBlockAlg::runtimeCounters=false;

  PreaccumulationLevel::PreaccumulationLevel_E BasicBlockAlg::ourPreaccumulationLevel(PreaccumulationLevel::PICK_BEST);

  PrivateLinearizedComputationalGraphAlgFactory* BasicBlockAlg::ourPrivateLinearizedComputationalGraphAlgFactory_p= PrivateLinearizedComputationalGraphAlgFactory::instance();
  PrivateLinearizedComputationalGraphEdgeAlgFactory* BasicBlockAlg::ourPrivateLinearizedComputationalGraphEdgeAlgFactory_p= PrivateLinearizedComputationalGraphEdgeAlgFactory::instance();
  PrivateLinearizedComputationalGraphVertexAlgFactory* BasicBlockAlg::ourPrivateLinearizedComputationalGraphVertexAlgFactory_p=PrivateLinearizedComputationalGraphVertexAlgFactory::instance();


  //BasicBlockAlg::Compute_elimination_sequence_fp BasicBlockAlg::ourCompute_elimination_sequence_fp=&angel::compute_elimination_sequence;
  BasicBlockAlg::Compute_elimination_sequence_fp BasicBlockAlg::ourCompute_elimination_sequence_fp=0;

  int BasicBlockAlg::ourIntParameter=5000;
  double BasicBlockAlg::ourGamma=5.0;

  BasicBlockAlg::Sequence::Sequence() {
    myFlattenedSequence_p=ourPrivateLinearizedComputationalGraphAlgFactory_p->makeNewPrivateLinearizedComputationalGraph();
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
    if (myFlattenedSequence_p)
      delete myFlattenedSequence_p;
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

  void BasicBlockAlg::SequenceHolder::splitFlattenedSequence(const Assignment& theAssignment) { 
    DBG_MACRO(DbgGroup::CALLSTACK, "BasicBlockAlg::SequenceHolder::splitFlattenedSequence entering");
    if(!myBasicBlockElementSequencePPairList.size()) { 
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::SequenceHolder::splitFlattenedSequence: must be initialized unless called out of order");
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
	DBG_MACRO(DbgGroup::CALLSTACK, "BasicBlockAlg::SequenceHolder::splitFlattenedSequence leaving");
	return; 
      } 
    } // end if 
    THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::splitFlattenedSequence: couldn't find"
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
    xaifBoosterLinearization::BasicBlockAlg(theContaining),
    myBestSeq_p(0),
    myFlatOn(false),
    myFlatOff(true) {
    // we must choose one SequenceHolder to do the things 
    // that are common across all the variants,
    // in particular the steps that can be done only once
    // such as redoing the activity determination and the
    // linearization. The latter items should be done 
    // on the flattening version which is why we pick that one 
    // as the representative. 
    if (ourPreaccumulationLevel!=PreaccumulationLevel::STATEMENT)
      myRepresentativeSequence_p=&myFlatOn;
    else
      myRepresentativeSequence_p=&myFlatOff;
  }

  BasicBlockAlg::~BasicBlockAlg() {
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
    if(runtimeCounters)
      {
	//Add macros for printing out counters
	for(PlainBasicBlock::BasicBlockElementList::const_iterator myBasicBlockElementListI = myBasicBlockElementList.begin();
	    myBasicBlockElementListI != myBasicBlockElementList.end();
	    ++myBasicBlockElementListI)
	  {
	    (*(myBasicBlockElementListI))->printXMLHierarchy(os);
	  }
      }
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
      BasicBlockAlgParameter::instance().set(*this);	
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

  void 
  BasicBlockAlg::algorithm_action_3() {
    DBG_MACRO(DbgGroup::CALLSTACK, "BasicBlockAlg::algorihm_action_3: invoked for "
	      << debug().c_str());
    if (ourPreaccumulationLevel!=PreaccumulationLevel::STATEMENT)
      algorithm_action_3_perSequence(myFlatOn);
    if(!useScarce)
    {
      if (ourPreaccumulationLevel!=PreaccumulationLevel::MAX_GRAPH)
        algorithm_action_3_perSequence(myFlatOff);
    }
    switch(ourPreaccumulationLevel) { 
    case PreaccumulationLevel::STATEMENT:
      myBestSeq_p=&myFlatOff;
      break;
    case PreaccumulationLevel::MAX_GRAPH:
      myBestSeq_p=&myFlatOn;
      break;
    default: 
      // this is the heuristic to pick between the two sequences
      if(myFlatOn.myBasicBlockOperations.getJacValue() < myFlatOff.myBasicBlockOperations.getJacValue())
	  myBestSeq_p = &myFlatOn;
      else if(myFlatOff.myBasicBlockOperations.getJacValue() < myFlatOn.myBasicBlockOperations.getJacValue())
	myBestSeq_p = &myFlatOff;
      else if(myFlatOff.myBasicBlockOperations < myFlatOn.myBasicBlockOperations)
	myBestSeq_p = &myFlatOff;
      else
	myBestSeq_p = &myFlatOn;
      break;
    }
  }

  void 
  BasicBlockAlg::algorithm_action_3_perSequence(BasicBlockAlg::SequenceHolder& aSequenceHolder) { 	  
    aSequenceHolder.myBasicBlockOperations.reset();
    for (SequenceHolder::SequencePList::iterator aSequencePListI=aSequenceHolder.getUniqueSequencePList().begin();
	 aSequencePListI!=aSequenceHolder.getUniqueSequencePList().end();
	 ++aSequencePListI) { // outer loop over all items in myUniqueSequencePList
      PrivateLinearizedComputationalGraph& theFlattenedSequence=*((*aSequencePListI)->myFlattenedSequence_p);
      PrivateLinearizedComputationalGraph::VertexIteratorPair p(theFlattenedSequence.vertices());
      PrivateLinearizedComputationalGraph::VertexIterator it(p.first),endIt(p.second);
      for (;it!=endIt;++it) { 
	// here we should have constants etc. already removed
	// JU: this is temporary until we have r/w analysis
	if (!theFlattenedSequence.numInEdgesOf(*it)) {
	  theFlattenedSequence.addToIndependentList(*it);
	}
      } 
      // now look at all the vertices in the dependent list 
      // and remove the ones not needed as indicated by 
      // the duud information:
      const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList& theDepVertexPList(theFlattenedSequence.getDependentList());
      // we need a complete copy to ensure correctness in case of overwritten (local) independents
      VariableCPList theDepVertexPListCopyWithoutRemovals;
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
	  theFlattenedSequence.removeFromDependentList(myPrivateVertex);
	  continue;
	}
	DuUdMapUseResult theDuUdMapUseResult(ConceptuallyStaticInstances::instance()->
					     getCallGraph().getDuUdMap().use(aDuUdMapKey,
									     theFlattenedSequence.getStatementIdLists()));
	if (theDuUdMapUseResult.myAnswer==DuUdMapUseResult::AMBIGUOUS_INSIDE 
	    || 
	    theDuUdMapUseResult.myAnswer==DuUdMapUseResult::UNIQUE_INSIDE) { 
	  if (!theFlattenedSequence.numOutEdgesOf(myPrivateVertex)) { 
	    if (theDuUdMapUseResult.myActiveUse!=ActiveUseType::PASSIVEUSE) { 
	      // if the use is no strictly passive then in case of UNIQUE_INSIDE this vertex 
	      // should not be maximal and in case of AMBIGUOUS_INSIDE there should have 
	      // been a split. 
	      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::algorithm_action_3: attempting to remove a maximal vertex "
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
	    DBG_MACRO(DbgGroup::DATA, "BasicBlockAlg::algorithm_action_3: removing dependent " 
		      << myPrivateVertex.getLHSVariable().debug().c_str()
		      << " list size: " << theDepVertexPList.size()); 
	    theFlattenedSequence.removeFromDependentList(myPrivateVertex);
	    continue;
	  }
	}
	if (DbgLoggerManager::instance()->isSelected(DbgGroup::DATA)) { 
	  if (theFlattenedSequence.numOutEdgesOf(myPrivateVertex)) { 
	    DBG_MACRO(DbgGroup::DATA, "BasicBlockAlg::algorithm_action_3: non-maximal dependent " 
		      << myPrivateVertex.getLHSVariable().debug().c_str()); 
	  }
	  else { 
	    DBG_MACRO(DbgGroup::DATA, "BasicBlockAlg::algorithm_action_3: keeping regular dependent " 
		      << myPrivateVertex.getLHSVariable().debug().c_str()); 
	  }
	} 
      }
      if(useScarce)
      {
	//run andrews code
	scarceEliminationAlgorithm(aSequencePListI, theFlattenedSequence, theDepVertexPListCopyWithoutRemovals, aSequenceHolder);
      }
      else //old algorithm for eliminations sequences
      {
	standardEliminationAlgorithm(aSequencePListI, theFlattenedSequence, theDepVertexPListCopyWithoutRemovals, aSequenceHolder);
      }
    } // end for
  }

  //runs the scarce vertex and edge elmination algorithms
  void BasicBlockAlg::scarceEliminationAlgorithm(SequenceHolder::SequencePList::iterator& aSequencePListI, PrivateLinearizedComputationalGraph& theFlattenedSequence, VariableCPList& theDepVertexPListCopyWithoutRemovals, SequenceHolder& aSequenceHolder){
      // UN: this is used to keep track of those independent variables
      // that were already assigned to temporary variables to ensure correctness
      // of the Jacobian accumulation code.
      VariableHashTable theListOfAlreadyAssignedIndependents;
      InternalReferenceConcretizationList theInternalReferenceConcretizationList;
      // try to find collapsed vertices which are 
      // either singleton vertices, or 
      // vertices that occur in theFlattenedSequence 
      // dependent AND independent list.
      // first filter out singleton vertices:
      xaifBoosterDerivativePropagator::DerivativePropagator::EntryPList::iterator aDPBeginI((*aSequencePListI)->myDerivativePropagator.getEntryPList().begin());
      bool findNext=true;
      while (findNext) {
	PrivateLinearizedComputationalGraph::VertexIteratorPair aVertexIteratorPair(theFlattenedSequence.vertices());
	PrivateLinearizedComputationalGraph::VertexIterator aVertexI(aVertexIteratorPair.first),endAVertexI(aVertexIteratorPair.second);
	findNext=false;
	for (;aVertexI!=endAVertexI;++aVertexI) {
	  if (!(theFlattenedSequence.numOutEdgesOf(*aVertexI)+theFlattenedSequence.numInEdgesOf(*aVertexI))) { 
	    // a singleton
	    findNext=true;
	    // remove this vertex in the dependent/independent lists
	    theFlattenedSequence.removeFromDependentList(*aVertexI);
	    theFlattenedSequence.removeFromIndependentList(*aVertexI);
	    handleCollapsedVertex(dynamic_cast<PrivateLinearizedComputationalGraphVertex&>(*aVertexI),
				  theDepVertexPListCopyWithoutRemovals,
				  theListOfAlreadyAssignedIndependents,
				  **aSequencePListI,
				  aDPBeginI);
	    // remove it from the graph
	    theFlattenedSequence.removeAndDeleteVertex(*aVertexI);
	    // need to break out here because we removed the vertex
	    break;
	  } // end if 
	} // end for 
      } // end while 
      // now deal with the remaining graph and possible
      // non-singleton collapsed vertices:
      PrivateLinearizedComputationalGraph::VertexIteratorPair anotherVertexIteratorPair(theFlattenedSequence.vertices());
      PrivateLinearizedComputationalGraph::VertexIterator anotherVertexI(anotherVertexIteratorPair.first),endAnotherVertexI(anotherVertexIteratorPair.second);
      for (;anotherVertexI!=endAnotherVertexI;++anotherVertexI) {
	// try to locate it in the dependent list: 
	bool located=false; 
	const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList&  theDependentList(theFlattenedSequence.getDependentList());
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
	const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList&  theIndependentList(theFlattenedSequence.getIndependentList());
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
			      theListOfAlreadyAssignedIndependents,
			      **aSequencePListI,
			      aDPBeginI);
      } // end for 
      // the list to distinguish SAX from SAXPY or alternatively collect into n-ary SAX: 
      typedef std::pair<const Variable*,
	xaifBoosterDerivativePropagator::DerivativePropagatorSaxpy*> VarDevPropPPair;
      typedef std::list<VarDevPropPPair> VarDevPropPPairList;
      VarDevPropPPairList theListOfAlreadyAssignedDependents;
      if (theFlattenedSequence.numVertices()) {
	if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {     
	  GraphVizDisplay::show(theFlattenedSequence,
				"flattened",
				PrivateLinearizedComputationalGraphVertexLabelWriter(theFlattenedSequence));
	}
        //Pointer for best list
        xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList *best;
        //List variables to store algorithms results
        xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList alg1Test;
        xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList alg2Test;
        xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList alg3Test;
        xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList alg4Test;
        //Counters for both count of best algorithm and current algorithm
	Counter min;
	Counter current;
        xaifBoosterCrossCountryInterface::LinearizedComputationalGraph rgraph;
	xaifBoosterCrossCountryInterface::VertexCorrelationList v_cor_list;
        xaifBoosterCrossCountryInterface::EdgeCorrelationList e_cor_list;
        // call Angel which fills myJacobianAccumulationExpressionList and finds most efficient algorithm
	try { 
	  //ourCompute_elimination_sequence_fp=&angel::compute_partial_elimination_sequence; //Set algorithm
		angel::compute_partial_elimination_sequence (theFlattenedSequence, ourIntParameter, ourGamma, alg1Test, rgraph, v_cor_list, e_cor_list); //Run algorithm
          if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {
	    GraphVizDisplay::show(rgraph, "remainderGraph");
	  }
	  countOperations(alg1Test, current); //Count algorithm
	  min = current; //since first this is min
	  best = &alg1Test; //it is also best
	  //debuging print statements with results
		  DBG_MACRO(DbgGroup::METRIC, "Default elimination " << current.debug().c_str() << " for Sequence " << &theFlattenedSequence << " in BasicBlockAlg " << this);
	  current.reset(); //Reset counter for next algorithm
	}
	catch(...) { 
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::algorithm_action_3: exception thrown from within angel call");
	}
        //Insert Macros into the code that will be expanded to count multiplications and additions
        //Multiplication counter
	if(runtimeCounters)
	  {
	    theSubroutineCall_p=new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("countmult");
	    theSubroutineCall_p->setId("inline_countmult");
	    theSubroutineCall_p->addConcreteArgument(1).makeConstant(SymbolType::INTEGER_STYPE).setint(min.getMulValue());
	    // save it in the list
	    myBasicBlockElementList.push_back(theSubroutineCall_p);
	    //Addition Counter
	    theSubroutineCall_p=new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("countadd");
	    theSubroutineCall_p->setId("inline_countadd");
	    theSubroutineCall_p->addConcreteArgument(1).makeConstant(SymbolType::INTEGER_STYPE).setint(min.getAddValue());
	    // save it in the list
	    myBasicBlockElementList.push_back(theSubroutineCall_p);
	  }
	for(xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList::GraphList::const_iterator it=
	      (*best).getGraphList().begin();
	    it!=(*best).getGraphList().end();
	    ++it) { 
	  // make a new assignment: 
	  Assignment& aNewAssignment=(*aSequencePListI)->appendEndAssignment();
	  // JU should we get away with this setting of "jacobian_accumulation" for the Id
	  aNewAssignment.setId("jacobian_accumulation");
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
	  theVariableSymbolReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::algorithm_action_3");
	  theLHS.supplyAndAddVertexInstance(*theVariableSymbolReference_p);
	  theLHS.getAliasMapKey().setTemporary();
	  theLHS.getDuUdMapKey().setTemporary();
	  const xaifBoosterCrossCountryInterface::JacobianAccumulationExpression& theExpression(*(*it));
	  if (theExpression.isJacobianEntry()) { 
	    // UN: assign independent to temporary if aliased by some
	    // dependent
	    // use temporary in DerivativePropagator
	    // temporary currently lives in global scope 
	    // this is the actual independent:
	    const Variable& 
	      theIndepVariable(dynamic_cast<const PrivateLinearizedComputationalGraphVertex&>
			       (theExpression.getIndependent()).getRHSVariable());
	    const Variable* theIndepVariableContainer_cp=0;
	    if (isAliased(theIndepVariable,
			  theDepVertexPListCopyWithoutRemovals)) { 
	      // make a Variable (container) for use in the saxpys:
	      Variable* theIndepVariableContainer_p = new Variable;
	      // was this actual indepenent already assigned?
	      // Note, that at this point they should indeed all be syntactically distinct 
	      if (!(theListOfAlreadyAssignedIndependents.hasElement(theIndepVariable.equivalenceSignature()))) {
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
		theTemporaryVariableReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::algorithm_action_3");
		theTarget.supplyAndAddVertexInstance(*theTemporaryVariableReference_p);
		theTarget.getAliasMapKey().setTemporary();
		theTarget.getDuUdMapKey().setTemporary();
		// copy the new temporary into the container
		theTarget.copyMyselfInto(*theIndepVariableContainer_p);
		// "theTarget" is only local but the DerivativePropagatorSetDeriv 
		// ctor performs a deep copy and owns the new instance so we are fine
		// the theListOfAlreadyAssignedIndependents needs to contain the 
		// address of the copy.
		theListOfAlreadyAssignedIndependents.
		  addElement(theIndepVariable.equivalenceSignature(),
			     &((*aSequencePListI)->myDerivativePropagator.addSetDerivToEntryPList(theTarget,
												  theIndepVariable).getTarget()));
	      } // end if (wasn't assigned before)  
	      else {
		// yes, it was assigned before
		// copy the previously created temporary into the container
		(theListOfAlreadyAssignedIndependents.getElement(theIndepVariable.equivalenceSignature()))->
		  copyMyselfInto(*theIndepVariableContainer_p); 
	      }
	      // point to the new or previously created temporary
	      theIndepVariableContainer_cp=theIndepVariableContainer_p;
	    } // end if isAliased
	    else { // not aliased
	      // point to the original independent
	      theIndepVariableContainer_cp=&theIndepVariable;
	    }
	    // make the entry to the DerivativePropagator
	    // UN: use the  variable in the container theIndepVariableContainer_p 
	    // instead of original independent
	    const Variable& theDependent(dynamic_cast<const PrivateLinearizedComputationalGraphVertex&>
					 (theExpression.getDependent()).getLHSVariable());
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
	      theSaxpy_p=&((*aSequencePListI)->myDerivativePropagator.
			   addSaxpyToEntryPList(theLHS,
						*theIndepVariableContainer_cp,
						theDependent));
	    }
	    else { 
	      theSaxpy_p=(*aVarDevPropPPairListI).second;
	      theSaxpy_p->addAX(theLHS,
				*theIndepVariableContainer_cp);
	    } 
	    if (!found) { 
	      theSaxpy_p->useAsSax();
	      theListOfAlreadyAssignedDependents.
		push_back(VarDevPropPPair(&theDependent,
					  theSaxpy_p));
	    }
	  } // end if is JacobianEntry
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
	} // end for 
	//debuging print statements with results
	DBG_MACRO(DbgGroup::METRIC, "Seqeunce metrics: " << aSequenceHolder.myBasicBlockOperations.debug().c_str() << " for " << aSequenceHolder.debug().c_str() << " in BasicBlockAlg " << this);
      } // end if have flattened graph with more than one vertex
      else { 
	// do nothing, empty graph, as e.g. for a single assignment x=const;
      }
  }
  //runs the standard vertex and edge elmination algorithms
  void BasicBlockAlg::standardEliminationAlgorithm(SequenceHolder::SequencePList::iterator& aSequencePListI, PrivateLinearizedComputationalGraph& theFlattenedSequence, VariableCPList& theDepVertexPListCopyWithoutRemovals, SequenceHolder& aSequenceHolder){
      // UN: this is used to keep track of those independent variables
      // that were already assigned to temporary variables to ensure correctness
      // of the Jacobian accumulation code.
      VariableHashTable theListOfAlreadyAssignedIndependents;
      InternalReferenceConcretizationList theInternalReferenceConcretizationList;
      // try to find collapsed vertices which are 
      // either singleton vertices, or 
      // vertices that occur in theFlattenedSequence 
      // dependent AND independent list.
      // first filter out singleton vertices:
      xaifBoosterDerivativePropagator::DerivativePropagator::EntryPList::iterator aDPBeginI((*aSequencePListI)->myDerivativePropagator.getEntryPList().begin());
      bool findNext=true;
      while (findNext) {
	PrivateLinearizedComputationalGraph::VertexIteratorPair aVertexIteratorPair(theFlattenedSequence.vertices());
	PrivateLinearizedComputationalGraph::VertexIterator aVertexI(aVertexIteratorPair.first),endAVertexI(aVertexIteratorPair.second);
	findNext=false;
	for (;aVertexI!=endAVertexI;++aVertexI) {
	  if (!(theFlattenedSequence.numOutEdgesOf(*aVertexI)+theFlattenedSequence.numInEdgesOf(*aVertexI))) { 
	    // a singleton
	    findNext=true;
	    // remove this vertex in the dependent/independent lists
	    theFlattenedSequence.removeFromDependentList(*aVertexI);
	    theFlattenedSequence.removeFromIndependentList(*aVertexI);
	    handleCollapsedVertex(dynamic_cast<PrivateLinearizedComputationalGraphVertex&>(*aVertexI),
				  theDepVertexPListCopyWithoutRemovals,
				  theListOfAlreadyAssignedIndependents,
				  **aSequencePListI,
				  aDPBeginI);
	    // remove it from the graph
	    theFlattenedSequence.removeAndDeleteVertex(*aVertexI);
	    // need to break out here because we removed the vertex
	    break;
	  } // end if 
	} // end for 
      } // end while 
      // now deal with the remaining graph and possible
      // non-singleton collapsed vertices:
      PrivateLinearizedComputationalGraph::VertexIteratorPair anotherVertexIteratorPair(theFlattenedSequence.vertices());
      PrivateLinearizedComputationalGraph::VertexIterator anotherVertexI(anotherVertexIteratorPair.first),endAnotherVertexI(anotherVertexIteratorPair.second);
      for (;anotherVertexI!=endAnotherVertexI;++anotherVertexI) {
	// try to locate it in the dependent list: 
	bool located=false; 
	const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList&  theDependentList(theFlattenedSequence.getDependentList());
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
	const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList&  theIndependentList(theFlattenedSequence.getIndependentList());
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
			      theListOfAlreadyAssignedIndependents,
			      **aSequencePListI,
			      aDPBeginI);
      } // end for 
      // the list to distinguish SAX from SAXPY or alternatively collect into n-ary SAX: 
      typedef std::pair<const Variable*,
	xaifBoosterDerivativePropagator::DerivativePropagatorSaxpy*> VarDevPropPPair;
      typedef std::list<VarDevPropPPair> VarDevPropPPairList;
      VarDevPropPPairList theListOfAlreadyAssignedDependents;
      if (theFlattenedSequence.numVertices()) {
	if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {     
	  GraphVizDisplay::show(theFlattenedSequence,
				"flattened",
				PrivateLinearizedComputationalGraphVertexLabelWriter(theFlattenedSequence));
	}
        //Pointer for best list
        xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList *best;
        //List variables to store algorithms results
        xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList alg1Test;
        xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList alg2Test;
        xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList alg3Test;
        xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList alg4Test;
        //Counters for both count of best algorithm and current algorithm
	Counter min;
	Counter current;
        // call Angel which fills myJacobianAccumulationExpressionList and finds most efficient algorithm
	try { 
	  ourCompute_elimination_sequence_fp=&angel::compute_elimination_sequence; //Set algorithm
          (*ourCompute_elimination_sequence_fp) (theFlattenedSequence, ourIntParameter, ourGamma, alg1Test); //Run algorithm
	  countOperations(alg1Test, current); //Count algorithm
	  min = current; //since first this is min
	  best = &alg1Test; //it is also best
	  //debuging print statements with results
		  DBG_MACRO(DbgGroup::METRIC, "Default elimination " << current.debug().c_str() << " for Sequence " << &theFlattenedSequence << " in BasicBlockAlg " << this);
	  current.reset(); //Reset counter for next algorithm
	  if(chooseAlg) {
	    ourCompute_elimination_sequence_fp=&angel::compute_elimination_sequence_lsa_vertex; //Set algorithm
	    (*ourCompute_elimination_sequence_fp) (theFlattenedSequence, ourIntParameter, ourGamma, alg2Test); //Run algorithm
	    countOperations(alg2Test, current); //Count algorithm
	    //Debuging output statements
	    DBG_MACRO(DbgGroup::METRIC, "LSA Vertex elimination " << current.debug().c_str() << " for Sequence " << &theFlattenedSequence << " in BasicBlockAlg " << this);
	    //Was current algorithm better than old algorithm
	    if(current < min) {
	      best = &alg2Test; //If better store new algrithms results
	      min = current;
	    }
	    current.reset(); //reset counter for next algorithm
	    ourCompute_elimination_sequence_fp=&angel::compute_elimination_sequence_lsa_face; //Set algorithm
	    (*ourCompute_elimination_sequence_fp) (theFlattenedSequence, ourIntParameter, ourGamma, alg3Test); //Run algorithm
	    countOperations(alg3Test, current); //Count algorithm
	    //debugging statements
	    DBG_MACRO(DbgGroup::METRIC, "LSA Face elimination " << current.debug().c_str() << " for Sequence " << &theFlattenedSequence << " in BasicBlockAlg " << this);
	    //Was current algorithm better than old algorithm
	    if(current < min) {
	      best = &alg3Test; //If better store new algorithm results
	      min = current;
	    }
	  }
	}
	catch(...) { 
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::algorithm_action_3: exception thrown from within angel call");
	}
        //Insert Macros into the code that will be expanded to count multiplications and additions
        //Multiplication counter
	if(runtimeCounters)
	  {
	    theSubroutineCall_p=new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("countmult");
	    theSubroutineCall_p->setId("inline_countmult");
	    theSubroutineCall_p->addConcreteArgument(1).makeConstant(SymbolType::INTEGER_STYPE).setint(min.getMulValue());
	    // save it in the list
	    myBasicBlockElementList.push_back(theSubroutineCall_p);
	    //Addition Counter
	    theSubroutineCall_p=new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("countadd");
	    theSubroutineCall_p->setId("inline_countadd");
	    theSubroutineCall_p->addConcreteArgument(1).makeConstant(SymbolType::INTEGER_STYPE).setint(min.getAddValue());
	    // save it in the list
	    myBasicBlockElementList.push_back(theSubroutineCall_p);
	  }
	for(xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList::GraphList::const_iterator it=
	      (*best).getGraphList().begin();
	    it!=(*best).getGraphList().end();
	    ++it) { 
	  // make a new assignment: 
	  Assignment& aNewAssignment=(*aSequencePListI)->appendEndAssignment();
	  // JU should we get away with this setting of "jacobian_accumulation" for the Id
	  aNewAssignment.setId("jacobian_accumulation");
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
	  theVariableSymbolReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::algorithm_action_3");
	  theLHS.supplyAndAddVertexInstance(*theVariableSymbolReference_p);
	  theLHS.getAliasMapKey().setTemporary();
	  theLHS.getDuUdMapKey().setTemporary();
	  const xaifBoosterCrossCountryInterface::JacobianAccumulationExpression& theExpression(*(*it));
	  if (theExpression.isJacobianEntry()) { 
	    // UN: assign independent to temporary if aliased by some
	    // dependent
	    // use temporary in DerivativePropagator
	    // temporary currently lives in global scope 
	    // this is the actual independent:
	    const Variable& 
	      theIndepVariable(dynamic_cast<const PrivateLinearizedComputationalGraphVertex&>
			       (theExpression.getIndependent()).getRHSVariable());
	    const Variable* theIndepVariableContainer_cp=0;
	    if (isAliased(theIndepVariable,
			  theDepVertexPListCopyWithoutRemovals)) { 
	      // make a Variable (container) for use in the saxpys:
	      Variable* theIndepVariableContainer_p = new Variable;
	      // was this actual indepenent already assigned?
	      // Note, that at this point they should indeed all be syntactically distinct 
	      if (!(theListOfAlreadyAssignedIndependents.hasElement(theIndepVariable.equivalenceSignature()))) {
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
		theTemporaryVariableReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::algorithm_action_3");
		theTarget.supplyAndAddVertexInstance(*theTemporaryVariableReference_p);
		theTarget.getAliasMapKey().setTemporary();
		theTarget.getDuUdMapKey().setTemporary();
		// copy the new temporary into the container
		theTarget.copyMyselfInto(*theIndepVariableContainer_p);
		// "theTarget" is only local but the DerivativePropagatorSetDeriv 
		// ctor performs a deep copy and owns the new instance so we are fine
		// the theListOfAlreadyAssignedIndependents needs to contain the 
		// address of the copy.
		theListOfAlreadyAssignedIndependents.
		  addElement(theIndepVariable.equivalenceSignature(),
			     &((*aSequencePListI)->myDerivativePropagator.addSetDerivToEntryPList(theTarget,
												  theIndepVariable).getTarget()));
	      } // end if (wasn't assigned before)  
	      else {
		// yes, it was assigned before
		// copy the previously created temporary into the container
		(theListOfAlreadyAssignedIndependents.getElement(theIndepVariable.equivalenceSignature()))->
		  copyMyselfInto(*theIndepVariableContainer_p); 
	      }
	      // point to the new or previously created temporary
	      theIndepVariableContainer_cp=theIndepVariableContainer_p;
	    } // end if isAliased
	    else { // not aliased
	      // point to the original independent
	      theIndepVariableContainer_cp=&theIndepVariable;
	    }
	    // make the entry to the DerivativePropagator
	    // UN: use the  variable in the container theIndepVariableContainer_p 
	    // instead of original independent
	    const Variable& theDependent(dynamic_cast<const PrivateLinearizedComputationalGraphVertex&>
					 (theExpression.getDependent()).getLHSVariable());
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
	      theSaxpy_p=&((*aSequencePListI)->myDerivativePropagator.
			   addSaxpyToEntryPList(theLHS,
						*theIndepVariableContainer_cp,
						theDependent));
	    }
	    else { 
	      theSaxpy_p=(*aVarDevPropPPairListI).second;
	      theSaxpy_p->addAX(theLHS,
				*theIndepVariableContainer_cp);
	    } 
	    if (!found) { 
	      theSaxpy_p->useAsSax();
	      theListOfAlreadyAssignedDependents.
		push_back(VarDevPropPPair(&theDependent,
					  theSaxpy_p));
	    }
	  } // end if is JacobianEntry
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
	} // end for 
	//debuging print statements with results
	DBG_MACRO(DbgGroup::METRIC, "Seqeunce metrics: " << aSequenceHolder.myBasicBlockOperations.debug().c_str() << " for " << aSequenceHolder.debug().c_str() << " in BasicBlockAlg " << this);
      } // end if have flattened graph with more than one vertex
      else { 
	// do nothing, empty graph, as e.g. for a single assignment x=const;
      }
  }

  //Counts the number of add and multiply operations that are in a list passed in to it
  void BasicBlockAlg::countOperations(xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList &list, Counter &ops)
  {
    //goes through each graph in the list
    for(xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList::GraphList::const_iterator it=
	  list.getGraphList().begin();
	it!=list.getGraphList().end();
	++it) {
      const xaifBoosterCrossCountryInterface::JacobianAccumulationExpression& theExpression2(*(*it));
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstVertexIteratorPair testPair(theExpression2.vertices());
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstVertexIterator testVertexI(testPair.first), testVertexIEnd(testPair.second);
      if(theExpression2.isJacobianEntry())
	{
	  ops.jacInc();
	}
      //goes through every vertex in each graph
      for (;testVertexI!=testVertexIEnd; ++testVertexI) {
	//if the vertex is an operation then figure out which one it is and increment the counter
	if ((*testVertexI).getReferenceType() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::OPERATION)
	  {
	    if ((*testVertexI).getOperation() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::MULT_OP)
	      {
		ops.mulInc();
	      }
	    if ((*testVertexI).getOperation() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::ADD_OP)
	      {
		ops.addInc();
	      }
	  }
      } // end for
    }
    return;
  }

	
  void BasicBlockAlg::handleCollapsedVertex(PrivateLinearizedComputationalGraphVertex& theCollapsedVertex,
					    VariableCPList& theDepVertexPListCopyWithoutRemovals,
					    BasicBlockAlg::VariableHashTable& theListOfAlreadyAssignedIndependents,
					    BasicBlockAlg::Sequence& aSequence,
					    xaifBoosterDerivativePropagator::DerivativePropagator::EntryPList::iterator& aDPBeginI) { 
    // this is the independent:
    const Variable& theIndepVariable(theCollapsedVertex.getRHSVariable());
    // now figure out if the independent may be overwritten:
    const Variable* theIndepVariableContainer_cp=0;
    if (isAliased(theIndepVariable,
		  theDepVertexPListCopyWithoutRemovals)) { 
      // make a Variable (container) for use in the setDeriv
      Variable* theIndepVariableContainer_p = new Variable;
      // was this actual indepenent already assigned?
      // Note, that at this point they should indeed all be syntactically distinct 
      if (!(theListOfAlreadyAssignedIndependents.hasElement(theIndepVariable.equivalenceSignature()))) {
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
	theTemporaryVariableReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::algorithm_action_3");
	theTarget.supplyAndAddVertexInstance(*theTemporaryVariableReference_p);
	theTarget.getAliasMapKey().setTemporary();
	theTarget.getDuUdMapKey().setTemporary();
	// copy the new temporary into the container
	theTarget.copyMyselfInto(*theIndepVariableContainer_p);
	// "theTarget" is only local but the DerivativePropagatorSetDeriv 
	// ctor performs a deep copy and owns the new instance so we are fine
	// the theListOfAlreadyAssignedIndependents needs to contain the 
	// address of the copy.
	theListOfAlreadyAssignedIndependents.
	  addElement(theIndepVariable.equivalenceSignature(),
		     &(aSequence.myDerivativePropagator.addSetDerivToEntryPList(theTarget,
										theIndepVariable).getTarget()));
      } // end if (wasn't assigned efore  
      else {
	// yes, it was assigned before
	// copy the previously created temporary into the container
	(theListOfAlreadyAssignedIndependents.getElement(theIndepVariable.equivalenceSignature()))->
	  copyMyselfInto(*theIndepVariableContainer_p); 
      }
      // point to the new or previously created temporary
      theIndepVariableContainer_cp=theIndepVariableContainer_p;
    } // end if isAliased
    else { // not aliased
      // point to the original independent
      theIndepVariableContainer_cp=&theIndepVariable;
    }
    // make the direct assignment
    aSequence.myDerivativePropagator.
      addSetDerivToEntryPList(theCollapsedVertex.getLHSVariable(),
			      *theIndepVariableContainer_cp,
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
	if(thePrivateEdge.getParallels().size()) { 
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
	  if (thePrivateEdge.isUnitExpressionEdge()) { 
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
	  if (thePrivateEdge.isUnitExpressionEdge()) { 
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
  BasicBlockAlg::getFlattenedSequence(const Assignment& theAssignment,
				      BasicBlockAlg::SequenceHolder& aSequenceHolder) { 
    DBG_MACRO(DbgGroup::CALLSTACK, "BasicBlockAlg::SequenceHolder::getFlattenedSequence entering with "
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
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::SequenceHolder::getFlattenedSequence: this basic block does not have element "
				 << theAssignment.debug().c_str());
    DBG_MACRO(DbgGroup::CALLSTACK, "BasicBlockAlg::SequenceHolder::getFlattenedSequence leaving with "
	      << debug().c_str());
    return *(theSequence_p->myFlattenedSequence_p);
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

  const Counter& BasicBlockAlg::getBasicBlockOperations() const {
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
    chooseAlg = true;
  }

  void BasicBlockAlg::setRuntimeCounters(){
    runtimeCounters = true;
  }

  void BasicBlockAlg::setScarce(){
    useScarce = true;
  }

  BasicBlockAlg::SequenceHolder& BasicBlockAlg::getSequenceHolder(bool flattenFlag) { 
    if ((ourPreaccumulationLevel==PreaccumulationLevel::STATEMENT && flattenFlag)
	||
	(ourPreaccumulationLevel==PreaccumulationLevel::MAX_GRAPH && !flattenFlag))
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::SequenceHolder::getSequenceHolder: under PreaccumulationLevel "
				 << PreaccumulationLevel::toString(ourPreaccumulationLevel).c_str()
				 << " we do not populate data for the SequenceHolder with flattenFlag value "
				 << flattenFlag);
      return (flattenFlag?myFlatOn:myFlatOff);
  }

  const BasicBlockAlg::SequenceHolder& BasicBlockAlg::getBestSequenceHolder() const { 
    if (!myBestSeq_p)
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::SequenceHolder::getBestSequenceHolder: not determined");
    return *myBestSeq_p;
  } 

  BasicBlockAlg::SequenceHolder& BasicBlockAlg::getBestSequenceHolder() { 
    if (!myBestSeq_p)
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::SequenceHolder::getBestSequenceHolder: not determined");
    return *myBestSeq_p;
  } 

  void BasicBlockAlg::forcePreaccumulationLevel(PreaccumulationLevel::PreaccumulationLevel_E aLevel) { 
    PreaccumulationLevel::checkValid(aLevel);
    ourPreaccumulationLevel=aLevel;
  } 

  PreaccumulationLevel::PreaccumulationLevel_E BasicBlockAlg::getPreaccumulationLevel() { 
    return ourPreaccumulationLevel;
  } 

} // end of namespace xaifBoosterAngelInterfaceAlgorithms 
