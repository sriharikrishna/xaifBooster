#ifndef _COMBINEDGRAPHVERTEX_INCLUDE_
#define _COMBINEDGRAPHVERTEX_INCLUDE_
// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

#include "xaifBooster/boostWrapper/inc/Vertex.hpp"

#include "xaifBooster/system/inc/ExpressionVertex.hpp"
#include "xaifBooster/system/inc/ExpressionEdge.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertex.hpp"

#include "xaifBooster/algorithms/CrossCountryInterface/inc/AccumulationGraphVertex.hpp"

using namespace xaifBooster;

namespace xaifBoosterPushPop {

  class CombinedGraphVertex : public Vertex {

  public:

    CombinedGraphVertex(const xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphVertex& aLCGVertex);

    CombinedGraphVertex(const ExpressionVertex& anExpressionVertex);

    /// constructor for trivial partial expressions (such as LINEAR_ONE or LINEAR_MINUS_ONE)
    CombinedGraphVertex(const ExpressionEdge&);

    CombinedGraphVertex(const xaifBoosterCrossCountryInterface::AccumulationGraphVertex& aAccumulationGraphVertex);

    ~CombinedGraphVertex(){};

    std::string
    debug() const;

    enum VertexOriginType_E {ORIGINAL_VERTEX,
                             LINEARIZATION_VERTEX,
                             TRIVIAL_PARTIAL_EXPRESSION,
                             ACCUMULATION_VERTEX};
    
    VertexOriginType_E getOriginType() const;

    const xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphVertex&
    getOriginalVertex() const;

    const ExpressionVertex&
    getLinearizationExpressionVertex() const;
 
    const ExpressionEdge&
    getLinearizedExpressionEdge() const;
 
    const xaifBoosterCrossCountryInterface::AccumulationGraphVertex&
    getAccumulationGraphVertex() const;

    void
    addLHSVariable(const Variable&);

    const CVariablePSet&
    getLHSCVariablePSet() const;

  private:

    /// no def
    CombinedGraphVertex();
    /// no def
    CombinedGraphVertex(const CombinedGraphVertex&);
    /// no def
    CombinedGraphVertex& operator=(const CombinedGraphVertex&);

    /**
     * 
     */
    const union Origin {
      const xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphVertex* myOriginalPLCGVertex_p;
      const ExpressionVertex* myLinearizationExpressionVertex_p;
      const ExpressionEdge* myLinearizedExpressionEdge_p;
      const xaifBoosterCrossCountryInterface::AccumulationGraphVertex* myAccumulationGraphVertex_p;

      Origin(const xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphVertex& aPLCGVertex) : myOriginalPLCGVertex_p(&aPLCGVertex){}
      Origin(const ExpressionVertex& aExpressionVertex) : myLinearizationExpressionVertex_p(&aExpressionVertex){}
      Origin(const ExpressionEdge& aExpressionEdge) : myLinearizedExpressionEdge_p(&aExpressionEdge){}
      Origin(const xaifBoosterCrossCountryInterface::AccumulationGraphVertex& aAccumulationGraphVertex) : myAccumulationGraphVertex_p(&aAccumulationGraphVertex){}
    } myOrigin;

    const VertexOriginType_E myOriginType;

    CVariablePSet myLHSCVariablePSet;

  };
 
} 

#endif

