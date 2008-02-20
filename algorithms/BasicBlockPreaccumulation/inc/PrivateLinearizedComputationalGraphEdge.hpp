#ifndef _PRIVATELINEARIZEDCOMPUTATIONALGRAPHEDGE_INCLUDE_
#define _PRIVATELINEARIZEDCOMPUTATIONALGRAPHEDGE_INCLUDE_
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

#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraphEdge.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ExpressionEdgeAlg.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/AssignmentAlg.hpp"

namespace xaifBooster { 
  class ExpressionEdge;
}

using namespace xaifBooster; 

namespace xaifBoosterBasicBlockPreaccumulation { 
  
  class PrivateLinearizedComputationalGraphEdge : 
    public xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge {

  public:

    PrivateLinearizedComputationalGraphEdge();

    ~PrivateLinearizedComputationalGraphEdge(){};
 
    void setLinearizedExpressionEdge(ExpressionEdge& anExpressionEdge);

    void setDirectCopyEdge();

    bool isDirectCopyEdge() const;

    const ExpressionEdge& getLinearizedExpressionEdge() const;
    bool hasLinearizedExpressionEdge() const;

    std::string debug() const ;

    typedef std::list<ExpressionEdge*> ExpressionEdgePList;
    
    void addParallel(ExpressionEdge&);

    virtual Assignment& getAssignmentFromEdge() const {
      return (dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>(getLinearizedExpressionEdge().getExpressionEdgeAlgBase()).getConcretePartialAssignment());
    };

    const ExpressionEdgePList& getParallels() const;

  private:
    
    /**
     * this refers to an edge in the  
     * right hand side of an assignment in a 
     * basic block
     * I.e. this is a reference to a local partial 
     * derivative
     * this class doesn't own the ExpressionEdge pointed 
     * to by myPrivateLinearizedExpressionEdge
     * the edge we point to is not owned by this class
     */
    ExpressionEdge* myLinearizedExpressionEdge_p;

    /** 
     * we keep all references to edges parallel 
     * to the one referenced in myLinearizedExpressionEdge_p
     * in here such that the we have only one placeholder 
     * in here. This implies that all parallel edges are 
     * added before any reference to this edge
     * none of the edges are owned by this class
     */
    ExpressionEdgePList myParallelEdges;

    /** 
     * this is a special purpose edge 
     * that needs to represent an assignment t1=t2, 
     * i.e. something for which we don't have an edge in the 
     * Expression
     */
    bool myDirectCopyEdgeFlag;

  }; // end of class LinearizedComputationalGraphEdge
 
} 
                                                                     
#endif
