#include <sstream>
#include <string>
#include <iostream>
#include <fstream>
#include <list>
#include <algorithm>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include "xaifBooster/system/inc/GraphVizDisplay.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/EdgeElim.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/VertexElim.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/FaceElim.hpp"


enum Heuristic{VERTEX, EDGE, FACE, FORWARD, REVERSE, MARKOWITZ, SIBLING, SIBLING2, SUCCPRED};

using namespace MemOpsTradeoffPreaccumulation;

namespace xaifBoosterMemOpsTradeoffPreaccumulation { 

  void BasicBlockAlg::compute_elimination_sequence(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& theOriginal,
						   int mode,
						   xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& theJacobianAccumulationExpressionList){
    //readme

    //run QuickRegression.bash at /home/lyonsam/Argonne/xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/test
    // and make sure the results are correct.  then push, they will be the standard from then on 

    GraphVizDisplay::show(theOriginal,"flattened");

    if(DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)){
      GraphVizDisplay::show(theOriginal,"flattened");
    }

    //input from file to construct heuristic sequence
    std::list<Heuristic> heuristicEnumSequence;
    bool usable = true;

    std::ifstream hfile("HeuristicList.txt");
    if(!hfile){
      std::cout << "Error opening heuristic file, using default mode and heuristics" << std::endl;
      usable = false;
    }

    else{
      char line[10];
      while(hfile.getline(line, 10)){
	std::string theline = line;
 	if(theline == "VERTEX"){
	  if(heuristicEnumSequence.size() == 0){heuristicEnumSequence.push_back(VERTEX);}
	  else{
	    usable = false;
	    std::cout << "Error with heuristic order, using default mode and heuristics" << std::endl;
	  }
	}// end if VERTEX
	else if(theline == "EDGE"){
	  if(heuristicEnumSequence.size() == 0){heuristicEnumSequence.push_back(EDGE);}
	  else{
	    usable = false;
	    std::cout << "Error with heuristic order, using default mode and heuristics" << std::endl;
	  }
	}// end if EDGE
	else if(theline == "FACE"){
	  if(heuristicEnumSequence.size() == 0){heuristicEnumSequence.push_back(FACE);}
	  else{
	    usable = false;
	    std::cout << "Error with heuristic order, using default mode and heuristics" << std::endl;
	  }
	}// end if FACE
	else if(theline == "FORWARD"){
	  if(heuristicEnumSequence.size() == 0){
	    usable = false;
	    std::cout << "Error with heuristic order, using default mode and heuristics" << std::endl;
	  }
	  else{heuristicEnumSequence.push_back(FORWARD);}
	}// end if FORWARD
	else if(theline == "REVERSE"){
	  if(heuristicEnumSequence.size() == 0){
	    usable = false;
	    std::cout << "Error with heuristic order, using default mode and heuristics" << std::endl;
	  }
	  else{heuristicEnumSequence.push_back(REVERSE);}
	}// end if REVERSE
	else if(theline == "MARKOWITZ"){
	  if(heuristicEnumSequence.size() == 0){
	    usable = false;
	    std::cout << "Error with heuristic order, using default mode and heuristics" << std::endl;
	  }
	  else{heuristicEnumSequence.push_back(MARKOWITZ);}
	}// end if MARKOWITZ
	else if(theline == "SIBLING"){
	  if(heuristicEnumSequence.size() == 0){
	    usable = false;
	    std::cout << "Error with heuristic order, using default mode and heuristics" << std::endl;
	  }
	  else{heuristicEnumSequence.push_back(SIBLING);}
	}// end if SIBLING
	else if(theline == "SIBLING2"){
	  if(heuristicEnumSequence.size() == 0){
	    usable = false;
	    std::cout << "Error with heuristic order, using default mode and heuristics" << std::endl;
	  }
	  else{heuristicEnumSequence.push_back(SIBLING2);}
	}// end if SIBLING2
	else if(theline == "SUCCPRED"){
	  if(heuristicEnumSequence.size() == 0){
	    usable = false;
	    std::cout << "Error with heuristic order, using default mode and heuristics" << std::endl;
	  }
	  else{heuristicEnumSequence.push_back(SUCCPRED);}
	}// end if SUCCPRED
	else{
 	  usable = false;
 	  std::cout << "Error reading heuristic file, using default mode and heuristics";
        }// end else
	if(!usable){break;}
      }// end while
    }// end else
    hfile.close();
    
