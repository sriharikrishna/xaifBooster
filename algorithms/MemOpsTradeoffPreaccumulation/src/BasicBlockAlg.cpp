#include <sstream>
#include <iostream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/GraphVizDisplay.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/BasicBlockAlg.hpp"

#include "xaifBooster/system/inc/BasicBlock.hpp"
using namespace xaifBooster;

namespace xaifBoosterMemOpsTradeoffPreaccumulation { 

  void BasicBlockAlg::compute_elimination_sequence(
      const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& theOriginal,
      int mode,
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& theJacobianAccumulationExpressionList){
    
    GraphVizDisplay::show(theOriginal,"flattened");

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

    std::cout << "edges copied" << std::endl;

    //create a topsorted intermediate list
    i = 0;
    for(; i < numOriginalVertices; i++){  
      if(!copymap[i].topsorted){
	bool topsortable = true;
	MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::InEdgeIteratorPair tsp (theCopy.getInEdgesOf(*copymap[i].copy));
	MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::InEdgeIterator ti (tsp.first), t_end (tsp.second);
	for(; ti != t_end; ++ti){
	  unsigned int topindex = 0;
	  for(; copymap[topindex].copy != &theCopy.getSourceOf(*ti); topindex++){ //set topindex to the index of the source of ti
	  }// end for
	  if(!copymap[topindex].topsorted){//if there is an edge from a non-topsorted vertex, break and start over
	    topsortable = false;
	    i = 0;
	    break;
	  }// end if
        }// end for
	if(topsortable){//if it is a candidate for topsorting
	    theCopy.addToIntermediateList(*copymap[i].copy);
	    copymap[i].topsorted = true;
	}// end if
      }// end if
    }// end for

    std::cout << "intermediate list constructed" << std::endl;
    
    //std::cout << "choose the mode to be used (forward=1, reverse=2, markowitz[not implemented]=3): ";
    //std::cin >> mode;
    mode = 2;
    switch(mode){
      case 1:
        forwardMode(theCopy,theJacobianAccumulationExpressionList); 
      break;
      case 2:
	reverseMode(theCopy,theJacobianAccumulationExpressionList);
      break;
      case 3:
	markowitzMode(theCopy,theJacobianAccumulationExpressionList);
      break;
      default:
      std::cout << "mode not supported, currently supported modes are: Forward(1) Reverse(2) Markowitz[not implemented](3)";
    }

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
      (((*ci).getJacobianRef()).myExpression).setJacobianEntry(*(copymap[depindex].original), *(copymap[indepindex].original));
    }// end for
    GraphVizDisplay::show(theCopy,"bipartite");
  } // end compute_elimination_sequence
  
  void BasicBlockAlg::forwardMode(
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy& theCopy,
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& theJacobianAccumulationExpressionList){
    
    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList& inter_list = theCopy.getIntermediateList();
    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList::iterator bi = inter_list.begin(), be = inter_list.end();
    while(bi != be) {
      be--;
      elim_vertex(theCopy, **be, theJacobianAccumulationExpressionList);
      theCopy.removeFromIntermediateList(**be);
    }// end for
  }

  void BasicBlockAlg::reverseMode(
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy& theCopy,
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& theJacobianAccumulationExpressionList){

    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList& inter_list = theCopy.getIntermediateList();
    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList::iterator bi = inter_list.begin(), be = inter_list.end();
    for (; bi != be; bi++) {
      elim_vertex(theCopy, **bi, theJacobianAccumulationExpressionList);
      theCopy.removeFromIntermediateList(**bi);
    }// end for
  }

  void BasicBlockAlg::markowitzMode(
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy& theCopy,
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& theJacobianAccumulationExpressionList){

    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList& inter_list = theCopy.getIntermediateList();
    MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList::iterator bi = inter_list.begin(), be = inter_list.end();
    xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex* lowestMarkowitz = *bi;
    for (; bi != be; bi++) {
      for (; bi != be; bi++) {
	if(((theCopy.numInEdgesOf(**bi))*(theCopy.numOutEdgesOf(**bi)))<((theCopy.numInEdgesOf(*lowestMarkowitz))*(theCopy.numOutEdgesOf(*lowestMarkowitz)))){
	  lowestMarkowitz = *bi;
	}// end if
      }// end for
      elim_vertex(theCopy, *lowestMarkowitz, theJacobianAccumulationExpressionList);
      theCopy.removeFromIntermediateList(**bi);
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopy::VertexPointerList&  inter_list = theCopy.getIntermediateList();
      bi = inter_list.begin();
      be = inter_list.end();
      lowestMarkowitz = *bi;
    }// end for
   
  }// end markowitzMode

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
    theCopy.removeAndDeleteVertex(theVertex);
    //GraphVizDisplay::show(theCopy,"bipartite");
  }// end elim_vertex
  
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

  std::string
  BasicBlockAlg::debug() const {
    return xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::debug();
  }

  void BasicBlockAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::traverseToChildren(anAction_c);
  }

} // end of namespace
