#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/LinearizedComputationalGraphCopy.hpp"

namespace MemOpsTradeoffPreaccumulation {

  const LinearizedComputationalGraphCopy::ConstVertexPointerList&
  LinearizedComputationalGraphCopy::getIndependentList() const { 
    return myIndependentList;
  }
  
  const LinearizedComputationalGraphCopy::ConstVertexPointerList& 
  LinearizedComputationalGraphCopy::getDependentList() const {
    return myDependentList;
  }

  LinearizedComputationalGraphCopy::VertexPointerList 
  LinearizedComputationalGraphCopy::getIntermediateList(){
    return myIntermediateList;
  }

  void LinearizedComputationalGraphCopy::addToIndependentList(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theIndepdentVertex) { 
    myIndependentList.push_back(&theIndepdentVertex);
  } 

  void LinearizedComputationalGraphCopy::addToDependentList(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theDepdentVertex) { 
    myDependentList.push_back(&theDepdentVertex);
  }

  void LinearizedComputationalGraphCopy::addToIntermediateList(xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theInterVertex) { 
    myIntermediateList.push_back(&theInterVertex);
  }

  void LinearizedComputationalGraphCopy::removeFromIntermediateList(xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theInterVertex) { 
    myIntermediateList.remove(&theInterVertex);
  }

} 
