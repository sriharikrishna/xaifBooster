#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/LinearizedComputationalGraphCopy.hpp"

namespace MemOpsTradeoffPreaccumulation{

  const LinearizedComputationalGraphCopy::ConstVertexPointerList& LinearizedComputationalGraphCopy::getIndependentList() const{ 
    return myIndependentList;
  }
  
  const LinearizedComputationalGraphCopy::ConstVertexPointerList& LinearizedComputationalGraphCopy::getDependentList() const{
    return myDependentList;
  }

  bool LinearizedComputationalGraphCopy::isDep(xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theVertex) const {

    bool isdep = false;

    const ConstVertexPointerList& depList = getDependentList();
    ConstVertexPointerList::const_iterator depCheck;
    for(depCheck = depList.begin(); depCheck != depList.end(); depCheck++){
      if(*depCheck == &theVertex){
	isdep = true;
	break;
      }// end if
    }// end for

    return isdep;
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

  void LinearizedComputationalGraphCopy::addToIndependentList(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theIndepdentVertex){ 
    myIndependentList.push_back(&theIndepdentVertex);
  } 

  void LinearizedComputationalGraphCopy::addToDependentList(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theDepdentVertex){ 
    myDependentList.push_back(&theDepdentVertex);
  }

  void LinearizedComputationalGraphCopy::addToVertexList(xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theVertex){ 
    myVertexList.push_back(&theVertex);
  }

  void LinearizedComputationalGraphCopy::removeFromVertexList(xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theVertex){ 
    myVertexList.remove(&theVertex);
  }

  LinearizedComputationalGraphCopy::EdgePointerList LinearizedComputationalGraphCopy::populateEdgeList() {

    EdgeIteratorPair edgelist (edges());
    EdgeIterator eli (edgelist.first), ele (edgelist.second);
    for(; eli != ele; ++eli){
      if((numOutEdgesOf(getTargetOf(*eli)) > 0) && (!isDep(getTargetOf(*eli)))){
	// if the target of the edge is not a dependent and has inedges

	edgeEntry newFrontElim;
	newFrontElim.edge_p = &*eli;
	newFrontElim.direction = FRONT;
	myEdgeList.push_front(newFrontElim);

      }// end if 
      //if the source has inedges
      if(numInEdgesOf(getSourceOf(*eli)) > 0){//can be back eliminated

	edgeEntry newBackElim;
	newBackElim.edge_p = &*eli;
	newBackElim.direction = BACK;
	myEdgeList.push_front(newBackElim);

      }// end if
    }// end for

    return myEdgeList;
  }// end populateEdgeList

  void LinearizedComputationalGraphCopy::clearEdgeList(){
    myEdgeList.clear();
  }// end clearEdgeList

}// end namespace MemOpsTradeoffPreaccumulation
