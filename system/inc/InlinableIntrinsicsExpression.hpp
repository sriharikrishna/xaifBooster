#ifndef _INLINABLEINTRINSICSEXPRESSION_INCLUDE_
#define _INLINABLEINTRINSICSEXPRESSION_INCLUDE_
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

#include "xaifBooster/boostWrapper/inc/GraphWrapper.hpp"
#include "xaifBooster/system/inc/InlinableIntrinsicsExpressionVertex.hpp"
#include "xaifBooster/system/inc/InlinableIntrinsicsExpressionEdge.hpp"
#include "xaifBooster/system/inc/PartialDerivativeKind.hpp"
#include "xaifBooster/system/inc/PositionSet.hpp"

namespace xaifBooster { 
  
  class InlinableIntrinsicsExpression : public GraphWrapper<InlinableIntrinsicsExpressionVertex,
					InlinableIntrinsicsExpressionEdge> { 
    
  public: 

    InlinableIntrinsicsExpression(unsigned int aNumberOfArguments,
				  PartialDerivativeKind::PartialDerivativeKind_E aPartialDerivativeKind);

    /**
     * get positions of arguments used in this partial
     */ 
    const PositionSet& getUsedPositionalArguments() const;

    /**
     * defines the position for a formal argument to the partial
     */
    void setPartialArgument(const InlinableIntrinsicsExpressionVertex& theVertex,
			    unsigned int thePosition);

    /**
     * returns the formal argument (vertex) for the partial 
     * that corresponds to the intrinsics argument  in position 
     * aPosition
     */
    const InlinableIntrinsicsExpressionVertex& getPartialArgumentAt(unsigned int aPosition) const ;

    bool isBuiltinFunction() const;
    void setBuiltinFunction();

    void setBuiltinFunctionName(std::string);
    std::string getBuiltinFunctionName() const;
    
    PartialDerivativeKind::PartialDerivativeKind_E getPartialDerivativeKind() const; 

  private: 

    /**
     * no def
     */
    InlinableIntrinsicsExpression();

    /**
     * set of argument positions used in this 
     * partial, counting starts with 1, 
     * the 0 position denotes the intrinsic's value
     */
    PositionSet myUsedPositionalArguments;

    typedef std::vector<const InlinableIntrinsicsExpressionVertex*> VertexVector;

    /**
     * this is the positional argument vector for this 
     * partial. Positions are expressed in terms of 
     * argument positions of the intrinsic. 
     * counting starts with 1 but the 0th 
     * position signifies the intrinsic's result. 
     * The vector doesn't own the pointers.
     */
    VertexVector myPartialArgumentSignature;

    const unsigned int myNumberOfArguments;

    /**
     * this specifies whether an intrinsic is builtin
     * if it is then myBuiltinFunctionName 
     * contains the name of the builtin function
     *
     * this is only used for the function evaluation
     * part of an InlinableIntrinsicCatalogueItem
     */

    bool myIsBuiltinFunction;

    std::string myBuiltinFunctionName;

    /**
     * this specifies categories of  
     * partial derivatives;
     * this is not used for the function expression
     */
    const PartialDerivativeKind::PartialDerivativeKind_E myPartialDerivativeKind;
    
    /** 
     * true if this partial used the intrinsics positional 
     * argument in position aPosition
     */
    bool hasPartialArgumentAt(unsigned int aPosition) const ;

  }; // end of class InlinableIntrinsicsExpression
  
} 

#endif
