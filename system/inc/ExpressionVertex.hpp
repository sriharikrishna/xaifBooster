#ifndef _EXPRESSIONVERTEX_INCLUDE_
#define _EXPRESSIONVERTEX_INCLUDE_
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

#include "xaifBooster/utils/inc/ObjectWithId.hpp"
#include "xaifBooster/system/inc/ExpressionVertexAlgBase.hpp"
#include "xaifBooster/system/inc/VertexTraversable.hpp"
#include "xaifBooster/system/inc/InlinableIntrinsicsCatalogueItem.hpp"

namespace xaifBooster { 

  /**
   * base class for various vertex types inside of expressions
   */
  class ExpressionVertex : public VertexTraversable, 
			   public ObjectWithId {

  public:

    ExpressionVertex();

    /**
     * dtor deallocates the algorithm object if present
     */
    virtual ~ExpressionVertex();

    /**
     * invoked by Expression
     */
    virtual void printXMLHierarchy(std::ostream& os) const=0;

    /** 
     * nothing implemented. this is for edges
     */
    virtual void printXMLHierarchyImpl(std::ostream& os, const Expression& theExpression) const {};

    /**
     * actual implementation for printing xaif
     * always invoked by the graph
     */
    virtual void printXMLHierarchyImpl(std::ostream& os) const {};

    std::string debug() const ;

    /**
     * access the algorithm
     */
    ExpressionVertexAlgBase& getExpressionVertexAlgBase() const;

    /**
     * leaf objects that are derived from this class
     * need to be comparable for equivalence
     * \todo remove this
     */
    virtual std::string equivalenceSignature() const =0;

    /**
     * returns true if this is an Argument
     */
    virtual bool isArgument() const;

    /**
     * ExpressionVertex is base class for variety of leaf classes
     * with algorithms; those need to be able to create copy of 
     * themselves for use in algorithms
     */
    virtual ExpressionVertex& createCopyOfMyself(bool withAlgorithm=false) const=0;

    virtual const InlinableIntrinsicsCatalogueItem& getInlinableIntrinsicsCatalogueItem() const;

  private: 

    /** 
     * no def 
     */ 
    ExpressionVertex(const ExpressionVertex&); 

    /** 
     * no def 
     */ 
    ExpressionVertex& operator=(const ExpressionVertex&); 

  protected:
    /**
     * if required then an algorithm object is allocated dynamically
     * by the factory and the pointer is set
     */
    ExpressionVertexAlgBase* myExpressionVertexAlgBase_p;

  }; // end of class ExpressionVertex
 
} // end of namespace xaifBooster
                                                                     
#endif
