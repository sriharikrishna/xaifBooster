#ifndef _XAIFBOOSTERMEMOPSTRADEOFFPREACCUMULATION_VERTEXELIM_INCLUDE_
#define _XAIFBOOSTERMEMOPSTRADEOFFPREACCUMULATION_VERTEXELIM_INCLUDE_
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

  class VertexElim {

  public:

    /**
     * forward mode sets the vertex list to the first element in the topsorted vertex list.
     * forwardmode makes no use of the predecessor and successor lists .    
     */
    static void forwardMode_v(
      LinearizedComputationalGraphCopy& theCopy,
      LinearizedComputationalGraphCopy::VertexPointerList& theOldVertexList,
      const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList);

    /**
     * reversemode sets the vertex list to the first element in the topsorted vertex list.
     * reversemode makes no use of the predecessor and successor lists .    
     */
    static void reverseMode_v(
      LinearizedComputationalGraphCopy& theCopy,
      LinearizedComputationalGraphCopy::VertexPointerList& theOldVertexList,
      const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList);

    /**
     * markowitzmode reduces the list to all those vertices with the lowest markowitz degree.
     * markowitzmode makes no use of the predecessor and successor lists.
     */
    static void markowitzMode_v(
      LinearizedComputationalGraphCopy& theCopy,
      LinearizedComputationalGraphCopy::VertexPointerList& theOldvertexList,
      const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList);

    /**
     * silingmode reduces the vertex list to only those vertices that share at least one predecessor
     * and sucessor with the most recently eliminated vertex.  if no vertices meet this criteria, the
     * vertex list remains unchanged.
     */
    static void siblingMode_v(
      LinearizedComputationalGraphCopy& theCopy,
      LinearizedComputationalGraphCopy::VertexPointerList& theOldVertexList,
      const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList);

    /**
     * sibling2mode reduces the vertex list to only those vertices that have the highest nonzero value for
     * the number of predecessors shared with the most recently eliminated vertex times the number of
     * sucessors shared.  if no vertices meet this criteria, the vertex list remains unchanged. 
     */
    static void sibling2Mode_v(
      LinearizedComputationalGraphCopy& theCopy,
      LinearizedComputationalGraphCopy::VertexPointerList& theOldVertexList,
      const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList);

    /**
     * succpredmode reduces the vertex list to those vertices that were either predecessors or sucessors of
     * the most recently eliminated vertex.
     */
    static void succPredMode_v(
      LinearizedComputationalGraphCopy& theCopy,
      LinearizedComputationalGraphCopy::VertexPointerList& theOldVertexList,
      const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
      const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList);

  };  // end of class

} // end of namespace 
                                                                     
#endif
