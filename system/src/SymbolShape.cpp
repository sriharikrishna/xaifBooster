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
#include "xaifBooster/system/inc/SymbolShape.hpp"

namespace xaifBooster { 
  
  const std::string SymbolShape::our_attribute_XAIFName("shape");

  std::string SymbolShape::toString(const SymbolShape_E& aShape)
    throw (PrintingIntException) { 
    std::string returnString;
    switch(aShape) {
    case SCALAR:
      returnString="scalar";
      break;
    case VECTOR:
      returnString="vector";
      break;
    case MATRIX:
      returnString="matrix";
      break;
    case THREE_TENSOR:
      returnString="three_tensor";
      break;
    case FOUR_TENSOR:
      returnString="four_tensor";
      break;
    case FIVE_TENSOR:
      returnString="five_tensor";
      break;
    default: 
      throw PrintingIntException("SymbolShape::toString: unknown value",aShape);
      break;
    } // end switch
    return returnString;
  } // end of std::string SymbolShape::toString

  const SymbolShape::SymbolShape_E
  SymbolShape::fromString(const std::string& aName) { 
    SymbolShape_E returnValue;
    if (aName=="scalar")
      returnValue=SCALAR;
    else if (aName=="vector")
      returnValue=VECTOR;
    else if (aName=="matrix")
      returnValue=MATRIX;
    else if (aName=="three_tensor")
      returnValue=THREE_TENSOR;
    else if (aName=="four_tensor")
      returnValue=FOUR_TENSOR;
    else if (aName=="five_tensor")
      returnValue=FIVE_TENSOR;
    else  
      THROW_LOGICEXCEPTION_MACRO("SymbolShape::fromString: unknown value >"
			   << aName.c_str() << "<");
    return returnValue;
  } // end of std::string SymbolShape::fromString
  
} // end of namespace xaifBooster
