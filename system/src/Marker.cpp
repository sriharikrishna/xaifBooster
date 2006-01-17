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
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/Marker.hpp"
#include "xaifBooster/system/inc/MarkerAlgFactory.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"

namespace xaifBooster { 

  const std::string Marker::ourXAIFName("xaif:Marker");
  const std::string Marker::our_myId_XAIFName("statement_id");
  const std::string Marker::our_myAnnotation_XAIFName("annotation");

  Marker::Marker(bool makeAlgorithm) : myAnnotationFlag(false) { 
    if (makeAlgorithm)
      myBasicBlockElementAlgBase_p=MarkerAlgFactory::instance()->makeNewAlg(*this); 
  } // end of Marker::Marker

  Marker::~Marker() { 
  } 

  MarkerAlgBase& 
  Marker::getMarkerAlgBase() const { 
    if (!myBasicBlockElementAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("Marker::getMarkerAlgBase: not set");
    return dynamic_cast<MarkerAlgBase&>(*myBasicBlockElementAlgBase_p);
  }

  std::string Marker::debug () const { 
    std::ostringstream out;
    out << "Marker[" 
	<< this 
	<< BasicBlockElement::debug().c_str()
	<< ",myAnnotation=" << myAnnotation.c_str() 
	<< ",myAnnotationFlag=" << myAnnotationFlag
	<< "]" << std::ends;  
    return out.str();
  } // end of Marker::debug

  void
  Marker::setAnnotation(const std::string& anAnnotation) { 
    if (myAnnotationFlag)
      THROW_LOGICEXCEPTION_MACRO("Marker::setAnnotation can't reset myAnnotation");
    myAnnotationFlag=true;
    myAnnotation=anAnnotation;
  } // end of Marker::setAnnotation

  const std::string&
  Marker::getAnnotation() const { 
    if (!myAnnotationFlag)
      THROW_LOGICEXCEPTION_MACRO("Marker::getAnnotation myAnnotation not set");
    return myAnnotation;
  } // end of Marker::getAnnotation

  void Marker::printXMLHierarchy(std::ostream& os) const {
    if (myBasicBlockElementAlgBase_p
	&& 
	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY)
      getMarkerAlgBase().printXMLHierarchy(os);
    else 
      printXMLHierarchyImpl(os);
  }

  void
  Marker::printXMLHierarchyImpl(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent()
       << "<"
       << ourXAIFName
       << " "
       << our_myId_XAIFName
       << "=\"" 
       << getId() 
       << "\" " 
       << our_myAnnotation_XAIFName
       << "=\"" 
       << getAnnotation() 
       << "\"/>" 
       << std::endl;
    pm.releaseInstance(); 
  } // end of Marker::printXMLHierarchyImpl

} 
