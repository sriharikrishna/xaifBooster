#ifndef _XAIFBOOSTERMEMOPSTRADEOFFPREACCUMULATION_EDGEELIM_INCLUDE_
#define _XAIFBOOSTERMEMOPSTRADEOFFPREACCUMULATION_EDGEELIM_INCLUDE_
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
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"

using namespace MemOpsTradeoffPreaccumulation;

namespace xaifBoosterMemOpsTradeoffPreaccumulation {  

  class EdgeElim {

  public:

    /**
     * forward mode receives a list of possible edge eliminations and a const reference to the copy graph.
     * it reduces the edge list to a single edge to be eliminated based on the topological sort of the
     * vertices made when the original graph is copied.  It prefers to back eliminate.
     * forwardmode makes no use of the predecessor and successor lists .    
     */
    static void forwardMode_e(
      LinearizedComputationalGraphCopy& theCopy,
      LinearizedComputationalGraphCopy::EdgePointerList& theOldEdgeList,
      const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList);

    /**
     * reverse mode receives a list of possible edge eliminations and a const reference to the copy graph.
     * it reduces the edge list to a single edge to be eliminated based on the topological sort of the
     * vertices made when the original graph is copied.  It prefers to front eliminate.
     * reversemode makes no use of the predecessor and successor lists   .  
     */
    static void reverseMode_e(
      LinearizedComputationalGraphCopy& theCopy,
      LinearizedComputationalGraphCopy::EdgePointerList& theOldEdgeList,
      const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList);

    /**
     * markowitzmode reduces the list to all those edges with the lowest markowitz degree.
     * markowitzmode makes no use of the predecessor and successor lists.
     */
    static void markowitzMode_e(
      LinearizedComputationalGraphCopy& theCopy,
      LinearizedComputationalGraphCopy::EdgePointerList& theOldEdgeList,
      const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList);

    /**
     * sibling2mode uses the predecessor and sucessor lists to try to make an elimination that causes an
     * addition to an edge created during the previous elimination.  if the last elimination was a front
     * elimination, it attempts to find an edge which originates from the same source as the last edge
     * eliminated, this edge is front eliminated if its target has the most number of sucessors in the
     * successor list.  if the previous elimination was a back elimination, we attempt to maximize the
     * number of predecessors in the predecessor list in a similar fashion.  if there are no "siblings,"
     * the edge list is not changed.
     */
    static void sibling2Mode_e(
      LinearizedComputationalGraphCopy& theCopy,
      LinearizedComputationalGraphCopy::EdgePointerList& theOldEdgeList,
      const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList);

    /**
     * succpredmode chooses front edge eliminations whose target is in the predecessor set, and back
     * eliminations whose source is in the successor set.
     */
    static void succPredMode_e(
      LinearizedComputationalGraphCopy& theCopy,
      LinearizedComputationalGraphCopy::EdgePointerList& theOldEdgeList,
      const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList);

  };  // end of class

} // end of namespace 
                                                                     
#endif
