#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/LinearizedComputationalGraphCopy.hpp"

namespace MemOpsTradeoffPreaccumulation{

  const LinearizedComputationalGraphCopy::ConstVertexPointerList& LinearizedComputationalGraphCopy::getIndependentList() const{ 
    return myIndependentList;
  }
  
  const LinearizedComputationalGraphCopy::ConstVertexPointerList& LinearizedComputationalGraphCopy::getDependentList() const{
    return myDependentList;
  }

  const unsigned int LinearizedComputationalGraphCopy::numIndeps() const{
    return myIndependentList.size();
  }

  const unsigned int LinearizedComputationalGraphCopy::numDeps() const{
    return myDependentList.size();
  }

  LinearizedComputationalGraphCopy::VertexPointerList LinearizedComputationalGraphCopy::getVertexList() const{
    return myVertexList;
  }

  LinearizedComputationalGraphCopy::EdgePointerList LinearizedComputationalGraphCopy::getEdgeList() const{
    return myEdgeList;
  }

  void LinearizedComputationalGraphCopy::addToIndependentList(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theIndepdentVertex){ 
    myIndependentList.push_back(&theIndepdentVertex);
  } 

  void LinearizedComputationalGraphCopy::addToDependentList(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theDepdentVertex){ 
    myDependentList.push_back(&theDepdentVertex);
  }

  void LinearizedComputationalGraphCopy::addToVertexList(xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theVertex){ 
    myVertexList.push_back(&theVertex);
  }

  void LinearizedComputationalGraphCopy::addToEdgeList(LinearizedComputationalGraphCopy& theCopy,
						       MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopyEdge& theEdge,
						       LinearizedComputationalGraphCopy::edgeElimDirection theDirection){ 
    edgeEntry theNewEntry;
    theNewEntry.edge_p = &theEdge;
    theNewEntry.direction = theDirection;
    myEdgeList.push_front(theNewEntry);
  }// end addToEdgeList

  void LinearizedComputationalGraphCopy::removeFromVertexList(xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theVertex){ 
    myVertexList.remove(&theVertex);
  }

  void LinearizedComputationalGraphCopy::clearEdgeList(){
    myEdgeList.clear();
  }// end clearEdgeList

}// end namespace MemOpsTradeoffPreaccumulation
