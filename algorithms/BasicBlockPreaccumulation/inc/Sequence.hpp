#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATION_SEQUENCE_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATION_SEQUENCE_INCLUDE_
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
#include <map>

#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/BasicBlockElement.hpp"
#include "xaifBooster/system/inc/ExpressionVertex.hpp"
#include "xaifBooster/system/inc/PlainBasicBlock.hpp"

#include "xaifBooster/algorithms/CrossCountryInterface/inc/AccumulationGraph.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/JacobianAccumulationExpressionList.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/GraphCorrelations.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/Elimination.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagator.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PreaccumulationMetric.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/RemainderGraph.hpp" 
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/RemainderGraphVertex.hpp" 

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  /**
   * an instance of Sequence is held 
   * for every sequence of consecutive assignments 
   * in the block. 
   * Note that any non Assignment BasicBlockElement 
   * interrupts the sequence
   */
  class Sequence : public Debuggable { 

  public: 

    Sequence();      

    ~Sequence();

    virtual std::string debug() const ;

    /** 
     * the graph of all basic block elements combined, 
     * i.e. flattened, however since this is only for 
     * nontrivial derivative computations all zero 
     * expressions are clipped from the graph
     */
    PrivateLinearizedComputationalGraph* myComputationalGraph_p;
    
    xaifBoosterCrossCountryInterface::Elimination& addNewElimination(xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& lcg); 

    typedef std::list<xaifBoosterCrossCountryInterface::Elimination*> EliminationPList;

    /** 
     * the derivative accumulator for this sequence
     */
    xaifBoosterDerivativePropagator::DerivativePropagator myDerivativePropagator;      

    /**
     * first original BasicBlockElement 
     * covered by this Sequence
     * set in getComputationalGraph
     * used in printXMLHierarchy
     */
    const BasicBlockElement* myFirstElement_p;

    /**
     * last original BasicBlockElement 
     * covered by this Sequence
     * set in getComputationalGraph
     * used in printXMLHierarchy
     */
    const BasicBlockElement* myLastElement_p;

    typedef std::list<xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall*> InlinableSubroutineCallPList;

    const InlinableSubroutineCallPList& getAllocationList() const;

    /** 
     * create a new Allocation instance
     * and append it to the list to be printed 
     * in printXMLHierarchy
     * before any element of the sequence
     */
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& 
    addAllocation(const VariableSymbolReference& toBeAllocated,
		  const Variable& variableToMatch);

    /** 
     * create a new Assignment instance
     * and append it to the list to be printed 
     * in printXMLHierarchy
     * before any element of the sequence
     */
    Assignment& appendFrontAssignment();

    /** 
     * create a new Assignment instance
     * and append it to the list to be printed 
     * in printXMLHierarchy
     * after any element of the sequence but 
     * before the DerivativePropagator
     */
    Assignment& appendEndAssignment();

    typedef std::list<Assignment*> AssignmentPList;

    const AssignmentPList& getFrontAssignmentList() const;

    const AssignmentPList& getEndAssignmentList() const;

    /// choose "best" transformation, based on what our metric for preaccumulation
    void determineBestElimination(PreaccumulationMetric::PreaccumulationMetric_E aMetric);

    const xaifBoosterCrossCountryInterface::Elimination& getBestElimination() const;
    xaifBoosterCrossCountryInterface::Elimination& getBestElimination();
    RemainderGraph& getBestRemainderGraph();
      

    EliminationPList& getEliminationPList();

    /**
     * check the front/end assignment lists and the derivative propagator for \p anExpression
     */
    bool hasExpression(const Expression& anExpression) const;

  private: 

    /**
     * list to hold allocation calls to be added to 
     * the front of this sequence
     */
    InlinableSubroutineCallPList myAllocationList;

    /**
     * list to hold statements to be added to 
     * the front of this sequence
     */
    AssignmentPList myFrontAssignmentList;

    /**
     * list to hold statements to be added to 
     * the end of this sequence
     */
    AssignmentPList myEndAssignmentList;

    /** 
     * no def
     */
    Sequence(const Sequence&);

    /** 
     * no def
     */
    Sequence& operator= (const Sequence&);

    EliminationPList myEliminationPList;

    xaifBoosterCrossCountryInterface::Elimination* myBestElimination_p;

    /** 
     * the RemainderGraph corresponding to myBestElimination_p
     */
    RemainderGraph* myBestRemainderGraph_p;
      
  }; 

} 
                                                                     
#endif
