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
    
  }// end forwardMode

  void FaceElim::reverseMode_f(const DualGraph& theDual,
			       DualGraph::FacePointerList& theOldFaceList,
			       const DualGraph::VertexPointerList& thePredList,
			       const DualGraph::VertexPointerList& theSuccList){
    
  }// end reverseMode

  void FaceElim::markowitzMode_f(const DualGraph& theDual,
				 DualGraph::FacePointerList& theOldFaceList,
				 const DualGraph::VertexPointerList& thePredList,
				 const DualGraph::VertexPointerList& theSuccList){

    
  }// end markowitzMode

  void FaceElim::siblingMode_f(const DualGraph& theDual,
			       DualGraph::FacePointerList& theOldFaceList,
			       const DualGraph::VertexPointerList& thePredList,
			       const DualGraph::VertexPointerList& theSuccList){

   
  }// end siblingMode_e

  void FaceElim::elim_face(DualGraph& theDual,
			   DualGraphEdge& theFace,
			   xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& theJacobianAccumulationExpressionList){

    
  }// end front_elim_edge


 

} // end of namespace
