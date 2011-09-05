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

  xaifBoosterCrossCountryInterface::Elimination& Sequence::addNewElimination(xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& lcg) { 
    xaifBoosterCrossCountryInterface::Elimination* theElimination_p = new xaifBoosterCrossCountryInterface::Elimination (lcg);
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
  } // end BasicBlockAlg::Sequence::hasExpression()

} 
 
