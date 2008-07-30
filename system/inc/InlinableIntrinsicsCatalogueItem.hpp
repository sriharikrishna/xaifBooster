#ifndef _INLINABLEINTRINSICSCATALOGUEITEM_INCLUDE_
#define _INLINABLEINTRINSICSCATALOGUEITEM_INCLUDE_
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

#include "xaifBooster/system/inc/InlinableIntrinsicsExpression.hpp"
#include "xaifBooster/system/inc/PartialDerivativeKind.hpp"
#include <vector>

namespace xaifBooster { 

  /**
   * a class that contains all the 
   * definitions for a particular 
   * intrinsic
   */
  class InlinableIntrinsicsCatalogueItem { 
    
  public: 

    /**
     * we preallocate the vector with the resp. size
     * and check any argument position against this size
     * the ctor will also preallocate an Expression for the 
     * function but will not fill it. 
     * \todo JU: why do we preallocate the expression for the function?
     */
    InlinableIntrinsicsCatalogueItem(unsigned int aNumberOfArguments,
				     bool aNonSmoothFlag);

    ~InlinableIntrinsicsCatalogueItem();

    /** 
     * see
     * myExpressionVector for explanation 
     * of position parameter
     */
    InlinableIntrinsicsExpression& addPartial(unsigned int aPosition,
					      PartialDerivativeKind::PartialDerivativeKind_E aPartialDerivativeKind);
    
    typedef std::vector<InlinableIntrinsicsExpression*> ExpressionVector;

    /** 
     * the ExpressionVector element can be set only once with addPartial
     */
    bool isExpressionVectorElementSet(unsigned int Position) const;

    /**
     * will throw an exception if the element had not been set with 
     */
    const InlinableIntrinsicsExpression& getExpressionVectorElement(unsigned int Position) const;

    InlinableIntrinsicsExpression& getFunction();
    
    unsigned int getNumberOfArguments() const;

    static const std::string ourXAIFName;
    static const std::string our_myName_XAIFName;
    static const std::string our_myNrArgs_XAIFName;
    static const std::string our_myNonSmoothFlag_XAIFName;
    static const std::string ourFunctionXAIFName;
    static const std::string our_myFunctionType_XAIFName;
    static const std::string our_myFunctionBuiltinName_XAIFName;
    static const std::string ourPartialXAIFName;
    static const std::string our_myPartialId_XAIFName;
    static const std::string our_myPartialType_XAIFName;

    /** 
     * this method is const but on first invocation will fill the 
     * myUsedPositionalArguments and flip myDataComplete
     * disallowing the addition of further partials
     * \todo implementation to be fixed
     */
    const PositionSet& getUsedPositionalArguments(const PositionSet& theActiveArgumentPositions) const;

    /** 
     * returns flag value
     */
    bool isNonSmooth() const; 

  private:
    
    /**
     * no def
     */
    InlinableIntrinsicsCatalogueItem();

    /**
     * no def
     */
    InlinableIntrinsicsCatalogueItem(const InlinableIntrinsicsCatalogueItem&);

    /**
     * no def
     */
    InlinableIntrinsicsCatalogueItem& operator=(const InlinableIntrinsicsCatalogueItem&);

    /** 
     * the number of Arguments for this intrinsic
     */
    unsigned int myNumberOfArguments;

    /**
     * the Vector of all partials
     * however the 0th element is always 
     * reserved for a potential expression for 
     * the function itself, i.e. this has myNumberOfArguments+1 
     * elements;
     * items in this Vector are newed up
     * by addPartial and deleted by 
     * this class' dtor
     */
    ExpressionVector myExpressionVector;

    /**
     * set of argument positions used anywhere in a  
     * partial of this intrinsic, counting starts with 1, 
     * the 0 position denotes the intrinsic's value
     * this is the union of all 
     * InlinableIntrinsicsExpression::myUsedPositionalArguments
     * kept in myExpressionVector
     */
    PositionSet myUsedPositionalArguments;

    /** 
     * indicates the setting of the catalogue item's 
     * data is complete,i.e. myUsedPositionalArguments was set
     */
    bool myDataComplete;

    /** 
     * a flag in the intrinsics catalogue indicating a nonsmooth 
     * behavior
     */
    const bool myNonSmoothFlag;

  }; // end of class InlinableIntrinsicsCatalogueItem
  
} 

#endif
