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
			   const DualGraph::VertexPointerList& thePredList,
			   const DualGraph::VertexPointerList& theSuccList,
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

    std::cout << "new vertex connected to the new JAE" << std::endl;

    // iterate over predecessors of the source and successors of the target, connect them all to the new vertex
    DualGraph::InEdgeIteratorPair die (theDual.getInEdgesOf(theDual.getSourceOf(theFace)));
    DualGraph::InEdgeIterator diei (die.first), die_end (die.second);
    for(; diei != die_end; ++diei){
      theDual.addEdge(theDual.getSourceOf(*diei), theNewVertex);
      
      std::cout << "vertex connected to a pred" << std::endl;

    }// end for inedges
    DualGraph::OutEdgeIteratorPair doe (theDual.getOutEdgesOf(theDual.getTargetOf(theFace)));
    DualGraph::OutEdgeIterator doei (doe.first), doe_end (doe.second);
    for(; doei != doe_end; ++doei){
      theDual.addEdge(theNewVertex, theDual.getTargetOf(*doei));

      std::cout << "vertex connected to a succ" << std::endl;

    }// end for outedges
    
    //check for direct vertex
    DualGraphVertex* directVertex_pt = NULL;

    //spath iterates through each path in the list
    DualGraph::PathList::const_iterator spath;
    //svertex iterates through each vertex in the path
    DualGraphPath::Path::iterator svertex;
    //predi and succi iterate over the predecessor and successor lists of the face being eliminated
    DualGraph::VertexPointerList::const_iterator predi, succi;
    unsigned int i = 0;

    //go through all paths to find a path with a direct vertex between source and target
    for(spath = theDual.myPathList.begin(); spath != theDual.myPathList.end(); spath++){
      //for each vertex in the path
      for(svertex = ((**spath).myPath).begin(); svertex != ((**spath).myPath).end(); svertex++){
	for(predi = thePredList.begin(); predi != thePredList.end(); predi++){
	  //if the vertex is a pred
	  if(*predi == *svertex){break;}
	}// end for each predecessor
	//if vertex is a pred of the face
	if(predi != thePredList.end()){
	  svertex++;
	  svertex++;
	  //check for svertex in succlist
	  for(succi = theSuccList.begin(); succi != theSuccList.end(); succi++){
	    //if the vertex is a succ
	    if(*succi == *svertex){break;}
	  }// end for each successor
	  //if a succ is in path
	  if(succi != theSuccList.end()){
	    svertex--;
	    directVertex_pt = *svertex;
	    // if the direct vertex doesnt have inedges from all preds and outedges to all succs throw exception
	    i = 0;
	    DualGraph::InEdgeIteratorPair dvie (theDual.getInEdgesOf(*directVertex_pt));
	    DualGraph::InEdgeIterator dviei (dvie.first), dvie_end (dvie.second);
	    for(; dviei != dvie_end; ++dviei){
	      i++;
	      for(predi = thePredList.begin(); predi != thePredList.end(); predi++){
		if(*predi == &theDual.getSourceOf(*dviei)){break;}
	      }// end for each predecessor
	      //if a direcpred wasnt in pred list  
	      if(predi == thePredList.end()){
		THROW_LOGICEXCEPTION_MACRO("Error: Successor and predecessor sets of direct vertex do not match those of the face");
	      }//end if a direcpred wasnt in pred list
	    }// end for direct inedges
	    if(i != thePredList.size()){
	      THROW_LOGICEXCEPTION_MACRO("Error: Successor and predecessor sets of direct vertex do not match those of the face");
	    }
	    i = 0;
	    DualGraph::OutEdgeIteratorPair dvoe (theDual.getOutEdgesOf(*directVertex_pt));
	    DualGraph::OutEdgeIterator dvoei (dvoe.first), dvoe_end (dvoe.second);
	    for(; dvoei != dvoe_end; ++dvoei){
	      i++;
	      for(succi = theSuccList.begin(); succi != theSuccList.end(); succi++){
		if(*succi == &theDual.getTargetOf(*dvoei)){break;}
	      }// end for each successor
	      //if a direcpred wasnt in pred list  
	      if(succi == theSuccList.end()){
		THROW_LOGICEXCEPTION_MACRO("Error: Successor and predecessor sets of direct vertex do not match those of the face");
	      }//end if a direcpred wasnt in pred list
	    }// end for direct outedges
	    if(i != theSuccList.size()){
	      THROW_LOGICEXCEPTION_MACRO("Error: Successor and predecessor sets of direct vertex do not match those of the face");
	    }
	    spath = theDual.myPathList.end();
	    spath--;
	    break;
	  }//end if we found direct vertex
	}//end if a pred is in path
      }//end for each vertex in the path
    }//end for all paths

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
      //connect "add" vertex to minidirect and mult, point the new vertex to add, delete the old vertex
      ((*theExpression).myExpression).addEdge(mult, add);
      ((*theExpression).myExpression).addEdge(minidirect, add);
      theDual.removeAndDeleteVertex(*directVertex_pt);
      (*theExpression).setMaximal(add);
    }// end if
    else{      //point the new vertex to "mult"
      (*theExpression).setMaximal(mult);	  
    }// end else
  
    
    //if the face elimination isolates both the source and the target, delete them both (which automatically deletes the face)
    if(theDual.numOutEdgesOf(theDual.getSourceOf(theFace))*theDual.numInEdgesOf(theDual.getTargetOf(theFace)) == 1){
      theDual.removeAndDeleteVertex(theDual.getSourceOf(theFace));
      std::cout << "source now isolated, deleting source" << std::endl;

      theDual.removeAndDeleteVertex(theDual.getTargetOf(theFace));
      std::cout << "target now isolated, deleting target" << std::endl;

    }// end if
    //if the face elimination isolates the source, delete the source (which automatically deletes the face)
    else if(theDual.numOutEdgesOf(theDual.getSourceOf(theFace)) == 1){
      theDual.removeAndDeleteVertex(theDual.getSourceOf(theFace));
      std::cout << "source now isolated, deleting source" << std::endl;

    }
    //if the face elimination isolates the target, delete the target (which automatically deletes the face)
    else if(theDual.numInEdgesOf(theDual.getTargetOf(theFace)) == 1){
      theDual.removeAndDeleteVertex(theDual.getTargetOf(theFace));
      std::cout << "target now isolated, deleting target" << std::endl;

    }
    // if the elimination does not isolate either the source or the target, we simply delete the face
    else{
      theDual.removeAndDeleteEdge(theFace);
    }

    if(DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {
      GraphVizDisplay::show(theDual,"intermediate");
    }


  }// end elim_face

} // end of namespace
