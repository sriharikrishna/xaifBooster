#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraph.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  PrivateLinearizedComputationalGraph::PrivateLinearizedComputationalGraph() { 
  } 

  void PrivateLinearizedComputationalGraph::addToIndependentList(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theIndependentVertex) { 
    myIndependentList.push_back(&theIndependentVertex);
  } 

  void PrivateLinearizedComputationalGraph::addToDependentList(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theDependentVertex,
							       const ObjectWithId::Id& aStatementId) { 
    myDependentList.push_back(&theDependentVertex);
    myDependentStatementIdList.push_back(aStatementId);
  } 

  void PrivateLinearizedComputationalGraph::removeFromIndependentList(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theIndependentVertex) { 
    VertexPointerList::iterator aVertexPointerListI=myIndependentList.begin();
    for (;
	 aVertexPointerListI!=myIndependentList.end();
	 ++aVertexPointerListI) { 
      if ((*aVertexPointerListI)==&theIndependentVertex) { 
	myIndependentList.erase(aVertexPointerListI);
	break;
      }
    }
    if (aVertexPointerListI==myIndependentList.end()) { 
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraph::removeFromIndependentList: attempt to remove a vertex that is not in the list");
    }
  } 

  void PrivateLinearizedComputationalGraph::removeFromDependentList(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theDependentVertex) {
    VertexPointerList::iterator aVertexPointerListI=myDependentList.begin();
    DuUdMapDefinitionResult::StatementIdList::iterator aStatementIdListI=myDependentStatementIdList.begin();
      for (;
	   aVertexPointerListI!=myDependentList.end();
	   ++aStatementIdListI,++aVertexPointerListI) { 
	     if ((*aVertexPointerListI)==&theDependentVertex) { 
	       myDependentList.erase(aVertexPointerListI);
	       myDependentStatementIdList.erase(aStatementIdListI);
	       break;
	     }
	   }
    if (aVertexPointerListI==myDependentList.end()) { 
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraph::removeFromDependentList: attempt to remove a vertex that is not in the list");
    }
  }

  const DuUdMapDefinitionResult::StatementIdList& PrivateLinearizedComputationalGraph::getDependentStatementIdList()const { 
    return myDependentStatementIdList;
  }

} // end of namespace 
