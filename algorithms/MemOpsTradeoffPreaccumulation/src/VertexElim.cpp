#include <sstream>
#include <list>
#include <algorithm>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include "xaifBooster/system/inc/GraphVizDisplay.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/VertexElim.hpp"

using namespace MemOpsTradeoffPreaccumulation;

namespace xaifBoosterMemOpsTradeoffPreaccumulation { 

  void VertexElim::forwardMode_v(const LinearizedComputationalGraphCopy& theCopy,
				 LinearizedComputationalGraphCopy::VertexPointerList& theOldVertexList,
				 const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
				 const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList){
    
    LinearizedComputationalGraphCopy::VertexPointerList theNewList;
    theNewList.push_back(theOldVertexList.front());
    theOldVertexList = theNewList;

  }// end forwardMode

  void VertexElim::reverseMode_v(const LinearizedComputationalGraphCopy& theCopy,
				 LinearizedComputationalGraphCopy::VertexPointerList& theOldVertexList,
				 const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
				 const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList){

    LinearizedComputationalGraphCopy::VertexPointerList theNewList;
    theNewList.push_back(theOldVertexList.back());
    theOldVertexList = theNewList;

  }// end reverseMode

  void VertexElim::markowitzMode_v(const LinearizedComputationalGraphCopy& theCopy,
				   LinearizedComputationalGraphCopy::VertexPointerList& theOldVertexList,
				   const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
				   const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList){

    LinearizedComputationalGraphCopy::VertexPointerList theNewList;
    LinearizedComputationalGraphCopy::VertexPointerList::iterator bi=theOldVertexList.begin();
    //push the first element in the list to have something to compare the rest to
    theNewList.push_back(*bi);
    bi++;
    for(; bi != theOldVertexList.end(); bi++) {
        //for each vertex in the list, if the markowitz degree is lower than those in the list, we clear the list
        //and add the vertex.  if the degree is the same as the list, we simply push it into the list
      	if(((theCopy.numInEdgesOf(**bi))*(theCopy.numOutEdgesOf(**bi))) <
	   ((theCopy.numInEdgesOf(*theNewList.front()))*(theCopy.numOutEdgesOf(*theNewList.front())))){
	  theNewList.clear();
	  theNewList.push_back(*bi);
	}// end if
	else if(((theCopy.numInEdgesOf(**bi))*(theCopy.numOutEdgesOf(**bi))) ==
	   ((theCopy.numInEdgesOf(*theNewList.front()))*(theCopy.numOutEdgesOf(*theNewList.front())))){
	  theNewList.push_back(*bi);
	}// end else if
    }// end for
    theOldVertexList = theNewList;
  }// end markowitzMode

