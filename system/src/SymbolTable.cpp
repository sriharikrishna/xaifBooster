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
#include "xaifBooster/system/inc/SymbolTable.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"
#include "xaifBooster/system/inc/ArrayAccess.hpp"
#include "xaifBooster/system/inc/Constant.hpp"

namespace xaifBooster { 

  const std::string SymbolTable::ourXAIFName("xaif:SymbolTable");
  
  SymbolTable::SymbolTable() { 
  } // end of SymbolTable::SymbolTable

  SymbolTable::~SymbolTable() { 
    for(HashTableSymbolP::InternalHashMapType::iterator myHashMap_iterator=
	  myHashTableSymbolP.getInternalHashMap().begin();
	myHashMap_iterator!=myHashTableSymbolP.getInternalHashMap().end();
	myHashMap_iterator++)
      delete((*myHashMap_iterator).second);
  }

  Symbol& 
  SymbolTable::addSymbol(const std::string& aName, 
			 const SymbolKind::SymbolKind_E& aKind,
			 const SymbolType::SymbolType_E& aType,
			 const SymbolShape::SymbolShape_E& aShape,
			 bool anActiveTypeFlag,
			 bool aTempFlag) { 
    if (myHashTableSymbolP.hasElement(aName)) 
      THROW_LOGICEXCEPTION_MACRO(debug().c_str() 
				 << "::addSymbol new" 
				 << Symbol(aName,
					   aKind,
					   aType,
					   aShape,
					   anActiveTypeFlag,
					   aTempFlag).debug().c_str() 
				 << " colliding with existing " 
				 << myHashTableSymbolP.getElement(aName)->debug().c_str());
    Symbol* theNewSymbol_p(new Symbol(aName,
				      aKind,
				      aType,
				      aShape,
				      anActiveTypeFlag,
				      aTempFlag));
    myHashTableSymbolP.addElement(aName,theNewSymbol_p);
    return *theNewSymbol_p;
  } // end of SymbolTable::addSymbol

  Symbol&  
  SymbolTable::addUniqueAuxSymbol(const SymbolKind::SymbolKind_E& aKind,
				  const SymbolType::SymbolType_E& aType,
				  const SymbolShape::SymbolShape_E& aShape,
				  bool anActiveTypeFlag) { 
    // use a unique name
    std::string aName(ConceptuallyStaticInstances::instance()->getNameCreator().makeName());
    Symbol& theSymbol(addSymbol(aName,
				aKind,
				aType,
				aShape,
				anActiveTypeFlag,
				true));
    theSymbol.setAnnotation("");
    return theSymbol; 
  } // end SymbolTable::addUniqueAuxSymbol()

  std::string SymbolTable::debug() const {
    std::ostringstream out;
    out << "SymbolTable[" << this 
	<< "," << myHashTableSymbolP.debug() 
	<< "]" << std::ends; 
    return out.str();
  } // end of SymbolTable::debug
  
  void SymbolTable::printXMLHierarchy(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<" 
       << ourXAIFName 
       << ">" 
       << std::endl; 
    for(HashTableSymbolP::InternalHashMapType::const_iterator myHashMap_iterator=
	  myHashTableSymbolP.getInternalHashMap().begin();
	myHashMap_iterator!=myHashTableSymbolP.getInternalHashMap().end();
	myHashMap_iterator++)
      (*myHashMap_iterator).second->printXMLHierarchy(os);       
    os << pm.indent() 
       << "</"
       << ourXAIFName
       << ">" << std::endl;
    pm.releaseInstance();
  } 

  const Symbol& SymbolTable::getSymbol(const std::string& aName) const { 
    return *(myHashTableSymbolP.getElement(aName));
  } 

  void SymbolTable::forcedPassivation() { 
    for(HashTableSymbolP::InternalHashMapType::iterator myHashMap_iterator=
	  myHashTableSymbolP.getInternalHashMap().begin();
	myHashMap_iterator!=myHashTableSymbolP.getInternalHashMap().end();
	myHashMap_iterator++)
      (*myHashMap_iterator).second->forcedPassivation();
  } 

  bool SymbolTable::hasElement(const Symbol& aSymbol) const { 
    for(HashTableSymbolP::InternalHashMapType::const_iterator myHashMap_iterator=
	  myHashTableSymbolP.getInternalHashMap().begin();
	myHashMap_iterator!=myHashTableSymbolP.getInternalHashMap().end();
	myHashMap_iterator++)
      if ((*myHashMap_iterator).second==&aSymbol)
	return true;
    return false;
  } 

  bool SymbolTable::hasSymbolWithPlainName(const std::string& aPlainName) const { 
    for(HashTableSymbolP::InternalHashMapType::const_iterator myHashMap_iterator=
	  myHashTableSymbolP.getInternalHashMap().begin();
	myHashMap_iterator!=myHashTableSymbolP.getInternalHashMap().end();
	myHashMap_iterator++) { 
      if ((*myHashMap_iterator).second->samePlainName(aPlainName)) 
	return true;
    }
    return false;
  } 

  const Symbol& SymbolTable::getSymbolWithPlainName(const std::string& aPlainName) const { 
    bool foundOne=false;
    const Symbol* aSymbol_p(0);
    for(HashTableSymbolP::InternalHashMapType::const_iterator myHashMap_iterator=
	  myHashTableSymbolP.getInternalHashMap().begin();
	myHashMap_iterator!=myHashTableSymbolP.getInternalHashMap().end();
	myHashMap_iterator++) { 
      if ((*myHashMap_iterator).second->samePlainName(aPlainName)) { 
	if (!foundOne) { 
	  foundOne=true;
	  aSymbol_p=(*myHashMap_iterator).second;
	}
	else { 
	  THROW_LOGICEXCEPTION_MACRO("SymbolTable::getSymbolWithPlainName: name "
				     << aPlainName.c_str()
				     << " has ambiguous matches "
				     << aSymbol_p->getId().c_str()
				     << " and " 
				     << (*myHashMap_iterator).second->getId());
	}
      }
    }
    if (!foundOne) 
      THROW_LOGICEXCEPTION_MACRO("SymbolTable::getSymbolWithPlainName: no symbol matching plain name "
				 << aPlainName.c_str());
    return *aSymbol_p;
  } 

} 
