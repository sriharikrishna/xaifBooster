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
#include <sstream>

#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/system/inc/Variable.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorSetDeriv.hpp"

using namespace xaifBooster;

namespace xaifBoosterDerivativePropagator { 

  const std::string DerivativePropagatorSetDeriv::ourXAIFName("xaif:SetDeriv");
  const std::string DerivativePropagatorSetDeriv::our_myTarget_XAIFName("xaif:Tgt");
  const std::string DerivativePropagatorSetDeriv::our_mySource_XAIFName("xaif:Src");

  DerivativePropagatorSetDeriv::DerivativePropagatorSetDeriv(const Variable& theTarget,
							     const Variable& theSource) :
    DerivativePropagatorEntry(theTarget) { 
    theSource.copyMyselfInto(mySource);
    mySource.setId(1);
    mySource.setDerivFlag();
  }

  void
  DerivativePropagatorSetDeriv::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent()
       << "<"
       << ourXAIFName.c_str() 
       << ">" 
       << std::endl; 
    printMemberXMLHierarchy(myTarget,our_myTarget_XAIFName,os);
    printMemberXMLHierarchy(mySource,our_mySource_XAIFName,os);
    os << pm.indent() 
       << "</"
       << ourXAIFName.c_str()
       << ">" 
       << std::endl;
    pm.releaseInstance();
  } // end of DerivativePropagatorSetDeriv::printXMLHierarchy

  void
  DerivativePropagatorSetDeriv::printMemberXMLHierarchy(const Variable& theVariable,
							const std::string& aName,
							std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent()
       << "<"
       << aName.c_str() 
       << " "
       << Variable::our_myDerivFlag_XAIFName.c_str()
       << "=\""
       << theVariable.getDerivFlag()
       << "\""
       << ">" 
       << std::endl; 
    theVariable.printXMLHierarchy(os);
    os << pm.indent() 
       << "</"
       << aName.c_str()
       << ">" 
       << std::endl;
    pm.releaseInstance();
  } // end of DerivativePropagatorSetDeriv::printXMLHierarchy

  std::string DerivativePropagatorSetDeriv::debug () const { 
    std::ostringstream out;
    out << "DerivativePropagatorSetDeriv[" << this 
	<< DerivativePropagatorEntry::debug().c_str()
	<< ", mySource=" << mySource.debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  } // end of DerivativePropagatorSetDeriv::debug

  void  DerivativePropagatorSetDeriv::getFactors(FactorList& theFactorList) const { 
    Factor aFactor;
    aFactor.setUnit();
    aFactor.setSource(mySource);
    theFactorList.push_back(aFactor);
  } 

} // end of namespace 
