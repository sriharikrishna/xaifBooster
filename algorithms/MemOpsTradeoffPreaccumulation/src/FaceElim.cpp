#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include "xaifBooster/system/inc/GraphVizDisplay.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/FaceElim.hpp"

using namespace MemOpsTradeoffPreaccumulation;

namespace xaifBoosterMemOpsTradeoffPreaccumulation { 
  
  void FaceElim::forwardMode_f(const DualGraph& theDual,
			       DualGraph::FacePointerList& theOldFaceList,
			       const DualGraph::VertexPointerList& thePredList,
			       const DualGraph::VertexPointerList& theSuccList){
    
  }// end forwardMode_f

  void FaceElim::reverseMode_f(const DualGraph& theDual,
			       DualGraph::FacePointerList& theOldFaceList,
			       const DualGraph::VertexPointerList& thePredList,
			       const DualGraph::VertexPointerList& theSuccList){
    
  }// end reverseMode_f

  void FaceElim::markowitzMode_f(const DualGraph& theDual,
				 DualGraph::FacePointerList& theOldFaceList,
				 const DualGraph::VertexPointerList& thePredList,
				 const DualGraph::VertexPointerList& theSuccList){

    
  }// end markowitzMode_f

  void FaceElim::siblingMode_f(const DualGraph& theDual,
			       DualGraph::FacePointerList& theOldFaceList,
			       const DualGraph::VertexPointerList& thePredList,
			       const DualGraph::VertexPointerList& theSuccList){

   
  }// end siblingMode_f

