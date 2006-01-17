#ifndef _XAIFBOOSTERMEMOPSTRADEOFFPREACCUMULATION_BASICBLOCKALG_INCLUDE_
#define _XAIFBOOSTERMEMOPSTRADEOFFPREACCUMULATION_BASICBLOCKALG_INCLUDE_
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

#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/LinearizedComputationalGraphCopyEdge.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/LinearizedComputationalGraphCopy.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/JacobianAccumulationExpressionCopy.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/DualGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"

using namespace xaifBoosterCrossCountryInterface;

namespace xaifBoosterMemOpsTradeoffPreaccumulation {  

  /**
   * class to implement algorithms relevant for the 
   * elimination methods for memory-operations-tradeoffs
   */
  class BasicBlockAlg : public xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg {
  public:

    BasicBlockAlg(BasicBlock& theContaining);
                                                                                
    virtual ~BasicBlockAlg() {};

    /**
     * calls algorithm_action_2() from 
     * xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg 
     */
    virtual void algorithm_action_2();
                                                                                
    /**
     * calls algorithm_action_3() from 
     * xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg 
     */

    virtual void algorithm_action_3();

    virtual void printXMLHierarchy(std::ostream& os) const;
                                                                                
    virtual std::string debug() const;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    /**
     * compute elimination sequence receives a flattened linearized computational graph and a 
     * JAE list, the mode parameter is a dummy for now.  First, a copy of the graph is made, so that
     * the original can remain unmodified.  A text file is then parsed, the contents ofd the file first
     * stipulate whether vertex or edge elimination is to be used on the graph.  At the moment, vertex
     * elimination can only be used on graphs where the independent vertices are those vertices with no
     * inedges, and the dependent vertices are the ones with no outedges, rather than the distinctions
     * specified by the independent and dependent lists that come as a part of the original graph.
     * Next, the order of heuristics to be used is read in from the file.  the first heuristic is run
     * on the set of possible eliminations, if it can't decide on a sungle element, the second heuristic
     * is run on the remaining elements, and so on, until either forward mode or reverse mode is called.
     * These two heuristics always decide on a single element.  the JAE list is updated as eliminations
     * are made.  After execution, theOriginal remains the same, and the JAE list is full of the
     * eliminations required to reduce the original to a bipartite graph
     */
    static void compute_elimination_sequence(
      const LinearizedComputationalGraph& theOriginal,
      int mode,
      double, //consolidate interfaces
      JacobianAccumulationExpressionList& theJacobianAccumulationExpressionList);

  private:

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

  };  // end of class

} // end of namespace 
                                                                     
#endif
