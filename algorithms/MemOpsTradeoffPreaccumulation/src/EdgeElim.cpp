#include <list>
#include <algorithm>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include "xaifBooster/system/inc/GraphVizDisplay.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/EdgeElim.hpp"

using namespace MemOpsTradeoffPreaccumulation;

namespace xaifBoosterMemOpsTradeoffPreaccumulation { 
  
  void EdgeElim::forwardMode_e(const LinearizedComputationalGraphCopy& theCopy,
			       LinearizedComputationalGraphCopy::EdgePointerList& theOldEdgeList,	    
			       const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
			       const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList){
    //prefer back
    LinearizedComputationalGraphCopy::EdgePointerList theNewList;
    bool found = false;

    LinearizedComputationalGraphCopy::VertexPointerList theVertexList = theCopy.getVertexList();
    LinearizedComputationalGraphCopy::EdgePointerList::iterator eli;
    LinearizedComputationalGraphCopy::VertexPointerList::iterator vli, vli2;
    //iterate through the topsorted vertex list for possible sources.  The earlier in this list the better.
    for(vli = theVertexList.begin(); vli != theVertexList.end(); vli++){
      //iterate through the topsorted vertex list for possible targets.  The earlier in this list the better.
      for(vli2 = theVertexList.begin(); vli2 != theVertexList.end(); vli2++){
	LinearizedComputationalGraphCopy::ConstOutEdgeIteratorPair outedges (theCopy.getOutEdgesOf(**vli));
	LinearizedComputationalGraphCopy::ConstOutEdgeIterator outi (outedges.first), oute (outedges.second);
	//search through outedges of the source for edges in the list
        for(; outi != oute; ++outi){
	  //if there is an edge fro source to target, check to see if its in the list
          if(&theCopy.getTargetOf(*outi) == *vli2){
	    for(eli = theOldEdgeList.begin(); eli != theOldEdgeList.end(); eli++){
	      //if the edge is there, we have found the topologically first edge.  we prefer back elimination,
	      //and if the edge can be back eliminated, the "back" instance will occur first in the edge list,
	      //thus we can simply take the first instance
	      if((*eli).edge_p == &*outi){
		theNewList.push_back(*eli);
		found = true;
		break;
	      }// end if
	    }// end for
	  }// end if
	  if(found){break;}
	}// end for inedges
	if(found){break;}
      }// end for targets
      if(found){break;}
    }// end for sources
    theOldEdgeList = theNewList;
  }// end forwardMode

  void EdgeElim::reverseMode_e(const LinearizedComputationalGraphCopy& theCopy,
			       LinearizedComputationalGraphCopy::EdgePointerList& theOldEdgeList,
			       const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
 			       const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList){
    //prefer forward elims
    LinearizedComputationalGraphCopy::EdgePointerList theNewList;
    bool found = false;

    LinearizedComputationalGraphCopy::VertexPointerList theVertexList = theCopy.getVertexList();
    LinearizedComputationalGraphCopy::EdgePointerList::reverse_iterator reli;
    LinearizedComputationalGraphCopy::VertexPointerList::reverse_iterator rvli, rvli2;
    //iterate backwards through the topsorted vertex list for possible targets.  The later in this list the better
    for(rvli = theVertexList.rbegin(); rvli != theVertexList.rend(); rvli++){
      //iterate backwards through the topsorted vertex list for possible sources.  The later in this list the better
      for(rvli2 = theVertexList.rbegin(); rvli2 != theVertexList.rend(); rvli2++){
	LinearizedComputationalGraphCopy::ConstInEdgeIteratorPair inedges (theCopy.getInEdgesOf(**rvli));
	LinearizedComputationalGraphCopy::ConstInEdgeIterator ini (inedges.first), ine (inedges.second);
	//search through inedges of the target for edges in the list
        for(; ini != ine; ++ini){
	  //if there is an edge fro source to target, check to see if its in the list
          if(&theCopy.getSourceOf(*ini) == *rvli2){
	    for(reli = theOldEdgeList.rbegin(); reli != theOldEdgeList.rend(); reli++){
	      //if the edge is there, we have found the topologically last edge.  we prefer front elimination,
	      //and if the edge can be front eliminated, the "front" instance will occur last in the edge list,
	      //thus we can simply take the first instance going backwards
	      if((*reli).edge_p == &*ini){
		theNewList.push_back(*reli);
		found = true;
		break;
	      }// end if
	    }// end for
	  }// end if
	  if(found){break;}
	}// end for inedges
	if(found){break;}
      }// end for sources
      if(found){break;}
    }// end for targets
    theOldEdgeList = theNewList;
  }// end reverseMode

