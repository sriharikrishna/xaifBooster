#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATION_BASICBLOCKALG_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATION_BASICBLOCKALG_INCLUDE_
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
#include "xaifBooster/system/inc/Marker.hpp"
#include "xaifBooster/system/inc/PlainBasicBlock.hpp"
#include "xaifBooster/system/inc/SubroutineCall.hpp"

#include "xaifBooster/algorithms/CrossCountryInterface/inc/AccumulationGraph.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/JacobianAccumulationExpressionList.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/GraphCorrelations.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/Elimination.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagator.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PreaccumulationMetric.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PreaccumulationCounter.hpp" 
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/RemainderGraph.hpp" 
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/RemainderGraphVertex.hpp" 
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/Sequence.hpp" 

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  enum FlattenedBasicBlockElementType_E {
   MARKER,
   SUBROUTINE_CALL,
   NONINLINABLE_ASSIGNMENT,
   SEQUENCE
  };

  class FlattenedBasicBlockElement {
  public:
    FlattenedBasicBlockElement(const Marker& aMarker) : myType(MARKER),
                                                        myRef(aMarker) {}

    FlattenedBasicBlockElement(const SubroutineCall& aSubroutineCall) : myType(SUBROUTINE_CALL),
                                                                        myRef(aSubroutineCall) {}

    FlattenedBasicBlockElement(const Assignment& aNonInlinableAssignment) : myType(NONINLINABLE_ASSIGNMENT),
                                                                            myRef(aNonInlinableAssignment) {
      if (!aNonInlinableAssignment.isNonInlinable())
        THROW_LOGICEXCEPTION_MACRO("xaifBoosterBasicBlockPreaccumulation::FlattenedBasicBlockElement:"
                                   << " expected noninlinable for " << aNonInlinableAssignment.debug().c_str())
    }

    FlattenedBasicBlockElement(const Sequence& aSequence) : myType(SEQUENCE),
                                                            myRef(aSequence) {}

    ~FlattenedBasicBlockElement(){
    //if (myType==SEQUENCE)
    //  if (myRef.mySequence_p)
    //    delete myRef.mySequence_p;
    }

    const FlattenedBasicBlockElementType_E myType;

    /// we do not own the thing that we point to
    const union FlattenedBasicBlockElementRef {
      const Marker* myMarker_p;
      const SubroutineCall* mySubroutineCall_p;
      const Assignment* myNonInlinableAssignment_p;
      const Sequence* mySequence_p;
      
      FlattenedBasicBlockElementRef(const Marker& aMarker) :
       myMarker_p(&aMarker){}
      FlattenedBasicBlockElementRef(const SubroutineCall& aSubroutineCall) :
       mySubroutineCall_p(&aSubroutineCall){}
      FlattenedBasicBlockElementRef(const Assignment& aNonInlinableAssignment) :
       myNonInlinableAssignment_p(&aNonInlinableAssignment){}
      FlattenedBasicBlockElementRef(const Sequence& aSequence) :
       mySequence_p(&aSequence){}
    } myRef;

  private:
    /// no def
    FlattenedBasicBlockElement();
    /// no def
    FlattenedBasicBlockElement(const FlattenedBasicBlockElement&);

  };

  typedef std::list<const FlattenedBasicBlockElement*> CFlattenedBasicBlockElementPList;

  class PrivateLinearizedComputationalGraphAlgFactory;
  class PrivateLinearizedComputationalGraphEdgeAlgFactory;
  class PrivateLinearizedComputationalGraphVertexAlgFactory;
  class PrivateLinearizedComputationalGraphEdge;

  /** 
   * class to implement algorithms relevant for the 
   * angel interface
   */
  class BasicBlockAlg : virtual public BasicBlockAlgBase {
  public:
    
    BasicBlockAlg(BasicBlock& theContaining);

    virtual ~BasicBlockAlg();

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    /**
     * search through all sequences for \p anExpression.
     * NOTE: this method may not be neccessary for push/pop algorithms,
     * as requires values are saved along with their CFG vertex.
     */ 
    virtual bool hasExpression(const Expression& anExpression) const;

    /// flatten assignments into sequences
    /**
     * flatten sequential inlinable assignments into sequences,
     * producing a list of FlattenedBasicBlockElement references
     * so that each Sequence can be treated atomically
     * (needed for traversing the transformations withinBasicBlock)
     */
    virtual void algorithm_action_2();

    /**
     * generate code for the elimination sequence returned by Angel
     */
    virtual void algorithm_action_3();

    static int ourIterationsParameter;
    static double ourGamma;

    /**
     * Sets flag to insert runtime conuters into the code.
     */
    static void setRuntimeCounters();

    static PrivateLinearizedComputationalGraphAlgFactory *getPrivateLinearizedComputationalGraphAlgFactory();
    static PrivateLinearizedComputationalGraphEdgeAlgFactory *getPrivateLinearizedComputationalGraphEdgeAlgFactory();
    static PrivateLinearizedComputationalGraphVertexAlgFactory *getPrivateLinearizedComputationalGraphVertexAlgFactory();
    static void setPrivateLinearizedComputationalGraphAlgFactory(xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphAlgFactory*);
    static void setPrivateLinearizedComputationalGraphEdgeAlgFactory(xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphEdgeAlgFactory*);
    static void setPrivateLinearizedComputationalGraphVertexAlgFactory(xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphVertexAlgFactory*);

    /**
     * access container
     */
    const BasicBlock& getContaining() const;

    /** 
     * we can allow to have all 'ax' factors collected 
     * into one DerivativePropagator per 'y'
     */
    static void permitNarySax();
    
    static bool doesPermitNarySax();

    /// command line activated switch for using randomized heuristics
    static void useRandomizedHeuristics();

    /// command line activated switch for specifying preaccumulation metric (min ops or scarcity)
    /** the validity of the input is checked in AlgConfig
     *  \sa AlgConfig
     */
    static void setPreaccumulationMetric(PreaccumulationMetric::PreaccumulationMetric_E aMetric); 

    /// command line activated switch for using scarcity heuristics that do reroutings 
    static void useReroutings();

    const StatementIdList& getAssignmentIdList()const;

    void addMyselfToAssignmentIdList(const Assignment&); 

    /**
     * pointer to printer for DerivativePropagator
     */
    typedef void (*PrintDerivativePropagator_fp)(std::ostream& os,
						 const BasicBlockAlgBase& aBasicBlockAlg, 
						 const xaifBoosterDerivativePropagator::DerivativePropagator& aPropagator);

    void printXMLHierarchyImpl(std::ostream& os,
			       PrintDerivativePropagator_fp aPrintDerivativePropagator_fp) const;

    static unsigned int getAssignmentCounter();
    static unsigned int getSequenceCounter();
    static const PreaccumulationCounter& getGlobalPreaccumulationCounter();

    const PreaccumulationCounter& getPreaccumulationCounter() const;

    /**
     * sets ourOneGraphPerStatementFlag to true
     */
    static void oneGraphPerStatement();

    /**
     * returns ourOneGraphPerStatementFlag
     */
    static bool isOneGraphPerStatement(); 

  private:

    static PrivateLinearizedComputationalGraphAlgFactory* ourPrivateLinearizedComputationalGraphAlgFactory_p;
    static PrivateLinearizedComputationalGraphEdgeAlgFactory* ourPrivateLinearizedComputationalGraphEdgeAlgFactory_p;
    static PrivateLinearizedComputationalGraphVertexAlgFactory* ourPrivateLinearizedComputationalGraphVertexAlgFactory_p;

    static bool ourRuntimeCountersFlag; 

    /// if this flag is true we run randomized heuristics in addition to deterministic ones
    static bool ourUseRandomizedHeuristicsFlag;

    /// indicates whether our goal is to minimize ops or exploit scarcity
    static PreaccumulationMetric::PreaccumulationMetric_E ourPreaccumulationMetric;

    /// if this flag is set to true we use scarcity heuristics that utilize reroutings
    static bool ourUseReroutingsFlag;

    PlainBasicBlock::BasicBlockElementList myRuntimeCounterCallList;
    
    /// keep track of metrics associated with the preaccumulation
    PreaccumulationCounter myPreaccumulationCounter;

    /** 
     * no def
     */
    BasicBlockAlg();

    /** 
     * no def
     */
    BasicBlockAlg(const BasicBlockAlg&);

    /** 
     * no def
     */
    BasicBlockAlg& operator=(const BasicBlockAlg&);

  public:

    typedef std::list<Sequence*> SequencePList;

    const SequencePList& getUniqueSequencePList() const;

  protected:

    /// currently we dont own anything referred to
    CFlattenedBasicBlockElementPList myFlattenedBasicBlockElementPList;

    /** 
     * this list owns all the Sequence instances created by getComputationalGraph
     * and keeps them in order
     * it is for convenient ordered traversal over all Sequence instances.
     * The classes dtor will delete the instances held here
     */
    SequencePList myUniqueSequencePList;

    /** 
     * this is just a helper to accomodate 
     * the additional BasicBlockAlgBase&
     * in the signature of PrintDerivativePropagator_fp
     */
    static void printerWrapper(std::ostream& os,
			       const BasicBlockAlgBase&, 
			       const xaifBoosterDerivativePropagator::DerivativePropagator& aPropagator) {
      xaifBoosterDerivativePropagator::DerivativePropagator::printXMLHierarchyImpl(os,aPropagator);
    }; 

    /** 
     * if this flag is true we attempt to collect 
     * all 'ax' factors ordered by 'y'
     */ 
    static bool ourPermitNarySaxFlag;

    /*
     * the list of all Assignment statement Ids
     */ 
    StatementIdList myAssignmentIdList;

    /** 
     * counting all assignments
     */
    static unsigned int ourAssignmentCounter;
      
    /** 
     * counting all Sequence instances
     */
    static unsigned int ourSequenceCounter;
      
    /// keep track of (total) metrics associated with all preaccumulation operations
    static PreaccumulationCounter ourPreaccumulationCounter;

    /// perform the preaccumulation transformation on the graph for \p aSequence
    virtual void runElimination(Sequence& aSequence);

    void incrementGlobalAssignmentCounter();
    
    void incrementGlobalSequenceCounter();
      
    /**
     * Traverses theAccumulationGraph for the best elimination in \p aSequence in topological order,
     * generating assignments for all non-leaf vertices that are either maximal or have >1 outedges
     * (those with >1 outedge represent intermediate values used more than once).
     */
    void generateAccumulationExpressions(Sequence& aSequence);

    /**
     * Determines the PDK for a non-leaf vertex and, if applicable, also pre-computes it's value.
     * (This is where the magic of constant folding happens!)
     */
    void evaluateAccVertex(xaifBoosterCrossCountryInterface::AccumulationGraphVertex& theAccVertex,
			   const xaifBoosterCrossCountryInterface::AccumulationGraph& theAccumulationGraph);

    /**
     * Recursively builds a single accumulation assignment from the subtree rooted at \p theAccVertex
     */
    const ExpressionVertex&
    buildAccumulationAssignmentRecursively(const xaifBoosterCrossCountryInterface::AccumulationGraph& theAccumulationGraph,
                                           Assignment& theNewAssignment,
                                           const xaifBoosterCrossCountryInterface::AccumulationGraphVertex& theAccVertex);

    /**
     * Check all independents against all dependents for possible aliasing conflicts,
     * creating a replacement propagation variables independents that possibly conflict.
     */
    void makePropagationVariables(Sequence& aSequence);

    /**
     * traverses the remainder graph and creates a derivative propagator entry for every edge
     */
    void generateRemainderGraphPropagators(Sequence& aSequence); 

    /*
     * Produces all the propagation code relevent to \p theRemainderTargetV.
     * A separate call is created for every inedge, where the unit edges are processed first.
     * This lets us start with a setderiv or a setnegderiv whenever possible.
     * The constant and variable edges are subsequently handled with Sax(py) operations.
     */
    void propagateToRemainderVertex(const RemainderGraphVertex& theRemainderTargetV,
                                    Sequence& aSequence);

    /**
     * creates a single n-ary SAX operation for propagating to \p theRemainderTargetV
     */
    void propagateToRemainderVertex_narySax(const RemainderGraphVertex& theRemainderTargetV,
                                            Sequence& aSequence);

    /** 
     * to satisfy schema uniqueness constraints
     */
    static std::string makeUniqueId(); 

    /**
     * if this is true then computational graphs will be built only for one 
     * statement, i.e. the flattening across statements is turned off
     */
    static bool ourOneGraphPerStatementFlag;

  }; 
 
} 
                                                                     
#endif
