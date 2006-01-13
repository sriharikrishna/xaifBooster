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
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/Symbol.hpp"
#include "xaifBooster/system/inc/Symbol.hpp"
#include "xaifBooster/system/inc/SymbolAlgFactory.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"

namespace xaifBooster { 

  const std::string Symbol::ourXAIFName("xaif:Symbol");

  const std::string Symbol::our_myId_XAIFName("symbol_id");

  const std::string Symbol::our_myActiveTypeFlag_XAIFName("active");

  const std::string Symbol::our_myTempFlag_XAIFName("temp");

  Symbol::Symbol(const std::string& aName, 
		 const SymbolKind::SymbolKind_E& aKind,
		 const SymbolType::SymbolType_E& aType,
		 const SymbolShape::SymbolShape_E& aShape,
		 bool anActiveTypeFlag,
		 bool aTempFlag,
		 bool makeAlgorithm) : 
    myKind(aKind),
    myType(aType),
    myShape(aShape),
    myActiveTypeFlag(anActiveTypeFlag),
    myTempFlag(aTempFlag),
    mySymbolAlgBase_p(0) {
    setId(aName);
    if (makeAlgorithm)
      mySymbolAlgBase_p=SymbolAlgFactory::instance()->makeNewAlg(*this);
  }

  Symbol::~Symbol() {
    if (mySymbolAlgBase_p) delete mySymbolAlgBase_p;
  }

  void Symbol::printXMLHierarchy(std::ostream& os) const {
    if (mySymbolAlgBase_p
	&& 
	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY)
      getSymbolAlgBase().printXMLHierarchy(os);
    else
      printXMLHierarchyImpl(os);
  } // end of Symbol::printXMLHierarchy


  void
  Symbol::printXMLHierarchyImpl(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str() 
       << " " 
       << our_myId_XAIFName.c_str() 
       << "=\"" 
       << getId().c_str()
       << "\" " 
       << SymbolKind::our_attribute_XAIFName.c_str() 
       << "=\""
       << SymbolKind::toString(myKind).c_str()
       << "\" " 
       << SymbolType::our_attribute_XAIFName.c_str() 
       << "=\""
       << SymbolType::toString(myType).c_str()
       << "\" " 
       << SymbolShape::our_attribute_XAIFName.c_str() 
       << "=\""
       << SymbolShape::toString(myShape).c_str()
       << "\" " 
       << ObjectWithAnnotation::our_myAnnotation_XAIFName.c_str() 
       << "=\""
       << getAnnotation().c_str()
       << "\" " 
       << our_myActiveTypeFlag_XAIFName.c_str() 
       << "=\""
       << myActiveTypeFlag
       << "\" " 
       << our_myTempFlag_XAIFName.c_str() 
       << "=\""
       << myTempFlag
       << "\">" 
       << std::endl; 
    for (DimensionBoundsPList::const_iterator li=myDimensionBoundsPList.begin();
	 li!=myDimensionBoundsPList.end();
	 ++li)
      (*li)->printXMLHierarchy(os);
    os << pm.indent() 
       << "</"
       << ourXAIFName.c_str() 
       << ">" 
       << std::endl; 
    pm.releaseInstance();
  } // end 
  
  std::string Symbol::debug () const { 
    std::ostringstream out;
    out << "Symbol[" << this 
	<< ",myName=" << getId() 
	<< ",myKind=" << SymbolKind::toString(myKind) 
	<< ",myType=" << SymbolType::toString(myType) 
	<< ",myShape=" << SymbolShape::toString(myShape)
	<< ",myActiveTypeFlag=" << myActiveTypeFlag
	<< ",myTempFlag=" << myTempFlag
	<< "]" << std::ends;  
    return out.str();
  } // end of Symbol::debug

  const SymbolKind::SymbolKind_E& Symbol::getSymbolKind() const { 
    return myKind; 
  }

  const SymbolType::SymbolType_E& Symbol::getSymbolType() const { 
    return myType; 
  }

  const SymbolShape::SymbolShape_E& Symbol::getSymbolShape() const {
    return myShape;
  }

  bool Symbol::getActiveTypeFlag() const { 
    return myActiveTypeFlag;
  }

  void Symbol::addDimensionBounds(int aLower, 
				  int anUpper) { 
    myDimensionBoundsPList.push_back(new DimensionBounds(aLower,anUpper));
  }

  const Symbol::DimensionBoundsPList& Symbol::getDimensionBoundsPList() const { 
    if (myShape==SymbolShape::SCALAR)
      THROW_LOGICEXCEPTION_MACRO("Symbol::getDimensionBoundsPList: no dimensions for scalar symbols");
    return myDimensionBoundsPList;
  } 

  bool Symbol::hasDimensionBounds()const { 
    return ((myShape!=SymbolShape::SCALAR) && !myDimensionBoundsPList.empty() ? true:false);
  } 

  SymbolAlgBase&
  Symbol::getSymbolAlgBase() {
    if (!mySymbolAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("Symbol::getSymbolAlgBase: not set");
    return *mySymbolAlgBase_p;
  }
                                                                                
  const SymbolAlgBase&
  Symbol::getSymbolAlgBase() const {
    if (!mySymbolAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("Symbol::getSymbolAlgBase: not set");
    return *mySymbolAlgBase_p;
  }
                                                                                
  void Symbol::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
    getSymbolAlgBase().genericTraversal(anAction_c);
  }

} // end of namespace xaifBooster 
