/********************************************************************************************************
 * Andrew Lyons, MCS Division, Argonne National Laboratory
 * Under the supervision of Paul Hovland and Uwe Naumann
 * EdgeElim.hpp          Last Updated: 03/11/04 13:08
 * Class to facilitate implementation of heuristics for edge elimination
 */

#ifndef _XAIFBOOSTERMEMOPSTRADEOFFPREACCUMULATION_EDGEELIM_INCLUDE_
#define _XAIFBOOSTERMEMOPSTRADEOFFPREACCUMULATION_EDGEELIM_INCLUDE_

#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/LinearizedComputationalGraphCopyEdge.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/LinearizedComputationalGraphCopy.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/JacobianAccumulationExpressionCopy.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"

using namespace MemOpsTradeoffPreaccumulation;

namespace xaifBoosterMemOpsTradeoffPreaccumulation {  

  class EdgeElim {

  public:

    /**
     * forward mode receives a list of possible edge eliminations and a const reference to the copy graph.
     * it reduces the edge list to a single edge to be eliminated based on the topological sort of the
     * vertices made when the original graph is copied.  It prefers to back eliminate.
     * forwardmode makes no use of the predecessor and successor lists .    
     */
    static void forwardMode_e(
      LinearizedComputationalGraphCopy& theCopy,
      LinearizedComputationalGraphCopy::EdgePointerList& theOldEdgeList,
      const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList);

    /**
     * reverse mode receives a list of possible edge eliminations and a const reference to the copy graph.
     * it reduces the edge list to a single edge to be eliminated based on the topological sort of the
     * vertices made when the original graph is copied.  It prefers to front eliminate.
     * reversemode makes no use of the predecessor and successor lists   .  
     */
    static void reverseMode_e(
      LinearizedComputationalGraphCopy& theCopy,
      LinearizedComputationalGraphCopy::EdgePointerList& theOldEdgeList,
      const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList);

    /**
     * markowitzmode reduces the list to all those edges with the lowest markowitz degree.
     * markowitzmode makes no use of the predecessor and successor lists.
     */
    static void markowitzMode_e(
      LinearizedComputationalGraphCopy& theCopy,
      LinearizedComputationalGraphCopy::EdgePointerList& theOldEdgeList,
      const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList);

    /**
     * sibling2mode uses the predecessor and sucessor lists to try to make an elimination that causes an
     * addition to an edge created during the previous elimination.  if the last elimination was a front
     * elimination, it attempts to find an edge which originates from the same source as the last edge
     * eliminated, this edge is front eliminated if its target has the most number of sucessors in the
     * successor list.  if the previous elimination was a back elimination, we attempt to maximize the
     * number of predecessors in the predecessor list in a similar fashion.  if there are no "siblings,"
     * the edge list is not changed.
     */
    static void sibling2Mode_e(
      LinearizedComputationalGraphCopy& theCopy,
      LinearizedComputationalGraphCopy::EdgePointerList& theOldEdgeList,
      const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList);

  };  // end of class

} // end of namespace 
                                                                     
#endif
