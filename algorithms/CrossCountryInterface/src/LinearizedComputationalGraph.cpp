#include "LinearizedComputationalGraph.hpp"

namespace xaifBooster { 

  const LinearizedComputationalGraph::VertexPointerList&
  LinearizedComputationalGraph::getIndependentList() const { 
    return myIndependentList;
  }
  
  const LinearizedComputationalGraph::VertexPointerList& 
  LinearizedComputationalGraph::getDependentList() const {
    return myDependentList;
  }

  void LinearizedComputationalGraph::addToIndependentList(const LinearizedComputationalGraphVertex& theIndepdentVertex) { 
    myIndependentList.push_back(&theIndepdentVertex);
  } 

  void LinearizedComputationalGraph::addToDependentList(const LinearizedComputationalGraphVertex& theDepdentVertex) { 
    myDependentList.push_back(&theDepdentVertex);
  } 

} 
