/********************************************************************************************************
 * Andrew Lyons, MCS Division, Argonne National Laboratory
 * Under the supervision of Paul Hovland and Uwe Naumann
 * VertexElim.hpp          Last Updated: 03/11/04 13:54
 * Class to facilitate implementation of heuristics for vertex elimination
 */
#ifndef _XAIFBOOSTERMEMOPSTRADEOFFPREACCUMULATION_VERTEXELIM_INCLUDE_
#define _XAIFBOOSTERMEMOPSTRADEOFFPREACCUMULATION_VERTEXELIM_INCLUDE_

#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/LinearizedComputationalGraphCopyEdge.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/LinearizedComputationalGraphCopy.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/JacobianAccumulationExpressionCopy.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"

using namespace MemOpsTradeoffPreaccumulation;

namespace xaifBoosterMemOpsTradeoffPreaccumulation {  

  class VertexElim {

  public:

    /**
     * forward mode sets the vertex list to the first element in the topsorted vertex list.
     * forwardmode makes no use of the predecessor and successor lists .    
     */
    static void forwardMode_v(
      const LinearizedComputationalGraphCopy& theCopy,
      LinearizedComputationalGraphCopy::VertexPointerList& theOldVertexList,
      const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList);

    /**
     * reversemode sets the vertex list to the first element in the topsorted vertex list.
     * reversemode makes no use of the predecessor and successor lists .    
     */
    static void reverseMode_v(
      const LinearizedComputationalGraphCopy& theCopy,
      LinearizedComputationalGraphCopy::VertexPointerList& theOldVertexList,
      const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList);

    /**
     * markowitzmode reduces the list to all those vertices with the lowest markowitz degree.
     * markowitzmode makes no use of the predecessor and successor lists.
     */
    static void markowitzMode_v(
      const LinearizedComputationalGraphCopy& theCopy,
      LinearizedComputationalGraphCopy::VertexPointerList& theOldvertexList,
      const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList);

    /**
     * siblingmode reduces the vertex list to only those vertices that share at least one predecessor
     * and sucessor with the most recently eliminated vertex.  if no vertices meet this criteria, the
     * vertex list remains unchanged.
     */
    static void siblingMode_v(
      const LinearizedComputationalGraphCopy& theCopy,
      LinearizedComputationalGraphCopy::VertexPointerList& theOldVertexList,
      const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList);

    /**
     * sibling2mode reduces the vertex list to only those vertices that have the highest nonzero value for
     * the number of predecessors shared with the most recently eliminated vertex times the number of
     * sucessors shared.  if no vertices meet this criteria, the vertex list remains unchanged. 
     */
    static void sibling2Mode_v(
      const LinearizedComputationalGraphCopy& theCopy,
      LinearizedComputationalGraphCopy::VertexPointerList& theOldVertexList,
      const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList);

    /**
     * succpredmode reduces the vertex list to those vertices that were either predecessors or sucessors of
     * the most recently eliminated vertex.
     */
    static void succPredMode_v(
      const LinearizedComputationalGraphCopy& theCopy,
      LinearizedComputationalGraphCopy::VertexPointerList& theOldVertexList,
      const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList);

    /**
     * elim_vertex receives a vertex to be eliminated.  the vertex is eliminated, the corresponding
     * new edges are created, and the relevant accumulation expressions are constructed and added to the list.
     */
    static void elim_vertex(
      LinearizedComputationalGraphCopy& theCopy,
      xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theVertex,
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& theJacobianAccumulationExpressionList);

  };  // end of class

} // end of namespace 
                                                                     
#endif