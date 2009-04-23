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

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorEntry.hpp"

using namespace xaifBooster;

namespace xaifBoosterDerivativePropagator { 

  void DerivativePropagatorEntry::Factor::setZero() { 
    if (myFactorKind!=NOT_SET)
      THROW_LOGICEXCEPTION_MACRO("DerivativePropagatorEntry::Factor::setZero: already set");
    myFactorKind=ZERO_FACTOR;
  }  

  void DerivativePropagatorEntry::Factor::setUnit() { 
    if (myFactorKind!=NOT_SET)
      THROW_LOGICEXCEPTION_MACRO("DerivativePropagatorEntry::Factor::setUnit: already set");
    myFactorKind=UNIT_FACTOR;
  }  

  void DerivativePropagatorEntry::Factor::setNegativeUnit() {
    if (myFactorKind != NOT_SET)
      THROW_LOGICEXCEPTION_MACRO("DerivativePropagatorEntry::Factor::setNegativeUnit: already set");
    myFactorKind = NEGATIVE_UNIT_FACTOR;
  } // end DerivativePropagatorEntry::Factor::setNegativeUnit()

  void DerivativePropagatorEntry::Factor::setConstant(const Constant& theConstant) { 
    if (myFactorKind!=NOT_SET)
      THROW_LOGICEXCEPTION_MACRO("DerivativePropagatorEntry::Factor::setConstant: already set");
    myFactorKind=CONSTANT_FACTOR;
    myFactor.myConstant_p=&theConstant;
  }  

  const Constant& DerivativePropagatorEntry::Factor::getConstant() const { 
    if (myFactorKind!=CONSTANT_FACTOR)
      THROW_LOGICEXCEPTION_MACRO("DerivativePropagatorEntry::Factor::getConstant: not CONSTANT_FACTOR");
    return *myFactor.myConstant_p;
  }  

  void DerivativePropagatorEntry::Factor::setVariable(const Variable& theVariable) { 
    if (myFactorKind!=NOT_SET)
      THROW_LOGICEXCEPTION_MACRO("DerivativePropagatorEntry::Factor::setVariable: already set");
    myFactorKind=VARIABLE_FACTOR;
    myFactor.myVariable_p=&theVariable;
  }  

  const Variable& DerivativePropagatorEntry::Factor::getVariable() const { 
    if (myFactorKind!=VARIABLE_FACTOR)
      THROW_LOGICEXCEPTION_MACRO("DerivativePropagatorEntry::Factor::getVariable: not VARIABLE_FACTOR");
    return *myFactor.myVariable_p;
  }  

  DerivativePropagatorEntry::Factor::FactorKind_E 
  DerivativePropagatorEntry::Factor::getKind() const { 
    return myFactorKind;
  }

  void DerivativePropagatorEntry::Factor::setSource(const Variable& theVariable) { 
    if (mySource_p)
      THROW_LOGICEXCEPTION_MACRO("DerivativePropagatorEntry::Factor::setSource: already set");
    mySource_p=&theVariable;
  }  

  const Variable& DerivativePropagatorEntry::Factor::getSource() const { 
    if (!mySource_p)
      THROW_LOGICEXCEPTION_MACRO("DerivativePropagatorEntry::Factor::getSource: not set");
    return *mySource_p;
  }  

  DerivativePropagatorEntry::DerivativePropagatorEntry(const Variable& theTarget) {
    theTarget.copyMyselfInto(myTarget);
    myTarget.setId(1);
    myTarget.setDerivFlag();
  }  

  const Variable& DerivativePropagatorEntry::getTarget() const { 
    return myTarget;
  }  

  std::string DerivativePropagatorEntry::debug () const { 
    std::ostringstream out;
    out << "DerivativePropagatorEntry[" << this 
	<< ", myTarget=" << myTarget.debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  } 

  bool
  DerivativePropagatorEntry::hasExpression(const Expression& anExpression) const {
    return myTarget.hasExpression(anExpression);
  } // end DerivativePropagatorEntry::hasExpression()

} // end namespace xaifBoosterDerivativePropagator