  void FaceElim::elim_face(DualGraph& theDual,
			   DualGraphEdge& theFace,
			   xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& theJacobianAccumulationExpressionList){
    
    //create a new JAE graph
    JacobianAccumulationExpressionCopy* theExpression = new JacobianAccumulationExpressionCopy(theJacobianAccumulationExpressionList.addExpression());

    //add first minimal vertex: the source of the face
    xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& minisource = ((*theExpression).myExpression).addVertex();
    if((theDual.getSourceOf(theFace)).getRefType() == DualGraphVertex::TO_INTERNAL_EXPRESSION){
      minisource.setInternalReference(((theDual.getSourceOf(theFace)).getJacobianRef()).getMaximal());
    }
    else{
      minisource.setExternalReference((theDual.getSourceOf(theFace)).getOriginalRef());
    }
    //add second minimal vertex: the target of the face
    xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& minitarget = ((*theExpression).myExpression).addVertex();    
    if((theDual.getTargetOf(theFace)).getRefType() == DualGraphVertex::TO_INTERNAL_EXPRESSION){
      minitarget.setInternalReference(((theDual.getTargetOf(theFace)).getJacobianRef()).getMaximal());
    }// end if
    else{
      minitarget.setExternalReference((theDual.getTargetOf(theFace)).getOriginalRef());
    }// end else

    //create "mult" vertex and connect it to minisource and minitarget
    xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& mult = ((*theExpression).myExpression).addVertex();
    mult.setOperation(xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::MULT_OP);
    ((*theExpression).myExpression).addEdge(minisource, mult);
    ((*theExpression).myExpression).addEdge(minitarget, mult);

    //create a new vertex and set its jacobian ref to the new JAE
    DualGraphVertex& theNewVertex = theDual.addVertex();
    theNewVertex.setJacobianRef(theExpression);

    // iterate over predecessors of the source and successors of the target, connect them all to the new vertex
    DualGraph::InEdgeIteratorPair die (theDual.getInEdgesOf(theDual.getSourceOf(theFace)));
    DualGraph::InEdgeIterator diei (die.first), die_end (die.second);
    for(; diei != die_end; ++diei){
      theDual.addEdge(theDual.getSourceOf(*diei), theNewVertex);      
    }// end for inedges
    DualGraph::OutEdgeIteratorPair doe (theDual.getOutEdgesOf(theDual.getTargetOf(theFace)));
    DualGraph::OutEdgeIterator doei (doe.first), doe_end (doe.second);
    for(; doei != doe_end; ++doei){
      theDual.addEdge(theNewVertex, theDual.getTargetOf(*doei));
    }// end for outedges
    
    //check for direct vertex
    DualGraphVertex* directVertex_pt = NULL;
    DualGraph::VertexIteratorPair dv (theDual.vertices());
    DualGraph::VertexIterator dvi (dv.first), dv_end (dv.second);    
    for(; dvi != dv_end; ++dvi){
      //check each inedge to see if it comes from a predecessor of the face
      DualGraph::InEdgeIteratorPair dvie (theDual.getInEdgesOf(*dvi));
      DualGraph::InEdgeIterator dviei (dvie.first), dvie_end (dvie.second);
      for(; dviei != dvie_end; ++dviei){
	DualGraph::InEdgeIteratorPair die2 (theDual.getInEdgesOf(theDual.getSourceOf(theFace)));
	DualGraph::InEdgeIterator die2i (die2.first), die2_end (die2.second);
	for(; die2i != die2_end; ++die2i){
	  //if current vertex pred is a pred of the face source
	  if(&*dviei == &*die2i){
	    break;
	  }// end if
	}// end for inedges of face source
      }// end for inedges of current vertex

      if(dviei != dvie_end){
	//check each outedge to see it if leads to a succesor of the face
	DualGraph::OutEdgeIteratorPair dvoe (theDual.getOutEdgesOf(*dvi));
	DualGraph::OutEdgeIterator dvoei (dvoe.first), dvoe_end (dvoe.second);
	for(; dvoei != dvoe_end; ++dvoei){
	  DualGraph::OutEdgeIteratorPair doe2 (theDual.getOutEdgesOf(theDual.getTargetOf(theFace)));
	  DualGraph::OutEdgeIterator doe2i (doe2.first), doe2_end (doe2.second);
	  for(; doe2i != doe2_end; ++doe2i){
	    //if current vertex succ is a succ of the face target
	    if(&*dvoei == &*doe2i){
	      directVertex_pt = &*dvi;
	      //reset iterators to break out of the other loops
	      DualGraph::OutEdgeIterator dvoei (dvoe.second);
	      DualGraph::VertexIterator dvi (dv.second);
	      break;
	    }// end if
	  }// end for outedges of face target
	}// end for outedges of current vertex
      }// end if we found a pred match
    }// end for all vertices

    //if there was a direct vertex from predecessors to successors
    if(directVertex_pt != NULL){
      //create vertex for direct edge, and "add" vertex, point new edge to it
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& add = ((*theExpression).myExpression).addVertex();
      add.setOperation(xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::ADD_OP);
      //add vertex for direct vertex
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& minidirect = ((*theExpression).myExpression).addVertex();
      if((*directVertex_pt).getRefType() == DualGraphVertex::TO_INTERNAL_EXPRESSION){
	minidirect.setInternalReference(((*directVertex_pt).getJacobianRef()).getMaximal());
      }
      else{
	minidirect.setExternalReference((*directVertex_pt).getOriginalRef());
      }
      //connect "add" vertex to minidirect and mult
      ((*theExpression).myExpression).addEdge(mult, add);
      ((*theExpression).myExpression).addEdge(minidirect, add);
      theDual.removeAndDeleteVertex(*directVertex_pt);
      (*theExpression).setMaximal(add);
    }// end if
    else{      //point the new edge to "mult"
      (*theExpression).setMaximal(mult);	  
    }// end else
  
    //if the face elimination isolates the source, delete the source (which automatically deletes the face)
    if(theDual.numOutEdgesOf(theDual.getSourceOf(theFace)) == 1){
      theDual.removeAndDeleteVertex(theDual.getSourceOf(theFace));
    }// end if
    //if the face elimination isolates the target, delete the target (which automatically deletes the face)
    else if(theDual.numInEdgesOf(theDual.getTargetOf(theFace)) == 1){
      theDual.removeAndDeleteVertex(theDual.getTargetOf(theFace));
    }
    // if the elimination does not isolate either the source or the target, we simply delete the face
    else{
      theDual.removeAndDeleteEdge(theFace);
    }

    //if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {
      GraphVizDisplay::show(theDual,"intermediate");
      //}


  }// end elim_face

} // end of namespace
