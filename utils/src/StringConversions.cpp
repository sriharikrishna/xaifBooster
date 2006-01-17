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
#include <cerrno>
#include "xaifBooster/utils/inc/StringConversions.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"

namespace xaifBooster { 

  double StringConversions::convertToDouble(const std::string& aValue) { 
    double value;
    char *remainder=NULL;
    errno=0;
    value=strtod(aValue.c_str(),&remainder);
    if (errno) {
      THROW_LOGICEXCEPTION_MACRO("StringConversions::convertToDouble: "  
				 << "the string "
				 << "\"" << aValue.c_str() << "\" " 
				 << "cannot be converted to an double. "
				 << "The error returned by strtod() is: " 
				 << strerror(errno)); 
    } 
    return value;
  } 

  float StringConversions::convertToFloat(const std::string& aValue) { 
    float value;
    char *remainder=NULL;
    errno=0;
    value=strtof(aValue.c_str(),&remainder);
    if (errno) {
      THROW_LOGICEXCEPTION_MACRO("StringConversions::convertToFloat: "  
				 << "the string "
				 << "\"" << aValue.c_str() << "\" " 
				 << "cannot be converted to a float. "
				 << "The error returned by strtof() is: " 
				 << strerror(errno)); 
    } 
    return value;
  } 

  int StringConversions::convertToInt(const std::string& aValue) { 
    int value;
    char *remainder=NULL;
    errno=0;
    value=strtol(aValue.c_str(),&remainder,10);
    if (errno) {
      THROW_LOGICEXCEPTION_MACRO("StringConversions::convertToInt: "  
				 << "the string "
				 << "\"" << aValue.c_str() << "\" " 
				 << "cannot be converted to an int. "
				 << "The error returned by strtof() is: " 
				 << strerror(errno)); 
    } 
    return value;
  } 

  unsigned int StringConversions::convertToUInt(const std::string& aValue) { 
    int value;
    char *remainder=NULL;
    errno=0;
    value=strtoul(aValue.c_str(),&remainder,10);
    if (errno) {
      THROW_LOGICEXCEPTION_MACRO("StringConversions::convertToUInt: "  
				 << "the string "
				 << "\"" << aValue.c_str() << "\" " 
				 << "cannot be converted to an unsigned int. "
				 << "The error returned by strtof() is: " 
				 << strerror(errno)); 
    } 
    return value;
  } 

} // end of namespace xaifBooster
