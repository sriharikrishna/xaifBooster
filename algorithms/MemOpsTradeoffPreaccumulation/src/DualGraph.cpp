#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/DualGraph.hpp"

using namespace MemOpsTradeoffPreaccumulation;

namespace MemOpsTradeoffPreaccumulation {

  DualGraph::~DualGraph() {
    clearPathList();
  }

  const DualGraphVertex& DualGraph::getDualVertex(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge& theEdge) const {

    DualGraph::ConstVertexIteratorPair dvip (vertices());
    DualGraph::ConstVertexIterator dvi (dvip.first), dv_end (dvip.second);
    for(; dvi != dv_end; ++dvi){
      if((*dvi).getRefType() == DualGraphVertex::TO_ORIGINAL_EDGE){
	if(&(*dvi).getOriginalRef() == &theEdge){
	  return *dvi;
	}
      }
    }

    THROW_LOGICEXCEPTION_MACRO("attempt to determine corresponding dual vertex for original edge which does not have one"); 

  }// end getDualVertex

  void DualGraph::populatePathList() {
    
    DualGraph::VertexIteratorPair dvip (vertices());
    DualGraph::VertexIterator dvi (dvip.first), dv_end (dvip.second);
    for(; dvi != dv_end; ++dvi){
      if(numInEdgesOf(*dvi) == 0){
	DualGraphPath* thenewpath_p = new DualGraphPath;
	if(numOutEdgesOf(*dvi) == 0){
	  (*thenewpath_p).setComplete();
	}// end if
	else{
	  copyPath(*thenewpath_p);
	}// end else
      }// end if
    }// end for

    DualGraph::PathList::iterator pathi;
    for(pathi = myPathList.begin(); pathi != myPathList.end(); pathi++){
      if(!(**pathi).isComplete()){ 
	//iterate through successors of the last vertex in the path
        DualGraph::OutEdgeIteratorPair doe (getOutEdgesOf(*((**pathi).myPath).back()));
	DualGraph::OutEdgeIterator doei (doe.first), doe_end (doe.second);
	for(; doei != doe_end; ++doei){
	  //check to see if there is already a path from the vertex to the successor
	  if(!checkSequence((*((**pathi).myPath).back()), getTargetOf(*doei))){
	    break;
	  }// end if
	}// end for outedges
	if(doei != doe_end){
	  THROW_LOGICEXCEPTION_MACRO("Error: no untraveled successor found");
	}// end if
	((**pathi).myPath).push_back(&getTargetOf(*doei));
	if(numOutEdgesOf(getTargetOf(*doei)) == 0) {
	  (**pathi).setComplete();
	}// end if
	else{
	  copyPath(**pathi);
	}// end else
	pathi = myPathList.begin();
      }// end if not complete
    }// end for all paths
  }// end populate path list

  void DualGraph::clearPathList() {

    DualGraph::PathList::iterator lclear;
    for(lclear = myPathList.begin(); lclear != myPathList.end(); lclear++) {
      delete *lclear;
    }// end for
    
    myPathList.clear();

  }// end clear path list

  const DualGraph::PathList& DualGraph::getPathList() const { 
    return myPathList;
  } 

  void DualGraph::copyPath(const DualGraphPath& thePath) {

    unsigned int i;
    for(i = 1; i < numOutEdgesOf(*(thePath.myPath).back()); i++){
       DualGraphPath* thenewpath_p= new DualGraphPath;
       (*thenewpath_p).myPath = thePath.myPath;
    }// end for

  }// end copyPath

  bool DualGraph::allComplete() const {
    bool iscomplete = true;
    //iterate through all paths
    DualGraph::PathList::const_iterator ccheck;
    for(ccheck = myPathList.begin(); ccheck != myPathList.end(); ccheck++){
      if(!(**ccheck).isComplete()){
	iscomplete = false;
	break;
      }// end if
    }// end for all paths
    if(myPathList.size() == 0){
      iscomplete = false;
    }// end if
    return iscomplete;
  }
  
  unsigned int DualGraph::checkSequence(DualGraphVertex& theFirst, DualGraphVertex& theSecond) {

    unsigned int numSequences = 0;
    //spath iterates through each path in the list
    DualGraph::PathList::iterator spath;
    //svertex iterates through each vertex in the path
    DualGraphPath::Path::iterator svertex;
    
    //for each path in the list
    for(spath = myPathList.begin(); spath != myPathList.end(); spath++){
      //for each vertex in the path
      for(svertex = ((**spath).myPath).begin(); svertex != ((**spath).myPath).end(); svertex++){
	if(*svertex == &theFirst){
	  spath++;
	  if(*svertex == &theSecond){
	    numSequences++;
	  }
	  break;
	}// end if
      }// end for vertices
    }// end for paths

    return numSequences;

  }// end checkSequence

}// end namespace MemOpsTradeoffPreaccumulation
