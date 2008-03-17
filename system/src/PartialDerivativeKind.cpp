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
#include "xaifBooster/system/inc/PartialDerivativeKind.hpp"

namespace xaifBooster { 

  const std::string PartialDerivativeKind::our_attribute_XAIFName("kind");

  std::string 
  PartialDerivativeKind::toString(const PartialDerivativeKind_E& aKind)
    throw (PrintingIntException) { 
    std::string returnString;
    switch(aKind) {
    case NOT_SET: 
      returnString="not_set";
      break;
    case PASSIVE:
      returnString="passive";
      break;
    case LINEAR_ONE: 
      returnString="linear_one";
      break;
    case LINEAR_MINUS_ONE: 
      returnString="linear_minus_one";
      break;
    case LINEAR: 
      returnString="linear";
      break;
    case NONLINEAR: 
      returnString="nonlinear";
      break;
    default: 
      throw PrintingIntException("PartialDerivativeKind::toString: unknown value",aKind);
      break;
    } // end switch
    return returnString;
  } // end of std::string PartialDerivativeKind::toString

  const PartialDerivativeKind::PartialDerivativeKind_E
  PartialDerivativeKind::fromString(const std::string& aName) { 
    PartialDerivativeKind_E returnValue;
    if (aName=="not_set")
      returnValue=NOT_SET;
    else if (aName=="passive")
      returnValue=PASSIVE;
    else if (aName=="linear_one")
      returnValue=LINEAR_ONE;
    else if (aName=="linear_minus_one")
      returnValue=LINEAR_MINUS_ONE;
    else if (aName=="linear")
      returnValue=LINEAR;
    else if (aName=="nonlinear")
      returnValue=NONLINEAR;
    else  
      THROW_LOGICEXCEPTION_MACRO("PartialDerivativeKind::fromString: unknown value >"
				 << aName.c_str() << "<");
    return returnValue;
  } // end of std::string PartialDerivativeKind::fromString

  PartialDerivativeKind::PartialDerivativeKind_E 
  PartialDerivativeKind::leastDependent(PartialDerivativeKind::PartialDerivativeKind_E aKind,
					PartialDerivativeKind::PartialDerivativeKind_E anotherKind) { 
    PartialDerivativeKind_E theResult;
    switch (aKind) { 
    case PASSIVE:
      theResult=PASSIVE;
    case LINEAR_ONE: 
      switch (anotherKind) { 
      case PASSIVE:
	theResult=PASSIVE;
      case LINEAR_MINUS_ONE: 
	THROW_LOGICEXCEPTION_MACRO("PartialDerivativeKind::leastDependent: cannot compare " 
				   << toString(LINEAR_ONE).c_str()
				   << " and " 
				   << toString(LINEAR_MINUS_ONE).c_str());
	break;
      case LINEAR_ONE: 
      case LINEAR: 
      case NONLINEAR: 
	theResult=LINEAR_ONE;
	break;
      default: 
	throw PrintingIntException("PartialDerivativeKind::leastDependent: unknown value",anotherKind);
	break;
      } 
      break;
    case LINEAR_MINUS_ONE: 
      switch (anotherKind) { 
      case PASSIVE:
	theResult=PASSIVE;
      case LINEAR_ONE: 
	THROW_LOGICEXCEPTION_MACRO("PartialDerivativeKind::leastDependent: cannot compare " 
				   << toString(LINEAR_ONE).c_str()
				   << " and " 
				   << toString(LINEAR_MINUS_ONE).c_str());
	break;
      case LINEAR_MINUS_ONE: 
      case LINEAR: 
      case NONLINEAR: 
	theResult=LINEAR_MINUS_ONE;
	break;
      default: 
	throw PrintingIntException("PartialDerivativeKind::leastDependent: unknown value",anotherKind);
	break;
      } 
      break;
    case LINEAR: 
      switch (anotherKind) { 
      case PASSIVE:
      case LINEAR_ONE: 
      case LINEAR_MINUS_ONE: 
	theResult=anotherKind;
	break;
      case LINEAR: 
      case NONLINEAR: 
	theResult=LINEAR;
	break;
      default: 
	throw PrintingIntException("PartialDerivativeKind::leastDependent: unknown value",anotherKind);
	break;
      } 
      break;
    case NONLINEAR: 
      theResult=anotherKind;
      break;
    default: 
      throw PrintingIntException("PartialDerivativeKind::toString: unknown value",aKind);
      break;
    } 
    return theResult;
  } 

  
} // end of namespace xaifBooster
