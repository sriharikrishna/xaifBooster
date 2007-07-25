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


#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include "xaifBooster/system/inc/SymbolReference.hpp"
#include "xaifBooster/algorithms/TypeChange/inc/SignaturePattern.hpp"

namespace xaifBoosterTypeChange { 

  const unsigned short SignaturePattern::ourMaxParameterCount;

  SignaturePattern::SignaturePattern() : mySize(-1) {
  } 

  void SignaturePattern::trackAt(unsigned short aPosition) { 
    if (aPosition<1 || aPosition>getSize())
      THROW_LOGICEXCEPTION_MACRO("SignaturePattern::setActive: aPosition "
				 << aPosition
				 << " is out of range [1,"
				 << getSize()
				 << "]");
    myPattern.set(aPosition-1);
  }
  
  void SignaturePattern::setSize(unsigned short aSize) { 
    if (aSize>ourMaxParameterCount)
      THROW_LOGICEXCEPTION_MACRO("SignaturePattern::setSize: "
				 << aSize
				 << " is out of range [0,"
				 << ourMaxParameterCount
				 << "]");
    mySize=aSize;
  }
  

  unsigned short SignaturePattern::getSize()const { 
    if (mySize<0)
      THROW_LOGICEXCEPTION_MACRO("SignaturePattern::getSize: not set ");
    return mySize;
  }

  bool SignaturePattern::initialized() const { 
    return (mySize>=0);
  } 
  
  bool SignaturePattern::operator == (const SignaturePattern& anotherPattern) const { 
    return (myPattern==anotherPattern.myPattern);
  } 
  
  bool SignaturePattern::operator != (const SignaturePattern& anotherPattern) const{ 
    return (myPattern!=anotherPattern.myPattern);
  } 

  std::string SignaturePattern::discrepancyPositions(const SignaturePattern& anotherPattern) const { 
    if (getSize()!=anotherPattern.getSize()) 
      THROW_LOGICEXCEPTION_MACRO("SignaturePattern::discrepancyPositions: size mismatch ");
    std::ostringstream out;
    for (unsigned short i=0; i<mySize-1; ++i) { 
      if (myPattern.test(i)!=anotherPattern.myPattern.test(i)) 
	out << i+1 << " ";
    }
    return out.str();
  } 
  
  bool SignaturePattern::isTracked(unsigned short aPosition) const { 
    if (aPosition<1 || aPosition>getSize())
      THROW_LOGICEXCEPTION_MACRO("SignaturePattern::isTracked: aPosition "
				 << aPosition
				 << " is out of range [1,"
				 << getSize()
				 << "]");
    return myPattern.test(aPosition-1);
  } 

}