    if(!usable){
      heuristicEnumSequence.clear();
      heuristicEnumSequence.push_back(EDGE);
      heuristicEnumSequence.push_back(MARKOWITZ);
      heuristicEnumSequence.push_back(SIBLING2);
      heuristicEnumSequence.push_back(REVERSE);
    }// end if usable

    if(heuristicEnumSequence.front() == FACE){

      DualGraph theDual;
      
      //Create Dual Graph Vertices
      xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstEdgeIteratorPair deip (theOriginal.edges());
      xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstEdgeIterator dei (deip.first), de_end (deip.second);
      //iterate through edges in the original graph, and create a vertex in the dual for each one
      for(; dei != de_end; ++dei){
	DualGraphVertex& DV = theDual.addVertex();
	DV.setOriginalRef(*dei);
      }// end for original edges

      xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstVertexIteratorPair dv (theOriginal.vertices());
      xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstVertexIterator dvi (dv.first), dv_end (dv.second);
      //iterate through vertices in the original graph, and create a vertex in the copy for each one
      for(; dvi != dv_end; ++dvi){
	if(theOriginal.numInEdgesOf(*dvi) == 0){

	  DualGraphVertex& DV = theDual.addVertex();
	  DV.setAssumedInEdgeRef(*dvi);

	  // for each outedge of the vertex, make an edge from that outedge vertex to the assumed inedge vertex
	  xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstOutEdgeIteratorPair doe (theOriginal.getOutEdgesOf(*dvi));
	  xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstOutEdgeIterator doei (doe.first), doe_end (doe.second);
	  for(; doei != doe_end; ++doei){
	    theDual.addEdge(DV, theDual.getDualVertex(*doei));
	  }// end for outedges
	}// end if minimal
	if(theOriginal.numOutEdgesOf(*dvi) == 0){

	  DualGraphVertex& DV = theDual.addVertex();
	  DV.setAssumedOutEdgeRef(*dvi);

	  // for each inedge of the vertex, make an edge from the inedge to the assumed inedge vertex
	  xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstInEdgeIteratorPair die (theOriginal.getInEdgesOf(*dvi));
	  xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstInEdgeIterator diei (die.first), die_end (die.second);
	  for(; diei != die_end; ++diei){
	    theDual.addEdge(theDual.getDualVertex(*diei), DV);
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

	    theDual.addEdge(theDual.getDualVertex(*die2i),theDual.getDualVertex(*doe2i));

	  }// end for outedges
	}// end for inedges
      }// end for original vertices

      typedef void(*faceHeuristicFunc) (const DualGraph&,
					DualGraph::FacePointerList&,
					const DualGraph::VertexPointerList&,
				        const DualGraph::VertexPointerList&);

      std::list<faceHeuristicFunc> faceHeuristicSequence;

      heuristicEnumSequence.pop_front();
      //generate a list of function pointers that point to each heuristic that is to be used
      while(heuristicEnumSequence.size() > 0){
	switch(heuristicEnumSequence.front()){
	  case FORWARD:
	    faceHeuristicSequence.push_back(&FaceElim::forwardMode_f);
	    break;
	  case REVERSE:
	    faceHeuristicSequence.push_back(&FaceElim::reverseMode_f);
	    break;
	  case MARKOWITZ:
	    faceHeuristicSequence.push_back(&FaceElim::markowitzMode_f);
	    break;
	  case SIBLING:
	    faceHeuristicSequence.push_back(&FaceElim::siblingMode_f);
	    break;
	  default:
	    THROW_LOGICEXCEPTION_MACRO("Error: unknown face heuristic passed");
	}// end switch heuristicEnumSequence
	heuristicEnumSequence.pop_front();
      }// end while

      //the face list holds all the faces that are candidates for elimination
      faceHeuristicFunc func_pt;
      std::list<faceHeuristicFunc>::iterator fhiter;

      //populate the dual path list
      theDual.populatePathList();







      DualGraph::FacePointerList theFaceList;
      DualGraph::VertexPointerList thePredList, theSuccList;

      //this loop runs the list through each heuristic
      if(1){
	for(fhiter=faceHeuristicSequence.begin(); fhiter!=faceHeuristicSequence.end(); fhiter++){
	  func_pt = *fhiter;
	  func_pt(theDual, theFaceList, thePredList, theSuccList);
	}// end for
      }// end if





      GraphVizDisplay::show(theDual,"Dual");

    }// end if face
    else{

      LinearizedComputationalGraphCopy theCopy;
      struct vertexMap {
	const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex* original;
	xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex* copy;
	bool topsorted;
      };
      //copymap maps the copy vertices to the original graph vertices
      vertexMap copymap[theOriginal.numVertices()];
      unsigned int i = 0, s = 0, t = 0;

      //declaration of lists to hold information about the last vertex/edge eliminated
      LinearizedComputationalGraphCopy::VertexPointerList thePredList;
      LinearizedComputationalGraphCopy::VertexPointerList theSuccList;
    
      // Copy Vertices
      //declaration of iterators
      const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList& originalIndependents = theOriginal.getIndependentList();
      const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList& originalDependents = theOriginal.getDependentList();
      xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList::const_iterator oIndeps, odeps;

      xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstVertexIteratorPair vip (theOriginal.vertices());
      xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstVertexIterator vi (vip.first), v_end (vip.second);
      //iterate through vertices in the original graph, and create a vertex in the copy for each one
      for(; vi != v_end; ++vi){
	copymap[i].original = &*vi;
	copymap[i].copy = &theCopy.addVertex();
	copymap[i].topsorted = false;  //flag used for topsorting
    
	//Copy dependent and independent lists
	//go through indeps, if its in the indep list, add to the copy indep list
	for(oIndeps=originalIndependents.begin(); oIndeps != originalIndependents.end(); oIndeps++) {
	  if(copymap[i].original == *oIndeps){
	    theCopy.addToIndependentList(*copymap[i].copy);
	    break;
	  }// end if
	}// end for original indep list
      
	//go through deps, if its in the dep list, add to the copy dep list
	for(odeps=originalDependents.begin(); odeps != originalDependents.end(); odeps++) {
	  if(copymap[i].original == *odeps){
	    theCopy.addToDependentList(*copymap[i].copy);
	    break;
	  }// end if
	}// end for original indep list
	i++;
      }// end for

      //create a file and output a list of edges, which represents the graph
      std::ofstream graphdump;
      if(DbgLoggerManager::instance()->isSelected(DbgGroup::TEMPORARY)){
	graphdump.open("graphdump.txt");
      }// end if TEMPORARY

      // Copy Edges
      xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstEdgeIteratorPair eip (theOriginal.edges());
      xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstEdgeIterator ei (eip.first), e_end (eip.second);
      for(; ei != e_end; ++ei){
	//set the source and target indices for each edge
	for(s = 0; copymap[s].original != &theOriginal.getSourceOf(*ei); s++){}// end for
	for(t = 0; copymap[t].original != &theOriginal.getTargetOf(*ei); t++){}// end for
	theCopy.addEdge(*(copymap[s].copy), *(copymap[t].copy)).setOriginalRef(*ei);

	if(DbgLoggerManager::instance()->isSelected(DbgGroup::TEMPORARY)){
	  graphdump << s << " " << t << std::endl;
	}// end if TEMPORARY

      }// end for

      if(DbgLoggerManager::instance()->isSelected(DbgGroup::TEMPORARY)){
	graphdump.close();
      }// end if TEMPORARY

      //create a topsorted vertex list
      i = 0;
      while(i < theOriginal.numVertices()){  
	if(!copymap[i].topsorted){
	  LinearizedComputationalGraphCopy::InEdgeIteratorPair tsp (theCopy.getInEdgesOf(*copymap[i].copy));
	  LinearizedComputationalGraphCopy::InEdgeIterator ti (tsp.first), t_end (tsp.second);
	  for(; ti != t_end; ++ti){//go through sources and make sure they have been topsorted
	    unsigned int topindex = 0;
	    for(; copymap[topindex].copy != &theCopy.getSourceOf(*ti); topindex++){ //set topindex to the index of the source of ti
	    }// end for
	    if(!copymap[topindex].topsorted){//if there is an edge from a non-topsorted vertex, break and move on
	      break;
	    }// end if
	  }// end for
	  if(ti == t_end){//if all of the vertex's predecessors are topsorted, it can be topsorted next
	    theCopy.addToVertexList(*copymap[i].copy);
	    copymap[i].topsorted = true;
	    i = 0; //reset the loop
	  }// end if
	  else{
	    i++;
	  }// end else
	}// end if
	else{
	  i++;
	}// end else
      }// end while

      if(heuristicEnumSequence.front() == VERTEX){

	typedef void(*vertexHeuristicFunc) (const LinearizedComputationalGraphCopy&,
					    LinearizedComputationalGraphCopy::VertexPointerList&,
					    const LinearizedComputationalGraphCopy::VertexPointerList&,
					    const LinearizedComputationalGraphCopy::VertexPointerList&);

	std::list<vertexHeuristicFunc> vertexHeuristicSequence;

	heuristicEnumSequence.pop_front();
	//generate a list of function pointers that point to each heuristic that is to be used
	while(heuristicEnumSequence.size() > 0){
	  switch(heuristicEnumSequence.front()){
	  case FORWARD:
	    vertexHeuristicSequence.push_back(&VertexElim::forwardMode_v);
	    break;
	  case REVERSE:
	    vertexHeuristicSequence.push_back(&VertexElim::reverseMode_v);
	    break;
	  case MARKOWITZ:
	    vertexHeuristicSequence.push_back(&VertexElim::markowitzMode_v);
	    break;
	  case SIBLING:
	    vertexHeuristicSequence.push_back(&VertexElim::siblingMode_v);
	    break;
	  case SIBLING2:
	    vertexHeuristicSequence.push_back(&VertexElim::sibling2Mode_v);
	    break;
	  case SUCCPRED:
	    vertexHeuristicSequence.push_back(&VertexElim::succPredMode_v);
	    break;
	  default:
	    THROW_LOGICEXCEPTION_MACRO("Error: unknown heuristic passed");
	  }// end switch heuristicEnumSequence
	  heuristicEnumSequence.pop_front();
	}// end while

	//the vertex list holds all the vertices that are candidates for elimination
	LinearizedComputationalGraphCopy::VertexPointerList theVertexList = theCopy.getVertexList();
	vertexHeuristicFunc func_pt;
	std::list<vertexHeuristicFunc>::iterator vhiter;
    
	//output list of eliminations to a file
	std::ofstream sequencedump;
	if(DbgLoggerManager::instance()->isSelected(DbgGroup::TEMPORARY)){
	  sequencedump.open("f.txt");
	}// end if TEMPORARY

	//this is the elimination loop, it eliminates one vertex per iteration
	while(theVertexList.size() > 0){
	  //thevertexlist will be passed to and reduced by each heuristic
	  theVertexList = theCopy.getVertexList();

	  //all vertices that are minimal or maximal are removed from the list, they cannot be eliminated
	  LinearizedComputationalGraphCopy::VertexIteratorPair cvip (theCopy.vertices());
	  LinearizedComputationalGraphCopy::VertexIterator cvi (cvip.first), cv_end (cvip.second);
	  for(; cvi != cv_end; ++cvi){
	    if(theCopy.numInEdgesOf(*cvi) == 0){
	      theVertexList.remove(&*cvi);
	    }// end if
	    else if(theCopy.numOutEdgesOf(*cvi) == 0){
	      theVertexList.remove(&*cvi);
	    }// end if
	  }// end for

	  //this loop runs the list through each heuristic
	  if(theVertexList.size() > 0){
	    for(vhiter=vertexHeuristicSequence.begin(); vhiter!=vertexHeuristicSequence.end(); vhiter++){
	      func_pt = *vhiter;
	      func_pt(theCopy, theVertexList, thePredList, theSuccList);
	    }// end for
	  }// end if

	  if(theVertexList.size() == 1){
	    //the predlist and thesucclist hold the predecessors and successors respectively of the vertex about to be eliminated.
	    //this information is stored in case one of the heuristics needs to use it to make it's determinations.
	    thePredList.clear();
	    theSuccList.clear();
	    LinearizedComputationalGraphCopy::InEdgeIteratorPair newpreds (theCopy.getInEdgesOf(*theVertexList.front()));
	    LinearizedComputationalGraphCopy::InEdgeIterator newpredi (newpreds.first), newprede (newpreds.second);
	    //go through predecessors and add them to the list of predecessors
	    for(; newpredi != newprede; ++newpredi){
	      thePredList.push_back(&theCopy.getSourceOf(*newpredi));
	    }// end for
	    LinearizedComputationalGraphCopy::OutEdgeIteratorPair newsuccs (theCopy.getOutEdgesOf(*theVertexList.front()));
	    LinearizedComputationalGraphCopy::OutEdgeIterator newsucci (newsuccs.first), newsucce (newsuccs.second);
	    //go through successors and add them to the list of successors
	    for(; newsucci != newsucce; ++newsucci){
	      theSuccList.push_back(&theCopy.getTargetOf(*newsucci));
	    }// end for
	
	    if(DbgLoggerManager::instance()->isSelected(DbgGroup::TEMPORARY)){
	      for(s = 0; copymap[s].copy != theVertexList.front(); s++){}// end for
	      //output vertex index
	      sequencedump << s << std::endl;
	    }// end if TEMPORARY

	    VertexElim::elim_vertex(theCopy, *theVertexList.front(), theJacobianAccumulationExpressionList);

	  }// end if
	  else if(theVertexList.size() > 1){
	    THROW_LOGICEXCEPTION_MACRO("More than one vertex in list of possible eliminations");
	  }// end else
	}// end while

	if(DbgLoggerManager::instance()->isSelected(DbgGroup::TEMPORARY)){
	  sequencedump.close();
	}// end if TEMPORARY

      }// end if

      else if(heuristicEnumSequence.front() == EDGE){

	typedef void(*edgeHeuristicFunc) (const LinearizedComputationalGraphCopy&,
					  LinearizedComputationalGraphCopy::EdgePointerList&,
					  const LinearizedComputationalGraphCopy::VertexPointerList&,
					  const LinearizedComputationalGraphCopy::VertexPointerList&);
	std::list<edgeHeuristicFunc> edgeHeuristicSequence;

	heuristicEnumSequence.pop_front();
	//generate a list of function pointers that point to each heuristic that is to be used
	while(heuristicEnumSequence.size() > 0){
	  switch(heuristicEnumSequence.front()){
	  case FORWARD:
	    edgeHeuristicSequence.push_back(&EdgeElim::forwardMode_e);
	    break;
	  case REVERSE:
	    edgeHeuristicSequence.push_back(&EdgeElim::reverseMode_e);
	    break;
	  case MARKOWITZ:
	    edgeHeuristicSequence.push_back(&EdgeElim::markowitzMode_e);
	    break;
	  case SIBLING2:
	    edgeHeuristicSequence.push_back(&EdgeElim::sibling2Mode_e);
	    break;
	  default:
	    THROW_LOGICEXCEPTION_MACRO("Error: unknown heuristic passed");
	  }// end switch heuristicEnumSequence
	  heuristicEnumSequence.pop_front();
	}// end while

      
	edgeHeuristicFunc func_pt;
	std::list<edgeHeuristicFunc>::iterator ehiter;

	//output list of eliminations to a file
	std::ofstream sequencedump;
	if(DbgLoggerManager::instance()->isSelected(DbgGroup::TEMPORARY)){
	  sequencedump.open("f.txt");
	}// end if TEMPORARY

	//create list of edges with associated elim directions
	LinearizedComputationalGraphCopy::EdgeIteratorPair edgelist (theCopy.edges());
	LinearizedComputationalGraphCopy::EdgeIterator eli (edgelist.first), ele (edgelist.second);
	for(; eli != ele; ++eli){
	  if(theCopy.numOutEdgesOf(theCopy.getTargetOf(*eli)) > 0){//can be front eliminated
	    theCopy.addToEdgeList(theCopy, *eli, LinearizedComputationalGraphCopy::FRONT);
	  }// end if
	  if(theCopy.numInEdgesOf(theCopy.getSourceOf(*eli)) > 0){//can be back eliminated
	    theCopy.addToEdgeList(theCopy, *eli, LinearizedComputationalGraphCopy::BACK);
	  }// end if
	}// end for
	LinearizedComputationalGraphCopy::EdgePointerList theEdgeList = theCopy.getEdgeList();

	//this is the elimination loop, it eliminates one vertex per iteration
	while(theEdgeList.size() > 0){
	
	  //send theEdgeList to each heuristic
	  for(ehiter=edgeHeuristicSequence.begin(); ehiter!=edgeHeuristicSequence.end(); ehiter++){
	    func_pt = *ehiter;
	    func_pt(theCopy, theEdgeList, thePredList, theSuccList);
	  }// end for

	  if(theEdgeList.size() == 1){//if the heuristics have decided on one single edge
	    //reset pred and succ lists and eliminate the edge as specified
	    thePredList.clear();
	    theSuccList.clear();
	    if(theEdgeList.front().direction == LinearizedComputationalGraphCopy::FRONT){
	      thePredList.push_back(&theCopy.getSourceOf(*(theEdgeList.front().edge_p)));
	      LinearizedComputationalGraphCopy::OutEdgeIteratorPair succs (theCopy.getOutEdgesOf(theCopy.getTargetOf(*(theEdgeList.front().edge_p))));
	      LinearizedComputationalGraphCopy::OutEdgeIterator succi (succs.first), succ_end (succs.second);
	      for(; succi != succ_end; ++succi){//go through successors and add them to the list of successors
		theSuccList.push_back(&theCopy.getTargetOf(*succi));
	      }// end for

	      if(DbgLoggerManager::instance()->isSelected(DbgGroup::TEMPORARY)){
		for(s = 0; copymap[s].copy != &theCopy.getSourceOf(*(theEdgeList.front()).edge_p); s++){}// end for
		for(t = 0; copymap[t].copy != &theCopy.getTargetOf(*(theEdgeList.front()).edge_p); t++){}// end for
		//output source and target indices
		sequencedump << s << " " << t << std::endl;
	      }// end if TEMPORARY

	      EdgeElim::front_elim_edge(theCopy, *(theEdgeList.front().edge_p), theJacobianAccumulationExpressionList);
	    }// end if
	    else if((theEdgeList.front()).direction == LinearizedComputationalGraphCopy::BACK){
	      theSuccList.push_back(&theCopy.getTargetOf(*(theEdgeList.front().edge_p)));
	      LinearizedComputationalGraphCopy::InEdgeIteratorPair preds (theCopy.getInEdgesOf(theCopy.getSourceOf(*((theEdgeList.front()).edge_p))));
	      LinearizedComputationalGraphCopy::InEdgeIterator predi (preds.first), pred_end (preds.second);
	      for(; predi != pred_end; ++predi){//go through predecessors and add them to the list of predecessors
		thePredList.push_back(&theCopy.getSourceOf(*predi));
	      }// end for

	      if(DbgLoggerManager::instance()->isSelected(DbgGroup::TEMPORARY)){
		for(s = 0; copymap[s].copy != &theCopy.getSourceOf(*(theEdgeList.front()).edge_p); s++){}// end for
		for(t = 0; copymap[t].copy != &theCopy.getTargetOf(*(theEdgeList.front()).edge_p); t++){}// end for
		//output source and target indices
		sequencedump << s << " " << t << std::endl;
	      }// end if TEMPORARY

	      EdgeElim::back_elim_edge(theCopy, *(theEdgeList.front().edge_p), theJacobianAccumulationExpressionList);
	    }// end else if
	    else{
	      THROW_LOGICEXCEPTION_MACRO("Error: edge has no elimination direction specified");
	    }
	
	  }// end if
	  else{
	    THROW_LOGICEXCEPTION_MACRO("More than one edge in list of possible eliminations");
	  }// end else

	  //create list of edges with associated elim directions
	  theCopy.clearEdgeList();
	  LinearizedComputationalGraphCopy::EdgeIteratorPair edgelist (theCopy.edges());
	  LinearizedComputationalGraphCopy::EdgeIterator eli (edgelist.first), ele (edgelist.second);
	  for(; eli != ele; ++eli){
	    if(theCopy.numOutEdgesOf(theCopy.getTargetOf(*eli)) > 0){//can be front eliminated
	      theCopy.addToEdgeList(theCopy, *eli, LinearizedComputationalGraphCopy::FRONT);
	    }// end if
	    if(theCopy.numInEdgesOf(theCopy.getSourceOf(*eli)) > 0){//can be back eliminated
	      theCopy.addToEdgeList(theCopy, *eli, LinearizedComputationalGraphCopy::BACK);
	    }// end if
	  }// end for
	  theEdgeList = theCopy.getEdgeList();

	}// end while
      
	if(DbgLoggerManager::instance()->isSelected(DbgGroup::TEMPORARY)){
	  sequencedump.close();
	}// end if TEMPORARY

      }// end else if

      else{
	THROW_LOGICEXCEPTION_MACRO("Must specify either vertex or edge elimination");
      }// end else

      //iterate through remaining edges and set corresponding expressions as jacobian entries
      LinearizedComputationalGraphCopy::EdgeIteratorPair jeip (theCopy.edges());
      LinearizedComputationalGraphCopy::EdgeIterator ci (jeip.first), c_end (jeip.second);
      for(; ci != c_end; ++ci){
	unsigned int indepindex = 0;
	for(; copymap[indepindex].copy != &theCopy.getSourceOf(*ci); indepindex++){
	}
	unsigned int depindex = 0;
	for(; copymap[depindex].copy != &theCopy.getTargetOf(*ci); depindex++){
	}
	//check to see if the edge was an original edge, if so, create a JAE comprised of one vertex for it
	if((*ci).getRefType() == LinearizedComputationalGraphCopyEdge::TO_ORIGINAL_EDGE){
	  JacobianAccumulationExpressionCopy* theNewExpression = new JacobianAccumulationExpressionCopy(theJacobianAccumulationExpressionList.addExpression());
	
	  xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& orig = ((*theNewExpression).myExpression).addVertex();
	  orig.setExternalReference((*ci).getOriginalRef());
	  (*theNewExpression).setMaximal(orig);
	  (*ci).setJacobianRef(theNewExpression);
	}// end if

	(((*ci).getJacobianRef()).myExpression).setJacobianEntry(*(copymap[depindex].original), *(copymap[indepindex].original));
      }// end for
      if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {
	GraphVizDisplay::show(theCopy,"bipartite");
      }

    }// end else (vertex or edge)

  } // end compute_elimination_sequence
  
  BasicBlockAlg::BasicBlockAlg(BasicBlock& theContaining) :
      xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg(theContaining) {
      xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::compute_elimination_sequence=&compute_elimination_sequence; 
  }

  void
  BasicBlockAlg::algorithm_action_2() {
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::algorithm_action_2();
  }

  void
  BasicBlockAlg::algorithm_action_3() {
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::algorithm_action_3();
  }

  void
  BasicBlockAlg::printXMLHierarchy(std::ostream& os) const {
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::printXMLHierarchy(os);
  }

  std::string BasicBlockAlg::debug () const { 
    std::ostringstream out;
    out << "xaifBoosterMemOpsTradeoffPreaccumulation::BasicBlockAlg[" << this
 	<< "]" << std::ends;  
    return out.str();
  } // end of BasicBlockAlg::debug

  void BasicBlockAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::traverseToChildren(anAction_c);
  }

} // end of namespace
