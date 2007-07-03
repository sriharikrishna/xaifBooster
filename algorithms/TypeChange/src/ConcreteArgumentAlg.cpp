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

#include "xaifBooster/system/inc/ConcreteArgument.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"

#include "xaifBooster/algorithms/TypeChange/inc/ConcreteArgumentAlg.hpp"

namespace xaifBoosterTypeChange {  

  ConcreteArgumentAlg::ConcreteArgumentAlg(const ConcreteArgument& theContainingConcreteArgument) : 
    ConcreteArgumentAlgBase(theContainingConcreteArgument),
    myReplacement_p(0),
    myPriorConversionConcreteArgument_p(0),
    myPostConversionConcreteArgument_p(0) { 
  }

  ConcreteArgumentAlg::~ConcreteArgumentAlg() { 
    if (myReplacement_p)
      delete myReplacement_p;
  } 

  void ConcreteArgumentAlg::printXMLHierarchy(std::ostream& os) const { 
    if (myReplacement_p)
      myReplacement_p->printXMLHierarchyImpl(os);
    else
      getContaining().printXMLHierarchyImpl(os);
  }

  std::string 
  ConcreteArgumentAlg::debug() const { 
    std::ostringstream out;
    out << "xaifBoosterTypeChange::ConcreteArgumentAlg["
	<< this 
	<< ","
 	<< ConcreteArgumentAlgBase::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  }

  void ConcreteArgumentAlg::makeReplacement(const Variable& aVariable) { 
    if(myReplacement_p)
      THROW_LOGICEXCEPTION_MACRO("ConcreteArgumentAlg::makeReplacement : already have a replacement");
    myReplacement_p=new ConcreteArgument(getContaining().getPosition());
    aVariable.copyMyselfInto(myReplacement_p->getArgument().getVariable());
  }
  
  bool ConcreteArgumentAlg::hasReplacement() const { 
    return (myReplacement_p)?true:false;
  } 
  
  ConcreteArgument& ConcreteArgumentAlg::getReplacement() { 
    if(!myReplacement_p)
      THROW_LOGICEXCEPTION_MACRO("ConcreteArgumentAlg::getReplacement : has no replacement");
    return *myReplacement_p;
  } 

  bool ConcreteArgumentAlg::hasPriorConversionConcreteArgument() const { 
    return (myPriorConversionConcreteArgument_p)?true:false;
  } 

  ConcreteArgument& ConcreteArgumentAlg::getPriorConversionConcreteArgument() { 
    if(!myPriorConversionConcreteArgument_p)
      THROW_LOGICEXCEPTION_MACRO("ConcreteArgumentAlg::getPriorConversionConcreteArgument:  nothing there ");
    return *myPriorConversionConcreteArgument_p;
  } 

  void ConcreteArgumentAlg::setPriorConversionConcreteArgument(ConcreteArgument& aConcreteArgument) { 
    if(myPriorConversionConcreteArgument_p)
      THROW_LOGICEXCEPTION_MACRO("ConcreteArgumentAlg::setPriorConversionConcreteArgument: already set");
    myPriorConversionConcreteArgument_p=&aConcreteArgument;
  } 
  
  bool ConcreteArgumentAlg::hasPostConversionConcreteArgument() const { 
    return (myPostConversionConcreteArgument_p)?true:false;
  } 

  ConcreteArgument& ConcreteArgumentAlg::getPostConversionConcreteArgument() { 
    if(!myPostConversionConcreteArgument_p)
      THROW_LOGICEXCEPTION_MACRO("ConcreteArgumentAlg::getPostConversionConcreteArgument:  nothing there ");
    return *myPostConversionConcreteArgument_p;
  } 

  void ConcreteArgumentAlg::setPostConversionConcreteArgument(ConcreteArgument& aConcreteArgument) { 
    if(myPostConversionConcreteArgument_p)
      THROW_LOGICEXCEPTION_MACRO("ConcreteArgumentAlg::setPostConversionConcreteArgument: already set");
    myPostConversionConcreteArgument_p=&aConcreteArgument;
  } 
  
} // end of namespace 
