#ifndef _LOGICEXCEPTION_INCLUDE_
#define _LOGICEXCEPTION_INCLUDE_
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
#include "xaifBooster/utils/inc/BaseException.hpp"

namespace xaifBooster { 

  /** 
   * class to be used for any generic exception
   * we expect complete failure upon any such exception
   * Exceptions that point to non-fatal problem 
   * should get their own type to allow selective 
   * handling by the calling environment
   */
  class LogicException : public BaseException { 

  public:

    /** 
     * param what should be one line, 
     * used in THROW_LOGICEXCEPTION_MACRO
     */
    LogicException(std::string aFileName,
		   int aLineNumber,
		   std::string what);
    ~LogicException(){};
  }; // end of class LogicException 
  
  /**
   * use of preprocessor defined __FILE__ and __LINE__ requires 
   * use of a macro. We have to define a strange name 
   * for local variables to avoid accidental name matching - 
   * the niceties of macros!
   * Note the enclosing {} allowing for 
   * if (...) 
   *   THROW_LOGICEXCEPTION_MACRO(...);
   * without extra brackets but the compiler will complain 
   * about 
   * if (...) { 
   *   THROW_LOGICEXCEPTION_MACRO(...);
   * } 
   * because it doesn't know what to do with the extra ';' in the end;
   * make your choice.
   * the  argument is an argument to an 
   * ostream << operator.
   */
#ifndef THROW_LOGICEXCEPTION_MACRO
#define THROW_LOGICEXCEPTION_MACRO(StreamArgs) \
   { \
     std::ostringstream aLoNgAnDwEiRdLoCaLnAmeFoRtHiSmAcRoOnLy; \
     aLoNgAnDwEiRdLoCaLnAmeFoRtHiSmAcRoOnLy << StreamArgs << std::ends; \
     throw LogicException(__FILE__,__LINE__,aLoNgAnDwEiRdLoCaLnAmeFoRtHiSmAcRoOnLy.str()); \
   }
#else
#error macro name for THROW_LOGICEXCEPTION_MACRO already in use
#endif

} // end of namespace xaifBooster
                                                                     
#endif
