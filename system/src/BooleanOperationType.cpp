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
#include "xaifBooster/system/inc/BooleanOperationType.hpp"

namespace xaifBooster { 
  
  std::string BooleanOperationType::toString(const BooleanOperationType_E& aType)
    throw (PrintingIntException) { 
    std::string returnString;
    switch(aType) {
    case LESS_THAN_OTYPE:
      returnString="less_than";
      break;
    case LESS_OR_EQUAL_OTYPE: 
      returnString="less_or_equal";
      break;
    case GREATER_THAN_OTYPE:
      returnString="greater_than";
      break;
    case GREATER_OR_EQUAL_OTYPE: 
      returnString="greater_or_equal";
      break;
    case EQUAL_OTYPE: 
      returnString="equal";
      break;
    case NOT_EQUAL_OTYPE:
      returnString="not_equal";
      break;
    case AND_OTYPE: 
      returnString="and";
      break;
    case OR_OTYPE: 
      returnString="or";
      break;
    case NOT_OTYPE: 
      returnString="not";
      break;
    case XOR_OTYPE: 
      returnString="xor";
      break;
    default: 
      throw PrintingIntException("BooleanOperationType::toString: unknown value",aType);
      break;
    } // end switch
    return returnString;
  } // end of std::string BooleanOperationType::toString

  const BooleanOperationType::BooleanOperationType_E
  BooleanOperationType::fromString(const std::string& aName) { 
    BooleanOperationType_E returnValue;
    if (aName=="less_than")
      returnValue=LESS_THAN_OTYPE;
    else if (aName=="less_or_equal")
      returnValue=LESS_OR_EQUAL_OTYPE;
    else if (aName=="greater_than")
      returnValue=GREATER_THAN_OTYPE;
    else if (aName=="greater_or_equal")
      returnValue=GREATER_OR_EQUAL_OTYPE;
    else if (aName=="equal")
      returnValue=EQUAL_OTYPE;
    else if (aName=="not_equal")
      returnValue=NOT_EQUAL_OTYPE;
    else if (aName=="and")
      returnValue=AND_OTYPE;
    else if (aName=="or")
      returnValue=OR_OTYPE;
    else if (aName=="not")
      returnValue=NOT_OTYPE;
    else if (aName=="xor")
      returnValue=XOR_OTYPE;
    else  
      THROW_LOGICEXCEPTION_MACRO("BooleanOperationType::fromString: unknown value >"
			   << aName.c_str() << "<");
    return returnValue;
  } // end of std::string BooleanOperationType::fromString
  
} // end of namespace xaifBooster