  void VertexElim::siblingMode_v(const LinearizedComputationalGraphCopy& theCopy,
				 LinearizedComputationalGraphCopy::VertexPointerList& theOldVertexList,
				 const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
				 const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList){

    LinearizedComputationalGraphCopy::VertexPointerList theNewList;
    LinearizedComputationalGraphCopy::VertexPointerList::const_iterator predi, succi;
    LinearizedComputationalGraphCopy::VertexPointerList::iterator bi;
    //iterate through every vertex in the list of intermediates
    for(bi = theOldVertexList.begin(); bi != theOldVertexList.end(); bi++) {
      bool predMatch = false;
      bool succMatch = false;

      //if the vertex has a predecessor in the predlist, set predmatch to true
      LinearizedComputationalGraphCopy::ConstInEdgeIteratorPair inedges (theCopy.getInEdgesOf(**bi));
      LinearizedComputationalGraphCopy::ConstInEdgeIterator ie=inedges.first, iend=inedges.second;
      for(; ie != iend; ++ie){
	for(predi=thePredList.begin(); predi != thePredList.end(); predi++) {
	  if(&theCopy.getSourceOf(*ie) == *predi){
	    predMatch = true;
	    break;
	  }// end if
	}// end for pred list
	if(predMatch){
	  break;
	}// end if
      }// end for candidate inedges
	
      //if there is a predmatch, check for a succmatch.  if there is a match, push the vertyex to the new list
      if(predMatch){
	LinearizedComputationalGraphCopy::ConstOutEdgeIteratorPair outedges (theCopy.getOutEdgesOf(**bi));
	LinearizedComputationalGraphCopy::ConstOutEdgeIterator oe=outedges.first, oend=outedges.second;
	for(; oe != oend; ++oe){
	  for(succi=theSuccList.begin(); succi != theSuccList.end(); succi++) {
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
    //only change the vertex list if we have found a sibling
    if(theNewList.size() > 0){
      theOldVertexList = theNewList;
    }// end if
  }// end siblingMode

  void VertexElim::sibling2Mode_v(const LinearizedComputationalGraphCopy& theCopy,
				  LinearizedComputationalGraphCopy::VertexPointerList& theOldVertexList,
				  const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
				  const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList){

    LinearizedComputationalGraphCopy::VertexPointerList theNewList;
    unsigned int highestdegree = 0;
    LinearizedComputationalGraphCopy::VertexPointerList::const_iterator predi, succi;
    LinearizedComputationalGraphCopy::VertexPointerList::iterator bi;
    for(bi = theOldVertexList.begin(); bi != theOldVertexList.end(); bi++) {
      unsigned int predMatch = 0;
      unsigned int succMatch = 0;

      //find the number of matching predecessors
      LinearizedComputationalGraphCopy::ConstInEdgeIteratorPair inedges (theCopy.getInEdgesOf(**bi));
      LinearizedComputationalGraphCopy::ConstInEdgeIterator ie=inedges.first, iend=inedges.second;
      for(; ie != iend; ++ie){
	for(predi=thePredList.begin(); predi != thePredList.end(); predi++) {
	  if(&theCopy.getSourceOf(*ie) == *predi){
	    predMatch++;
	  }// end if
	}// end for pred list
      }// end for candidate inedges

      //if any preds match, find the number of matching sucessors
      if(predMatch){
	LinearizedComputationalGraphCopy::ConstOutEdgeIteratorPair outedges (theCopy.getOutEdgesOf(**bi));
	LinearizedComputationalGraphCopy::ConstOutEdgeIterator oe=outedges.first, oend=outedges.second;
	for(; oe != oend; ++oe){
	  for(succi=theSuccList.begin(); succi != theSuccList.end(); succi++) {
	    if(&theCopy.getTargetOf(*oe) == *succi){
	      succMatch++;
	    }// end if
	  }//end for succ list
	}// end for candidate outedges
      }// end if

      //if the "sibling degree" is higher than those already in the list, clear the list and push back the vertex
      if(predMatch*succMatch > highestdegree){
	highestdegree = predMatch*succMatch;
	theNewList.clear();
	theNewList.push_back(*bi);
      }// end if
      //if they have the same degree, simply push it to the list
      else if((predMatch*succMatch == highestdegree) && (highestdegree > 0)){
	theNewList.push_back(*bi);
      }// end else if
    }// end for each in old list
    //only change the old list if we have found at least one candidate
    if(theNewList.size() > 0){
      theOldVertexList = theNewList;
    }// end if
  }// end sibling2Mode

  void VertexElim::succPredMode_v(const LinearizedComputationalGraphCopy& theCopy,
				  LinearizedComputationalGraphCopy::VertexPointerList& theOldVertexList,
				  const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
				  const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList){

    LinearizedComputationalGraphCopy::VertexPointerList theNewList;
    LinearizedComputationalGraphCopy::VertexPointerList::const_iterator predi, succi;
    LinearizedComputationalGraphCopy::VertexPointerList::iterator bi;
    for(bi = theOldVertexList.begin(); bi != theOldVertexList.end(); bi++) {
      bool isMatch = false;
      //search for the vertex in the predlist
      for(predi=thePredList.begin(); predi != thePredList.end(); predi++) {
	if(*bi == *predi){
	  isMatch = true;
	  break;
	}// end if
      }// end for pred list
      //search for the vertex in the succlist
      for(succi=theSuccList.begin(); succi != theSuccList.end(); succi++) {
	if(*bi == *succi){
	  isMatch = true;
	  break;
        }// end if
      }//end for succ list
 
      if(isMatch){
	theNewList.push_back(*bi);
      }// end if
    }// end for each in old list

    //only change the old list if we have found at least one candidate
    if(theNewList.size() > 0){
      theOldVertexList = theNewList;
    }// end if
  }// end succPredMode

  void VertexElim::elim_vertex(LinearizedComputationalGraphCopy& theCopy,
			       xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theVertex,
			       xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& theJacobianAccumulationExpressionList){
    
    //iterator over inedges of theVertex
    LinearizedComputationalGraphCopy::InEdgeIteratorPair inedges (theCopy.getInEdgesOf(theVertex));
    LinearizedComputationalGraphCopy::InEdgeIterator ie=inedges.first, iend=inedges.second;
    //iterator over outedges of theVertex
    LinearizedComputationalGraphCopy::OutEdgeIteratorPair outedges (theCopy.getOutEdgesOf(theVertex));
    
    for(; ie != iend; ++ie){
      LinearizedComputationalGraphCopy::OutEdgeIterator oe=outedges.first, oend=outedges.second;
      for(; oe != oend; ++oe){
	JacobianAccumulationExpressionCopy* theExpression = new JacobianAccumulationExpressionCopy(theJacobianAccumulationExpressionList.addExpression());

	//add first minimal vertex: edge into theVertex
       	xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& miniin = ((*theExpression).myExpression).addVertex();
	//if the edge points to a JAE rather than an original vertex, the new vertex is set to point to the maximal vertex of the JAE
	//that the edge points to
	if((*ie).getRefType() == LinearizedComputationalGraphCopyEdge::TO_INTERNAL_EXPRESSION){
	  miniin.setInternalReference(((*ie).getJacobianRef()).getMaximal());
	}
	//if the edge points to an original vertex, it is set as an external ref, and points to the original edge that the copy edge pointed to
	else{
	  miniin.setExternalReference((*ie).getOriginalRef());
	}
	//add second minimal vertex: edge out of theVertex
	xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& miniout = ((*theExpression).myExpression).addVertex();    
	if((*oe).getRefType() == LinearizedComputationalGraphCopyEdge::TO_INTERNAL_EXPRESSION){
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
	LinearizedComputationalGraphCopy::OutEdgeIteratorPair srcoutedges (theCopy.getOutEdgesOf(theCopy.getSourceOf(*ie)));
	LinearizedComputationalGraphCopy::OutEdgeIterator srcoe = srcoutedges.first, srcoend = srcoutedges.second;
	LinearizedComputationalGraphCopyEdge* directEdge_pt = NULL;
	for(; srcoe != srcoend; ++srcoe){
	  //if there already was a direct edge from the source vertex to the target vertex, directEdge_pt is set to point to that edge
	  if(&theCopy.getTargetOf(*srcoe) == &theCopy.getTargetOf(*oe)){
	    directEdge_pt = &*srcoe;
	    break;
	  } //endif
	}//end while

	LinearizedComputationalGraphCopyEdge& theNewEdge = theCopy.addEdge(theCopy.getSourceOf(*ie), theCopy.getTargetOf(*oe));
	theNewEdge.setJacobianRef(theExpression);
	if(directEdge_pt != NULL){        //create vertex for direct edge, and "add" vertex, point new edge to it
	  xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& add = ((*theExpression).myExpression).addVertex();
	  add.setOperation(xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::ADD_OP);
	  //add vertex for direct edge
	  xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& minidirect = ((*theExpression).myExpression).addVertex();
	  if((*directEdge_pt).getRefType() == LinearizedComputationalGraphCopyEdge::TO_INTERNAL_EXPRESSION){
	    minidirect.setInternalReference(((*directEdge_pt).getJacobianRef()).getMaximal());
	  }
	  else{
	    minidirect.setExternalReference((*directEdge_pt).getOriginalRef());
	  }
	  //connect "add" vertex to minidirect and mult
	  ((*theExpression).myExpression).addEdge(mult, add);
	  ((*theExpression).myExpression).addEdge(minidirect, add);
	  theCopy.removeAndDeleteEdge(*directEdge_pt);
	  (*theExpression).setMaximal(add);
	}// end if
	else{      //point the new edge to "mult"
	  (*theExpression).setMaximal(mult);	  
	}// end else
      }// end outedge iteration
    }// end inedge iteration
    theCopy.removeFromVertexList(theVertex);
    theCopy.removeAndDeleteVertex(theVertex);

    if(DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)){
      GraphVizDisplay::show(theCopy,"bipartite");
    }// end if

  }// end elim_vertex

} // end of namespace
