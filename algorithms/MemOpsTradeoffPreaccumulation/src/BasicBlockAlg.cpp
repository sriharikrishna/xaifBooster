#include <sstream>
#include <iostream>
#include <list>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/GraphVizDisplay.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/BasicBlockAlg.hpp"

#include "xaifBooster/system/inc/BasicBlock.hpp"

enum Heuristic {FORWARD, REVERSE, MARKOWITZ, SIBLING, SIBLING2, SUCCPRED};

using namespace xaifBooster;

namespace xaifBoosterMemOpsTradeoffPreaccumulation { 

  void BasicBlockAlg::compute_elimination_sequence(
      const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& theOriginal,
      int mode,
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& theJacobianAccumulationExpressionList){
    
    if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {
      GraphVizDisplay::show(theOriginal,"flattened");
    }

    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy theCopy;
    struct vertexMap {
      const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex* original;
      xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex* copy;
      bool topsorted;
    };
    unsigned int numOriginalVertices = theOriginal.numVertices();
    vertexMap copymap[numOriginalVertices];
    unsigned int i = 0;

    // Copy Vertices
    xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstVertexIteratorPair vip (theOriginal.vertices());
    xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstVertexIterator vi (vip.first), v_end (vip.second);
    for(; vi != v_end; ++vi){
      copymap[i].original = &*vi;
      copymap[i].copy = &theCopy.addVertex();
      copymap[i].topsorted = false;
      if(theOriginal.numInEdgesOf(*vi)==0){
	theCopy.addToIndependentList(*copymap[i].copy);
	copymap[i].topsorted = true;
      }// end if
      if(theOriginal.numOutEdgesOf(*vi)==0){
	theCopy.addToDependentList(*copymap[i].copy);
	copymap[i].topsorted = true;
      }// end if
      i++;
    }// end for

    // Copy Edges
    xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstEdgeIteratorPair eip (theOriginal.edges());
    xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstEdgeIterator ei (eip.first), e_end (eip.second);
    for(; ei != e_end; ++ei){
      unsigned int s = 0;
      for(; copymap[s].original != &theOriginal.getSourceOf(*ei); s++){
      }// end for
      unsigned int d = 0;
      for(; copymap[d].original != &theOriginal.getTargetOf(*ei); d++){
      }// end for
      theCopy.addEdge(*(copymap[s].copy), *(copymap[d].copy)).setOriginalRef(*ei);
    }// end for

    //create a topsorted intermediate list
    i = 0;
    while(i < numOriginalVertices){  
      if(!copymap[i].topsorted){
	MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::InEdgeIteratorPair tsp (theCopy.getInEdgesOf(*copymap[i].copy));
	MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::InEdgeIterator ti (tsp.first), t_end (tsp.second);
	for(; ti != t_end; ++ti){//go through sources and make sure they have been topsorted
	  unsigned int topindex = 0;
	  for(; copymap[topindex].copy != &theCopy.getSourceOf(*ti); topindex++){ //set topindex to the index of the source of ti
	  }// end for
	  if(!copymap[topindex].topsorted){//if there is an edge from a non-topsorted vertex, break and move on
	    break;
	  }// end if
        }// end for
	if(ti == t_end){
	  theCopy.addToIntermediateList(*copymap[i].copy);
	  copymap[i].topsorted = true;
	  i = 0;
	}// end if
	else{
	  i++;
	}// end else
      }// end if
      else{
	i++;
      }// end else
    }// end while

    
    std::list<Heuristic> heuristicEnumSequence;
    //    heuristicEnumSequence.push_back(SIBLING2);
    heuristicEnumSequence.push_back(MARKOWITZ);
    heuristicEnumSequence.push_back(REVERSE);

    typedef void(*heuristicfunc) (MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy&,
		 MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList&,
		 MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList&,
		 MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList&);

    std::list<heuristicfunc> heuristicSequence;

    while(heuristicEnumSequence.size() > 0){

      switch(heuristicEnumSequence.front()){
      case FORWARD:
	heuristicSequence.push_back(&BasicBlockAlg::forwardMode);
	break;
      case REVERSE:
	heuristicSequence.push_back(&BasicBlockAlg::reverseMode);
	break;
      case MARKOWITZ:
	heuristicSequence.push_back(&BasicBlockAlg::markowitzMode);
	break;
      case SIBLING:
	heuristicSequence.push_back(&BasicBlockAlg::siblingMode);
	break;
      case SIBLING2:
	heuristicSequence.push_back(&BasicBlockAlg::sibling2Mode);
	break;
      case SUCCPRED:
	heuristicSequence.push_back(&BasicBlockAlg::succPredMode);
	break;
      }// end switch heuristicEnumSequence

      heuristicEnumSequence.pop_front();

    }// end while

    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList theList;
    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList thePredList;
    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList theSuccList;
    
   heuristicfunc func_pt;

    std::list<heuristicfunc>::iterator hiter;
    
    while((theCopy.getIntermediateList()).size() > 0){
      theList = theCopy.getIntermediateList();

      for(hiter=heuristicSequence.begin(); hiter!=heuristicSequence.end(); hiter++){
	func_pt = *hiter;
	func_pt(theCopy, theList, thePredList, theSuccList);
      }// end while

      if(theList.size() == 1){

	thePredList.clear();
	theSuccList.clear();
	MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::InEdgeIteratorPair preds (theCopy.getInEdgesOf(*theList.front()));
	MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::InEdgeIterator predi (preds.first), pred_end (preds.second);
	for(; predi != pred_end; ++predi){//go through predecessors and add them to the list of predecessors
	  thePredList.push_back(&theCopy.getSourceOf(*predi));
	}// end for
	MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::OutEdgeIteratorPair succs (theCopy.getOutEdgesOf(*theList.front()));
	MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::OutEdgeIterator succi (succs.first), succ_end (succs.second);
	for(; succi != succ_end; ++succi){//go through successors and add them to the list of successors
	  theSuccList.push_back(&theCopy.getTargetOf(*succi));
	}// end for
	elim_vertex(theCopy, *theList.front(), theJacobianAccumulationExpressionList);

      }// end if

      else{
	THROW_LOGICEXCEPTION_MACRO("More than one vertex in list of possible eliminations");
      }// end else


    }// end while


    //iterate through remaining edges and set corresponding expressions as jacobian entries
    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::EdgeIteratorPair jeip (theCopy.edges());
    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::EdgeIterator ci (jeip.first), c_end (jeip.second);
    for(; ci != c_end; ++ci){
      unsigned int indepindex = 0;
      for(; copymap[indepindex].copy != &theCopy.getSourceOf(*ci); indepindex++){
      }
      unsigned int depindex = 0;
      for(; copymap[depindex].copy != &theCopy.getTargetOf(*ci); depindex++){
      }
      //check to see if the edge was an original edge, if so, create a JAE comprised of one vertex for it
      if((*ci).getRefType() == MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopyEdge::TO_ORIGINAL_EDGE){
	MemOpsTradeoffPreaccumulation::JacobianAccumulationExpressionCopy* theNewExpression = 
	  new MemOpsTradeoffPreaccumulation::JacobianAccumulationExpressionCopy(theJacobianAccumulationExpressionList.addExpression());
	
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
  } // end compute_elimination_sequence
  
  void BasicBlockAlg::forwardMode(
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy& theCopy,
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList& theOldList,
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList& theSuccList){
    
    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList theNewList;
    theNewList.push_back(theOldList.front());
    theOldList = theNewList;

  }// end forwardMode

  void BasicBlockAlg::reverseMode(
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy& theCopy,
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList& theOldList,
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList& theSuccList){

    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList theNewList;
    theNewList.push_back(theOldList.back());
    theOldList = theNewList;

  }// end reverseMode

  void BasicBlockAlg::markowitzMode(
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy& theCopy,
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList& theOldList,
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList& theSuccList){

    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList theNewList;
    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList::iterator bi=theOldList.begin(), be=theOldList.end();
    theNewList.push_back(*bi);
    bi++;
    for(; bi != be; bi++) {
      	if(((theCopy.numInEdgesOf(**bi))*(theCopy.numOutEdgesOf(**bi))) <
	   ((theCopy.numInEdgesOf(*theNewList.front()))*(theCopy.numOutEdgesOf(*theNewList.front())))){
	  theNewList.clear();
	  theNewList.push_back(*bi);
	}// end if
	else if(((theCopy.numInEdgesOf(**bi))*(theCopy.numOutEdgesOf(**bi))) ==
	   ((theCopy.numInEdgesOf(*theNewList.front()))*(theCopy.numOutEdgesOf(*theNewList.front())))){
	  theNewList.push_back(*bi);
	}// end if
    }// end for=
    theOldList = theNewList;
  }// end markowitzMode

  void BasicBlockAlg::siblingMode(
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy& theCopy,
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList& theOldList,
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList& theSuccList){

    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList theNewList;
    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList::iterator predi=thePredList.begin(), prede=thePredList.end();
    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList::iterator succi=theSuccList.begin(), succe=theSuccList.end();
    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList::iterator bi = theOldList.begin(), be = theOldList.end();
    for(; bi != be; bi++) {
      bool predMatch = false;
      bool succMatch = false;

      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::InEdgeIteratorPair inedges (theCopy.getInEdgesOf(**bi));
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::InEdgeIterator ie=inedges.first, iend=inedges.second;
      for(; ie != iend; ++ie){
	for(predi=thePredList.begin(); predi != prede; predi++) {
	  if(&theCopy.getSourceOf(*ie) == *predi){
	    predMatch = true;
	    break;
	  }// end if
	}// end for pred list
	if(predMatch){
	  break;
	}// end if
      }// end for candidate inedges
	
      if(predMatch){
	MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::OutEdgeIteratorPair outedges (theCopy.getOutEdgesOf(**bi));
	MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::OutEdgeIterator oe=outedges.first, oend=outedges.second;
	for(; oe != oend; ++oe){
	  for(succi=theSuccList.begin(); succi != succe; succi++) {
	    if(&theCopy.getTargetOf(*oe) == *succi){
	      succMatch = true;
	      break;
	    }// end if
	  }//end for succ list
	  if(succMatch){
	    break;
	  }// end if
	}// end for candidate outedges
      }// end if

      if(predMatch && succMatch){
	theNewList.push_back(*bi);
      }// end if
    }// end for each in old list
    if(theNewList.size() > 0){
      theOldList = theNewList;
    }// end if
  }// end siblingMode

  void BasicBlockAlg::sibling2Mode(
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy& theCopy,
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList& theOldList,
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList& theSuccList){

    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList theNewList;
    unsigned int highestdegree = 0;
    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList::iterator predi=thePredList.begin(), prede=thePredList.end();
    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList::iterator succi=theSuccList.begin(), succe=theSuccList.end();
    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList::iterator bi = theOldList.begin(), be = theOldList.end();
    for(; bi != be; bi++) {
      unsigned int predMatch = 0;
      unsigned int succMatch = 0;

      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::InEdgeIteratorPair inedges (theCopy.getInEdgesOf(**bi));
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::InEdgeIterator ie=inedges.first, iend=inedges.second;
      for(; ie != iend; ++ie){
	for(predi=thePredList.begin(); predi != prede; predi++) {
	  if(&theCopy.getSourceOf(*ie) == *predi){
	    predMatch++;
	  }// end if
	}// end for pred list
      }// end for candidate inedges
	
      if(predMatch){
	MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::OutEdgeIteratorPair outedges (theCopy.getOutEdgesOf(**bi));
	MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::OutEdgeIterator oe=outedges.first, oend=outedges.second;
	for(; oe != oend; ++oe){
	  for(succi=theSuccList.begin(); succi != succe; succi++) {
	    if(&theCopy.getTargetOf(*oe) == *succi){
	      succMatch++;
	    }// end if
	  }//end for succ list
	}// end for candidate outedges
      }// end if

      if(predMatch*succMatch > highestdegree){
	highestdegree = predMatch*succMatch;
	theNewList.push_back(*bi);
      }// end if
      else if((predMatch*succMatch == highestdegree) && (highestdegree > 0)){
	theNewList.push_back(*bi);
      }// end else if
    }// end for each in old list

    if(theNewList.size() > 0){
      theOldList = theNewList;
    }// end if
  }// end sibling2Mode

  void BasicBlockAlg::succPredMode(
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy& theCopy,
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList& theOldList,
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList& theSuccList){

    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList theNewList;
    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList::iterator predi=thePredList.begin(), prede=thePredList.end();
    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList::iterator succi=theSuccList.begin(), succe=theSuccList.end();
    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList::iterator bi = theOldList.begin(), be = theOldList.end();
    for(; bi != be; bi++) {
      bool isMatch = false;
    
      for(predi=thePredList.begin(); predi != prede; predi++) {
	if(*bi == *predi){
	  isMatch = true;
	  break;
	}// end if
      }// end for pred list
	
      for(succi=theSuccList.begin(); succi != succe; succi++) {
	if(*bi == *succi){
	  isMatch = true;
	  break;
        }// end if
      }//end for succ list
 
      if(isMatch){
	theNewList.push_back(*bi);
      }// end if
    }// end for each in old list

    if(theNewList.size() > 0){
      theOldList = theNewList;
    }// end if
  }// end succPredMode

  void BasicBlockAlg::elim_vertex(
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy& theCopy,
      xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theVertex,
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& theJacobianAccumulationExpressionList){
    
    //iterator over inedges of theVertex
    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::InEdgeIteratorPair inedges (theCopy.getInEdgesOf(theVertex));
    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::InEdgeIterator ie=inedges.first, iend=inedges.second;
    //iterator over outedges of theVertex
    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::OutEdgeIteratorPair outedges (theCopy.getOutEdgesOf(theVertex));
    
    for(; ie != iend; ++ie){
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::OutEdgeIterator oe=outedges.first, oend=outedges.second;
      for(; oe != oend; ++oe){
	MemOpsTradeoffPreaccumulation::JacobianAccumulationExpressionCopy* theExpression = 
	  new MemOpsTradeoffPreaccumulation::JacobianAccumulationExpressionCopy(theJacobianAccumulationExpressionList.addExpression());

	//add first minimal vertex: edge into theVertex
       	xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& miniin = ((*theExpression).myExpression).addVertex();
	if((*ie).getRefType() == MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopyEdge::TO_INTERNAL_EXPRESSION){
	  miniin.setInternalReference(((*ie).getJacobianRef()).getMaximal());
	}
	else{
	  miniin.setExternalReference((*ie).getOriginalRef());
	}
	//add second minimal vertex: edge out of theVertex
	xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& miniout = ((*theExpression).myExpression).addVertex();    
	if((*oe).getRefType() == MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopyEdge::TO_INTERNAL_EXPRESSION){
	  miniout.setInternalReference(((*oe).getJacobianRef()).getMaximal());
	}// end if
	else{
	  miniout.setExternalReference((*oe).getOriginalRef());
	}// end else
	//create "mult" vertex and connect it to miniin and miniout
	xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& mult = ((*theExpression).myExpression).addVertex();
	mult.setOperation(xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::MULT_OP);
	((*theExpression).myExpression).addEdge(miniin, mult);
	((*theExpression).myExpression).addEdge(miniout, mult);
	
	//iterator used to check for a direct edge from source to target
	MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::OutEdgeIteratorPair srcoutedges (theCopy.getOutEdgesOf(theCopy.getSourceOf(*ie)));
	MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::OutEdgeIterator srcoe = srcoutedges.first, srcoend = srcoutedges.second;
	MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopyEdge* directEdge_pt = NULL;
	for(; srcoe != srcoend; ++srcoe){
	  if(&theCopy.getTargetOf(*srcoe) == &theCopy.getTargetOf(*oe)){
	    directEdge_pt = &*srcoe;
	    break;
	  } //endif
	}//end while

	MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopyEdge& theNewEdge = theCopy.addEdge(theCopy.getSourceOf(*ie), theCopy.getTargetOf(*oe));
	theNewEdge.setJacobianRef(theExpression);
	if(directEdge_pt != NULL){        //create vertex for direct edge, and "add" vertex, point new edge to it
	  xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& add = ((*theExpression).myExpression).addVertex();
	  add.setOperation(xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::ADD_OP);
	  //add vertex for direct edge
	  xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& minidirect = ((*theExpression).myExpression).addVertex();
	  if((*directEdge_pt).getRefType() == MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopyEdge::TO_INTERNAL_EXPRESSION){
	    minidirect.setInternalReference(((*directEdge_pt).getJacobianRef()).getMaximal());
	  }
	  else{
	    minidirect.setExternalReference((*directEdge_pt).getOriginalRef());
	  }
	  ((*theExpression).myExpression).addEdge(mult, add);     //connect "add" vertex to minidirect and mult
	  ((*theExpression).myExpression).addEdge(minidirect, add);
	  theCopy.removeAndDeleteEdge(*directEdge_pt);
	  (*theExpression).setMaximal(add);
	}// end if
	else{      //point the new edge to "mult"
	  (*theExpression).setMaximal(mult);	  
	}// end else
      }// end outedge iteration
    }// end inedge iteration
    theCopy.removeFromIntermediateList(theVertex);
    theCopy.removeAndDeleteVertex(theVertex);
    
    if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {
         GraphVizDisplay::show(theCopy,"bipartite");
    }
  }// end elim_vertex

  void BasicBlockAlg::front_elim_edge(
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy& theCopy,
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopyEdge& theEdge,
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& theJacobianAccumulationExpressionList){

  }// end front_elim_edge

  void BasicBlockAlg::back_elim_edge(
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy& theCopy,
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopyEdge& theEdge,
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& theJacobianAccumulationExpressionList){

  }// end back_elim_edge
  
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
