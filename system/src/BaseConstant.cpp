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
#include <iomanip>
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/utils/inc/StringConversions.hpp"
#include "xaifBooster/system/inc/BaseConstant.hpp"

namespace xaifBooster { 

  const std::string BaseConstant::ourBooleanTrueString("true");
  const std::string BaseConstant::ourBooleanFalseString("false");

  std::string BaseConstant::debug () const { 
    std::ostringstream out;
    out << "BaseConstant[" << this 
	<< ",myType=" << SymbolType::toString(myType)
	<< ",myValue=" << toString().c_str()
	<< "]" << std::ends;  
    return out.str();
  } // end of ExpressionVertex::debug

  double BaseConstant::getdouble()const { 
    if (myType!=SymbolType::REAL_STYPE)
      THROW_LOGICEXCEPTION_MACRO("BaseConstant::getdouble typs is " + 
				 SymbolType::toString(myType));
    return myValue.f;
  } 

  void BaseConstant::setdouble(double f) { 
    if (myType!=SymbolType::REAL_STYPE)
      THROW_LOGICEXCEPTION_MACRO("BaseConstant::setdouble typs is " + 
				 SymbolType::toString(myType));
    myValue.f=f;
  } 

  int BaseConstant::getint()const { 
    if (myType!=SymbolType::INTEGER_STYPE)
      THROW_LOGICEXCEPTION_MACRO("BaseConstant::getint typs is " + 
				 SymbolType::toString(myType));
    return myValue.i;
  } 

  void BaseConstant::setint(int i) { 
    if (myType!=SymbolType::INTEGER_STYPE)
      THROW_LOGICEXCEPTION_MACRO("BaseConstant::setint typs is " + 
				 SymbolType::toString(myType));
    myValue.i=i;
  } 

  void BaseConstant::setbool(bool b) { 
    if (myType!=SymbolType::BOOL_STYPE)
      THROW_LOGICEXCEPTION_MACRO("BaseConstant::setint typs is " + 
				 SymbolType::toString(myType));
    myValue.b=b;
  } 

  bool BaseConstant::getbool()const { 
    if (myType!=SymbolType::BOOL_STYPE)
      THROW_LOGICEXCEPTION_MACRO("BaseConstant::getint typs is " + 
				 SymbolType::toString(myType));
    return myValue.b;
  } 

  void BaseConstant::setchar(char c) { 
    if (myType!=SymbolType::CHAR_STYPE)
      THROW_LOGICEXCEPTION_MACRO("BaseConstant::setint typs is " + 
				 SymbolType::toString(myType));
    myValue.c=c;
  } 

  char BaseConstant::getchar()const { 
    if (myType!=SymbolType::CHAR_STYPE)
      THROW_LOGICEXCEPTION_MACRO("BaseConstant::getint typs is " + 
				 SymbolType::toString(myType));
    return myValue.c;
  } 

  void 
  BaseConstant::setFromString(const std::string& aValue) { 
    myOriginalStringRep=aValue;
    switch(myType) { 
    case SymbolType::INTEGER_STYPE : 
      setint(StringConversions::convertToInt(aValue.c_str()));
      break;
    case SymbolType::REAL_STYPE : 
      setdouble(StringConversions::convertToDouble(aValue.c_str()));
      break;
    case SymbolType::BOOL_STYPE : 
      { 
	if (aValue==ourBooleanTrueString) 
	  setbool(true);
	else if (aValue==ourBooleanFalseString)
	  setbool(false);
	else 
	  THROW_LOGICEXCEPTION_MACRO("BaseConstant::setFromString: boolean value expected to be " 
				     + ourBooleanTrueString + " or " + ourBooleanFalseString);
	break;
      }
    case SymbolType::STRING_STYPE : 
      break;
    case SymbolType::CHAR_STYPE : 
      { 
	if (aValue.size()!=1)
	  THROW_LOGICEXCEPTION_MACRO("BaseConstant::setFromString: char value expected to be a string of length 1");
	setchar(aValue[0]);
	break;
      }
    default: 
      THROW_LOGICEXCEPTION_MACRO("BaseConstant::setFromString: cannot handle " 
				 + SymbolType::toString(myType));
      break;
    } // end switch
  } 

  std::string
  BaseConstant::toString() const {
    std::ostringstream oss;
    switch(myType) { 
    case SymbolType::INTEGER_STYPE : 
      oss << getint();
      break;
    case SymbolType::REAL_STYPE : 
      oss << std::scientific << std::setprecision(20) << getdouble();
      break;
    case SymbolType::BOOL_STYPE : 
      if (myValue.b)
	oss << ourBooleanTrueString.c_str();
      else
	oss << ourBooleanFalseString.c_str();
      break;
    case SymbolType::STRING_STYPE : 
      oss << myOriginalStringRep.c_str();
      break;
    case SymbolType::CHAR_STYPE : 
      oss << getchar();
      break;
    default: 
      THROW_LOGICEXCEPTION_MACRO("BaseConstant::toString: cannot handle " 
				 + SymbolType::toString(myType));
      break;
    } // end switch
    return oss.str();
  } 

  SymbolType::SymbolType_E  
  BaseConstant::getType() const {
    return myType;
  }

} // end of namespace 
