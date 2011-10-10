// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertex.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  PrivateLinearizedComputationalGraph::PrivateLinearizedComputationalGraph() { 
  } 

  void
  PrivateLinearizedComputationalGraph::mapAssignmentLHS2PLCGV(const Assignment& aAssignment,
                                                              const PrivateLinearizedComputationalGraphVertex& thePLCGV) {
    if (myAssignmentLHS2LCGVertexPMap.find(&aAssignment) != myAssignmentLHS2LCGVertexPMap.end())
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraph::mapAssignmentLHS2PLCGV: already mapping " << aAssignment.debug().c_str());
    myAssignmentLHS2LCGVertexPMap[&aAssignment] = &thePLCGV;
  }

  const PrivateLinearizedComputationalGraphVertex&
  PrivateLinearizedComputationalGraph::getLCGVertexForAssignmentLHS(const Assignment& aAssignment) const {
    CAssignmentP2CPLCGVertexPMap::const_iterator mapI(myAssignmentLHS2LCGVertexPMap.find(&aAssignment));
    if (mapI == myAssignmentLHS2LCGVertexPMap.end())
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraph::mapAssignmentLHS2PLCGV: no map entry for " << aAssignment.debug().c_str());
    return *(mapI->second);
  }

  void PrivateLinearizedComputationalGraph::addToIndependentList(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theIndependentVertex) { 
    myIndependentList.push_back(&theIndependentVertex);
  } 

  void PrivateLinearizedComputationalGraph::addToDependentList(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theDependentVertex,
							       const ObjectWithId::Id& aStatementId) { 
    myDependentList.push_back(&theDependentVertex);
    myDependentStatementIdList.push_back(aStatementId);
    myStatementIdList.push_back(aStatementId);
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
    StatementIdList::iterator aStatementIdListI=myDependentStatementIdList.begin();
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

  const DuUdMapUseResult::StatementIdLists PrivateLinearizedComputationalGraph::getStatementIdLists()const { 
    return DuUdMapUseResult::StatementIdLists(myDependentStatementIdList, 
					      myPassiveStatementIdList,
					      myStatementIdList);
  }

  void PrivateLinearizedComputationalGraph::addToPassiveStatementIdList(const ObjectWithId::Id& aStatementId) { 
    myPassiveStatementIdList.push_back(aStatementId);
    myStatementIdList.push_back(aStatementId);
  } 

} // end of namespace 
