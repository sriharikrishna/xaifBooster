#ifndef _DUUDMAPENTRY_INCLUDE_
#define _DUUDMAPENTRY_INCLUDE_
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

#include <string>
#include <list>

#include "xaifBooster/utils/inc/XMLPrintable.hpp"

#include "xaifBooster/system/inc/DuUdMapDefinitionResult.hpp"
#include "xaifBooster/system/inc/DuUdMapUseResult.hpp"

namespace xaifBooster{ 

  /**
   * contains the list of statement IDs
   */
  class DuUdMapEntry : public XMLPrintable{ 
    
  public: 
  
    DuUdMapEntry(unsigned int theKey); 
 
    ~DuUdMapEntry();

    std::string debug() const ; 

    static const std::string ourXAIFName;

    static const std::string our_myKey_XAIFName;

    static const std::string our_StatementId_XAIFName;

    static const std::string our_IdRef_XAIFName;

    void printXMLHierarchy(std::ostream& os) const; 

    const DuUdMapDefinitionResult::StatementIdList& getStatementIdList() const; 

    void appendToStatementIdList(const ObjectWithId::Id& anId);

    /** 
     * anIdList contains the Ids of all statements 
     * found in the scope of question so far
     * this applies only to UD chains and for this use 
     * we are looking for a definition
     * and we use statementId to distinguish 
     * loop carried dependencies
     */
    const DuUdMapDefinitionResult definition(const ObjectWithId::Id& statementId,
					     const DuUdMapDefinitionResult::StatementIdList& anIdList) const;

    /** 
     * idList contains the Ids of all statements (active and passive) 
     * in the scope of question so far
     * this applies only to DU chains and for this definition 
     * we are looking for uses
     * and we use statementId to distinguish 
     * loop carried dependencies
     */
    const DuUdMapUseResult use(const ObjectWithId::Id& statementId,
			       const DuUdMapUseResult::StatementIdLists& idLists) const;

    /** 
     * the name says it all
     * Note: sameDefinitionAs returning false does not 
     * imply the definitions are disjoint
     */
    bool sameDefinitionAs(const DuUdMapEntry& anotherEntry) const;

    /** 
     * the name says it all
     * Note: disjointDefinitionFrom returning false does not 
     * imply the definitions are the same
     */
    bool disjointDefinitionFrom(const DuUdMapEntry& anotherEntry) const;

  private:

    /**
     * keys start with 1
     * in XAIF schema the default is 0 
     * which refers to a dummy instance in the
     * DuUdMap
     */
    const unsigned int myKey;

    /**
     * no def
     */
    DuUdMapEntry();

    /**
     * no def
     */
    DuUdMapEntry(const DuUdMapEntry&);

    /**
     * no def
     */
    DuUdMapEntry operator=(const DuUdMapEntry&);

    DuUdMapDefinitionResult::StatementIdList myStatementIdList;
    
  }; // end of class DuUdMapEntry

} // end of namespace xaifBooster

#endif
