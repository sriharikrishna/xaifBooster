/********************************************************************************************************
 * Andrew Lyons, MCS Division, Argonne National Laboratory
 * Under the supervision of Paul Hovland and Uwe Naumann
 * DualGraph.hpp          Last Updated: 03/24/04 13:36
 */

#ifndef _DUALGRAPH_INCLUDE_
#define _DUALGRAPH_INCLUDE_

#include "xaifBooster/boostWrapper/inc/GraphWrapper.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/DualGraphEdge.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/DualGraphVertex.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/DualGraphPath.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/JacobianAccumulationExpressionCopy.hpp"

using namespace MemOpsTradeoffPreaccumulation;

namespace MemOpsTradeoffPreaccumulation { 

  class DualGraph : public GraphWrapper<DualGraphVertex, DualGraphEdge>{

  public:

    DualGraph(const LinearizedComputationalGraph& theOriginal);
    ~DualGraph();

    typedef std::list<DualGraphEdge*> FacePointerList;
    typedef std::list<DualGraphVertex*> VertexPointerList;
    typedef std::list<DualGraphPath*> PathList;  

    const DualGraphVertex& getDualVertex(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge& theEdge) const;
    
    void populatePathList();
    void copyPath(DualGraphPath* thePath);
    void clearPathList();
    
    FacePointerList populateElimList();
    bool isFinal(DualGraphVertex& theVertex) const;

    DualGraphVertex* elim_face(
      DualGraphEdge& theFace,
      const DualGraph::VertexPointerList& thePredList,
      const DualGraph::VertexPointerList& theSuccList,
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& theJacobianAccumulationExpressionList);

    PathList myPathList;

  private:

  }; // end of class DualGraph 

} // end of namespace MemOpsTradeoffPreaccumulation
                                                                     
#endif
