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









    
  }// end elim_face

} // end of namespace
