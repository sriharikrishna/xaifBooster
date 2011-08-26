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
    myFirstElement_p(0),
    myLastElement_p(0),
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

  const Sequence::AssignmentPList& Sequence::getFrontAssignmentList() const { 
    return myFrontAssignmentList;
  }

  const Sequence::AssignmentPList& Sequence::getEndAssignmentList() const { 
    return myEndAssignmentList;
  }

  std::string Sequence::debug() const { 
    std::ostringstream out;    
    out << "Sequence[" << this
	<< ",myFirstElement_p=" << myFirstElement_p
	<< ",myLastElement_p=" << myLastElement_p
	<< "]" << std::ends;  
    return out.str();
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
 
