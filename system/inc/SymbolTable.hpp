#ifndef _SYMBOLTABLE_INCLUDE_
#define _SYMBOLTABLE_INCLUDE_
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

#include "xaifBooster/utils/inc/HashTable.hpp"
#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/utils/inc/NameCreator.hpp"
#include "xaifBooster/system/inc/Symbol.hpp"

namespace xaifBooster { 
  
  class Variable;

  class SymbolTable : public XMLPrintable {
  public:
    
    SymbolTable();

    ~SymbolTable();

    /**
     * adds the symbol to the table, 
     */
    Symbol&  addSymbol(const std::string& aName, 
		       const SymbolKind::SymbolKind_E& aKind,
		       const SymbolType::SymbolType_E& aType,
		       const SymbolShape::SymbolShape_E& aShape,
		       bool anActiveTypeFlag,
		       bool aTempFlag);

    Symbol&  addUniqueAuxSymbol(const SymbolKind::SymbolKind_E& aKind,
				const SymbolType::SymbolType_E& aType,
				const SymbolShape::SymbolShape_E& aShape,
				bool anActiveTypeFlag);

    Symbol& addUniqueSymbol(const NameCreator& aNameCreator,
                            const SymbolKind::SymbolKind_E& aKind,
                            const SymbolType::SymbolType_E& aType,
                            const SymbolShape::SymbolShape_E& aShape,
                            bool anActiveTypeFlag);

    const Symbol& getSymbol(const std::string& aName) const;

    std::string debug() const ; 

    void printXMLHierarchy(std::ostream& os) const; 

    /**
     * name as specified in XAIF schema
     */
    static const std::string ourXAIFName;

    /** 
     * iterate through all Symbols 
     * to find some requiring forced passivation
     */
    void forcedPassivation();

    /** 
     * this tests Symbol instance identity
     * it does NOT test data equivalence
     */
    bool hasElement(const Symbol& aSymbol) const; 
    
    /** 
     * tries to find a matching symbol disregarding fron-end decorations
     */
    bool hasSymbolWithPlainName(const std::string& aPlainName) const; 

    const Symbol&  getSymbolWithPlainName(const std::string& aPlainName) const; 
    
  private: 
    
    typedef HashTable<Symbol*> HashTableSymbolP;

    HashTableSymbolP myHashTableSymbolP;

  }; // end of class SymbolTable

} // end of namespace 
                                                                     
#endif
