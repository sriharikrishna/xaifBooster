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
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"

namespace xaifBooster { 
  
  ConceptuallyStaticInstances* ConceptuallyStaticInstances::ourInstance_p(0);

  ConceptuallyStaticInstances::ConceptuallyStaticInstances() : 
    myCallGraph_p(0),
    myPrintVersion(PrintVersion::VIRTUAL) { 
  }

  ConceptuallyStaticInstances::~ConceptuallyStaticInstances() {
    if (myCallGraph_p)
      delete myCallGraph_p;
  }


  ConceptuallyStaticInstances* 
  ConceptuallyStaticInstances::instance() { 
    if (!ourInstance_p)
      ourInstance_p=new ConceptuallyStaticInstances();
    return ourInstance_p;
  } 

  CallGraph& 
  ConceptuallyStaticInstances::getCallGraph() { 
    if (!myCallGraph_p)
      THROW_LOGICEXCEPTION_MACRO("ConceptuallyStaticInstances::getCallGraph: has not been created");
    return *myCallGraph_p;
  } 

  InlinableIntrinsicsCatalogue& 
  ConceptuallyStaticInstances::getInlinableIntrinsicsCatalogue() { 
    return myInlinableIntrinsicsCatalogue;
  }

  void ConceptuallyStaticInstances::createCallGraph(const std::string& aSchemaInstance,
						    const std::string& anXAIFInstance,
						    const std::string& aSchemaLocation,
						    const std::string& aPrefix) { 
    if (myCallGraph_p)
      THROW_LOGICEXCEPTION_MACRO("ConceptuallyStaticInstances::createCallGraph: already created");
    myCallGraph_p=new CallGraph(aSchemaInstance,
				anXAIFInstance,
				aSchemaLocation,
				aPrefix);
    myNameCreator.setBaseName(aPrefix+"Symbol");
  } 

  PrintVersion::PrintVersion_E 
  ConceptuallyStaticInstances::getPrintVersion() const { 
    return myPrintVersion;
  }

  void ConceptuallyStaticInstances::setPrintVersion(PrintVersion::PrintVersion_E aPrintVersion) { 
    myPrintVersion=aPrintVersion;
  }

  const NameCreator& ConceptuallyStaticInstances::getNameCreator() const { 
    return myNameCreator;
  }

} 

