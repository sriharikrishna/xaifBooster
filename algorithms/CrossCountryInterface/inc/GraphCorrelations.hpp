#ifndef _GRAPHCORRELATIONS_INCLUDE_
#define _GRAPHCORRELATIONS_INCLUDE_
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

#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/JacobianAccumulationExpressionList.hpp"

namespace xaifBoosterCrossCountryInterface {

  /** 
   * a vertex in the remainder graph 
   * should have a counter part in the original
   * linearized computational graph
   */
  struct VertexCorrelationEntry {
    const LinearizedComputationalGraphVertex* myOriginalVertex_p;
    LinearizedComputationalGraphVertex* myRemainderVertex_p;
    VertexCorrelationEntry(): 
      myOriginalVertex_p(0),
      myRemainderVertex_p(0) {
    };
  };
  
  /** 
   * an edge in the remainder graph 
   * should reference either an edge in the original
   * linearized computational graph
   * or a top level vertex in an JacobianAccumulationExpression
   */
  struct EdgeCorrelationEntry {
    
    union { 
      const LinearizedComputationalGraphEdge* myOriginalEdge_p;
      JacobianAccumulationExpressionVertex* myJAEVertex_p;
    } myElminationReference;

    enum RemainderEdgeType_E {LCG_EDGE, 
			      JAE_VERT,
			      UNDEFINED};
    /** 
     * the discriminator for myElminationReference
     */
    RemainderEdgeType_E myType;
    LinearizedComputationalGraphEdge* myRemainderGraphEdge_p;
    EdgeCorrelationEntry() : 
      myType(UNDEFINED),
      myRemainderGraphEdge_p(0) {
    };
  };
  
  typedef std::list<VertexCorrelationEntry> VertexCorrelationList;
  typedef std::list<EdgeCorrelationEntry> EdgeCorrelationList;
  
} // namespace xaifBoosterCrossCountryInterface

#endif  
