#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATION_SEQUENCE_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATION_SEQUENCE_INCLUDE_
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
