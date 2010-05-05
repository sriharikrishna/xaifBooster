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
#include "xaifBooster/system/inc/InlinableIntrinsicsCatalogueItem.hpp"

namespace xaifBooster { 


  const std::string InlinableIntrinsicsCatalogueItem::ourXAIFName("xaifii:InlinableIntrinsic");
  const std::string InlinableIntrinsicsCatalogueItem::our_myName_XAIFName("name");
  const std::string InlinableIntrinsicsCatalogueItem::our_myNrArgs_XAIFName("nr_arguments");
  const std::string InlinableIntrinsicsCatalogueItem::our_myNonSmoothFlag_XAIFName("nonSmooth");
  const std::string InlinableIntrinsicsCatalogueItem::ourFunctionXAIFName("xaifii:Function");
  const std::string InlinableIntrinsicsCatalogueItem::our_myFunctionType_XAIFName("type");
  const std::string InlinableIntrinsicsCatalogueItem::our_myFunctionBuiltinName_XAIFName("builtin_name");
  const std::string InlinableIntrinsicsCatalogueItem::ourPartialXAIFName("xaifii:Partial");
  const std::string InlinableIntrinsicsCatalogueItem::our_myPartialId_XAIFName("partial_id");
  const std::string InlinableIntrinsicsCatalogueItem::our_myPartialType_XAIFName("partial_type");

  InlinableIntrinsicsCatalogueItem::InlinableIntrinsicsCatalogueItem(unsigned int aNumberOfArguments,
								     bool aNonSmoothFlag) :
    myNumberOfArguments(aNumberOfArguments),
    myExpressionVector(aNumberOfArguments+1),
    myDataComplete(false),
    myNonSmoothFlag(aNonSmoothFlag) { 
    InlinableIntrinsicsExpression* theFunction_p=new InlinableIntrinsicsExpression(myNumberOfArguments,
										   PartialDerivativeKind::PASSIVE); // this is for the function itself
    myExpressionVector[0]=theFunction_p;
    for (unsigned int i=1;i<aNumberOfArguments+1;i++)
      myExpressionVector[i]=0;
  } 

  InlinableIntrinsicsCatalogueItem::~InlinableIntrinsicsCatalogueItem() { 
    for (ExpressionVector::iterator it=myExpressionVector.begin();
	 it!=myExpressionVector.end();
	 it++)
      if ((*it)) // should always be true
	delete (*it);
  } 

  InlinableIntrinsicsExpression&
  InlinableIntrinsicsCatalogueItem::addPartial(unsigned int aPosition,
					       PartialDerivativeKind::PartialDerivativeKind_E aPartialDerivativeKind) { 
    if (myDataComplete)
      THROW_LOGICEXCEPTION_MACRO("InlinableIntrinsicsCatalogueItem::addPartial: cannot add partials after list was assumed to be complete");
    if (myExpressionVector[aPosition])
      THROW_LOGICEXCEPTION_MACRO("InlinableIntrinsicsCatalogueItem::addPartial: position already set");
    if (aPosition<1 || aPosition>myNumberOfArguments)
      THROW_LOGICEXCEPTION_MACRO("InlinableIntrinsicsCatalogueItem::addPartial: position out of range");
    InlinableIntrinsicsExpression* theExpression_p=new InlinableIntrinsicsExpression(myNumberOfArguments, aPartialDerivativeKind);
    myExpressionVector[aPosition]=theExpression_p;
    return *theExpression_p;
  } 
  
  bool
  InlinableIntrinsicsCatalogueItem::isExpressionVectorElementSet(unsigned int aPosition) const { 
    if (aPosition>myNumberOfArguments)
      THROW_LOGICEXCEPTION_MACRO("InlinableIntrinsicsCatalogueItem::isExpressionVectorElementSet: position out of range");
    return (myExpressionVector[aPosition]!=0);
  } 

  const InlinableIntrinsicsExpression& 
  InlinableIntrinsicsCatalogueItem::getExpressionVectorElement(unsigned int aPosition) const { 
    if (!isExpressionVectorElementSet(aPosition))
      THROW_LOGICEXCEPTION_MACRO("InlinableIntrinsicsCatalogueItem::getExpressionVectorElement: position not set");
    return *(myExpressionVector[aPosition]);
  } 

  InlinableIntrinsicsExpression& 
  InlinableIntrinsicsCatalogueItem::getFunction() { 
    if (!isExpressionVectorElementSet(0))
      THROW_LOGICEXCEPTION_MACRO("InlinableIntrinsicsCatalogueItem::getFunction: position 0 in ExpressionVector not set");
    return *(myExpressionVector[0]);
  } 

  const InlinableIntrinsicsExpression& 
  InlinableIntrinsicsCatalogueItem::getFunction() const { 
    if (!isExpressionVectorElementSet(0))
      THROW_LOGICEXCEPTION_MACRO("InlinableIntrinsicsCatalogueItem::getFunction: position 0 in ExpressionVector not set");
    return *(myExpressionVector[0]);
  } 

  const PositionSet&
  InlinableIntrinsicsCatalogueItem::getUsedPositionalArguments(const PositionSet&) const { 
    if (!myDataComplete) { 
      for (ExpressionVector::const_iterator it=myExpressionVector.begin();
	   it!=myExpressionVector.end();
	   it++)
	// this is really conceptually constant
	const_cast<InlinableIntrinsicsCatalogueItem*>(this)->myUsedPositionalArguments.add((*it)->getUsedPositionalArguments());
      // this is really conceptually constant
      const_cast<InlinableIntrinsicsCatalogueItem*>(this)->myDataComplete=true;
    }
    return myUsedPositionalArguments; 
  } 

  bool 
  InlinableIntrinsicsCatalogueItem::isNonSmooth() const { 
    return myNonSmoothFlag;
  }

} 