  void EdgeElim::markowitzMode_e(const LinearizedComputationalGraphCopy& theCopy,
				 LinearizedComputationalGraphCopy::EdgePointerList& theOldEdgeList,
				 const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
				 const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList){

    LinearizedComputationalGraphCopy::EdgePointerList theNewList;
    unsigned int currentMin;
    LinearizedComputationalGraphCopy::EdgePointerList::iterator ei=theOldEdgeList.begin();
    theNewList.push_back(*ei);
    //put the first element in the new list, and set currentMin to the its markowitz degree
    if((*ei).direction == LinearizedComputationalGraphCopy::BACK){
      currentMin = theCopy.numInEdgesOf(theCopy.getSourceOf(*(*ei).edge_p));
    }// end if
    else if((*ei).direction == LinearizedComputationalGraphCopy::FRONT){
      currentMin = theCopy.numOutEdgesOf(theCopy.getTargetOf(*(*ei).edge_p));
    }// end else
    else{
      THROW_LOGICEXCEPTION_MACRO("no direction specified for edge");
    }// end else
    ei++;

    //iterate through the old list to find edges with a lower markowitz degree
    for(; ei != theOldEdgeList.end(); ei++) {
      if((*ei).direction == LinearizedComputationalGraphCopy::BACK){
	//if we find an edge with a lower markowitz degree, clear the list and fill it with this edge
	if((theCopy.numInEdgesOf(theCopy.getSourceOf(*(*ei).edge_p)) < currentMin) && (theCopy.numInEdgesOf(theCopy.getSourceOf(*(*ei).edge_p)) > 0)){
	  currentMin = theCopy.numInEdgesOf(theCopy.getSourceOf(*(*ei).edge_p));
	  theNewList.clear();
	  theNewList.push_back(*ei);
	}// end if
	//if the current edge has the same markowitz degree as those in the list, simply add it to the list
	else if(theCopy.numInEdgesOf(theCopy.getSourceOf(*(*ei).edge_p)) == currentMin){
	  theNewList.push_back(*ei);
	}// end else if
      }// end if

      else if((*ei).direction == LinearizedComputationalGraphCopy::FRONT){
	if((theCopy.numOutEdgesOf(theCopy.getTargetOf(*(*ei).edge_p)) < currentMin) && (theCopy.numOutEdgesOf(theCopy.getTargetOf(*(*ei).edge_p)) > 0)){
	  currentMin = theCopy.numOutEdgesOf(theCopy.getTargetOf(*(*ei).edge_p));
	  theNewList.clear();
	  theNewList.push_back(*ei);
	}// end if
	else if(theCopy.numOutEdgesOf(theCopy.getTargetOf(*(*ei).edge_p)) == currentMin){
	  theNewList.push_back(*ei);
	}// end else if
      }// end else if
      else{
	THROW_LOGICEXCEPTION_MACRO("no direction specified for edge");
      }// end else
    }// end for
    
    theOldEdgeList = theNewList;
  }// end markowitzMode

