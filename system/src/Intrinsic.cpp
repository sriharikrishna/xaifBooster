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
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/Intrinsic.hpp"
#include "xaifBooster/system/inc/IntrinsicAlgFactory.hpp"

namespace xaifBooster { 

  const std::string Intrinsic::ourXAIFName("xaif:Intrinsic");
  const std::string Intrinsic::our_myName_XAIFName("name");
  const std::string Intrinsic::our_myId_XAIFName("vertex_id");

  Intrinsic::Intrinsic(const std::string& aName, bool makeAlgorithm) :
    myName(aName) {
    myExpressionVertexAlgBase_p=0;
    if (makeAlgorithm)
      myExpressionVertexAlgBase_p=IntrinsicAlgFactory::instance()->makeNewAlg(*this);
  }

  ExpressionVertex& Intrinsic::createCopyOfMyself(bool withAlgorithm) const { 
    Intrinsic* aNewIntrinsic_p=new Intrinsic(myName,withAlgorithm);
    aNewIntrinsic_p->setId(getId());
    if (annotationIsSet())
      aNewIntrinsic_p->setAnnotation(getAnnotation());
    return *aNewIntrinsic_p;
  } 

  std::string Intrinsic::equivalenceSignature() const { 
    std::ostringstream oss;
    oss << "Intrinsic::" << myName.c_str() << std::ends;
    return std::string(oss.str());
  }

  std::string Intrinsic::debug() const { 
    std::ostringstream oss;
    oss << "Intrinsic[" << this << "," 
	<< ExpressionVertex::debug().c_str()
	<< "myName=" << myName.c_str()
	<< "]" << std::ends;
    return std::string(oss.str());
  }

  const InlinableIntrinsicsCatalogueItem&
  Intrinsic::getInlinableIntrinsicsCatalogueItem() const { 
    return ConceptuallyStaticInstances::instance()->getInlinableIntrinsicsCatalogue().getElement(myName);
  } 

  void
  Intrinsic::printXMLHierarchy(std::ostream& os) const {
    if (myExpressionVertexAlgBase_p
	&& 
	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY)
      getIntrinsicAlgBase().printXMLHierarchy(os);
    else
      printXMLHierarchyImpl(os);
  } // end of printXMLHierarchy

  void Intrinsic::printXMLHierarchyImpl(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str() 
       << " " 
       << our_myId_XAIFName.c_str() 
       << "=\"" 
       << getId().c_str()
       << "\" ";
    if (annotationIsSet())
      os << ObjectWithAnnotation::our_myAnnotation_XAIFName.c_str()
	 << "=\""
	 << getAnnotation().c_str()
	 << "\" "; 
    os << our_myName_XAIFName.c_str()
       << "=\""
       << myName.c_str()
       << "\""
       << "/>" 
       << std::endl; 
    pm.releaseInstance();
  } 

  IntrinsicAlgBase&
  Intrinsic::getIntrinsicAlgBase() const {
    if (!myExpressionVertexAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("Intrinsic::getIntrinsicAlgBase: not set");
    return dynamic_cast<IntrinsicAlgBase&>(*myExpressionVertexAlgBase_p);
  } 

  void Intrinsic::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
    getIntrinsicAlgBase().genericTraversal(anAction_c);
  } 

  const std::string& Intrinsic::getName() const { 
    return myName;
  } 

  bool Intrinsic::isNonSmooth() const { 
    return getInlinableIntrinsicsCatalogueItem().isNonSmooth();
  }

  bool Intrinsic::isIntrinsic() const {
    return true;
  }

} // end of namespace 
