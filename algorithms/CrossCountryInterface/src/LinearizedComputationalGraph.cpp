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

} 