  void EdgeElim::sibling2Mode_e(const LinearizedComputationalGraphCopy& theCopy,
				LinearizedComputationalGraphCopy::EdgePointerList& theOldEdgeList,
				const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
				const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList){

    LinearizedComputationalGraphCopy::EdgePointerList theNewList;
    LinearizedComputationalGraphCopy::VertexPointerList::const_iterator predi, succi;
    LinearizedComputationalGraphCopy::EdgePointerList::iterator bi;
    unsigned int highestdegree = 0;

    //iterate through the list of elimination candidates
    for(bi = theOldEdgeList.begin(); bi != theOldEdgeList.end(); bi++){
      unsigned int predMatch = 0;
      unsigned int succMatch = 0;
      for(predi=thePredList.begin(); predi != thePredList.end(); predi++){
	for(succi=theSuccList.begin(); succi != theSuccList.end(); succi++){
	  if((*bi).direction == LinearizedComputationalGraphCopy::FRONT){
	    //if the current edge shares the source with the previously eliminated edge and it is a front elimination, increment predmatch
	    if(&theCopy.getSourceOf(*(*bi).edge_p) == *predi){
	      predMatch++;
	    }// end if
	    if(predMatch){
	      LinearizedComputationalGraphCopy::ConstInEdgeIteratorPair inedges (theCopy.getInEdgesOf(**succi));
	      LinearizedComputationalGraphCopy::ConstInEdgeIterator ie=inedges.first, iend=inedges.second;
	      for(; ie != iend; ++ie){
		if(&theCopy.getSourceOf(*ie) == &theCopy.getTargetOf(*(*bi).edge_p)){
		  succMatch++;
		  break;
		}// end if
	      }// end for
	    }// end if predmatch
	  }// end if direction is front
	  else if((*bi).direction == LinearizedComputationalGraphCopy::BACK){
	    //if the current edge shares the target with the previously eliminated edge and it is a back elimination, increment succmatch
	    if(&theCopy.getTargetOf(*(*bi).edge_p) == *succi){
	      succMatch++;
	    }// end if
	    if(succMatch){
	      LinearizedComputationalGraphCopy::ConstOutEdgeIteratorPair outedges (theCopy.getOutEdgesOf(**predi));
	      LinearizedComputationalGraphCopy::ConstOutEdgeIterator oe=outedges.first, oend=outedges.second;
	      for(; oe != oend; ++oe){
		if(&theCopy.getTargetOf(*oe) == &theCopy.getSourceOf(*(*bi).edge_p)){
		  predMatch++;
		  break;
		}// end if
	      }// end for
	    }// end if succmatch
	  }// end if direction is back
	}// end for succlist
      }// end for predlist
      //if the current edge "sibling degree" is higher than those in the list, clear the list then push
      if(predMatch*succMatch > highestdegree){
	highestdegree = predMatch*succMatch;
	theNewList.clear();
	theNewList.push_back(*bi);
      }// end if
      //if the "sibling degree" is the same, simply push to the list
      else if((predMatch*succMatch == highestdegree) && (highestdegree > 0)){
	theNewList.push_back(*bi);
      }// end else if
    }// end for edges in list
    if(theNewList.size() > 0){
      theOldEdgeList = theNewList;
    }// end if
  }// end sibling2Mode_e

