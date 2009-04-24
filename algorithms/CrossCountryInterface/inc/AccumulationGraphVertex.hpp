#ifndef _XAIFBOOSTERCROSSCOUNTRYINTERFACE_ACCUMULATIONGRAPHVERTEX_INCLUDE_
#define _XAIFBOOSTERCROSSCOUNTRYINTERFACE_ACCUMULATIONGRAPHVERTEX_INCLUDE_
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

#include "xaifBooster/boostWrapper/inc/Vertex.hpp"

#include "xaifBooster/system/inc/Constant.hpp"
#include "xaifBooster/system/inc/ExpressionEdge.hpp"
#include "xaifBooster/system/inc/ExpressionEdgeAlgBase.hpp"
#include "xaifBooster/system/inc/Intrinsic.hpp"
#include "xaifBooster/system/inc/PartialDerivativeKind.hpp"

#include "xaifBooster/algorithms/CrossCountryInterface/inc/JacobianAccumulationExpressionVertex.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraphEdge.hpp"

#include "xaifBooster/algorithms/Linearization/inc/ExpressionEdgeAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterCrossCountryInterface { 

  class AccumulationGraphVertex : public Vertex {

  public:

    /**
     * Constructor for leaves that correspond to direct copy edges in the LCG;
     * sets only the PDK (which is all that's needed).
     */
    AccumulationGraphVertex();
 
    /**
     * Constructor for leaves (those that don't correspond to direct copy edges in the LCG).
     * Sets the PDK and also the value (when PDK is LINEAR), or the LHSVariable (when PDK is NONLINEAR).
     * AL: currently there is a HACK in place that sets the PDK to NONLINEAR if
     * it's linear but is some constant expression instead of a particular known constant
     * (in other words, if the RHS of the partial expression consists of more than one (Constant) vertex.)
     */
    AccumulationGraphVertex(const ExpressionEdge& theExpressionEdge);
 
    /**
     * Constructor for vertices for which there is an operation (all non-leaves).
     */
    AccumulationGraphVertex(const JacobianAccumulationExpressionVertex::Operation_E& anOpType);

    ~AccumulationGraphVertex(){};

    void setRemainderGraphEdge(const LinearizedComputationalGraphEdge& anLCGEdge);
    const LinearizedComputationalGraphEdge& getRemainderGraphEdge() const;
    const bool hasRemainderGraphEdge() const;

    JacobianAccumulationExpressionVertex::Operation_E getOperation() const;

    void setPartialDerivativeKind(const PartialDerivativeKind::PartialDerivativeKind_E aPartialDerivativeKind);
    const PartialDerivativeKind::PartialDerivativeKind_E getPartialDerivativeKind() const;

    void setValue(double aValue);
    double getValue() const;
    const bool hasValue() const;

    void setLHSVariable(const Variable& aVariable);
    const Variable& getLHSVariable() const;
    const bool hasLHSVariable() const;
 
    std::string debug() const;

  private:

    AccumulationGraphVertex (const AccumulationGraphVertex&);
    AccumulationGraphVertex& operator=(const AccumulationGraphVertex&);

    /**
     * Pointer to corresponding edge in the remainder graph.  May or may not be set.
     * When set, this Acc graph vertex must have some LHS set, which is used in propagation.
     */
    const LinearizedComputationalGraphEdge* myRemainderGraphEdge_p;

    /**
     * currently either ADD or MULT, only for non-leaf vertices.
     */
    JacobianAccumulationExpressionVertex::Operation_E myOperationType;

    /**
     *  Set either during the constructor (for leaves)
     *  or during the topological traversal (for non-leaves)
     */
    PartialDerivativeKind::PartialDerivativeKind_E myPartialDerivativeKind;

    /**
     * stores the value for vertices whose value can be computed
     * (those with LINEAR PDK, for all other PDKs the value is implicit)
     */
    double myValue;

    /**
     * Flag that indicates whether the value was set to something in particular (its initialized to zero,
     * but the flag tells us whether or not it was set to zero specifically).
     */
    bool ValueHasBeenSet;

    /**
     * MUST be set for accumulation graph vertices that either
     * - correspond to an edge in the remainder graph or
     * - are non-leaves with >1 outedge or
     * - are NONLINEAR leaves
     * May be set for non-leaves with one outedge whose LHSVARIABLE is identical to that of a child
     * (like if it's NONLINEAR+PASSIVE or NONLINEAR*LINEAR_ONE).
     * We do not own this variable.
     */
    const Variable* myLHSVariable_p;

  }; // end of class AccumulationGraphVertex

} // end namespace xaifBoosterCrossCountryInterface
                       
#endif

