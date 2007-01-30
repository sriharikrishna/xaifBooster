#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATION_BASICBLOCKALG_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATION_BASICBLOCKALG_INCLUDE_
// ========== begin copyright notice ==============
// This file is part of 
// ---------------
// xaifBooster
// ---------------
// Distributed under the BSD license as follows:
// Copyright (c) 2005, The University of Chicago
// All rights reserved.
//
// Redistribution and use in source and binary forms, 
// with or without modification, are permitted provided that the following conditions are met:
//
//    - Redistributions of source code must retain the above copyright notice, 
//      this list of conditions and the following disclaimer.
//    - Redistributions in binary form must reproduce the above copyright notice, 
//      this list of conditions and the following disclaimer in the documentation 
//      and/or other materials provided with the distribution.
//    - Neither the name of The University of Chicago nor the names of its contributors 
//      may be used to endorse or promote products derived from this software without 
//      specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
// OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
// SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
// LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
// General Information:
// xaifBooster is intended for the transformation of 
// numerical programs represented as xml files according 
// to the XAIF schema. It is part of the OpenAD framework. 
// The main application is automatic 
// differentiation, i.e. the generation of code for 
// the computation of derivatives. 
// The following people are the principal authors of the 
// current version: 
// 	Uwe Naumann
//	Jean Utke
// Additional contributors are: 
//	Andrew Lyons
//	Peter Fine
//
// For more details about xaifBooster and its use in OpenAD please visit:
//   http://www.mcs.anl.gov/openad
//
// This work is partially supported by:
// 	NSF-ITR grant OCE-0205590
// ========== end copyright notice ==============

#include <list>

#include "xaifBooster/algorithms/Linearization/inc/BasicBlockAlg.hpp"

#include "xaifBooster/algorithms/CrossCountryInterface/inc/JacobianAccumulationExpressionList.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/GraphCorrelations.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagator.hpp"
#include "xaifBooster/utils/inc/Counter.hpp" 
#include "xaifBooster/system/inc/PlainBasicBlock.hpp"
#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PreaccumulationMode.hpp"


