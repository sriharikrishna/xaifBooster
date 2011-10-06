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
#include "xaifBooster/algorithms/Linearization/inc/ExpressionVertexAlg.hpp"

#include "xaifBooster/algorithms/CrossCountryInterface/inc/AccumulationGraph.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/EliminationException.hpp"

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


  PreaccumulationMetric::PreaccumulationMetric_E Sequence::ourPreaccumulationMetric = PreaccumulationMetric::SCARCITY_METRIC;

  bool Sequence::ourUseRandomizedHeuristicsFlag = false;

  /// for simulated annealing
  int Sequence::ourIterationsParameter=5000;

  /// for simulated annealing
  double Sequence::ourGamma=5.0;

  bool Sequence::ourUseReroutingsFlag = false;

  bool Sequence::ourPermitNarySaxFlag = false;

  Sequence::Sequence() :
    myBestElimination_p(0),
    myBestRemainderGraph_p(0) {
    myComputationalGraph_p=BasicBlockAlg::getPrivateLinearizedComputationalGraphAlgFactory()->makeNewPrivateLinearizedComputationalGraph();
  }
  
  Sequence::~Sequence() { 
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

  void
  Sequence::useRandomizedHeuristics() {
    ourUseRandomizedHeuristicsFlag = true;
  }

  void
  Sequence::setPreaccumulationMetric(PreaccumulationMetric::PreaccumulationMetric_E aMetric) {
    ourPreaccumulationMetric = aMetric;
  } // end BasicBlockAlg::setPreaccumulationMetric()

  void
  Sequence::useReroutings() { 
    ourUseReroutingsFlag = true;
  } // end BasicBlockAlg::useReroutings()

  void
  Sequence::permitNarySax() {
    ourPermitNarySaxFlag=true;
  }

  bool
  Sequence::doesPermitNarySax() {
    return ourPermitNarySaxFlag;
  }

  void
  Sequence::printXMLHierarchyImpl(std::ostream& os) const {
    DBG_MACRO(DbgGroup::CALLSTACK,"xaifBoosterBasicBlockPreaccumulation::Sequence::printXMLHierarchyImpl: invoked for " << debug().c_str());
    // print all the stuff before the first element
    for(AssignmentPList::const_iterator fli(getFrontAssignmentList().begin()); fli != getFrontAssignmentList().end(); ++fli)
      (*fli)->printXMLHierarchy(os);

    // print the assignments themselves
    for (CAssignmentPList::const_iterator ai(myAssignmentPList.begin()); ai != myAssignmentPList.end(); ++ai)
      (*ai)->printXMLHierarchy(os);

    // print all the stuff after the last element
    // allocations
    for (InlinableSubroutineCallPList::const_iterator ali(getAllocationList().begin()); ali != getAllocationList().end(); ++ali)
      (*ali)->printXMLHierarchy(os);
    // assignments
    for(AssignmentPList::const_iterator eli(getEndAssignmentList().begin()); eli != getEndAssignmentList().end(); ++eli)
      (*eli)->printXMLHierarchy(os);
  }

  xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& 
  Sequence::addAllocation(const VariableSymbolReference& toBeAllocated,
			  const Variable& variableToMatch) { 
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theSRCall_p=new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("oad_AllocateMatching"); 
    theSRCall_p->setId("xaifBoosterBasicBlockPreaccumulation::Sequence::addAllocation");
    myAllocationList.push_back(theSRCall_p);
    // first argument
    Variable& toBeAllocatedVariable(theSRCall_p->addConcreteArgument(1).getArgument().getVariable());
    VariableSymbolReference* 
      tobeAllocateVariableSymbolReference_p(new VariableSymbolReference(toBeAllocated.getSymbol(),
									toBeAllocated.getScope()));
    tobeAllocateVariableSymbolReference_p->setId("1");
    tobeAllocateVariableSymbolReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulation::Sequence::addAllocation");
    toBeAllocatedVariable.supplyAndAddVertexInstance(*tobeAllocateVariableSymbolReference_p);
    toBeAllocatedVariable.getAliasMapKey().setTemporary();
    toBeAllocatedVariable.getDuUdMapKey().setTemporary();
    // second argument
    variableToMatch.copyMyselfInto(theSRCall_p->addConcreteArgument(2).getArgument().getVariable());
    return *theSRCall_p;
  } 

  Assignment& Sequence::appendFrontAssignment(bool withAlgorithm) { 
    Assignment* theAssignment_p=new Assignment(withAlgorithm);
    myFrontAssignmentList.push_back(theAssignment_p);
    return *theAssignment_p;
  }

  Assignment& Sequence::appendEndAssignment(bool withAlgorithm) { 
    Assignment* theAssignment_p=new Assignment(withAlgorithm);
    myEndAssignmentList.push_back(theAssignment_p);
    return *theAssignment_p;
  }

  const Sequence::InlinableSubroutineCallPList& Sequence::getAllocationList() const { 
    return myAllocationList;
  }

  const AssignmentPList& Sequence::getFrontAssignmentList() const { 
    return myFrontAssignmentList;
  }

  const AssignmentPList& Sequence::getEndAssignmentList() const { 
    return myEndAssignmentList;
  }

  std::string Sequence::debug() const {
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulation::Sequence[" << this
        << ",myAssignmentPList.size():" << myAssignmentPList.size()
        << ",myComputationalGraph_p->" << myComputationalGraph_p->debug().c_str()
        << ",myAllocationList.size():" << myAllocationList.size()
        << ",myFrontAssignmentList.size():" << myFrontAssignmentList.size()
        << ",myEndAssignmentList.size():" << myEndAssignmentList.size()
        << ",myEliminationPList.size():" << myEliminationPList.size()
        << ",myBestElimination_p=" << myBestElimination_p
        << ",myBestRemainderGraph_p=" << myBestRemainderGraph_p
        << "]" << std::ends;
    return out.str();
  }

  bool
  Sequence::canIncorporate(const Assignment& aAssignment,
                           const BasicBlock& theBasicBlock) { //const
    AssignmentAlg& theAssignmentAlg(dynamic_cast<AssignmentAlg&>(aAssignment.getAssignmentAlgBase()));
    if (theAssignmentAlg.getActiveFlag())
      return (theAssignmentAlg.vertexIdentification(*myComputationalGraph_p));
    else
      return (!myComputationalGraph_p->getVertexIdentificationListIndAct().overwrittenBy(aAssignment.getLHS(),
                                                                                         aAssignment.getId(),
                                                                                         theBasicBlock));
  }

  void
  Sequence::incorporateAssignment(const Assignment& aAssignment,
                                  const StatementIdList& theKnownAssignmentsIdList) {
    AssignmentAlg& theAssignmentAlg(dynamic_cast<AssignmentAlg&>(aAssignment.getAssignmentAlgBase()));
    theAssignmentAlg.incorporateMyselfInto(*this);
    myAssignmentPList.push_back(&aAssignment);
  }

  void
  Sequence::fillLCGIndependentsList() {
    PrivateLinearizedComputationalGraph::VertexIteratorPair p(myComputationalGraph_p->vertices());
    for (PrivateLinearizedComputationalGraph::VertexIterator it(p.first); it != p.second; ++it)
      // here we should have constants etc. already removed
      // JU: this is temporary until we have r/w analysis
      if (!myComputationalGraph_p->numInEdgesOf(*it))
	myComputationalGraph_p->addToIndependentList(*it);
  }

  void
  Sequence::fillLCGDependentsList() {
    // now look at all the vertices in the dependent list 
    // and remove the ones not needed as indicated by 
    // the duud information:
    const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList& theDepVertexPList(myComputationalGraph_p->getDependentList());
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
        myComputationalGraph_p->removeFromDependentList(myPrivateVertex);
        continue;
      }
      DuUdMapUseResult theDuUdMapUseResult(
       ConceptuallyStaticInstances::instance()->getCallGraph().getDuUdMap().use(aDuUdMapKey,
                                                                                myPrivateVertex.getStatementId(),
                                                                                myComputationalGraph_p->getStatementIdLists())
      );
      if (theDuUdMapUseResult.myAnswer==DuUdMapUseResult::AMBIGUOUS_INSIDE 
	  || 
	  theDuUdMapUseResult.myAnswer==DuUdMapUseResult::UNIQUE_INSIDE) { 
	if (!myComputationalGraph_p->numOutEdgesOf(myPrivateVertex)) { 
	  if (theDuUdMapUseResult.myActiveUse!=ActiveUseType::PASSIVEUSE) { 
	    // if the use is not strictly passive then in case of UNIQUE_INSIDE this vertex 
	    // should not be maximal and in case of AMBIGUOUS_INSIDE there should have 
	    // been a split. 
	    THROW_LOGICEXCEPTION_MACRO("Sequence::fillLCGDependentsList: attempting to remove a maximal vertex " << myPrivateVertex.getOriginalVariable().debug().c_str()
                                       << " key " << aDuUdMapKey.debug().c_str() << " from the dependent list");
	  }
	  // else do nothing, just leave it. This may indicate some inconsistency in 
	  // the activity results
	}
	else { 
          // we only use it in the scope of this flattened sequence, therefore remove it
          DBG_TAG_MACRO(DbgGroup::DATA,"depList","Sequence::fillLCGDependentsList:"
                        << " removing dependent " << myPrivateVertex.getOriginalVariable().debug().c_str()
                        << " list size: " << theDepVertexPList.size()); 
          myComputationalGraph_p->removeFromDependentList(myPrivateVertex);
          continue;
	}
      }
      else { 
        if (DbgLoggerManager::instance()->isSelected(DbgGroup::DATA)) { 
          if (myComputationalGraph_p->numOutEdgesOf(myPrivateVertex)) { 
            DBG_TAG_MACRO(DbgGroup::DATA,"depList","Sequence::fillLCGDependentsList:"
                          << " keeping non-maximal dependent " << myPrivateVertex.getOriginalVariable().debug().c_str()
                          << " key is " << aDuUdMapKey.debug().c_str()
                          << " use result is " << theDuUdMapUseResult.myAnswer
                          << " lists are " << myComputationalGraph_p->getStatementIdLists().debug().c_str()); 
          }
          else {
            DBG_TAG_MACRO(DbgGroup::DATA,"depList","Sequence::fillLCGDependentsList:"
                          << " keeping regular dependent " << myPrivateVertex.getOriginalVariable().debug().c_str()
                          << " key is " << aDuUdMapKey.debug().c_str());
          }
        }
      } 
    }
  }

  void Sequence::runElimination() { 
    // initialize the graph transformation(s)
    switch (ourPreaccumulationMetric) {
    case PreaccumulationMetric::OPERATIONS_METRIC: {
      addNewElimination().initAsOperations();
      if (ourUseRandomizedHeuristicsFlag) {
        addNewElimination().initAsOperationsRandom();
        addNewElimination().initAsLSAVertex(ourIterationsParameter,ourGamma);
        //addNewElimination().initAsLSAFace(ourIterationsParameter,ourGamma);
      } // end randomized heuristics
      break;
    } // end OPERATIONS
    case PreaccumulationMetric::SCARCITY_METRIC: {
      addNewElimination().initAsScarceElimination();
      if (ourUseRandomizedHeuristicsFlag)
        addNewElimination().initAsScarceRandomElimination();
      if (ourUseReroutingsFlag) {
        addNewElimination().initAsScarceTransformation();
        if (ourUseRandomizedHeuristicsFlag)
          addNewElimination().initAsScarceRandomTransformation();
      }
      break;
    } // end SCARCITY
    default: {
      THROW_LOGICEXCEPTION_MACRO("Sequence::runElimination: unknown preaccumulation metric "
                                 << PreaccumulationMetric::toString(ourPreaccumulationMetric));
      break;
    } // end default
    } // end switch (ourPreaccumulationMetric)

    // perform the transformations and build the accumulation graph
    for (EliminationPList::iterator elim_i = getEliminationPList().begin(); elim_i != getEliminationPList().end(); ++elim_i) {
      try {
        (*elim_i)->eliminate();	
      }
      catch(xaifBoosterCrossCountryInterface::EliminationException e) { 
	THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::runElimination: " << (*elim_i)->getDescription()
                                   << ": " << e.getReason().c_str());
      }
      (*elim_i)->buildAccumulationGraph();
      DBG_MACRO(DbgGroup::METRIC, " Sequence " << this
                               << " by " << (*elim_i)->getDescription()
                               << ": " << (*elim_i)->getCounter().debug().c_str()
                               << " with " << (*elim_i)->getNumReroutings() << " reroutings");
    } // end iterate over all Eliminations for this Sequence
    determineBestElimination(ourPreaccumulationMetric);
    DBG_MACRO(DbgGroup::METRIC, " Sequence " << this
                             << " best is " << getBestElimination().getDescription()
                             << ": " << getBestElimination().getCounter().debug().c_str()
                             << " with " << getBestElimination().getNumReroutings() << " reroutings");
  }

  xaifBoosterCrossCountryInterface::Elimination&
  Sequence::addNewElimination() {
    xaifBoosterCrossCountryInterface::Elimination* theElimination_p = new xaifBoosterCrossCountryInterface::Elimination(*myComputationalGraph_p);
    myEliminationPList.push_back(theElimination_p);
    return *theElimination_p;
  }

  void Sequence::determineBestElimination(PreaccumulationMetric::PreaccumulationMetric_E aMetric) {
    if (myEliminationPList.empty())
      THROW_LOGICEXCEPTION_MACRO("Sequence::determineBestElimination() : no eliminations, thus no results");
    if (myBestElimination_p)
      THROW_LOGICEXCEPTION_MACRO("Sequence::determineBestElimination() : myBestElimination_p already set");
    myBestElimination_p = *(myEliminationPList.begin());
    for (EliminationPList::iterator i = ++(myEliminationPList.begin()); i != myEliminationPList.end(); ++i) { 
      if ((*i)->getCounter() < myBestElimination_p->getCounter())
        myBestElimination_p = *i;
    } // end iterate over all Eliminations
  } 

  const xaifBoosterCrossCountryInterface::Elimination& Sequence::getBestElimination() const {
    if (!myBestElimination_p)
      THROW_LOGICEXCEPTION_MACRO("Sequence::getBestElimination: myBestElimination_p not set");
    return *myBestElimination_p;
  }

  xaifBoosterCrossCountryInterface::Elimination&
  Sequence::getBestElimination() {
    if (!myBestElimination_p)
      THROW_LOGICEXCEPTION_MACRO("Sequence::getBestElimination: myBestElimination_p not set");
    return *myBestElimination_p;
  } 

  RemainderGraph& 
  Sequence::getBestRemainderGraph() {
    if (!myBestElimination_p)
      THROW_LOGICEXCEPTION_MACRO("Sequence::getBestRemainderGraph: myBestElimination_p not set");
    if (!myBestRemainderGraph_p) { 
      myBestRemainderGraph_p=new RemainderGraph();
      myBestRemainderGraph_p->initFrom(getBestElimination());
    }
    return *myBestRemainderGraph_p;
  } 

  Sequence::EliminationPList& Sequence::getEliminationPList() {
    if (myEliminationPList.empty())
      THROW_LOGICEXCEPTION_MACRO("Sequence::getEliminationPList: myEliminationP:List is empty");
    return myEliminationPList;
  }

  bool
  Sequence::hasExpression(const Expression& anExpression) const {
    // NOTE: this currently does not check the original basic block elements.
    // check the front assignment list
    for (AssignmentPList::const_iterator frontAssI = myFrontAssignmentList.begin();
         frontAssI != myFrontAssignmentList.end(); ++frontAssI)
      if ((*frontAssI)->hasExpression(anExpression))
        return true;
    // check the end assignment list
    for (AssignmentPList::const_iterator endAssI = myEndAssignmentList.begin();
         endAssI != myEndAssignmentList.end(); ++endAssI)
      if ((*endAssI)->hasExpression(anExpression))
        return true;
    // check the derivative propagator
    return myDerivativePropagator.hasExpression(anExpression);
  }

  void
  Sequence::generateRemainderGraphPropagators() { 
    const RemainderGraph& theRemainderGraph(getBestRemainderGraph());
    getBestRemainderGraph().initVisit();
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
            propagateToRemainderVertex_narySax(theRemainderTargetV);
          else 
            propagateToRemainderVertex(theRemainderTargetV);
	} // end visit
      } // end iterate over all vertices
    } // end while(!done)
    getBestRemainderGraph().finishVisit();
  }

  void
  Sequence::propagateToRemainderVertex(const RemainderGraphVertex& theRemainderTargetV) {
    const RemainderGraph& theRemainderGraph(getBestRemainderGraph());
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
	THROW_LOGICEXCEPTION_MACRO("BasicBlockPreaccumulation::Sequence::propagateToRemainderVertex:"
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
        myDerivativePropagator.addSetDerivToEntryPList(theRemainderTargetV.getPropagationVariable(),
                                                       theSourceVertex.getPropagationVariable());
      else // IncDeriv
        myDerivativePropagator.addIncDerivToEntryPList(theRemainderTargetV.getPropagationVariable(),
                                                       theSourceVertex.getPropagationVariable());
      isZero = false;
    }
    // LINEAR_MINUS_ONE: SetNegDeriv and DecDeriv
    for (std::list<const RemainderGraphEdge*>::const_iterator lmoi = linearMinusOneInEdges.begin();
         lmoi != linearMinusOneInEdges.end(); ++lmoi) {
      const RemainderGraphVertex& theSourceVertex(theRemainderGraph.getSourceOf(**lmoi));
      if (isZero) // SetNegDeriv
        myDerivativePropagator.addSetNegDerivToEntryPList(theRemainderTargetV.getPropagationVariable(),
                                                          theSourceVertex.getPropagationVariable());
      else // DecDeriv
        myDerivativePropagator.addDecDerivToEntryPList(theRemainderTargetV.getPropagationVariable(),
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
	(myDerivativePropagator.addSaxpyToEntryPList(theConstantFactor,
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
	(myDerivativePropagator.addSaxpyToEntryPList(currentRGE.getAccumulationGraphVertex().getLHSVariable(),
                                                     (theRemainderGraph.getSourceOf(currentRGE)).getPropagationVariable(),
                                                     theRemainderTargetV.getPropagationVariable()));
      if (isZero)
        theNewSaxpy.useAsSax();
      isZero = false;
    }
  } 

  void
  Sequence::propagateToRemainderVertex_narySax(const RemainderGraphVertex& theRemainderTargetV) {
    const RemainderGraph& theRemainderGraph(getBestRemainderGraph());
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
	  theSax_p = &(myDerivativePropagator.addSaxpyToEntryPList(theTempConstant,
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
	  theSax_p = &(myDerivativePropagator.addSaxpyToEntryPList(theTempConstant,
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
	  theSax_p = &(myDerivativePropagator.addSaxpyToEntryPList(theTempConstant,
                                                                   theRemainderSourceV.getPropagationVariable(),
                                                                   theRemainderTargetV.getPropagationVariable()));
	break;
      }
      case PartialDerivativeKind::NONLINEAR: {
	if (theSax_p)
	  theSax_p->addAX(theAccVertex.getLHSVariable(),
			  theRemainderSourceV.getPropagationVariable());
	else
	  theSax_p = &(myDerivativePropagator.addSaxpyToEntryPList(theAccVertex.getLHSVariable(),
                                                                   theRemainderSourceV.getPropagationVariable(),
                                                                   theRemainderTargetV.getPropagationVariable()));
	break;
      }
      default:
	THROW_LOGICEXCEPTION_MACRO("BasicBlockPreaccumulation::Sequence::propagateToRemainderVertex_narySax:"
				   << " invalid PDK (" << PartialDerivativeKind::toString(theAccVertex.getPartialDerivativeKind()) << ") for saxpy factor");
	break;
      } // end switch on PDK
    } // end for all inedges
    if (!theSax_p)
      THROW_LOGICEXCEPTION_MACRO("BasicBlockPreaccumulation::Sequence::propagateToRemainderVertex_narySax:"
                                 << " remainder vertex " << theRemainderTargetV.debug() << " has no inedges with non-passive partial derivative kind");
    // this will be the sole propagation entry for theRemainderTargetV
    theSax_p->useAsSax();
  }

}

