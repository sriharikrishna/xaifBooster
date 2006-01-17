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
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/ArgumentSymbolReference.hpp"
#include "xaifBooster/system/inc/ArgumentSymbolReferenceAlgFactory.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"

namespace xaifBooster { 

  const std::string ArgumentSymbolReference::ourXAIFName("xaif:ArgumentSymbolReference");
  const std::string ArgumentSymbolReference::our_myPosition_XAIFName("position");
  const std::string ArgumentSymbolReference::our_symbolId_XAIFName("symbol_id");
  const std::string ArgumentSymbolReference::our_scopeId_XAIFName("scope_id");
  const std::string ArgumentSymbolReference::our_myIntent_XAIFName("intent");

  ArgumentSymbolReference::ArgumentSymbolReference (const Symbol& theSymbol,
						    const Scope& theScope,
						    unsigned int thePosition,
						    IntentType::IntentType_E theIntent,
						    bool makeAlgorithm) :
    SymbolReference(theSymbol,theScope),
    myPosition(thePosition),
    myIntent(theIntent) {
    if (makeAlgorithm)
      myArgumentSymbolReferenceAlgBase_p=
	ArgumentSymbolReferenceAlgFactory::instance()->makeNewAlg(*this); 
  }

  ArgumentSymbolReference::~ArgumentSymbolReference() {
    if (myArgumentSymbolReferenceAlgBase_p)
      delete myArgumentSymbolReferenceAlgBase_p;
  } 

  ArgumentSymbolReferenceAlgBase& 
  ArgumentSymbolReference::getArgumentSymbolReferenceAlgBase() const { 
    if (!myArgumentSymbolReferenceAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("ArgumentSymbolReference::getArgumentSymbolReferenceAlgBase: not set");
    return *myArgumentSymbolReferenceAlgBase_p;
  }

  void
  ArgumentSymbolReference::printXMLHierarchy(std::ostream& os) const { 
    if (myArgumentSymbolReferenceAlgBase_p
	&& 
	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY)
      getArgumentSymbolReferenceAlgBase().printXMLHierarchy(os);
    else 
      printXMLHierarchyImpl(os);
  }

  void ArgumentSymbolReference::printXMLHierarchyImpl(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str() 
       << " "
       << our_myPosition_XAIFName.c_str()
       << "=\""
       << myPosition
       << "\" " 
       << our_symbolId_XAIFName.c_str()
       << "=\"" 
       << mySymbol_r.getId().c_str()
       << "\" " 
       << our_scopeId_XAIFName.c_str() 
       << "=\"" 
       << myScope_r.getId().c_str()
       << "\" " 
       << ObjectWithAnnotation::our_myAnnotation_XAIFName.c_str() 
       << "=\""
       << getAnnotation().c_str()
       << "\" " 
       << our_myIntent_XAIFName.c_str() 
       << "=\"" 
       << IntentType::toString(myIntent).c_str()
       << "\"/>" 
       << std::endl; 
    pm.releaseInstance();
  } // end if ArgumentSymbolReference::printXMLHierarchy
  
  std::string ArgumentSymbolReference::debug () const { 
    std::ostringstream out;
    out << "ArgumentSymbolReference[" 
	<< this 
	<< ","
	<< "myArgumentSymbolReferenceAlgBase_p"
	<< "="
	<< myArgumentSymbolReferenceAlgBase_p
	<< "]" << std::ends;  
    return out.str();
  } // end of ArgumentSymbolReference::debug

  unsigned int ArgumentSymbolReference::getPosition() const { 
    return myPosition;
  } 
    
  IntentType::IntentType_E ArgumentSymbolReference::getIntent() const { 
    return myIntent;
  } 

  void ArgumentSymbolReference::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
    getArgumentSymbolReferenceAlgBase().genericTraversal(anAction_c);
  } 


} // end of namespace xaifBooster 
