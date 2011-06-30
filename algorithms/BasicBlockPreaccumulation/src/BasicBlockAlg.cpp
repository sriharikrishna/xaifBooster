// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

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

#include "xaifBooster/algorithms/TypeChange/inc/TemporariesHelper.hpp"

#include "xaifBooster/algorithms/Linearization/inc/ExpressionEdgeAlg.hpp"

#include "xaifBooster/algorithms/CrossCountryInterface/inc/AccumulationGraph.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/EliminationException.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdge.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertex.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdgeAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertexAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphWriters.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PreaccumulationCounter.hpp" 
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/RemainderGraphWriters.hpp"


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
	(*i).second = AlgFactoryManager::instance()->getSequenceFactory()->makeNewSequence();
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
	  for (Sequence::InlinableSubroutineCallPList::const_iterator ali=aSequence_p->getAllocationList().begin();
	       ali!=aSequence_p->getAllocationList().end();
	       ++ali) 
	    (*(ali))->printXMLHierarchy(os);
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
	  DBG_TAG_MACRO(DbgGroup::DATA, "depList", "BasicBlockAlg::fixUpDependentsList: removing dependent " 
			<< myPrivateVertex.getOriginalVariable().debug().c_str()
			<< " list size: " << theDepVertexPList.size()); 
	  theComputationalGraph.removeFromDependentList(myPrivateVertex);
	  continue;
	}
      }
      else { 
	if (DbgLoggerManager::instance()->isSelected(DbgGroup::DATA)) { 
	  if (theComputationalGraph.numOutEdgesOf(myPrivateVertex)) { 
	    DBG_TAG_MACRO(DbgGroup::DATA,  "depList",  "BasicBlockAlg::fixUpDependentsList: keeping non-maximal dependent " << myPrivateVertex.getOriginalVariable().debug().c_str() << " key is " << aDuUdMapKey.debug().c_str() << " use result is " << theDuUdMapUseResult.myAnswer << " lists are " << theComputationalGraph.getStatementIdLists().debug().c_str()); 
	  }
	  else { 
	    DBG_TAG_MACRO(DbgGroup::DATA,  "depList", "BasicBlockAlg::fixUpDependentsList: keeping regular dependent " << myPrivateVertex.getOriginalVariable().debug().c_str() << " key is " << aDuUdMapKey.debug().c_str()); 
	  }
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
      DBG_MACRO(DbgGroup::METRIC, "BasicBlockAlg " << this
		<< " Sequence " << &aSequence
		<< " by " << (*elim_i)->getDescription()
		<< ": " << (*elim_i)->getCounter().debug().c_str()
		<< " with " << (*elim_i)->getNumReroutings() << " reroutings");
    } // end iterate over all Eliminations for this Sequence

    aSequence.determineBestElimination(ourPreaccumulationMetric);
    if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS) && DbgLoggerManager::instance()->wantTag("cg")) {
      if (aSequence.getBestElimination().getAccumulationGraph().numVertices()) { // don't show empty AccumulationGraph
	GraphVizDisplay::show(aSequence.getBestElimination().getAccumulationGraph(),
			      "AccumulationGraph",
			      xaifBoosterCrossCountryInterface::AccumulationGraphVertexLabelWriter(aSequence.getBestElimination().getAccumulationGraph()),
			      xaifBoosterCrossCountryInterface::AccumulationGraphEdgeLabelWriter(aSequence.getBestElimination().getAccumulationGraph()),
			      xaifBoosterCrossCountryInterface::AccumulationGraphPropertiesWriter(aSequence.getBestElimination().getAccumulationGraph()));
      }
      GraphVizDisplay::show(aSequence.getBestRemainderGraph(),
			    "RemainderGraph",
			    RemainderGraphVertexLabelWriter(aSequence.getBestRemainderGraph()),
			    RemainderGraphEdgeLabelWriter(aSequence.getBestRemainderGraph()),
			    RemainderGraphPropertiesWriter(aSequence.getBestRemainderGraph()));
    }
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
	  // make the RHS
	  buildAccumulationAssignmentRecursively(theAccumulationGraph,
						 theNewAssignment,
						 currentAccV);
	  Scope& theCurrentCfgScope (ConceptuallyStaticInstances::instance()->getTraversalStack().getCurrentCallGraphVertexInstance().getControlFlowGraph().getScope());
	  xaifBoosterTypeChange::TemporariesHelper aHelper(
							   "xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::generateAccumulationExpressions",
							   theNewAssignment.getRHS(),
							   theNewAssignment.getRHS().getMaxVertex());
	  VariableSymbolReference* theVariableSymbolReference_p =
	    new VariableSymbolReference (aHelper.makeTempSymbol(theCurrentCfgScope,
								ConceptuallyStaticInstances::instance()->getAccumulationVariableNameCreator(),
								false),
					 theCurrentCfgScope);
	  theVariableSymbolReference_p->setId("1");
	  theVariableSymbolReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::generateAccumulationExpressions::JAE_LHS");
	  theNewAssignment.getLHS().supplyAndAddVertexInstance(*theVariableSymbolReference_p);
	  theNewAssignment.getLHS().getAliasMapKey().setTemporary();
	  theNewAssignment.getLHS().getDuUdMapKey().setTemporary();
	  currentAccV.setLHSVariable(theNewAssignment.getLHS());
	  if (aHelper.needsAllocation()) {
	    // add the allocation
	    aSequence.addAllocation(theNewAssignment.getLHS().getVariableSymbolReference(),
				    aHelper.allocationModel());
	  }
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
    RemainderGraph& theRemainderGraph (aSequence.getBestRemainderGraph());
    const AliasMap& theAliasMap(ConceptuallyStaticInstances::instance()->getCallGraph().getAliasMap());
    RemainderGraph::VertexIteratorPair rLCGvertIP (theRemainderGraph.vertices());
    for (RemainderGraph::VertexIterator rvi (rLCGvertIP.first), rvi_end (rLCGvertIP.second); rvi != rvi_end; ++rvi) {
      RemainderGraphVertex& theRemainderGraphVertex(dynamic_cast<RemainderGraphVertex&>(*rvi));
      const PrivateLinearizedComputationalGraphVertex& theOriginalVertex (theRemainderGraph.getOriginalVertexFor(theRemainderGraphVertex));
      // for independents, check against all non-independents for alias conflicts, making new propagation variable in that case
      // See AssignmentAlg::vertexIdentification for an explanation of why we only need to worry about replacing independents.
      if (!theRemainderGraph.numInEdgesOf(theRemainderGraphVertex)) {
	theRemainderGraphVertex.setOriginalVariable(theOriginalVertex.getOriginalVariable(),
						    theOriginalVertex.getStatementId());
	RemainderGraph::VertexIteratorPair rLCGvertIP2 (theRemainderGraph.vertices());
	RemainderGraph::VertexIterator rvi2 (rLCGvertIP2.first), rvi2_end (rLCGvertIP2.second);
	for (; rvi2 != rvi2_end; ++rvi2) { // inner iteration over all remainder vertices
	  if (!theRemainderGraph.numInEdgesOf(*rvi2)) continue; // skip other indeps
	  RemainderGraphVertex& theRemainderGraphVertex2(dynamic_cast<RemainderGraphVertex&>(*rvi2));
	  const PrivateLinearizedComputationalGraphVertex& theOriginalNonIndep (theRemainderGraph.getOriginalVertexFor(theRemainderGraphVertex2));
	  if (theOriginalNonIndep.hasOriginalVariable() && theAliasMap.mayAlias(theOriginalVertex.getOriginalVariable().getAliasMapKey(),
										theOriginalNonIndep.getOriginalVariable().getAliasMapKey())) {
	    theRemainderGraphVertex.replacePropagationVariable(aSequence);
	    // set the deriv of the new propagation variable to that of the original variable
	    aSequence.myDerivativePropagator.addSetDerivToEntryPList(theRemainderGraphVertex.getPropagationVariable(),
								     theOriginalVertex.getOriginalVariable());
	    DBG_MACRO(DbgGroup::DATA, "BasicBlockAlg::makePropagationVariables: created propagation variable for independent "
		      << theOriginalVertex.getOriginalVariable().getVariableSymbolReference().getSymbol().getId().c_str()); 
	    //<< theOriginalVertex.debug().c_str()); 
	    break; // no need to continue with this indep vertex once a replacement propagation vertex has been created
	  } // end if alias conflict possible
	} // end inner iteration over remainder vertices
      } // end if this vertex is an independent
      else {
	if (theOriginalVertex.hasOriginalVariable()) {
	  theRemainderGraphVertex.setOriginalVariable(theOriginalVertex.getOriginalVariable(),
						      theOriginalVertex.getStatementId());
        }
	else {
          // find a variable to match to
          RemainderGraph::InEdgeIteratorPair inEdgeIP (theRemainderGraph.getInEdgesOf(theRemainderGraphVertex));
          RemainderGraph::InEdgeIterator iei (inEdgeIP.first), ie_end (inEdgeIP.second);
          for (; iei != ie_end; ++iei) {
            // ultimately we may need topsort...
            //if (!theRemainderGraph.getSourceOf(*iei).wasVisited()) break;
            theRemainderGraphVertex.createNewPropagationVariable(aSequence,(dynamic_cast<RemainderGraphVertex&>(theRemainderGraph.getSourceOf(*iei))).getPropagationVariable());
            break;
          }
        } 
      } // end non-independent
    } // end iterate over all remainder vertices
  } // end BasicBlockAlg::makePropagationVariables()

  void BasicBlockAlg::generateRemainderGraphPropagators(Sequence& aSequence) { 
    const RemainderGraph& theRemainderGraph (aSequence.getBestRemainderGraph());
    aSequence.getBestRemainderGraph().initVisit();
    bool done = false;
    while(!done) {
      done = true;
      RemainderGraph::ConstVertexIteratorPair aVertexIP(theRemainderGraph.vertices());
      for(RemainderGraph::ConstVertexIterator anLCGVertI(aVertexIP.first),anLCGvertEndI(aVertexIP.second);
	  anLCGVertI != anLCGvertEndI; ++anLCGVertI) {
	const RemainderGraphVertex& theRemainderTargetV(dynamic_cast<const RemainderGraphVertex&>(*anLCGVertI));
	// skip visited vertices
	if (theRemainderTargetV.wasVisited()) continue;
	// skip minimal vertices
	if (!theRemainderGraph.numInEdgesOf(theRemainderTargetV)) {
	  theRemainderTargetV.setVisited();
	  continue;
	}
	// check whether predecessors have been visited
	RemainderGraph::ConstInEdgeIteratorPair inEdgeIP (theRemainderGraph.getInEdgesOf(theRemainderTargetV));
	RemainderGraph::ConstInEdgeIterator iei (inEdgeIP.first), ie_end (inEdgeIP.second);
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
    aSequence.getBestRemainderGraph().finishVisit();
  } // end BasicBlockAlg::generateRemainderGraphPropagators()

  void BasicBlockAlg::propagateToRemainderVertex(const RemainderGraphVertex& theRemainderTargetV,
                                                 Sequence& aSequence) {
    const RemainderGraph& theRemainderGraph (aSequence.getBestRemainderGraph());
    std::list<const RemainderGraphEdge*> passiveInEdges,linearOneInEdges,linearMinusOneInEdges,linearInEdges,nonlinearInEdges;

    // first iterate over inedges to build up lists of different types of partial derivative kinds
    RemainderGraph::ConstInEdgeIteratorPair inEdgeIP (theRemainderGraph.getInEdgesOf(theRemainderTargetV));
    for (RemainderGraph::ConstInEdgeIterator iei (inEdgeIP.first), ie_end (inEdgeIP.second);
         iei != ie_end; ++iei) {
      const xaifBoosterCrossCountryInterface::AccumulationGraphVertex& theAccVertex (theRemainderGraph.getAccumulationGraphVertexFor(dynamic_cast<const RemainderGraphEdge&>(*iei)));
      const RemainderGraphEdge& theRemainderGraphEdge(dynamic_cast<const RemainderGraphEdge&>(*iei));
      switch (theAccVertex.getPartialDerivativeKind()) {
      case PartialDerivativeKind::PASSIVE:
	passiveInEdges.push_back(&theRemainderGraphEdge);
	break;
      case PartialDerivativeKind::LINEAR_ONE:
	linearOneInEdges.push_back(&theRemainderGraphEdge);
	break;
      case PartialDerivativeKind::LINEAR_MINUS_ONE:
	linearMinusOneInEdges.push_back(&theRemainderGraphEdge);
	break;
      case PartialDerivativeKind::LINEAR:
	linearInEdges.push_back(&theRemainderGraphEdge);
	break;
      case PartialDerivativeKind::NONLINEAR:
	nonlinearInEdges.push_back(&theRemainderGraphEdge);
	break;
      default:
	THROW_LOGICEXCEPTION_MACRO("BasicBlockPreaccumulation::BasicBlockAlg::BasicBlockAlg::propagateToRemainderVertex:"
				   << " invalid PDK (" << PartialDerivativeKind::toString(theAccVertex.getPartialDerivativeKind()) << ") for saxpy factor");
	break;
      } // end switch on PDK
    } // end for all inedges

    bool isZero = true;

    // LINEAR_ONE: SetDeriv and IncDeriv
    for (std::list<const RemainderGraphEdge*>::const_iterator loi = linearOneInEdges.begin();
         loi != linearOneInEdges.end(); ++loi) {
      const RemainderGraphVertex& theSourceVertex(dynamic_cast<const RemainderGraphVertex&>(theRemainderGraph.getSourceOf(**loi)));
      if (isZero) // SetDeriv
        aSequence.myDerivativePropagator.addSetDerivToEntryPList(theRemainderTargetV.getPropagationVariable(),
                                                                 theSourceVertex.getPropagationVariable());
      else // IncDeriv
        aSequence.myDerivativePropagator.addIncDerivToEntryPList(theRemainderTargetV.getPropagationVariable(),
                                                                 theSourceVertex.getPropagationVariable());
      isZero = false;
    }
    // LINEAR_MINUS_ONE: SetNegDeriv and DecDeriv
    for (std::list<const RemainderGraphEdge*>::const_iterator lmoi = linearMinusOneInEdges.begin();
         lmoi != linearMinusOneInEdges.end(); ++lmoi) {
      const RemainderGraphVertex& theSourceVertex(dynamic_cast<const RemainderGraphVertex&>(theRemainderGraph.getSourceOf(**lmoi)));
      if (isZero) // SetNegDeriv
        aSequence.myDerivativePropagator.addSetNegDerivToEntryPList(theRemainderTargetV.getPropagationVariable(),
                                                                    theSourceVertex.getPropagationVariable());
      else // DecDeriv
        aSequence.myDerivativePropagator.addDecDerivToEntryPList(theRemainderTargetV.getPropagationVariable(),
                                                                 theSourceVertex.getPropagationVariable());
      isZero = false;
    }
    // LINEAR
    for (std::list<const RemainderGraphEdge*>::const_iterator li = linearInEdges.begin();
         li != linearInEdges.end(); ++li) {
      Constant theConstantFactor (SymbolType::REAL_STYPE, false);
      theConstantFactor.setId(1);
      theConstantFactor.setdouble(theRemainderGraph.getAccumulationGraphVertexFor(**li).getValue());
      xaifBoosterDerivativePropagator::DerivativePropagatorSaxpy& theNewSaxpy
	(aSequence.myDerivativePropagator.addSaxpyToEntryPList(theConstantFactor,
							       (dynamic_cast<const RemainderGraphVertex&>(theRemainderGraph.getSourceOf(**li))).getPropagationVariable(),
							       theRemainderTargetV.getPropagationVariable()));
      if (isZero)
        theNewSaxpy.useAsSax();
      isZero = false;
    }
    // NONLINEAR - sax/saxpy
    for (std::list<const RemainderGraphEdge*>::const_iterator nli = nonlinearInEdges.begin();
         nli != nonlinearInEdges.end(); ++nli) {
      xaifBoosterDerivativePropagator::DerivativePropagatorSaxpy& theNewSaxpy
	(aSequence.myDerivativePropagator.addSaxpyToEntryPList(theRemainderGraph.getAccumulationGraphVertexFor(**nli).getLHSVariable(),
							       (dynamic_cast<const RemainderGraphVertex&>(theRemainderGraph.getSourceOf(**nli))).getPropagationVariable(),
							       theRemainderTargetV.getPropagationVariable()));
      if (isZero)
        theNewSaxpy.useAsSax();
      isZero = false;
    }
  } 

  void BasicBlockAlg::propagateToRemainderVertex_narySax(const RemainderGraphVertex& theRemainderTargetV,
                                                         Sequence& aSequence) {
    const RemainderGraph& theRemainderGraph (aSequence.getBestRemainderGraph());
    xaifBoosterDerivativePropagator::DerivativePropagatorSaxpy* theSax_p (NULL);
    // we will create a single SAX operation that encompasses the derivative components from all the inedges
    bool allPassive = true;
    RemainderGraph::ConstInEdgeIteratorPair inEdgeIP (theRemainderGraph.getInEdgesOf(theRemainderTargetV));
    for (RemainderGraph::ConstInEdgeIterator iei (inEdgeIP.first), ie_end (inEdgeIP.second);
         iei != ie_end; ++iei) {
      const RemainderGraphVertex& theRemainderSourceV (dynamic_cast<const RemainderGraphVertex&>(theRemainderGraph.getSourceOf(*iei)));
      const xaifBoosterCrossCountryInterface::AccumulationGraphVertex& theAccVertex (theRemainderGraph.getAccumulationGraphVertexFor(dynamic_cast<const RemainderGraphEdge&>(*iei)));
      if (theAccVertex.getPartialDerivativeKind() == PartialDerivativeKind::PASSIVE)
        continue; // skip PASSIVE inedges
      allPassive = false;
      switch (theAccVertex.getPartialDerivativeKind()) {
      case PartialDerivativeKind::LINEAR_ONE: {
	//linearOneInEdges.push_back(&*iei);
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
				   << " invalid PDK (" << PartialDerivativeKind::toString(theAccVertex.getPartialDerivativeKind()) << ") for saxpy factor");
	break;
      } // end switch on PDK
    } // end for all inedges
    if (!theSax_p)
      THROW_LOGICEXCEPTION_MACRO("BasicBlockPreaccumulation::BasicBlockAlg::BasicBlockAlg::propagateToRemainderVertex:"
                                 << " remainder vertex " << theRemainderTargetV.debug() << " has no inedges with non-passive partial derivative kind");
    // this will be the sole propagation entry for theRemainderTargetV
    theSax_p->useAsSax();
  } 

  void BasicBlockAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  bool
  BasicBlockAlg::hasExpression(const Expression& anExpression) const {
    for (SequencePList::const_iterator seqPI = myUniqueSequencePList.begin(); seqPI != myUniqueSequencePList.end(); ++seqPI)
      if ((*seqPI)->hasExpression(anExpression))
        return true;
    return xaifBooster::BasicBlockAlgBase::hasExpression(anExpression);
  } // end BasicBlockAlg::hasExpression()

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
	      theSequence_p = AlgFactoryManager::instance()->getSequenceFactory()->makeNewSequence();
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
	    theSequence_p = AlgFactoryManager::instance()->getSequenceFactory()->makeNewSequence();
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
 
