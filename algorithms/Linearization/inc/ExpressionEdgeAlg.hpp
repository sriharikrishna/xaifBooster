#ifndef _XAIFBOOSTERLINEARIZATION_EXPRESSIONEDGEALG_INCLUDE_
#define _XAIFBOOSTERLINEARIZATION_EXPRESSIONEDGEALG_INCLUDE_
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

#include "xaifBooster/system/inc/ExpressionEdgeAlgBase.hpp"
#include "xaifBooster/system/inc/PartialDerivativeKind.hpp"
#include "xaifBooster/system/inc/InlinableIntrinsicsExpression.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"

using namespace xaifBooster; 

namespace xaifBoosterLinearization { 

  /**
   * class to implement linearization steps
   */
  class ExpressionEdgeAlg : public ExpressionEdgeAlgBase {

  public:
    
    ExpressionEdgeAlg(ExpressionEdge& theContainingExpressionEdge);

    virtual ~ExpressionEdgeAlg(){};

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    bool hasPartial() const; 

    const InlinableIntrinsicsExpression& getPartial() const ;

    void setPartial(const InlinableIntrinsicsExpression& thePartial);

    void addArgumentsConcretizationPair(const ExpressionVertex& aConcreteArgument,
					const InlinableIntrinsicsExpressionVertex& anAbstractArgument);

    void makeConcretePartialAssignment();

    Assignment& getConcretePartialAssignment();

    const Assignment& getConcretePartialAssignment() const ;

    bool hasConcretePartialAssignment() const;

    typedef std::pair<const ExpressionVertex*,const InlinableIntrinsicsExpressionVertex*> VertexPair;
    
    typedef std::list<VertexPair> VertexPairList;

    PartialDerivativeKind::PartialDerivativeKind_E getPartialDerivativeKind() const;

    void passivate();

    void linearate();

    const VertexPairList& getConcreteArgumentInstancesList() const;

  private: 

    /** 
     * no def
     */
    ExpressionEdgeAlg();

    /** 
     * no def
     */
    ExpressionEdgeAlg(const ExpressionEdgeAlg&);

    /** 
     * no def
     */
    ExpressionEdgeAlg operator=(const ExpressionEdgeAlg&);

    /**
     * a reference to the partial derivative
     * which is being set as part of the 
     * linearization. It refers to an entity in the  
     * InlinableInstrinsicsCatalogue
     */
    const InlinableIntrinsicsExpression* myPartialDerivative_p;
    
    /**
     * this is to keep track of 
     * the actual arguments in myPartialDerivative
     * the list doesn't own any of the instances pointed to
     */
    VertexPairList myConcreteArgumentInstancesList;

    /**
     * This is initially 0, it will 
     * be set during linearization 
     * when we establish a concrete 
     * instance for the partial expression 
     * based on the abstract expression 
     * referred to by myPartialDerivative_p
     * this class owns this instance
     */
    Assignment* myConcretePartialAssignment_p;

    /** 
     * this is initialized to NONLINEAR
     * will be reset upon setting of
     * myPartialDerivative_p to the value assumed 
     * there and can be changed to PASSIVE
     * with passivate
     */
    PartialDerivativeKind::PartialDerivativeKind_E myConcretePartialDerivativeKind;

  };
 
} 
                                                                     
#endif
