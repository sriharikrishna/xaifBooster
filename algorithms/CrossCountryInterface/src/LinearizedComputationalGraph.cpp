#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraph.hpp"

namespace xaifBoosterCrossCountryInterface {

  const LinearizedComputationalGraph::VertexPointerList&
  LinearizedComputationalGraph::getIndependentList() const { 
    return myIndependentList;
  }
  
  const LinearizedComputationalGraph::VertexPointerList& 
  LinearizedComputationalGraph::getDependentList() const {
    return myDependentList;
  }

  LinearizedComputationalGraph::VertexPointerList&
  LinearizedComputationalGraph::getIndependentList() { 
    return myIndependentList;
  }
  
  LinearizedComputationalGraph::VertexPointerList& 
  LinearizedComputationalGraph::getDependentList() {
    return myDependentList;
  }

  void LinearizedComputationalGraph::addToIndependentList(const LinearizedComputationalGraphVertex& theIndepdentVertex) { 
    myIndependentList.push_back(&theIndepdentVertex);
  } 

  void LinearizedComputationalGraph::addToDependentList(const LinearizedComputationalGraphVertex& theDepdentVertex) { 
    myDependentList.push_back(&theDepdentVertex);
  } 

} 
