#ifndef _XAIFBOOSTERPUSHPOP_SEQUENCE_INCLUDE_
#define _XAIFBOOSTERPUSHPOP_SEQUENCE_INCLUDE_
// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

#include <list>

#include "xaifBooster/system/inc/Expression.hpp"

#include "xaifBooster/algorithms/RequiredValues/inc/RequiredValue.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/Sequence.hpp"

#include "xaifBooster/algorithms/PushPop/inc/CombinedGraph.hpp" 

using namespace xaifBooster;

namespace xaifBoosterPushPop {

  /**
   * Derived Sequence class for ...
   */
  class Sequence : public xaifBoosterBasicBlockPreaccumulationTape::Sequence {

  public:

    Sequence();

    virtual ~Sequence();

    virtual std::string debug() const;

    /**
     * check ... for \p anExpression
     */
    virtual bool hasExpression(const Expression& anExpression) const;

    void assignAndPushRequiredValueAfter(const xaifBoosterRequiredValues::RequiredValue& aRequiredValue);

    void pushRequiredValueAfter(const xaifBoosterRequiredValues::RequiredValue& aRequiredValue);

  protected:
    friend class BasicBlockAlg;

    void populateCombinedGraph();

  private:

    typedef std::list<const BasicBlockElement*> CBasicBlockElementPList;

    /// a list of pushes (owned by us) that occur after this sequence
    CBasicBlockElementPList myPushBlock;

    /** 
     * The combined graph, which includes
     * - the original computational graph for this sequence
     * - computation of the local partials (linearization)
     * - the accumulation graph
     */
    CombinedGraph myCombinedGraph;

    typedef std::map<const xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphVertex*,
                     const CombinedGraphVertex*> PLCGVp2CGVpMap;

    typedef std::map<const ExpressionEdge*,
                     const CombinedGraphVertex*> CExpressionEdgeP2CCombinedGraphVertexPMap;

    typedef std::map<const ExpressionVertex*,
                     CombinedGraphVertex*> CExpressionVertexP2CombinedGraphVertexPMap;
    /**
     * maps original expression vertices to the corresp. CG vertex
     * (the original expression vertex associated with the corresp. PLCG vertex)
     * used to associate arguments to concrete partial expressions with the corresp. CGV
     */
    CExpressionVertexP2CombinedGraphVertexPMap myEVp2CGVpMap;

    /**
     * duplicate a partial expression and affix it to the CombinedGraph
     * returns a reference to the CombinedGraphVertex that corresponds to the maximal linearization expression vertex
     */
    const CombinedGraphVertex& affixLinearizationExpressionToCombinedGraph(const ExpressionEdge&);

    /// no def
    Sequence(const Sequence&);

    /// no def
    Sequence& operator= (const Sequence&);

  };

}

#endif