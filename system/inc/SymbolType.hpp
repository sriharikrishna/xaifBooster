#ifndef _SYMBOLTYPE_INCLUDE_
#define _SYMBOLTYPE_INCLUDE_
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

#include <string>
#include <set>
#include "xaifBooster/utils/inc/PrintingIntException.hpp"

namespace xaifBooster { 
  class SymbolType { 
  public:

    /**
     * keep the order!
     */
    enum SymbolType_E {
      INTEGER_STYPE=0,
      REAL_STYPE=1,
      COMPLEX_STYPE=2,
      VOID_STYPE=3,
      BOOL_STYPE=4,
      CHAR_STYPE=5,
      STRING_STYPE=6,
      OPAQUE_STYPE=7
    };


    static std::string toString(const SymbolType_E& aType) throw (PrintingIntException);

    static const SymbolType_E fromString(const std::string& aName);
    
    static const std::string our_attribute_XAIFName;
    
    /** 
     * for pairs of types that can be promoted or are equal
     * \return the resulting type
     * or throws an exception
     */
    static SymbolType_E genericPromotion(const SymbolType_E& aType,
					 const SymbolType_E& anotherType);

    /** 
     * the types that can't be automatically promoted 
     * in binary operations
     */
    static const std::set<SymbolType_E> ourNonPromotables;

  }; // end of class SymbolType

} // end of namespace xaifBooster
                                                                     
#endif
