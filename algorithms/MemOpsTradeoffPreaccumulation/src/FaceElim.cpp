#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include "xaifBooster/system/inc/GraphVizDisplay.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/FaceElim.hpp"

using namespace MemOpsTradeoffPreaccumulation;

namespace xaifBoosterMemOpsTradeoffPreaccumulation { 
  
  void FaceElim::forwardMode_f(const DualGraph& theDual,
			       DualGraph::FacePointerList& theOldFaceList,
			       const DualGraph::VertexPointerList& thePredList,
			       const DualGraph::VertexPointerList& theSuccList,
			       DualGraphVertex* newOrAbsorb){
    
  }// end forwardMode_f

  void FaceElim::reverseMode_f(const DualGraph& theDual,
			       DualGraph::FacePointerList& theOldFaceList,
			       const DualGraph::VertexPointerList& thePredList,
			       const DualGraph::VertexPointerList& theSuccList,
			       DualGraphVertex* newOrAbsorb){
    
  }// end reverseMode_f

  void FaceElim::markowitzMode_f(const DualGraph& theDual,
				 DualGraph::FacePointerList& theOldFaceList,
				 const DualGraph::VertexPointerList& thePredList,
				 const DualGraph::VertexPointerList& theSuccList,
				 DualGraphVertex* newOrAbsorb){

    
  }// end markowitzMode_f

  void FaceElim::siblingMode_f(const DualGraph& theDual,
			       DualGraph::FacePointerList& theOldFaceList,
			       const DualGraph::VertexPointerList& thePredList,
			       const DualGraph::VertexPointerList& theSuccList,
			       DualGraphVertex* newOrAbsorb){

   
  }// end siblingMode_f

  void FaceElim::absorbMode_f(const DualGraph& theDual,
			      DualGraph::FacePointerList& theOldFaceList,
			      const DualGraph::VertexPointerList& thePredList,
			      const DualGraph::VertexPointerList& theSuccList,
			      DualGraphVertex* newOrAbsorb){

   //  DualGraph::FacePointerList theNewFaceList;

//     //spath iterates through each path in the list
//     DualGraph::PathList::const_iterator spath;
//     //svertex iterates through each vertex in the path
//     DualGraphPath::Path::iterator svertex;
//     DualGraph::facePointerList::iterator sface;

//     for(sface = theOldFaceList.begin(); sface != theOldFaceList.end(); sface++){

//       DualGraph::InEdgeIteratorPair die (theDual.getInEdgesOf(theDual.getSourceOf(**sface)));
//       DualGraph::InEdgeIterator diei (die.first), die_end (die.second);
//       DualGraph::OutEdgeIteratorPair doe (theDual.getOutEdgesOf(theDual.getTargetOf(**sface)));
//       DualGraph::OutEdgeIterator doei (doe.first), doe_end (doe.second);

//       for(; diei != die_end; ++diei){
// 	for(; doei != doe_end; ++doei){
// 	  if((numOutEdgesOf(getSourceOf(*diei)) > 1) && (numInEdgesOf(getTargetOf(*doei)) > 1)){

// 	    for(spath = myPathList.begin(); spath != myPathList.end(); spath++){
// 	      for(svertex = ((**spath).myPath).begin(); svertex != ((**spath).myPath).end(); svertex++){
// 		if(*svertex == &getSourceOf(*diei)){
// 		  //if path contains the vertex, go to next path
// 		  svertex++;
// 		  if(*svertex == &theVertex){break;}
// 		  svertex++;
// 		  svertex++;

// 		  for(; svertex != ((**spath).myPath).end(); svertex++){
// 		    if(*svertex == &getTargetOf(*doei)){
// 		      return false;
// 		    }// end if we find 
// 		  }// end for all vertices after the pred

// 		  //if we dont find the succ, go to next path
// 		  break;

// 		}// end if vertex is the pred
// 	      }// end for each vertex in the path
// 	    }// end for all paths

// 	  }// end if pred and succ have alternate paths
// 	}// end for all out edges
//       }// end for all inedges





//     }// end for each face in the old list

//     if(!theNewFaceList.empty()){
//       theOldFaceList = theNewFaceList;
//     }// end if

  }// end absorbMode_f

} // end of namespace