  void EdgeElim::front_elim_edge(LinearizedComputationalGraphCopy& theCopy,
				 LinearizedComputationalGraphCopyEdge& theEdge,
				 xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& theJacobianAccumulationExpressionList){

    //iterator over outedges of theTarget
    LinearizedComputationalGraphCopy::OutEdgeIteratorPair outedges (theCopy.getOutEdgesOf(theCopy.getTargetOf(theEdge)));
    LinearizedComputationalGraphCopy::OutEdgeIterator oe=outedges.first, oend=outedges.second;
    for(; oe != oend; ++oe){
      JacobianAccumulationExpressionCopy* theExpression = new JacobianAccumulationExpressionCopy(theJacobianAccumulationExpressionList.addExpression());

      //add first minimal vertex: the edge being eliminated, set its pointer appropriately
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& miniin = ((*theExpression).myExpression).addVertex();
      if(theEdge.getRefType() == LinearizedComputationalGraphCopyEdge::TO_INTERNAL_EXPRESSION){
	miniin.setInternalReference((theEdge.getJacobianRef()).getMaximal());
      }
      else{
        miniin.setExternalReference(theEdge.getOriginalRef());
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
      LinearizedComputationalGraphCopy::OutEdgeIteratorPair srcoutedges (theCopy.getOutEdgesOf(theCopy.getSourceOf(theEdge)));
      LinearizedComputationalGraphCopy::OutEdgeIterator srcoe = srcoutedges.first, srcoend = srcoutedges.second;
      LinearizedComputationalGraphCopyEdge* directEdge_pt = NULL;
      for(; srcoe != srcoend; ++srcoe){
	//if there already was a direct edge from the source vertex to the target vertex, directEdge_pt is set to point to that edge
        if(&theCopy.getTargetOf(*srcoe) == &theCopy.getTargetOf(*oe)){
          directEdge_pt = &*srcoe;
          break;
        } //endif
      }//end while
      
      LinearizedComputationalGraphCopyEdge& theNewEdge = theCopy.addEdge(theCopy.getSourceOf(theEdge), theCopy.getTargetOf(*oe));
      
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

    //if the front elimination isolates the vertex, delete the vertex (which automatically deletes the edge)
    if(theCopy.numInEdgesOf(theCopy.getTargetOf(theEdge)) == 1){
      theCopy.removeFromVertexList(theCopy.getTargetOf(theEdge));
      theCopy.removeAndDeleteVertex(theCopy.getTargetOf(theEdge));
    }// end if
    // if the elimination does not isolate the target vertex, we simply delete the edge
    else{
      theCopy.removeAndDeleteEdge(theEdge);
    }

    if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {
      GraphVizDisplay::show(theCopy,"intermediate");
    }
  }// end front_elim_edge

  void EdgeElim::back_elim_edge(LinearizedComputationalGraphCopy& theCopy,
				LinearizedComputationalGraphCopyEdge& theEdge,
				xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& theJacobianAccumulationExpressionList){

    //iterator over inedges of theVertex
    LinearizedComputationalGraphCopy::InEdgeIteratorPair inedges (theCopy.getInEdgesOf(theCopy.getSourceOf(theEdge)));
    LinearizedComputationalGraphCopy::InEdgeIterator ie=inedges.first, iend=inedges.second;
    for(; ie != iend; ++ie){
      JacobianAccumulationExpressionCopy* theExpression = new JacobianAccumulationExpressionCopy(theJacobianAccumulationExpressionList.addExpression());

      //add first minimal vertex: edge into theVertex
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& miniin = ((*theExpression).myExpression).addVertex();
      if((*ie).getRefType() == LinearizedComputationalGraphCopyEdge::TO_INTERNAL_EXPRESSION){
        miniin.setInternalReference(((*ie).getJacobianRef()).getMaximal());
      }
      else{
        miniin.setExternalReference((*ie).getOriginalRef());
      }
      //add second minimal vertex: the edge being eliminated
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& miniout = ((*theExpression).myExpression).addVertex();    
      if(theEdge.getRefType() == LinearizedComputationalGraphCopyEdge::TO_INTERNAL_EXPRESSION){
        miniout.setInternalReference((theEdge.getJacobianRef()).getMaximal());
      }// end if
      else{
        miniout.setExternalReference(theEdge.getOriginalRef());
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
        if(&theCopy.getTargetOf(*srcoe) == &theCopy.getTargetOf(theEdge)){
          directEdge_pt = &*srcoe;
          break;
        } //endif
      }//end while

      LinearizedComputationalGraphCopyEdge& theNewEdge = theCopy.addEdge(theCopy.getSourceOf(*ie), theCopy.getTargetOf(theEdge));

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
    }// end inedge iteration

    if(theCopy.numOutEdgesOf(theCopy.getSourceOf(theEdge)) == 1){
      const LinearizedComputationalGraphCopy::ConstVertexPointerList& copyDependents = theCopy.getDependentList();
      // if the now isolated vertex is not a dependent
      if(find(copyDependents.begin(), copyDependents.end(), &theCopy.getSourceOf(theEdge)) == copyDependents.end()){
	theCopy.removeFromVertexList(theCopy.getSourceOf(theEdge));
	theCopy.removeAndDeleteVertex(theCopy.getSourceOf(theEdge));
      }// end if
      // is the source of the edge is a dependent vertex
      else{
	theCopy.removeAndDeleteEdge(theEdge);
      }// end else

    }// end if
    // if the vertex is not now isolated
    else{
      theCopy.removeAndDeleteEdge(theEdge);
    }// end else

    if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {
      GraphVizDisplay::show(theCopy,"intermediate");
    }
  }// end back_elim_edge

} // end of namespace
