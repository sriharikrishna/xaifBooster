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
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/SymbolType.hpp"

namespace xaifBooster { 
  
  const std::string SymbolType::our_attribute_XAIFName("type");

  static const SymbolType::SymbolType_E typesList[]={
    SymbolType::INTEGER_STYPE,
    SymbolType::REAL_STYPE,
    SymbolType::COMPLEX_STYPE,
    SymbolType::VOID_STYPE,
    SymbolType::BOOL_STYPE,
    SymbolType::CHAR_STYPE,
    SymbolType::STRING_STYPE,
    SymbolType::OPAQUE_STYPE
  };
  
  const std::set<SymbolType::SymbolType_E> SymbolType::ourNonPromotables(&(typesList[SymbolType::VOID_STYPE]),&(typesList[SymbolType::OPAQUE_STYPE])+1);

  std::string SymbolType::toString(const SymbolType_E& aType)
    throw (PrintingIntException) { 
    std::string returnString;
    switch(aType) {
    case INTEGER_STYPE: 
      returnString="integer";
      break;
    case REAL_STYPE: 
      returnString="real";
      break;
    case COMPLEX_STYPE:
      returnString="complex";
      break;
    case VOID_STYPE:
      returnString="void";
      break;
    case BOOL_STYPE: 
      returnString="bool";
      break;
    case CHAR_STYPE:
      returnString="char";
      break;
    case STRING_STYPE: 
      returnString="string";
      break;
    case OPAQUE_STYPE: 
      returnString="opaque";
      break;
    default: 
      throw PrintingIntException("SymbolType::toString: unknown value",aType);
      break;
    } // end switch
    return returnString;
  } // end of std::string SymbolType::toString

  const SymbolType::SymbolType_E
  SymbolType::fromString(const std::string& aName) { 
    SymbolType_E returnValue;
    if (aName=="integer")
      returnValue=INTEGER_STYPE;
    else if (aName=="real")
      returnValue=REAL_STYPE;
    else if (aName=="complex")
      returnValue=COMPLEX_STYPE;
    else if (aName=="void")
      returnValue=VOID_STYPE;
    else if (aName=="bool")
      returnValue=BOOL_STYPE;
    else if (aName=="char")
      returnValue=CHAR_STYPE;
    else if (aName=="string")
      returnValue=STRING_STYPE;
    else if (aName=="opaque")
      returnValue=OPAQUE_STYPE;
    else  
      THROW_LOGICEXCEPTION_MACRO("SymbolType::fromString: unknown value >" << aName.c_str() << "<");
    return returnValue;
  } // end of std::string SymbolType::fromString

  SymbolType::SymbolType_E SymbolType::genericPromotion(const SymbolType::SymbolType_E& aType,
							const SymbolType::SymbolType_E& anotherType) {
    if (aType==anotherType)
      return aType;
    if (ourNonPromotables.find(aType)!=ourNonPromotables.end()
	||
	ourNonPromotables.find(anotherType)!=ourNonPromotables.end()) {
      THROW_LOGICEXCEPTION_MACRO("SymbolType::genericPromotion: not between " << toString(aType) << " and " << toString(anotherType));
    }
    return (aType>anotherType)?aType:anotherType;
  }

} // end of namespace xaifBooster
