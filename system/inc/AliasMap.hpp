#ifndef _ALIASMAP_INCLUDE_
#define _ALIASMAP_INCLUDE_
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

#include <vector>
#include <list>
#include "xaifBooster/utils/inc/XMLPrintable.hpp"

namespace xaifBooster { 

  class AliasMapEntry;
  class AliasMapKey;


  /**
   * map to hold AliasMapEntry information 
   * supplied from the front end through XML
   */
  class AliasMap : public XMLPrintable {

  public:
    
    AliasMap(){};

    ~AliasMap();

    /**
     * adds the AliasMapEntry to the table, 
     * the key is supposed to be an integer
     * given as a string that will be converted
     */
    AliasMapEntry&  
    addAliasMapEntry(const std::string& aKey);

    typedef std::list<const AliasMapKey*> AliasMapKeyPList;

    /**
     * check disjunction of alias sets 
     */
    bool mayAlias(const AliasMapKey& theKey, const AliasMapKeyPList& theList) const;

    /**
     * check disjunction of alias sets 
     */
    bool mayAlias(const AliasMapKey& theKey, const AliasMapKey& theOtherKey) const;

    /** 
     * establish must alias
     * this will throw an exception if we involve temporaries, 
     * i.e. right now we don't support identification of temporaries...
     */
    bool mustAlias(const AliasMapKey& theKey,
		   const AliasMapKey& theOtherKey) const;

    /**
     * check if addresses in theKey are a subset of addresses associated with keys in theList 
     */
    bool subSet(const AliasMapKey& theKey, const AliasMapKeyPList& theList) const;

    std::string debug() const ; 

    void printXMLHierarchy(std::ostream& os) const; 

    /**
     * name as specified in XAIF schema
     */
    static const std::string ourXAIFName;

  private: 

    /**
     * since this map is potentially large
     * and has random access so
     * we use a vector as representation
     * and convert all XML integer key strings into 
     * ints.
     */
    typedef std::vector<AliasMapEntry*> AAVector;

    AAVector myAAVector;

    /**
     * no def
     */
    AliasMap(const AliasMap&);

    /**
     * no def
     */
    AliasMap& operator=(const AliasMap&);

    /** 
     * this key is a regular key
     * theOtherKey may not be a regular key
     */
    bool haveNonEmptyIntersection(const AliasMapKey& thisKey,
				  const AliasMapKey& theOtherKey) const;

  }; // end of class AliasMap

} // end of namespace 
                                                                     
#endif
