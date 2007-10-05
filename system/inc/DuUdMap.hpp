#ifndef _DUUDMAP_INCLUDE_
#define _DUUDMAP_INCLUDE_
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

#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/system/inc/StatementIdSetMap.hpp"
#include "xaifBooster/system/inc/DuUdMapDefinitionResult.hpp"
#include "xaifBooster/system/inc/DuUdMapUseResult.hpp"

namespace xaifBooster { 


  /**
   * map to hold DuUdMapEntry information 
   */
  class DuUdMap : public StatementIdSetMap ,
		  public XMLPrintable {

  public:
    
    static const std::string ourXAIFName;

    DuUdMap(){};

    ~DuUdMap(){};

    void printXMLHierarchy(std::ostream& os) const; 

    /** 
     * aKey is the key of a right-hand-side variable
     * which is to be checked for definitions in
     * statements listed in anIdList
     * and we use statementId to distinguish 
     * loop carried dependencies
     */
    const DuUdMapDefinitionResult definition(const StatementIdSetMapKey& aKey,
					     const ObjectWithId::Id& statementId,
					     const StatementIdList& anIdList) const;

    /** 
     * aKey is the key of a left-hand-side variable
     * which is to be checked for uses in
     * statements listed in the idLists
     * and we use statementId to distinguish 
     * loop carried dependencies
     */
    const DuUdMapUseResult use(const StatementIdSetMapKey& aKey,
			       const ObjectWithId::Id& statementId,
			       const DuUdMapUseResult::StatementIdLists& idLists) const;
    
    /** 
     * this returns true if the use-def chains for both 
     * keys are provably identical and false otherwise;
     * the keys have to come from the same ControlFlowGraph
     * as we don't require global uniqueness of statement ids
     * Note: sameDefinition returning false does not 
     * imply the definitions are disjoint
     */
    bool sameDefinition(const StatementIdSetMapKey& aKey,
			const StatementIdSetMapKey& anotherKey) const;


    /** 
     * this returns true if the use-def chains for both 
     * keys are provably disjoint and false otherwise;
     * the keys have to come from the same ControlFlowGraph
     * as we don't require global uniqueness of statement ids
     * Note: disjointDefinition returning false does not 
     * imply the definitions are the same
     */
    bool disjointDefinition(const StatementIdSetMapKey& aKey,
			    const StatementIdSetMapKey& anotherKey) const;

  private: 

    /**
     * no def
     */
    DuUdMap(const DuUdMap&);

    /**
     * no def
     */
    DuUdMap operator=(const DuUdMap&);

  };

} 
                                                                     
#endif
