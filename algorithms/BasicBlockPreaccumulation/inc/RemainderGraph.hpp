#ifndef _REMAINDERGRAPH_INCLUDE_
#define _REMAINDERGRAPH_INCLUDE_
// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

#include "xaifBooster/algorithms/CrossCountryInterface/inc/Elimination.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/RemainderGraphVertex.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/RemainderGraphEdge.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  /**
   * the default representation for the RemainderGraph
   */
  class RemainderGraph : public PrivateLinearizedComputationalGraph {
  public:

    RemainderGraph(){};

    void initFrom(const xaifBoosterCrossCountryInterface::Elimination& anElimination);

    virtual ~RemainderGraph(){};
    
    /**
     * \todo JU implementation incomplete
     */
    std::string debug() const { return std::string("RemainderGraph");};

    const PrivateLinearizedComputationalGraphVertex& 
    getOriginalVertexFor(const RemainderGraphVertex& aRemainderGraphVertex) const;
    
    const xaifBoosterCrossCountryInterface::AccumulationGraphVertex& 
    getAccumulationGraphVertexFor(const RemainderGraphEdge& aRemainderGraphEdge) const; 

  private:

    /**
     * used for propagation
     */
    typedef std::map<const RemainderGraphVertex*,
                     const PrivateLinearizedComputationalGraphVertex*> RemainderVertexP2OriginalVertexPMap;
    RemainderVertexP2OriginalVertexPMap myRemainderVertexP2OriginalVertexPMap;

    /**
     * used for propagation
     */
    typedef std::map<const RemainderGraphEdge*,
                     const xaifBoosterCrossCountryInterface::AccumulationGraphVertex*> RemainderEdgeP2AccumulationVertexPMap;
    RemainderEdgeP2AccumulationVertexPMap myRemainderEdgeP2AccumulationVertexPMap;

  }; 

} 
                                                                     
#endif
