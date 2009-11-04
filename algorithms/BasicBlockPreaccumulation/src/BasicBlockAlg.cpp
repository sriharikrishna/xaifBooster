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

#include "xaifBooster/algorithms/Linearization/inc/ExpressionEdgeAlg.hpp"

#include "xaifBooster/algorithms/CrossCountryInterface/inc/AccumulationGraph.hpp"
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
  PreaccumulationCounter BasicBlockAlg::ourPreaccumulationCounter;

  bool BasicBlockAlg::ourPermitNarySaxFlag=false;
  bool BasicBlockAlg::ourRuntimeCountersFlag=false;
  bool BasicBlockAlg::ourUseRandomizedHeuristicsFlag = false;
  PreaccumulationMetric::PreaccumulationMetric_E BasicBlockAlg::ourPreaccumulationMetric = PreaccumulationMetric::SCARCITY_METRIC;
  bool BasicBlockAlg::ourUseReroutingsFlag = false;

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
	  xaifBoosterCrossCountryInterface::Elimination* theElimination_p = new xaifBoosterCrossCountryInterface::Elimination (lcg);
    myEliminationPList.push_back(theElimination_p);
    return *theElimination_p;
  }

  void BasicBlockAlg::Sequence::determineBestElimination(PreaccumulationMetric::PreaccumulationMetric_E aMetric) {
    if (myEliminationPList.empty())
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::Sequence::determineBestElimination() : no eliminations, thus no results");
    if (myBestElimination_p)
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::Sequence::determineBestElimination() : myBestElimination_p already set");
    myBestElimination_p = *(myEliminationPList.begin());
    for (EliminationPList::iterator i = ++(myEliminationPList.begin()); i != myEliminationPList.end(); ++i) { 
      if ((*i)->getCounter() < myBestElimination_p->getCounter())
        myBestElimination_p = *i;
    } // end iterate over all Eliminations
  } // end BasicBlockAlg::Sequence::determineBestElimination()

  const xaifBoosterCrossCountryInterface::Elimination& BasicBlockAlg::Sequence::getBestElimination() const {
    if (!myBestElimination_p)
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::Sequence::getBestElimination: myBestElimination_p not set");
    return *myBestElimination_p;
  }

  xaifBoosterCrossCountryInterface::Elimination&
  BasicBlockAlg::Sequence::getBestElimination() {
    if (!myBestElimination_p)
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::Sequence::getBestElimination: myBestElimination_p not set");
    return *myBestElimination_p;
  } // end BasicBlockAlg::Sequence::getBestElimination()

  BasicBlockAlg::Sequence::EliminationPList& BasicBlockAlg::Sequence::getEliminationPList() {
    if (myEliminationPList.empty())
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::Sequence::getEliminationPList: myEliminationP:List is empty");
    return myEliminationPList;
  }

  void BasicBlockAlg::incrementGlobalAssignmentCounter() { 
    ourAssignmentCounter++;
  } // end BasicBlockAlg::incrementGlobalAssignmentCounter()
  
  void BasicBlockAlg::incrementGlobalSequenceCounter() {
    ourSequenceCounter++;
  } // end BasicBlockAlg::incrementGlobalSequenceCounter

  void BasicBlockAlg::splitComputationalGraph(const Assignment& theAssignment) { 
    DBG_MACRO(DbgGroup::CALLSTACK,"xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::splitComputationalGraph entering");
    if(!myBasicBlockElementSequencePPairList.size()) { 
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::splitComputationalGraph: must be initialized unless called out of order");
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
	DBG_MACRO(DbgGroup::CALLSTACK,"xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::splitComputationalGraph leaving");
	return; 
      } 
    } // end if 
    THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::splitComputationalGraph: couldn't find"
			       << theAssignment.debug().c_str());
  }

  xaifBoosterDerivativePropagator::DerivativePropagator& 
  BasicBlockAlg::getDerivativePropagator(const Assignment& theAssignment) { 
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

  unsigned int BasicBlockAlg::getAssignmentCounter() {
    return ourAssignmentCounter;
  }
  
  unsigned int BasicBlockAlg::getSequenceCounter() {
    return ourSequenceCounter;
  }

  const PreaccumulationCounter&
  BasicBlockAlg::getGlobalPreaccumulationCounter() { 
    return ourPreaccumulationCounter;
  } // end BasicBlockAlg::getGlobalPreaccumulationCounter()

  const PreaccumulationCounter&
  BasicBlockAlg::getPreaccumulationCounter() const {
    return myPreaccumulationCounter;
  } // end BasicBlockAlg::getPreaccumulationCounter()

  const BasicBlockAlg::SequencePList&
  BasicBlockAlg::getUniqueSequencePList() const {
    return myUniqueSequencePList;
  } // end BasicBlockAlg::getUniqueSequencePList()

  BasicBlockAlg::BasicBlockAlg(BasicBlock& theContaining) :
      xaifBooster::BasicBlockAlgBase(theContaining) {
  } // end BasicBlockAlg::BasicBlockAlg()

  BasicBlockAlg::~BasicBlockAlg() {
    for(SequencePList::iterator i = myUniqueSequencePList.begin();
	i != myUniqueSequencePList.end();
	++i)
      if (*i) // should always be true
	delete *i;
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
      for (BasicBlockElementSequencePPairList::const_iterator pli = myBasicBlockElementSequencePPairList.begin();
	   pli != myBasicBlockElementSequencePPairList.end();
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
      std::string theVertexShape("ellipse");
      std::string theVertexGroupname("intermediates");
      std::string vertexFixedSize("false");
      const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList& theDepVertexPList(myG.getDependentList());
      for (xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList::const_iterator aDepVertexPListI(theDepVertexPList.begin());
	   aDepVertexPListI!=theDepVertexPList.end();
	   ++aDepVertexPListI) { 
	if (thePrivateLinearizedComputationalGraphVertex_p==*(aDepVertexPListI)) {
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
	  theVertexShape = "triangle";
          theVertexGroupname = "independents";
          vertexFixedSize = "true";
	  break;
	}
      }

      // set label
      std::string theVertexKind("");
      std::ostringstream oss;
      if (thePrivateLinearizedComputationalGraphVertex_p->hasOriginalVariable()) {
	oss << thePrivateLinearizedComputationalGraphVertex_p->getOriginalVariable().getVariableSymbolReference().getSymbol().getId().c_str();
	if (thePrivateLinearizedComputationalGraphVertex_p->getOriginalVariable().getDuUdMapKey().getKind() == InfoMapKey::SET)
	  oss  << " k=" << thePrivateLinearizedComputationalGraphVertex_p->getOriginalVariable().getDuUdMapKey().getKey();
	theVertexKind = oss.str();
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
      if (thePrivateLinearizedComputationalGraphEdge_p->getEdgeLabelType() == xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge::UNIT_LABEL)
	theColor = "red";
      else if (thePrivateLinearizedComputationalGraphEdge_p->getEdgeLabelType() == xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge::CONSTANT_LABEL)
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
      const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex* theLCGVertex_p =
	dynamic_cast<const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex*>(boost::get(boost::get(BoostVertexContentType(),
                                                                                                                        myG.getInternalBoostGraph()),
                                                                                                             v));
      if (theLCGVertex_p->hasOriginalVariable())
	out << "[label=\"" << theLCGVertex_p->getOriginalVariable().getVariableSymbolReference().getSymbol().getId().c_str() << "\"]";
    }
    const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& myG;
  }; // end class LinearizedComputationalGraphVertexLabelWriter

  class LinearizedComputationalGraphEdgeLabelWriter {
  public:
    LinearizedComputationalGraphEdgeLabelWriter(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& g) : myG(g) {};
    template <class BoostIntenalEdgeDescriptor>
    void operator()(std::ostream& out, const BoostIntenalEdgeDescriptor& v) const {
      const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge* theLCGEdge_p =
	dynamic_cast<const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge*>(boost::get(boost::get(BoostEdgeContentType(),
                                                                                                                      myG.getInternalBoostGraph()),
									                                   v));
      if (theLCGEdge_p->getEdgeLabelType() == xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge::UNIT_LABEL)
	out << "[color=\"red\"]";
      else if (theLCGEdge_p->getEdgeLabelType() == xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge::CONSTANT_LABEL)
	out << "[color=\"blue\"]";
    }
    const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& myG;
  }; // end class LinearizedComputationalGraphEdgeLabelWriter

  class LinearizedComputationalGraphPropertiesWriter {
  public:
    LinearizedComputationalGraphPropertiesWriter(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& g) : myG(g) {};
    void operator()(std::ostream& out) const {
      out << "rankdir=BT;" << std::endl;
    }
    const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& myG;
  }; // end class LinearizedComputationalGraphPropertiesWriter

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
  BasicBlockAlg::algorithm_action_3() {
    DBG_MACRO(DbgGroup::CALLSTACK,"xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::algorithm_action_3: invoked for " << debug().c_str());
    myPreaccumulationCounter.reset();
    for (SequencePList::iterator aSequencePListI = myUniqueSequencePList.begin();
	 aSequencePListI != myUniqueSequencePList.end();
	 ++aSequencePListI) { // outer loop over all items in myUniqueSequencePList
      Sequence& currentSequence (**aSequencePListI);
      PrivateLinearizedComputationalGraph& theComputationalGraph=*(currentSequence.myComputationalGraph_p);
      fillIndependentsList(theComputationalGraph);
      fillDependentsList(theComputationalGraph);
      if (currentSequence.myComputationalGraph_p->numVertices()) {

	// hand off to transformation engine, which will make JAEs and a remainder graph
	runElimination(currentSequence);
	generateAccumulationExpressions(currentSequence);
	makePropagationVariables(currentSequence);
	generateRemainderGraphPropagators(currentSequence);

      } // end if LCG has vertices
    } // end iterate over sequences
    DBG_MACRO(DbgGroup::METRIC, "BasicBlockAlg " << this
                             << ": " << myPreaccumulationCounter.debug().c_str());
    if (ourRuntimeCountersFlag) {
      //Insert Macros into the code that will be expanded to count multiplications and additions
      //Multiplication counter
      xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theSubroutineCall_p;
      theSubroutineCall_p = new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall ("countmult");
      theSubroutineCall_p->setId("inline_countmult");
      theSubroutineCall_p->addConcreteArgument(1).makeConstant(SymbolType::INTEGER_STYPE).setint(myPreaccumulationCounter.getNumMultiplications());
      // save it in the list
      myRuntimeCounterCallList.push_back(theSubroutineCall_p);
      //Addition Counter
      theSubroutineCall_p = new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall ("countadd");
      theSubroutineCall_p->setId("inline_countadd");
      theSubroutineCall_p->addConcreteArgument(1).makeConstant(SymbolType::INTEGER_STYPE).setint(myPreaccumulationCounter.getNumAdditions());
      // save it in the list
      myRuntimeCounterCallList.push_back(theSubroutineCall_p);
    }
  } // end BasicBlockAlg::algorithm_action_3()

  void BasicBlockAlg::runElimination(Sequence& aSequence) { 
    PrivateLinearizedComputationalGraph& theComputationalGraph=*(aSequence.myComputationalGraph_p);
    if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS) && DbgLoggerManager::instance()->wantTag("cg")) {     
      GraphVizDisplay::show(theComputationalGraph,
			    "OriginalFlattenedPLCG",
			    PrivateLinearizedComputationalGraphVertexLabelWriter(theComputationalGraph),
			    PrivateLinearizedComputationalGraphEdgeLabelWriter(theComputationalGraph),
			    PrivateLinearizedComputationalGraphPropertiesWriter(theComputationalGraph));
    }

    // initialize the graph transformation(s)
    switch (ourPreaccumulationMetric) {
      case PreaccumulationMetric::OPERATIONS_METRIC: {
        aSequence.addNewElimination(theComputationalGraph).initAsOperations();
        if (ourUseRandomizedHeuristicsFlag) {
          aSequence.addNewElimination(theComputationalGraph).initAsOperationsRandom();
          aSequence.addNewElimination(theComputationalGraph).initAsLSAVertex(ourIterationsParameter, ourGamma);
          //aSequence.addNewElimination(theComputationalGraph).initAsLSAFace(ourIterationsParameter, ourGamma);
        } // end randomized heuristics
        break;
      } // end OPERATIONS
      case PreaccumulationMetric::SCARCITY_METRIC: {
        aSequence.addNewElimination(theComputationalGraph).initAsScarceElimination();
        if (ourUseRandomizedHeuristicsFlag)
	  aSequence.addNewElimination(theComputationalGraph).initAsScarceRandomElimination();
        if (ourUseReroutingsFlag) {
          aSequence.addNewElimination(theComputationalGraph).initAsScarceTransformation();
          if (ourUseRandomizedHeuristicsFlag)
            aSequence.addNewElimination(theComputationalGraph).initAsScarceRandomTransformation();
        }
        break;
      } // end SCARCITY
      default: {
          THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::runElimination: unknown preaccumulation metric "
                                     << PreaccumulationMetric::toString(ourPreaccumulationMetric));
        break;
      } // end default
    } // end switch (ourPreaccumulationMetric)

    // perform the transformations and build the accumulation graph
    for (Sequence::EliminationPList::iterator elim_i = aSequence.getEliminationPList().begin();
         elim_i != aSequence.getEliminationPList().end();
         ++elim_i) {
      try {
	(*elim_i)->eliminate();	
      }
      catch(xaifBoosterCrossCountryInterface::EliminationException e) { 
	THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::runElimination: " << (*elim_i)->getDescription()
                                   << ": " << e.getReason().c_str());
      }
      (*elim_i)->buildAccumulationGraph();

      if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS) && DbgLoggerManager::instance()->wantTag("cg")) {
        if ((*elim_i)->getAccumulationGraph().numVertices()) { // don't show empty AccumulationGraph
          GraphVizDisplay::show((*elim_i)->getAccumulationGraph(),
                                "AccumulationGraph",
                                xaifBoosterCrossCountryInterface::AccumulationGraphVertexLabelWriter((*elim_i)->getAccumulationGraph()),
                                xaifBoosterCrossCountryInterface::AccumulationGraphEdgeLabelWriter((*elim_i)->getAccumulationGraph()),
                                xaifBoosterCrossCountryInterface::AccumulationGraphPropertiesWriter((*elim_i)->getAccumulationGraph()));
        }
	GraphVizDisplay::show((*elim_i)->getRemainderLCG(),
                              "RemainderLCG",
                              LinearizedComputationalGraphVertexLabelWriter((*elim_i)->getRemainderLCG()),
                              LinearizedComputationalGraphEdgeLabelWriter((*elim_i)->getRemainderLCG()),
                              LinearizedComputationalGraphPropertiesWriter((*elim_i)->getRemainderLCG()));
      }
      DBG_MACRO(DbgGroup::METRIC, "BasicBlockAlg " << this
                               << " Sequence " << &aSequence
                               << " by " << (*elim_i)->getDescription()
                               << ": " << (*elim_i)->getCounter().debug().c_str()
                               << " with " << (*elim_i)->getNumReroutings() << " reroutings");
    } // end iterate over all Eliminations for this Sequence

    aSequence.determineBestElimination(ourPreaccumulationMetric);
    DBG_MACRO(DbgGroup::METRIC, "BasicBlockAlg " << this
                             << " Sequence " << &aSequence
                             << " best is " << aSequence.getBestElimination().getDescription()
                             << ": " << aSequence.getBestElimination().getCounter().debug().c_str()
                             << " with " << aSequence.getBestElimination().getNumReroutings() << " reroutings");
    myPreaccumulationCounter.incrementBy(aSequence.getBestElimination().getCounter());
    ourPreaccumulationCounter.incrementBy(aSequence.getBestElimination().getCounter());
  } // end BasicBlockAlg::runElimination()

  void BasicBlockAlg::generateAccumulationExpressions(Sequence& aSequence) {
    xaifBoosterCrossCountryInterface::AccumulationGraph& theAccumulationGraph (aSequence.getBestElimination().getAccumulationGraph());
    //traverse graph bottom up
    theAccumulationGraph.initVisit();
    bool done = false; 
    while (!done) {
      done = true;
      //iterate over all Accumulation vertices
      xaifBoosterCrossCountryInterface::AccumulationGraph::VertexIteratorPair aAccVitPair (theAccumulationGraph.vertices());
      xaifBoosterCrossCountryInterface::AccumulationGraph::VertexIterator aAccVit (aAccVitPair.first), aAccVitEnd (aAccVitPair.second);
      for(; aAccVit != aAccVitEnd; ++aAccVit) {
	xaifBoosterCrossCountryInterface::AccumulationGraphVertex& currentAccV = *aAccVit;

	// skip visited and leaves
	if (currentAccV.wasVisited()) continue;
	if (!theAccumulationGraph.numInEdgesOf(currentAccV)) {
	  currentAccV.setVisited();
	  continue;
	}

	// ensure there are exactly two predecessors and check whether both predecessors have been visited
	xaifBoosterCrossCountryInterface::AccumulationGraph::InEdgeIteratorPair iei_pair (theAccumulationGraph.getInEdgesOf(currentAccV));
	xaifBoosterCrossCountryInterface::AccumulationGraph::InEdgeIterator iei (iei_pair.first), ie_end (iei_pair.second);
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
	   new VariableSymbolReference (theGlobalScope.getSymbolTable().addUniqueSymbol(ConceptuallyStaticInstances::instance()->getAccumulationVariableNameCreator(),
                                                                                        SymbolKind::VARIABLE,
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

  void BasicBlockAlg::evaluateAccVertex(xaifBoosterCrossCountryInterface::AccumulationGraphVertex& theAccVertex,
					const xaifBoosterCrossCountryInterface::AccumulationGraph& theAccumulationGraph) {
    // get the two predecessors
    xaifBoosterCrossCountryInterface::AccumulationGraph::ConstInEdgeIteratorPair iei_pair (theAccumulationGraph.getInEdgesOf(theAccVertex));
    xaifBoosterCrossCountryInterface::AccumulationGraph::ConstInEdgeIterator iei (iei_pair.first);
    const xaifBoosterCrossCountryInterface::AccumulationGraphVertex& firstPredV (theAccumulationGraph.getSourceOf(*iei));
    ++iei;
    const xaifBoosterCrossCountryInterface::AccumulationGraphVertex& secondPredV (theAccumulationGraph.getSourceOf(*iei));

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

  const ExpressionVertex&
  BasicBlockAlg::buildAccumulationAssignmentRecursively(const xaifBoosterCrossCountryInterface::AccumulationGraph& theAccumulationGraph,
                                                        Assignment& theNewAssignment,
                                                        const xaifBoosterCrossCountryInterface::AccumulationGraphVertex& theAccVertex) {
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

    xaifBoosterCrossCountryInterface::AccumulationGraph::ConstInEdgeIteratorPair iei_pair (theAccumulationGraph.getInEdgesOf(theAccVertex));

    // TEST FOR SHORT-CIRCUIT: extract predecessors 
    xaifBoosterCrossCountryInterface::AccumulationGraph::ConstInEdgeIterator inEdge_i (iei_pair.first);
    const xaifBoosterCrossCountryInterface::AccumulationGraphVertex& firstPred (theAccumulationGraph.getSourceOf(*inEdge_i));
    ++inEdge_i;
    const xaifBoosterCrossCountryInterface::AccumulationGraphVertex& secondPred (theAccumulationGraph.getSourceOf(*inEdge_i));

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
    for (xaifBoosterCrossCountryInterface::AccumulationGraph::ConstInEdgeIterator iei (iei_pair.first), ie_end (iei_pair.second); iei != ie_end; ++iei) {
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
    xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& theRemainderLCG (aSequence.getBestElimination().getRemainderLCG());
    const AliasMap& theAliasMap(ConceptuallyStaticInstances::instance()->getCallGraph().getAliasMap());
    xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexIteratorPair rLCGvertIP (theRemainderLCG.vertices());
    for (xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexIterator rvi (rLCGvertIP.first), rvi_end (rLCGvertIP.second); rvi != rvi_end; ++rvi) {
      const PrivateLinearizedComputationalGraphVertex& theOriginalVertex (aSequence.getBestElimination().rVertex2oVertex(*rvi));
      // for independents, check against all non-independents for alias conflicts, making new propagation variable in that case
      // See AssignmentAlg::vertexIdentification for an explanation of why we only need to worry about replacing independents.
      if (!theRemainderLCG.numInEdgesOf(*rvi)) {
	xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexIteratorPair rLCGvertIP2 (theRemainderLCG.vertices());
	xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexIterator rvi2 (rLCGvertIP2.first), rvi2_end (rLCGvertIP2.second);
	for (; rvi2 != rvi2_end; ++rvi2) { // inner iteration over all remainder vertices
	  if (!theRemainderLCG.numInEdgesOf(*rvi2)) continue; // skip other indeps
	  const PrivateLinearizedComputationalGraphVertex& theOriginalNonIndep (aSequence.getBestElimination().rVertex2oVertex(*rvi2));
	  if (theOriginalNonIndep.hasOriginalVariable() && theAliasMap.mayAlias(theOriginalVertex.getOriginalVariable().getAliasMapKey(),
										theOriginalNonIndep.getOriginalVariable().getAliasMapKey())) {
	    (*rvi).createNewPropagationVariable();
	    // set the deriv of the new propagation variable to that of the original variable
	    aSequence.myDerivativePropagator.addSetDerivToEntryPList((*rvi).getPropagationVariable(),
								     theOriginalVertex.getOriginalVariable());
	    DBG_MACRO(DbgGroup::DATA, "BasicBlockAlg::makePropagationVariables: created propagation variable for independent "
				      << theOriginalVertex.getOriginalVariable().getVariableSymbolReference().getSymbol().getId().c_str()); 
				      //<< theOriginalVertex.debug().c_str()); 
	    break; // no need to continue with this indep vertex once a replacement propagation vertex has been created
	  } // end if alias conflict possible
	} // end inner iteration over remainder vertices
	if (rvi2 == rvi2_end) // we made it through without any conflicts (no new variable had to be created)
	  (*rvi).setOriginalVariable(theOriginalVertex.getOriginalVariable(),
				     theOriginalVertex.getStatementId());
      } // end if this vertex is an independent
      else {
	if (theOriginalVertex.hasOriginalVariable())
	  (*rvi).setOriginalVariable(theOriginalVertex.getOriginalVariable(),
				     theOriginalVertex.getStatementId());
	else
	  (*rvi).createNewPropagationVariable();
      } // end non-independent
    } // end iterate over all remainder vertices
  } // end BasicBlockAlg::makePropagationVariables()

  void BasicBlockAlg::generateRemainderGraphPropagators(Sequence& aSequence) { 
    const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& theRemainderGraph (aSequence.getBestElimination().getRemainderLCG());
    aSequence.getBestElimination().getRemainderLCG().initVisit();
    bool done = false;
    while(!done) {
      done = true;
      xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstVertexIteratorPair aVertexIP(theRemainderGraph.vertices());
      for(xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstVertexIterator anLCGVertI(aVertexIP.first),anLCGvertEndI(aVertexIP.second);
	  anLCGVertI != anLCGvertEndI; ++anLCGVertI) {
	const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theRemainderTargetV = *anLCGVertI;
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
          if (doesPermitNarySax())
            propagateToRemainderVertex_narySax(theRemainderTargetV,
                                               aSequence);
          else 
            propagateToRemainderVertex(theRemainderTargetV,
                                       aSequence);
	} // end visit
      } // end iterate over all vertices
    } // end while(!done)
    aSequence.getBestElimination().getRemainderLCG().finishVisit();
  } // end BasicBlockAlg::generateRemainderGraphPropagators()

  void BasicBlockAlg::propagateToRemainderVertex(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theRemainderTargetV,
                                                 Sequence& aSequence) {
    const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& theRemainderGraph (aSequence.getBestElimination().getRemainderLCG());
    const xaifBoosterCrossCountryInterface::Elimination::RemainderEdge2AccumulationVertexMap&
     theRemainderEdge2AccumulationVertexMap (aSequence.getBestElimination().getRemainderEdge2AccumulationVertexMap()); 
    xaifBoosterCrossCountryInterface::Elimination::RemainderEdge2AccumulationVertexMap::const_iterator map_it;
    std::list<const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge*> PassiveInedges,LinearOneInedges,LinearMinusOneInedges,LinearInedges,NonlinearInedges;

    // first iterate over inedges to build up lists of different types of partial derivative kinds
    xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstInEdgeIteratorPair inEdgeIP (theRemainderGraph.getInEdgesOf(theRemainderTargetV));
    for (xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstInEdgeIterator iei (inEdgeIP.first), ie_end (inEdgeIP.second);
         iei != ie_end; ++iei) {
      // Find the AccumulationGraphVertex that corresponds to this RemainderGraphEdge
      if ((map_it = theRemainderEdge2AccumulationVertexMap.find(&*iei)) == theRemainderEdge2AccumulationVertexMap.end())
        THROW_LOGICEXCEPTION_MACRO("BasicBlockPreaccumulation::BasicBlockAlg::propagateToRemainderVertex:"
                                << " could not find AccumulationGraphVertex for RemainderGraphEdge in theRemainderEdge2AccumulationVertexMap");
      switch ((*map_it->second).getPartialDerivativeKind()) {
        case PartialDerivativeKind::PASSIVE:
          PassiveInedges.push_back(&*iei);
          break;
        case PartialDerivativeKind::LINEAR_ONE:
          LinearOneInedges.push_back(&*iei);
          break;
        case PartialDerivativeKind::LINEAR_MINUS_ONE:
          LinearMinusOneInedges.push_back(&*iei);
          break;
        case PartialDerivativeKind::LINEAR:
          LinearInedges.push_back(&*iei);
          break;
        case PartialDerivativeKind::NONLINEAR:
          NonlinearInedges.push_back(&*iei);
          break;
        default:
           THROW_LOGICEXCEPTION_MACRO("BasicBlockPreaccumulation::BasicBlockAlg::BasicBlockAlg::propagateToRemainderVertex:"
                                      << " invalid PDK (" << PartialDerivativeKind::toString((*map_it->second).getPartialDerivativeKind()) << ") for saxpy factor");
          break;
      } // end switch on PDK
    } // end for all inedges

    bool isZero = true;

    // LINEAR_ONE: SetDeriv and IncDeriv
    for (std::list<const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge*>::const_iterator loi = LinearOneInedges.begin();
         loi != LinearOneInedges.end(); ++loi) {
      if (isZero) // SetDeriv
        aSequence.myDerivativePropagator.addSetDerivToEntryPList(theRemainderTargetV.getPropagationVariable(),
                                                                 theRemainderGraph.getSourceOf(**loi).getPropagationVariable());
      else // IncDeriv
        aSequence.myDerivativePropagator.addIncDerivToEntryPList(theRemainderTargetV.getPropagationVariable(),
                                                                 theRemainderGraph.getSourceOf(**loi).getPropagationVariable());
      isZero = false;
    }
    // LINEAR_MINUS_ONE: SetNegDeriv and DecDeriv
    for (std::list<const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge*>::const_iterator lmoi = LinearMinusOneInedges.begin();
         lmoi != LinearMinusOneInedges.end(); ++lmoi) {
      if (isZero) // SetNegDeriv
        aSequence.myDerivativePropagator.addSetNegDerivToEntryPList(theRemainderTargetV.getPropagationVariable(),
                                                                    theRemainderGraph.getSourceOf(**lmoi).getPropagationVariable());
      else // DecDeriv
        aSequence.myDerivativePropagator.addDecDerivToEntryPList(theRemainderTargetV.getPropagationVariable(),
                                                                 theRemainderGraph.getSourceOf(**lmoi).getPropagationVariable());
      isZero = false;
    }
    // LINEAR
    for (std::list<const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge*>::const_iterator li = LinearInedges.begin();
         li != LinearInedges.end(); ++li) {
      Constant theConstantFactor (SymbolType::REAL_STYPE, false);
      theConstantFactor.setId(1);
      theConstantFactor.setdouble((*theRemainderEdge2AccumulationVertexMap.find(*li)->second).getValue());
      xaifBoosterDerivativePropagator::DerivativePropagatorSaxpy& theNewSaxpy
       (aSequence.myDerivativePropagator.addSaxpyToEntryPList(theConstantFactor,
                                                              theRemainderGraph.getSourceOf(**li).getPropagationVariable(),
                                                              theRemainderTargetV.getPropagationVariable()));
      if (isZero)
        theNewSaxpy.useAsSax();
      isZero = false;
    }
    // NONLINEAR - sax/saxpy
    for (std::list<const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge*>::const_iterator nli = NonlinearInedges.begin();
         nli != NonlinearInedges.end(); ++nli) {
      xaifBoosterDerivativePropagator::DerivativePropagatorSaxpy& theNewSaxpy
       (aSequence.myDerivativePropagator.addSaxpyToEntryPList((*theRemainderEdge2AccumulationVertexMap.find(*nli)->second).getLHSVariable(),
                                                              theRemainderGraph.getSourceOf(**nli).getPropagationVariable(),
                                                              theRemainderTargetV.getPropagationVariable()));
      if (isZero)
        theNewSaxpy.useAsSax();
      isZero = false;
    }
  } // end BasicBlockAlg::propagateToRemainderVertex()

  void BasicBlockAlg::propagateToRemainderVertex_narySax(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theRemainderTargetV,
                                                         Sequence& aSequence) {
    const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& theRemainderGraph (aSequence.getBestElimination().getRemainderLCG());
    const xaifBoosterCrossCountryInterface::Elimination::RemainderEdge2AccumulationVertexMap&
     theRemainderEdge2AccumulationVertexMap (aSequence.getBestElimination().getRemainderEdge2AccumulationVertexMap()); 
    xaifBoosterCrossCountryInterface::Elimination::RemainderEdge2AccumulationVertexMap::const_iterator map_it;
    xaifBoosterDerivativePropagator::DerivativePropagatorSaxpy* theSax_p (NULL);

    // we will create a single SAX operation that encompasses the derivative components from all the inedges
    bool allPassive = true;
    xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstInEdgeIteratorPair inEdgeIP (theRemainderGraph.getInEdgesOf(theRemainderTargetV));
    for (xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstInEdgeIterator iei (inEdgeIP.first), ie_end (inEdgeIP.second);
         iei != ie_end; ++iei) {
      // Find the AccumulationGraphVertex that corresponds to this RemainderGraphEdge
      if ((map_it = theRemainderEdge2AccumulationVertexMap.find(&*iei)) == theRemainderEdge2AccumulationVertexMap.end())
        THROW_LOGICEXCEPTION_MACRO("BasicBlockPreaccumulation::BasicBlockAlg::propagateToRemainderVertex:"
                                << " could not find AccumulationGraphVertex for RemainderGraphEdge in theRemainderEdge2AccumulationVertexMap");
      const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theRemainderSourceV (theRemainderGraph.getSourceOf(*iei));
      const xaifBoosterCrossCountryInterface::AccumulationGraphVertex& theAccVertex (*map_it->second);
      if (theAccVertex.getPartialDerivativeKind() == PartialDerivativeKind::PASSIVE)
        continue; // skip PASSIVE inedges
      allPassive = false;
      switch (theAccVertex.getPartialDerivativeKind()) {
        case PartialDerivativeKind::LINEAR_ONE: {
          //LinearOneInedges.push_back(&*iei);
          Constant theTempConstant (SymbolType::INTEGER_STYPE, false);
          theTempConstant.setId(1);
          theTempConstant.setint(1);
          if (theSax_p)
            theSax_p->addAX(theTempConstant,
                            theRemainderSourceV.getPropagationVariable());
          else
            theSax_p = &(aSequence.myDerivativePropagator.addSaxpyToEntryPList(theTempConstant,
                                                                               theRemainderSourceV.getPropagationVariable(),
                                                                               theRemainderTargetV.getPropagationVariable()));
          break;
        }
        case PartialDerivativeKind::LINEAR_MINUS_ONE: {
          Constant theTempConstant (SymbolType::INTEGER_STYPE, false);
          theTempConstant.setId(1);
          theTempConstant.setint(-1);
          if (theSax_p)
            theSax_p->addAX(theTempConstant,
                            theRemainderSourceV.getPropagationVariable());
          else
            theSax_p = &(aSequence.myDerivativePropagator.addSaxpyToEntryPList(theTempConstant,
                                                                               theRemainderSourceV.getPropagationVariable(),
                                                                               theRemainderTargetV.getPropagationVariable()));
          break;
        }
        case PartialDerivativeKind::LINEAR: {
          Constant theTempConstant (SymbolType::REAL_STYPE, false);
          theTempConstant.setId(1);
          theTempConstant.setdouble(theAccVertex.getValue());
          if (theSax_p)
            theSax_p->addAX(theTempConstant,
                            theRemainderSourceV.getPropagationVariable());
          else
            theSax_p = &(aSequence.myDerivativePropagator.addSaxpyToEntryPList(theTempConstant,
                                                                               theRemainderSourceV.getPropagationVariable(),
                                                                               theRemainderTargetV.getPropagationVariable()));
          break;
        }
        case PartialDerivativeKind::NONLINEAR: {
          if (theSax_p)
            theSax_p->addAX(theAccVertex.getLHSVariable(),
                            theRemainderSourceV.getPropagationVariable());
          else
            theSax_p = &(aSequence.myDerivativePropagator.addSaxpyToEntryPList(theAccVertex.getLHSVariable(),
                                                                               theRemainderSourceV.getPropagationVariable(),
                                                                               theRemainderTargetV.getPropagationVariable()));
          break;
        }
        default:
          THROW_LOGICEXCEPTION_MACRO("BasicBlockPreaccumulation::BasicBlockAlg::BasicBlockAlg::propagateToRemainderVertex:"
                                     << " invalid PDK (" << PartialDerivativeKind::toString((*map_it->second).getPartialDerivativeKind()) << ") for saxpy factor");
          break;
      } // end switch on PDK
    } // end for all inedges
    if (!theSax_p)
      THROW_LOGICEXCEPTION_MACRO("BasicBlockPreaccumulation::BasicBlockAlg::BasicBlockAlg::propagateToRemainderVertex:"
                                 << " remainder vertex " << theRemainderTargetV.debug() << " has no inedges with non-passive partial derivative kind");
    // this will be the sole propagation entry for theRemainderTargetV
    theSax_p->useAsSax();
  } // end BasicBlockAlg::propagateToRemainderVertex_narySax()

  void BasicBlockAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  PrivateLinearizedComputationalGraph& 
  BasicBlockAlg::getComputationalGraph(const Assignment& theAssignment) {
    DBG_MACRO(DbgGroup::CALLSTACK,"xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::getComputationalGraph entering with "
	      << debug().c_str());
    Sequence* theSequence_p=0;
    if(myBasicBlockElementSequencePPairList.empty()) { 
      // not initialized
      for (PlainBasicBlock::BasicBlockElementList::const_iterator i=
	     getContaining().getBasicBlockElementList().begin();
	   i!=getContaining().getBasicBlockElementList().end();
	   ++i)
	myBasicBlockElementSequencePPairList.push_back(BasicBlockElementSequencePPair(*i,0));
    }
    for (BasicBlockElementSequencePPairList::iterator i = myBasicBlockElementSequencePPairList.begin();
	 i != myBasicBlockElementSequencePPairList.end();
	 ++i) 
      if ((*i).first==&theAssignment) { 
	if(!(*i).second) { // nothing assigned yet
	  incrementGlobalAssignmentCounter();
	  if(i != myBasicBlockElementSequencePPairList.begin()) { 
	    // have a predecessor: 
	    --i;
	    if(!(*i).second) { 
	      // nothing assigned yet, which means this is not an 
	      // assignment (unless we call this out of order) this is how 
	      // we handle splits for subroutine calls
	      theSequence_p=new Sequence;
	      incrementGlobalSequenceCounter();
	      theSequence_p->myFirstElement_p=theSequence_p->myLastElement_p=&theAssignment;
	      myUniqueSequencePList.push_back(theSequence_p);
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
	    incrementGlobalSequenceCounter();
	    theSequence_p->myFirstElement_p=theSequence_p->myLastElement_p=&theAssignment;
	    myUniqueSequencePList.push_back(theSequence_p);
	  }
	  (*i).second=theSequence_p;
	} // end if nothing assigned
	else
	  theSequence_p=(*i).second;
	break;
      } // end if 
    if (!theSequence_p)
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::getComputationalGraph: this basic block does not have element "
				 << theAssignment.debug().c_str());
    DBG_MACRO(DbgGroup::CALLSTACK,"xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::getComputationalGraph leaving with "
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

  void BasicBlockAlg::useRandomizedHeuristics() {
    ourUseRandomizedHeuristicsFlag = true;
  }

  void BasicBlockAlg::setPreaccumulationMetric(PreaccumulationMetric::PreaccumulationMetric_E aMetric) {
    ourPreaccumulationMetric = aMetric;
  } // end BasicBlockAlg::setPreaccumulationMetric()

  void BasicBlockAlg::useReroutings() { 
    ourUseReroutingsFlag = true;
  } // end BasicBlockAlg::useReroutings()

  const StatementIdList& BasicBlockAlg::getAssignmentIdList()const { 
    return myAssignmentIdList;
  } 

  void BasicBlockAlg::addMyselfToAssignmentIdList(const Assignment& anAssignment) {
    myAssignmentIdList.push_back(anAssignment.getId());
  } // end BasicBlockAlg::addMyselfToAssignmentIdList()

  void BasicBlockAlg::setRuntimeCounters(){
    ourRuntimeCountersFlag = true;
  }
  std::string BasicBlockAlg::makeUniqueId() { 
    static unsigned anId=0;
    std::ostringstream ostr;
    ostr << "_jacobian_accumulation_" << anId++ << std::ends;
    return ostr.str();
  }

} // end namespace xaifBoosterBasicBlockPreaccumulation
 
