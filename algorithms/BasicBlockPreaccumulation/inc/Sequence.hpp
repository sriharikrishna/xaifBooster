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
#include "xaifBooster/system/inc/BasicBlock.hpp"
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

    virtual ~Sequence();

    virtual std::string debug() const ;

    /**
     * check the front/end assignment lists and the derivative propagator for \p anExpression
     */
    virtual bool hasExpression(const Expression& anExpression) const;

    /// command line activated switch for specifying preaccumulation metric (min ops or scarcity)
    /** the validity of the input is checked in AlgConfig
     *  \sa AlgConfig
     */
    static void setPreaccumulationMetric(PreaccumulationMetric::PreaccumulationMetric_E aMetric); 

    /// command line activated switch for using randomized heuristics
    static void useRandomizedHeuristics();

    /// command line activated switch for using scarcity heuristics that do reroutings 
    static void useReroutings();

    /**
     * we can allow to have all 'ax' factors collected 
     * into one DerivativePropagator per 'y'
     */
    static void permitNarySax();

    static bool doesPermitNarySax();

    /**
     * determine whether an inlinable Assignment
     * \p aAssignment can be appended to this sequence
     * @returns true if 
     * @returns false if 
     * \TODO \FIXME should be const
     */
    bool
    canIncorporate(const Assignment& aAssignment,
                   const BasicBlock& theBasicBlock); //const;

    void
    incorporateAssignment(const Assignment& aAssignment,
                          const StatementIdList& theKnownAssignmentsIdList);

    /** 
     * the graph of all basic block elements combined, 
     * i.e. flattened, however since this is only for 
     * nontrivial derivative computations all zero 
     * expressions are clipped from the graph
     */
    PrivateLinearizedComputationalGraph* myComputationalGraph_p;
    
    void fillLCGIndependentsList(); 

    void fillLCGDependentsList();

    /// perform the preaccumulation transformation on the linearized computational graph
    void
    runElimination();

    typedef std::list<xaifBoosterCrossCountryInterface::Elimination*> EliminationPList;

    /** 
     * the derivative accumulator for this sequence
     */
    xaifBoosterDerivativePropagator::DerivativePropagator myDerivativePropagator;      

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
    Assignment& appendFrontAssignment(bool withAlgorithm=false);

    /** 
     * create a new Assignment instance
     * and append it to the list to be printed 
     * in printXMLHierarchy
     * after any element of the sequence but 
     * before the DerivativePropagator
     */
    Assignment& appendEndAssignment(bool withAlgorithm=false);

    const AssignmentPList& getFrontAssignmentList() const;

    const AssignmentPList& getEndAssignmentList() const;

    /// choose "best" transformation, based on what our metric for preaccumulation
    void determineBestElimination(PreaccumulationMetric::PreaccumulationMetric_E aMetric);

    const xaifBoosterCrossCountryInterface::Elimination& getBestElimination() const;
    xaifBoosterCrossCountryInterface::Elimination& getBestElimination();
    RemainderGraph& getBestRemainderGraph();

    EliminationPList& getEliminationPList();

  protected: friend class BasicBlockAlg;

    void
    printXMLHierarchyImpl(std::ostream&) const;

    /**
     * traverses the remainder graph and creates a derivative propagator entry for every edge.
     * created sax operations are n-ary if ourPermitNarySaxFlag is true
     */
    void generateRemainderGraphPropagators(); 

  protected:

    CAssignmentPList myAssignmentPList;

  private: 

    /// if this flag is true we run randomized heuristics in addition to deterministic ones
    static bool ourUseRandomizedHeuristicsFlag;

    /// indicates whether our goal is to minimize ops or exploit scarcity
    static PreaccumulationMetric::PreaccumulationMetric_E ourPreaccumulationMetric;

    /// if this flag is set to true we use scarcity heuristics that utilize reroutings
    static bool ourUseReroutingsFlag;

    static int ourIterationsParameter;

    static double ourGamma;

    /** 
     * if this flag is true we attempt to collect 
     * all 'ax' factors ordered by 'y'
     */ 
    static bool ourPermitNarySaxFlag;

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

    xaifBoosterCrossCountryInterface::Elimination&
    addNewElimination(); 

    xaifBoosterCrossCountryInterface::Elimination* myBestElimination_p;

    /** 
     * the RemainderGraph corresponding to myBestElimination_p
     */
    RemainderGraph* myBestRemainderGraph_p;
      
    /*
     * Produces all the propagation code relevent to \p theRemainderTargetV.
     * A separate call is created for every inedge, where the unit edges are processed first.
     * This lets us start with a setderiv or a setnegderiv whenever possible.
     * The constant and variable edges are subsequently handled with Sax(py) operations.
     */
    void propagateToRemainderVertex(const RemainderGraphVertex& theRemainderTargetV);

    /**
     * creates a single n-ary SAX operation for propagating to \p theRemainderTargetV
     */
    void propagateToRemainderVertex_narySax(const RemainderGraphVertex& theRemainderTargetV);

  }; 

} 
                                                                     
#endif
