// /********************************************************************************************************
//  * Andrew Lyons, MCS Division, Argonne National Laboratory
//  * Under the supervision of Paul Hovland and Uwe Naumann
//  * FaceElim.hpp          Last Updated: 03/25/04 11:02
//  * Class to facilitate implementation of heuristics for face elimination
//  */

#ifndef _XAIFBOOSTERMEMOPSTRADEOFFPREACCUMULATION_FACEELIM_INCLUDE_
#define _XAIFBOOSTERMEMOPSTRADEOFFPREACCUMULATION_FACEELIM_INCLUDE_

#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/DualGraph.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/JacobianAccumulationExpressionCopy.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"

using namespace MemOpsTradeoffPreaccumulation;

namespace xaifBoosterMemOpsTradeoffPreaccumulation {  

  class FaceElim {

  public:

    /**    
     */
    static void forwardMode_f(
      const DualGraph& theDual,
      DualGraph::FacePointerList& theOldFaceList,
      const DualGraph::VertexPointerList& thePredList,
      const DualGraph::VertexPointerList& theSuccList);

    /**
     */
    static void reverseMode_f(
      const DualGraph& theDual,
      DualGraph::FacePointerList& theOldFaceList,
      const DualGraph::VertexPointerList& thePredList,
      const DualGraph::VertexPointerList& theSuccList);

    /**
     */
    static void markowitzMode_f(
      const DualGraph& theDual,
      DualGraph::FacePointerList& theOldFaceList,
      const DualGraph::VertexPointerList& thePredList,
      const DualGraph::VertexPointerList& theSuccList);

    /**
     */
    static void siblingMode_f(
      const DualGraph& theDual,
      DualGraph::FacePointerList& theOldFaceList,
      const DualGraph::VertexPointerList& thePredList,
      const DualGraph::VertexPointerList& theSuccList);

    /**
     */
    static void elim_face(
      DualGraph& theDual,
      DualGraphEdge& theFace,
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& theJacobianAccumulationExpressionList);

  };  // end of class

} // end of namespace 
                                                                     
#endif
