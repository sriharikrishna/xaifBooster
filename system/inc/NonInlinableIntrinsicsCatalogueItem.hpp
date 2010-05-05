#ifndef _NONINLINABLEINTRINSICSCATALOGUEITEM_INCLUDE_
#define _NONINLINABLEINTRINSICSCATALOGUEITEM_INCLUDE_
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

#include <vector>
#include "xaifBooster/system/inc/ExplicitJacobian.hpp"
#include "xaifBooster/system/inc/DirectAction.hpp"

namespace xaifBooster { 

  /**
   * a class that contains all the 
   * definitions for a particular 
   * intrinsic
   */
  class NonInlinableIntrinsicsCatalogueItem { 
    
  public: 

    /**
     * we preallocate the vector with the resp. size
     * and check any argument position against this size
     * the ctor will also preallocate an Expression for the 
     * function but will not fill it. 
     * \todo JU: why do we preallocate the expression for the function?
     */
    NonInlinableIntrinsicsCatalogueItem(bool aNonSmoothFlag);

    ~NonInlinableIntrinsicsCatalogueItem();

    static const std::string our_myNonSmoothFlag_XAIFName;
    static const std::string our_myName_XAIFName;

    /** 
     * returns flag value
     */
    bool isNonSmooth() const; 

    bool isExplicitJacobian() const; 

    bool isDirectAction() const; 

    ExplicitJacobian& getExplicitJacobian(); 

    DirectAction& getDirectAction(); 

    ExplicitJacobian& makeExplicitJacobian(); 

    DirectAction& makeDirectAction(); 
  private:
    
    /**
     * no def
     */
    NonInlinableIntrinsicsCatalogueItem();

    /**
     * no def
     */
    NonInlinableIntrinsicsCatalogueItem(const NonInlinableIntrinsicsCatalogueItem&);

    /**
     * no def
     */
    NonInlinableIntrinsicsCatalogueItem& operator=(const NonInlinableIntrinsicsCatalogueItem&);

    /** 
     * a flag in the intrinsics catalogue indicating a nonsmooth 
     * behavior
     */
    const bool myNonSmoothFlag;

    /** 
     * if this is an ExplicitJacobian
     * this points to it;
     * we own the instance
     */
    ExplicitJacobian *myExplicitJacobian_p;

    /** 
     * if this is a DirectAction
     * this points to it;
     * we own the instance
     */
    DirectAction *myDirectAction_p;

  }; 
  
} 

#endif
