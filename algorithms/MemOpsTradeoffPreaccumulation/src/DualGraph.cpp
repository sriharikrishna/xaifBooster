#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/DualGraph.hpp"

using namespace MemOpsTradeoffPreaccumulation;

namespace MemOpsTradeoffPreaccumulation {

  DualGraph::DualGraph(const LinearizedComputationalGraph& theOriginal){

    //Create Dual Graph Vertices
      xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstEdgeIteratorPair deip (theOriginal.edges());
      xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstEdgeIterator dei (deip.first), de_end (deip.second);
      //iterate through edges in the original graph, and create a vertex in the dual for each one
      for(; dei != de_end; ++dei){
	DualGraphVertex& DV = addVertex();
	DV.setOriginalRef(*dei);
      }// end for original edges

      xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstVertexIteratorPair dv (theOriginal.vertices());
      xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstVertexIterator dvi (dv.first), dv_end (dv.second);
      //iterate through vertices in the original graph, and create a vertex in the copy for each one
      for(; dvi != dv_end; ++dvi){
	if(theOriginal.numInEdgesOf(*dvi) == 0){

	  DualGraphVertex& DV = addVertex();
	  DV.setAssumedInEdgeRef(*dvi);

	  // for each outedge of the vertex, make an edge from that outedge vertex to the assumed inedge vertex
	  xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstOutEdgeIteratorPair doe (theOriginal.getOutEdgesOf(*dvi));
	  xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstOutEdgeIterator doei (doe.first), doe_end (doe.second);
	  for(; doei != doe_end; ++doei){
	    addEdge(DV, getDualVertex(*doei));
	  }// end for outedges
	}// end if minimal
	if(theOriginal.numOutEdgesOf(*dvi) == 0){

	  DualGraphVertex& DV = addVertex();
	  DV.setAssumedOutEdgeRef(*dvi);

	  // for each inedge of the vertex, make an edge from the inedge to the assumed inedge vertex
	  xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstInEdgeIteratorPair die (theOriginal.getInEdgesOf(*dvi));
	  xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstInEdgeIterator diei (die.first), die_end (die.second);
	  for(; diei != die_end; ++diei){
	    addEdge(getDualVertex(*diei), DV);
	  }// end for inedges
	}// end if maximal
      }// end for original vertices

      //generate edges in dual graph
      xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstVertexIteratorPair dv2 (theOriginal.vertices());
      xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstVertexIterator dv2i (dv2.first), dv2_end (dv2.second);
      for(; dv2i != dv2_end; ++dv2i){

	xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstInEdgeIteratorPair die2 (theOriginal.getInEdgesOf(*dv2i));
	xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstInEdgeIterator die2i (die2.first), die2_end (die2.second);
	for(; die2i != die2_end; ++die2i){

	  xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstOutEdgeIteratorPair doe2 (theOriginal.getOutEdgesOf(*dv2i));
	  xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstOutEdgeIterator doe2i (doe2.first), doe2_end (doe2.second);
	  for(; doe2i != doe2_end; ++doe2i){

	    addEdge(getDualVertex(*die2i),getDualVertex(*doe2i));

	  }// end for outedges
	}// end for inedges
      }// end for original vertices

  }// end constructor

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
	  break;
	}
      }
    }

    THROW_LOGICEXCEPTION_MACRO("ERROR: Attempt to determine corresponding dual vertex for an edge which does not have one"); 

  }// end getDualVertex

  void DualGraph::populatePathList() {
    
    //create paths for independent vertices
    DualGraph::VertexIteratorPair dvip (vertices());
    DualGraph::VertexIterator dvi (dvip.first), dv_end (dvip.second);
    for(; dvi != dv_end; ++dvi){
      if(numInEdgesOf(*dvi) == 0){
	DualGraphPath* thenewpath_p = new DualGraphPath;
	((*thenewpath_p).myPath).push_back(&*dvi);
	(*thenewpath_p).pathNum = 0;
	myPathList.push_front(thenewpath_p);
	if(numOutEdgesOf(*dvi) == 0){
	  (*thenewpath_p).setComplete();
	}// end if
	else{
	  copyPath(thenewpath_p);
	}// end else
      }// end if
    }// end for

    DualGraph::PathList::iterator pathi;
    for(pathi = myPathList.begin(); pathi != myPathList.end(); pathi++){
      while(!(**pathi).isComplete()){

	//iterate through successors of the last vertex in the path
        DualGraph::OutEdgeIteratorPair doe (getOutEdgesOf(*((**pathi).myPath).back()));
	DualGraph::OutEdgeIterator doei (doe.first), doe_end (doe.second);
	unsigned int i = 0;
	for(; doei != doe_end; ++doei){
	  //check to see if there is already a path from the vertex to the successor
	  if((**pathi).pathNum == i){
	    break;
	  }// end if
	  i++;
	}// end for outedges
	if(doei == doe_end){
	  THROW_LOGICEXCEPTION_MACRO("Error: No match between pathnum and out edge num could be found");
	}// end if
	((**pathi).myPath).push_back(&getTargetOf(*doei));
	(**pathi).pathNum = 0;
	if(numOutEdgesOf(getTargetOf(*doei)) == 0) {
	  (**pathi).setComplete();
	}// end if
	else{
	  copyPath(*pathi);
	}// end else
	pathi = myPathList.begin();
      }// end while not complete
    }// end for all paths

  }// end populate path list

  void DualGraph::copyPath(DualGraphPath* thepath_p) {

    unsigned int i;
    for(i = 1; i < numOutEdgesOf(*((*thepath_p).myPath).back()); i++){      
       DualGraphPath* thenewpath_p= new DualGraphPath;
       (*thenewpath_p).myPath = (*thepath_p).myPath;
       (*thenewpath_p).pathNum = i;
       myPathList.push_front(thenewpath_p);
    }// end for

  }// end copyPath

  void DualGraph::clearPathList() {

    DualGraph::PathList::iterator lclear;
    for(lclear = myPathList.begin(); lclear != myPathList.end(); lclear++) {
      delete *lclear;
    }// end for
    
    myPathList.clear();

  }// end clear path list 

  DualGraph::FacePointerList DualGraph::populateElimList() {

    //iterate over all faces in the dual graph
    EdgeIteratorPair deip (edges());
    EdgeIterator dei (deip.first), de_end (deip.second);
    for(; dei != de_end; ++dei){

      //if the face is an intermediate and has no path conflicts
      if((numInEdgesOf(getSourceOf(*dei))*numOutEdgesOf(getTargetOf(*dei)) > 0) && (isFinal(*dei))){

	std::cout << "final intermediate edge added to elim list" << std::endl;

	myElimList.push_back(&*dei);
      }// end if
      else{
	
	std::cout << "edge not added to elim list" << std::endl;

      }// end else

    }// end for edges

    return myElimList;
  }// end populateElimlist

  bool DualGraph::isFinal(DualGraphEdge& theFace) const {

    std::cout << "inside isFinal.  source = " << &getSourceOf(theFace) << " target = " << &getTargetOf(theFace) << std::endl;

    VertexPointerList vertexReach;

    //spath iterates through each path in the list
    DualGraph::PathList::const_iterator spath;
    //svertex iterates through each vertex in the path, svertexr iterates in reverse order
    DualGraphPath::Path::iterator svertex;
    DualGraphPath::Path::reverse_iterator svertexr;
    DualGraph::VertexPointerList::iterator reachi;

    //check for alternate paths from source
    //built list of reachable from target
    for(spath = myPathList.begin(); spath != myPathList.end(); spath++){

      std::cout << "entering new path" << std::endl;

      //for each vertex in the path
      for(svertex = ((**spath).myPath).begin(); svertex != ((**spath).myPath).end(); svertex++){

	std::cout << "trying new vertex" << std::endl;

	//if the path contains the target vertex
	if(*svertex == &getTargetOf(theFace)){

	  std::cout << "target found" << std::endl;

	  //iterate through the remaining vertices and add them to vertexReach
	  svertex++;
	  for(; svertex != ((**spath).myPath).end(); svertex++){

	    std::cout << "adding subsequent vertex to reachlist" << std::endl;

	    vertexReach.push_back(*svertex);
	  }//end for remaining vertices
	  svertex--;
	}// end if source is in path
      }// end for vertices
    }// end for paths

    std::cout << "reachable from target built" << std::endl;

    //go through list again, find paths that contain source
    for(spath = myPathList.begin(); spath != myPathList.end(); spath++){

      std::cout << "checking new path" << std::endl;

      //for each vertex in the path
      for(svertex = ((**spath).myPath).begin(); svertex != ((**spath).myPath).end(); svertex++){
	if(*svertex == &getSourceOf(theFace)){
	  svertex++;
	  //if the path contains the face
	  if(*svertex == &getTargetOf(theFace)){

	    std::cout << "path contains the face" << std::endl;

	    //leave this path
	    break;
	  }
	  //if path doesnt have source->target it doesnt have face
	  else{
	    //for each remaining vertex in the path
	    for(; svertex != ((**spath).myPath).end(); svertex++){
	      
	      for(reachi = vertexReach.begin(); reachi != vertexReach.end(); reachi++){
		if(*svertex == *reachi){

		  std::cout << "reachable from target conflict found, isfinal returned false" << std::endl;

		  return false;
		
		}// end if reachi = svertex
	      }// end for all vertexReach
	    }//end for remaining vertices

	    svertex--;
	    
	  }// end else
	}//end if path contains source
      }//end for each vertex in the path
    }//end for all paths

    vertexReach.clear();

      
    std::cout << "found no conflicts, building reachable to source" << std::endl;

    //check for alternate paths to target
    //built list of reachable to source
    for(spath = myPathList.begin(); spath != myPathList.end(); spath++){
      //for each vertex in the path
      for(svertexr = ((**spath).myPath).rbegin(); svertexr != ((**spath).myPath).rend(); svertexr++){
	//if the path contains the source vertex
	if(*svertexr == &getSourceOf(theFace)){
	  //iterate through the previous vertices and add them to vertexReach
	  svertexr++;
	  for(; svertexr != ((**spath).myPath).rend(); svertexr++){
	    vertexReach.push_back(*svertexr);
	  }//end for remaining vertices
	  svertexr--;
	}// end if source is in path
      }// end for vertices
    }// end for paths

    std::cout << "reachable to source built" << std::endl;

    //go through list again, find paths that contain target
    for(spath = myPathList.begin(); spath != myPathList.end(); spath++){
      //for each vertex in the path
      for(svertexr = ((**spath).myPath).rbegin(); svertexr != ((**spath).myPath).rend(); svertexr++){
	//if the path contains the target
	if(*svertexr == &getTargetOf(theFace)){
	  svertexr++;
	  //if the path contains the face
	  if(*svertexr == &getSourceOf(theFace)){
	    //leave this path
	    break;
	  }
	  //if path doesnt have source->target it doesnt have face
	  else{
	    //for each remaining vertex in the path
	    for(; svertexr != ((**spath).myPath).rend(); svertexr++){

	      for(reachi = vertexReach.begin(); reachi != vertexReach.end(); reachi++){
		if(*svertex == *reachi){

		  std::cout << "reachable to source conflict found, isfinal returned false" << std::endl;

		  return false;
		}// end if reachi = svertex
	      }// end for all vertexReach
	    }//end for remaining vertices

	    svertexr--;

	  }// end else
	}//end if path contains source
      }//end for each vertex in the path
    }//end for all paths


    return true;
  }// end isFinal

  void DualGraph::clearElimList() {
    myElimList.clear();
  }

}// end namespace MemOpsTradeoffPreaccumulation
