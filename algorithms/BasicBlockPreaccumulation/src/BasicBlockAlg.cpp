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
#include "xaifBooster/system/inc/BasicBlockAlgBase.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/Intrinsic.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/Constant.hpp"
#include "xaifBooster/system/inc/Marker.hpp"

#include "xaifBooster/algorithms/TypeChange/inc/TemporariesHelper.hpp"

#include "xaifBooster/algorithms/Linearization/inc/ExpressionEdgeAlg.hpp"

#include "xaifBooster/algorithms/CrossCountryInterface/inc/AccumulationGraph.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/EliminationException.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/AssignmentAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdge.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertex.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdgeAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertexAlgFactory.hpp"
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
  bool BasicBlockAlg::ourOneGraphPerStatementFlag = false;

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
    for (CFlattenedBasicBlockElementPList::iterator i(myFlattenedBasicBlockElementPList.begin());
         i != myFlattenedBasicBlockElementPList.end(); ++i)
      if (*i) // should always be true
	delete *i;
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
    DBG_MACRO(DbgGroup::CALLSTACK,"xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::printXMLHierarchy: invoked for " << debug().c_str());
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
    for (CFlattenedBasicBlockElementPList::const_iterator aFBBEi(myFlattenedBasicBlockElementPList.begin());
         aFBBEi != myFlattenedBasicBlockElementPList.end(); ++aFBBEi) {
      const FlattenedBasicBlockElement& theFBBE(**aFBBEi);
      switch(theFBBE.myType) {
        case MARKER:
          theFBBE.myRef.myMarker_p->printXMLHierarchy(os);
          break;
        case SUBROUTINE_CALL:
          theFBBE.myRef.mySubroutineCall_p->printXMLHierarchy(os);
          break;
        case NONINLINABLE_ASSIGNMENT:
          theFBBE.myRef.myNonInlinableAssignment_p->printXMLHierarchy(os);
          break;
        case SEQUENCE: {
          const Sequence& theSequence(*theFBBE.myRef.mySequence_p);
          theSequence.printXMLHierarchyImpl(os);
          // that includes the accumulator
          (aPrintDerivativePropagator_fp)(os,
                                          *this,
                                          theSequence.myDerivativePropagator);
          break;
        }
        default:
          THROW_LOGICEXCEPTION_MACRO("xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::printXMLHierarchyImpl: unexpected FBBE type")
          break;
      } // end switch
    } // end iterate over myFlattenedBasicBlockElementPList
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

  std::string
  BasicBlockAlg::debug() const {
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg[" << BasicBlockAlgBase::debug().c_str()
        << ",myContaining=" << getContaining().debug().c_str()
        << ",myUniqueSequencePList.size()=" << myUniqueSequencePList.size()
        << ",myAssignmentIdList.size()=" << getAssignmentIdList().size()
        << "]" << std::ends;
    return out.str();
  }

  void 
  BasicBlockAlg::algorithm_action_2() {
    DBG_MACRO(DbgGroup::CALLSTACK,"xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::algorithm_action_2(flatten elements into sequences): invoked for " << debug().c_str());
    if (!myFlattenedBasicBlockElementPList.empty())
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::algorithm_action_2: cannot be run twice")
    Sequence* currentSequence_p(NULL); // the sequence currently being built
    // reasons for a split (ending the current sequence and beginning a new one):
    // (1): any subroutine call (our analysis isn't comprehensive enough)
    // (2): a nonInlinableIntrinsic Assignment
    // (3): ourOneGraphPerStatementFlag is true 
    // (4): an active assignment LHS is possibly aliased with  a previous (active?) LHS within this sequence
    //     (and ourPermitAliasedLHSsFlag is false)
    // In other words, assignments are added to the current assignment unless
    // - they are noninlinable
    // - they are active and the LHS may alias a preceeding (active?) LHS
    const PlainBasicBlock::BasicBlockElementList& theBBEList(getContaining().getBasicBlockElementList());
    for (PlainBasicBlock::BasicBlockElementList::const_iterator aBBEi(theBBEList.begin()); aBBEi != theBBEList.end(); ++aBBEi) {
      //const BasicBlockElement& currentBBE(**aBBEi);
      // determine the type of BBE (Assignment, Marker, SubroutineCall, InlinableSubroutineCall)
      // INLINABLESUBCALL?
      const xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* tryCastInlinable_p(
        dynamic_cast<const xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall*>(*aBBEi)
      );
      if (tryCastInlinable_p) { // the last non-assignment type of BBE
        THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::algorithm_action_2: unexpected BBE type for " << tryCastInlinable_p->debug().c_str())
      }
      // MARKER
      const Marker* tryCastMarker_p(dynamic_cast<const Marker*>(*aBBEi));
      if (tryCastMarker_p) { // if it's a Marker, just ignore it
        myFlattenedBasicBlockElementPList.push_back(new FlattenedBasicBlockElement(*tryCastMarker_p));
        continue;
      }
      // SUBROUTINECALL
      const SubroutineCall* tryCastSubroutineCall_p(dynamic_cast<const SubroutineCall*>(*aBBEi));
      if (tryCastSubroutineCall_p) { // for subroutines, terminate the current Sequence (if there is one) and continue
        currentSequence_p = NULL;
        myFlattenedBasicBlockElementPList.push_back(new FlattenedBasicBlockElement(*tryCastSubroutineCall_p));
        continue;
      }

      // ASSIGNMENT
      const Assignment& theAssignment(dynamic_cast<const Assignment&>(**aBBEi));

      // NONINLINABLE_ASSIGNMENT
      if (theAssignment.isNonInlinable()) {
        currentSequence_p = NULL;
        myFlattenedBasicBlockElementPList.push_back(new FlattenedBasicBlockElement(theAssignment));
        continue;
      }
      // at this point, we know that theAssignment is an inlinable assignment

      if (isOneGraphPerStatement() // the flag, which tells us to always split
       || (currentSequence_p==NULL) // there is no current sequence
       || !currentSequence_p->canIncorporate(theAssignment,getContaining())) { // this assignment cant be added
        Sequence& theNewSequence(*AlgFactoryManager::instance()->getSequenceFactory()->makeNewSequence());
	incrementGlobalSequenceCounter();
        myUniqueSequencePList.push_back(&theNewSequence); // we own this Sequence
        myFlattenedBasicBlockElementPList.push_back(new FlattenedBasicBlockElement(theNewSequence));
        currentSequence_p = &theNewSequence;
      }
      addMyselfToAssignmentIdList(theAssignment);

      // now redo the activity analysis
    //if (haveLinearizedRightHandSide() && DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS))
      //GraphVizDisplay::show(getLinearizedRightHandSide(),"before",VertexLabelWriter(getLinearizedRightHandSide()));
    //xaifBoosterLinearization::AssignmentAlg::activityAnalysis();
      dynamic_cast<xaifBoosterLinearization::AssignmentAlg&>(theAssignment.getAssignmentAlgBase()).activityAnalysis();
    //if (haveLinearizedRightHandSide() && DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS))
      //GraphVizDisplay::show(getLinearizedRightHandSide(),"after",VertexLabelWriter(getLinearizedRightHandSide()));

      currentSequence_p->incorporateAssignment(theAssignment,
                                               getAssignmentIdList());
    } // end iterate over BasicBlockElementList
  }

  void 
  BasicBlockAlg::algorithm_action_3() {
    DBG_MACRO(DbgGroup::CALLSTACK,"xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::algorithm_action_3(perform preaccumulation): invoked for " << debug().c_str());
    myPreaccumulationCounter.reset();
    for (SequencePList::iterator aSequencePListI = myUniqueSequencePList.begin();
	 aSequencePListI != myUniqueSequencePList.end();
	 ++aSequencePListI) { // outer loop over all items in myUniqueSequencePList
      Sequence& currentSequence (**aSequencePListI);
      currentSequence.fillLCGIndependentsList();
      currentSequence.fillLCGDependentsList();
      if (currentSequence.myComputationalGraph_p->numVertices()) {
	// hand off to transformation engine, which will make JAEs and a remainder graph
	runElimination(currentSequence);
	generateAccumulationExpressions(currentSequence);
	makePropagationVariables(currentSequence);
	generateRemainderGraphPropagators(currentSequence);
        if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS) && DbgLoggerManager::instance()->wantTag("cg")) {
          currentSequence.getBestElimination().getAccumulationGraph().show("AccumulationGraph");
          currentSequence.getBestRemainderGraph().show("RemainderGraph");
        }
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
    DBG_MACRO(DbgGroup::METRIC, "BasicBlockAlg " << this
	      << " Sequence " << &aSequence
	      << " best is " << aSequence.getBestElimination().getDescription()
	      << ": " << aSequence.getBestElimination().getCounter().debug().c_str()
	      << " with " << aSequence.getBestElimination().getNumReroutings() << " reroutings");
    myPreaccumulationCounter.incrementBy(aSequence.getBestElimination().getCounter());
    ourPreaccumulationCounter.incrementBy(aSequence.getBestElimination().getCounter());
  } // end BasicBlockAlg::runElimination()

  void BasicBlockAlg::generateAccumulationExpressions(Sequence& aSequence) {
    DBG_MACRO(DbgGroup::CALLSTACK,"xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::generateAccumulationExpressions: invoked for " << aSequence.debug().c_str());
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
      RemainderGraphVertex& theRemainderGraphVertex(*rvi);
      const PrivateLinearizedComputationalGraphVertex& theOriginalVertex(theRemainderGraphVertex.getOriginalVertex());
      // for independents, check against all non-independents for alias conflicts, making new propagation variable in that case
      // See AssignmentAlg::vertexIdentification for an explanation of why we only need to worry about replacing independents.
      if (!theRemainderGraph.numInEdgesOf(theRemainderGraphVertex)) {
	RemainderGraph::VertexIteratorPair rLCGvertIP2 (theRemainderGraph.vertices());
	RemainderGraph::VertexIterator rvi2 (rLCGvertIP2.first), rvi2_end (rLCGvertIP2.second);
	for (; rvi2 != rvi2_end; ++rvi2) { // inner iteration over all remainder vertices
	  if (!theRemainderGraph.numInEdgesOf(*rvi2)) continue; // skip other indeps
	  RemainderGraphVertex& theRemainderGraphVertex2(*rvi2);
	  const PrivateLinearizedComputationalGraphVertex& theOriginalNonIndep(theRemainderGraphVertex2.getOriginalVertex());
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
        // \TODO \FIXME: this is ugly -- wtf is the loop there for??
	if (!theOriginalVertex.hasOriginalVariable()) {
          // find a variable to match to
          RemainderGraph::InEdgeIteratorPair inEdgeIP (theRemainderGraph.getInEdgesOf(theRemainderGraphVertex));
          RemainderGraph::InEdgeIterator iei (inEdgeIP.first), ie_end (inEdgeIP.second);
          for (; iei != ie_end; ++iei) {
            // ultimately we may need topsort...
            //if (!theRemainderGraph.getSourceOf(*iei).wasVisited()) break;
            theRemainderGraphVertex.createNewPropagationVariable(aSequence,(theRemainderGraph.getSourceOf(*iei)).getPropagationVariable());
            break;
          }
        } // end if there's no original variable
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
	const RemainderGraphVertex& theRemainderTargetV(*anLCGVertI);
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
      const RemainderGraphEdge& theRemainderGraphEdge(*iei);
      switch (theRemainderGraphEdge.getAccumulationGraphVertex().getPartialDerivativeKind()) {
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
				   << " invalid PDK (" << PartialDerivativeKind::toString(theRemainderGraphEdge.getAccumulationGraphVertex().getPartialDerivativeKind()) << ") for saxpy factor");
	break;
      } // end switch on PDK
    } // end for all inedges

    bool isZero = true;

    // LINEAR_ONE: SetDeriv and IncDeriv
    for (std::list<const RemainderGraphEdge*>::const_iterator loi = linearOneInEdges.begin();
         loi != linearOneInEdges.end(); ++loi) {
      const RemainderGraphVertex& theSourceVertex(theRemainderGraph.getSourceOf(**loi));
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
      const RemainderGraphVertex& theSourceVertex(theRemainderGraph.getSourceOf(**lmoi));
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
      const RemainderGraphEdge& currentRGE(**li);
      Constant theConstantFactor (SymbolType::REAL_STYPE, false);
      theConstantFactor.setId(1);
      theConstantFactor.setdouble(currentRGE.getAccumulationGraphVertex().getValue());
      xaifBoosterDerivativePropagator::DerivativePropagatorSaxpy& theNewSaxpy
	(aSequence.myDerivativePropagator.addSaxpyToEntryPList(theConstantFactor,
							       (theRemainderGraph.getSourceOf(currentRGE)).getPropagationVariable(),
							       theRemainderTargetV.getPropagationVariable()));
      if (isZero)
        theNewSaxpy.useAsSax();
      isZero = false;
    }
    // NONLINEAR - sax/saxpy
    for (std::list<const RemainderGraphEdge*>::const_iterator nli = nonlinearInEdges.begin();
         nli != nonlinearInEdges.end(); ++nli) {
      const RemainderGraphEdge& currentRGE(**nli);
      xaifBoosterDerivativePropagator::DerivativePropagatorSaxpy& theNewSaxpy
	(aSequence.myDerivativePropagator.addSaxpyToEntryPList(currentRGE.getAccumulationGraphVertex().getLHSVariable(),
							       (theRemainderGraph.getSourceOf(currentRGE)).getPropagationVariable(),
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
      const RemainderGraphEdge& currentRGE(*iei);
      const RemainderGraphVertex& theRemainderSourceV(theRemainderGraph.getSourceOf(currentRGE));
      const xaifBoosterCrossCountryInterface::AccumulationGraphVertex& theAccVertex(currentRGE.getAccumulationGraphVertex());
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

  void BasicBlockAlg::oneGraphPerStatement() { 
    ourOneGraphPerStatementFlag=true;
  }

  bool BasicBlockAlg::isOneGraphPerStatement() { 
    return ourOneGraphPerStatementFlag;
  }

} // end namespace xaifBoosterBasicBlockPreaccumulation
 