namespace xaifBooster { 
  class ExpressionVertex;
  class Assignment;
  class BasicBlockElement;
}

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  class PrivateLinearizedComputationalGraphAlgFactory;
  class PrivateLinearizedComputationalGraphEdgeAlgFactory;
  class PrivateLinearizedComputationalGraphVertexAlgFactory;

  /** 
   * class to implement algorithms relevant for the 
   * angel interface
   */
  class BasicBlockAlg : public xaifBoosterLinearization::BasicBlockAlg {
  public:
    
    BasicBlockAlg(BasicBlock& theContaining);

    virtual ~BasicBlockAlg();

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    /**
     * flatten the Assignment level graphs found here into a graph held by 
     * myComputationalGraph per sequence of consecutive Assignment instances
     */
    virtual void algorithm_action_2();

    /**
     * generate code for the elimination sequence returned by Angel
     */
    virtual void algorithm_action_3();

    /**
     * pointer to function for computing non-scarse elimination sequences
     */
    typedef void (*ComputeEliminationSequence_fp)(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph&,
						  int,
						  double,
						  xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList&);
    typedef std::list<std::pair<std::string,ComputeEliminationSequence_fp> > ComputeEliminationSequence_fpList;
    static ComputeEliminationSequence_fpList ourNonScarseEliminations_fpList;
    static int ourIterationsParameter;
    static double ourGamma;

    typedef std::list<const Variable*> VariableCPList;
    
    /**
     * Sets flag to run all algorithms and choose the best one if a flag is set.
     */
    static void setAllAlgorithms();

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

    const Counter& getBasicBlockOperations() const;

    const DuUdMapDefinitionResult::StatementIdList& getAssignmentIdList()const;

    /**
     * pointer to printer for DerivativePropagator
     */
    typedef void (*PrintDerivativePropagator_fp)(std::ostream& os,
						 const BasicBlockAlgBase& aBasicBlockAlg, 
						 const xaifBoosterDerivativePropagator::DerivativePropagator& aPropagator);

    void printXMLHierarchyImpl(std::ostream& os,
			       PrintDerivativePropagator_fp aPrintDerivativePropagator_fp) const;

  private:

    static PrivateLinearizedComputationalGraphAlgFactory* ourPrivateLinearizedComputationalGraphAlgFactory_p;
    static PrivateLinearizedComputationalGraphEdgeAlgFactory* ourPrivateLinearizedComputationalGraphEdgeAlgFactory_p;
    static PrivateLinearizedComputationalGraphVertexAlgFactory* ourPrivateLinearizedComputationalGraphVertexAlgFactory_p;

    static bool ourChooseAlgFlag;
    static bool ourRuntimeCountersFlag; 

    PlainBasicBlock::BasicBlockElementList myCounterCallList;
    
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
    BasicBlockAlg operator=(const BasicBlockAlg&);
   
  protected: 
    
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
    
      /**
       * this is the result of applying an elimination to a Sequence
       */
      struct EliminationResult { 
      public: 
	xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList myJAEList;
	xaifBoosterCrossCountryInterface::LinearizedComputationalGraph myRemainderGraph;
	xaifBoosterCrossCountryInterface::VertexCorrelationList myVertexCorrelationList;
	xaifBoosterCrossCountryInterface::EdgeCorrelationList myEdgeCorrelationList;
	/** 
	 * the ensuing operation counts etc. 
	 */
	Counter myCounter; 
      };

      EliminationResult& addNewEliminationResult(); 

      typedef std::list<EliminationResult*> EliminationResultPList;

      EliminationResult* myBestEliminationResult_p;
      
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

      void setBestResult();

      /**
       * count the number of multiplications and additions in a JacobianAccumulationExpresstionList
       */
      void countPreaccumulationOperations(EliminationResult& anEliminationResult);


    private: 

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

      EliminationResultPList myEliminationResultPList;

    }; // end of struct Sequence

  private: 

    typedef std::pair<BasicBlockElement*,
		      Sequence*> BasicBlockElementSequencePPair;

  public: 

    /** 
     * we execute variants of sequences of assignments 
     * flattened into graphs
     * and need to keep the data for each variant
     */
    class SequenceHolder : public Debuggable {

    public: 
      
      SequenceHolder(bool flatten);

      ~SequenceHolder();

      typedef std::list<Sequence*> SequencePList;
      
      SequencePList& getUniqueSequencePList();

      /**
       * counting all Operations within a basic block
       */
      Counter myBasicBlockOperations;

      typedef std::list<BasicBlockElementSequencePPair> BasicBlockElementSequencePPairList;

      BasicBlockElementSequencePPairList& getBasicBlockElementSequencePPairList();
      const BasicBlockElementSequencePPairList& getBasicBlockElementSequencePPairList() const;

      /** 
       * returns the DerivativePropagtor 
       * to be used by theAssignment
       * this expects to be called only after 
       * a Sequence has been associated with 
       * theAssignment through a call to 
       * getComputationalGraph
       */
      xaifBoosterDerivativePropagator::DerivativePropagator& getDerivativePropagator(const Assignment& theAssignment);
      
      bool doesLimitToStatementLevel() const;

      /** 
       * signals a necessary split in the sequence due to an 
       * ambiguity
       */
      void splitComputationalGraph(const Assignment& theAssignment);

      static unsigned int getAssignmentCounter();
      
      static unsigned int getSequenceCounter();

      virtual std::string debug()const; 
    
    private: 

      /** 
       * this list owns all the Sequence instances
       * created by getComputationalGraph and keeps them in order
       * it is for convenient ordered traversal over all 
       * Sequence instances. 
       * The classes dtor will delete the instances held here
       */
      SequencePList myUniqueSequencePList;

      /** 
       * this list does not own the Sequence
       * instances it contains 
       * consecutive assignments may share 
       * a Sequence
       * BasicBlockElement instances that are not an 
       * Assignment will have a 0 pointer. 
       */
      BasicBlockElementSequencePPairList myBasicBlockElementSequencePPairList;

      /** 
       * if this flag is true each ComputationalGraph 
       * consists of exactly one assignment
       */ 
      bool myLimitToStatementLevelFlag;

    };

    SequenceHolder& getSequenceHolder(PreaccumulationMode::PreaccumulationMode_E aMode);

    /** 
     * returns the PrivateLinearizedComputationalGraph 
     * to be used by theAssignment
     * this expects to be called in the 
     * sequence order of BasicBlockElements
     * to work best as it creates the Sequence
     * instances to be used by sequences of consecutive
     * assignments. 
     */
    PrivateLinearizedComputationalGraph& getComputationalGraph(const Assignment& theAssignment,
							      SequenceHolder& aSequenceHolder);
    
    void addMyselfToAssignmentIdList(const Assignment&, 
				     const SequenceHolder& aSequenceHolder);

    /** 
     * determines if the given SequenceHolder is the 
     * the representative one
     */
    bool isRepresentativeSequenceHolder(const SequenceHolder& aSequenceHolder) const;
    
    SequenceHolder& getRepresentativeSequenceHolder();
    
    static void forcePreaccumulationMode(PreaccumulationMode::PreaccumulationMode_E aMode); 

    static PreaccumulationMode::PreaccumulationMode_E getPreaccumulationMode();
    
    const SequenceHolder& getBestSequenceHolder() const;

    SequenceHolder& getBestSequenceHolder();

  private: 
    
    /** 
     * the sequence that we deem best after applying some heuristic 
     * as criterion to pick between myFlatOn, myFlatOff etc. 
     * no deletion in dtor
     */
    SequenceHolder* myBestSequenceHolder_p;

    typedef std::vector<SequenceHolder*> SequenceHolderPVector;

    SequenceHolderPVector mySequenceHolderPVector;

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
    
    
    typedef std::pair<const xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex*,
		      const Variable*> InternalReferenceConcretization; 
    typedef std::list<InternalReferenceConcretization> InternalReferenceConcretizationList;

    typedef std::pair<const xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex*,
		      const ExpressionVertex*> VertexPair; 
    typedef std::list<VertexPair> VertexPairList;
    
    /**
     * \todo JU: here we just make up positions for the + and * operations because
     * they don't matter for scalars. In the future for vector valued Jacobian 
     * accumulations ANGEL needs to return the positions. 
     */
    void traverseAndBuildJacobianAccumulationsFromBottomUp(const xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& theVertex,
							   const xaifBoosterCrossCountryInterface::JacobianAccumulationExpression& theExpression,
							   Assignment& theNewAssignment,
							   const InternalReferenceConcretizationList& theInternalReferenceConcretizationList,
							   VertexPairList& theVertexPairList);

    /** 
     * determines variables in IN and OUT
     */
    bool isAliased(const Variable& theIndepVariable,
		   const VariableCPList& theDependentList);
    
    /** 
     * if this flag is true we attempt to collect 
     * all 'ax' factors ordered by 'y'
     */ 
    static bool ourPermitNarySaxFlag;

    /*
     * the list of all Assignment statement Ids
     */ 
    DuUdMapDefinitionResult::StatementIdList ourAssignmentIdList;

    typedef HashTable<const Variable*> VariableHashTable;

    void handleCollapsedVertex(PrivateLinearizedComputationalGraphVertex& theCollapsedVertex,
			       VariableCPList& theDepVertexPListCopyWithoutRemovals,
			       VariableHashTable& theListOfAlreadyAssignedIndependents,
			       BasicBlockAlg::Sequence& aSequence,
			       xaifBoosterDerivativePropagator::DerivativePropagator::EntryPList::iterator& aDPBeginI);

    /*
     * performs the core of algorithm_action_3();
     */
    void algorithm_action_3_perSequence(SequenceHolder&);
    
    /** 
     * counting all assignments
     */
    static unsigned int ourAssignmentCounter;
      
    /** 
     * counting all Sequence instances
     */
    static unsigned int ourSequenceCounter;
      
    /**
     * run the standard algorithm for creating the elminated graphs
     */
    void standardEliminationAlgorithm(SequenceHolder::SequencePList::iterator&, PrivateLinearizedComputationalGraph&, VariableCPList& theDepVertexPListCopyWithoutRemoval, SequenceHolder&);
    
    /**
     * run the scarce algorithm for creating the elminated graphs
     */
    void runElimination(SequenceHolder::SequencePList::iterator&, 
			VariableCPList& theDepVertexPListCopyWithoutRemoval, 
			SequenceHolder&);
    
    void incrementGlobalAssignmentCounter(const SequenceHolder& aSequenceHolder);
    
    void incrementGlobalSequenceCounter(const SequenceHolder& aSequenceHolder);
      
    /** 
     * one of the SequenceHolder instances should be 
     * the one for which we do the common tasks
     */
    SequenceHolder* myRepresentativeSequence_p;

    static PreaccumulationMode::PreaccumulationMode_E ourPreaccumulationMode;

    /** 
     * filter out singleton vertices
     */
    void graphFilter(VariableHashTable& theListOfAlreadyAssignedIndependents,
		     SequenceHolder::SequencePList::iterator& aSequencePListI,
		     VariableCPList& theDepVertexPListCopyWithoutRemovals,
		     BasicBlockAlg::SequenceHolder& aSequenceHolder); 

    void fillIndependentsList(PrivateLinearizedComputationalGraph& theComputationalGraph); 
    
    void fillDependentsList(PrivateLinearizedComputationalGraph& theComputationalGraph,
			    VariableCPList& theDepVertexPListCopyWithoutRemovals);

    void 
    runAngelNonScarse(SequenceHolder::SequencePList::iterator& aSequencePListI); 

    void 
    generate(VariableHashTable& theListOfAlreadyAssignedIndependents,
	     SequenceHolder::SequencePList::iterator& aSequencePListI, 
	     VariableCPList& theDepVertexPListCopyWithoutRemovals, 
	     SequenceHolder& aSequenceHolder); 

    };
 
} // end of namespace xaifBoosterAngelInterfaceAlgorithms
                                                                     
#endif
