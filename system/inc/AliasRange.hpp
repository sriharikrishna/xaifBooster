#ifndef _ALIASRANGE_INCLUDE_
#define _ALIASRANGE_INCLUDE_
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

namespace xaifBooster{ 

  /**
   * class to hold single and range alias information 
   * we don't want to split this so that making a range 
   * from two adjacent single addresses becomes easier
   */
  class AliasRange : public XMLPrintable { 
    
  public: 
  
    AliasRange(unsigned int lower,
	       unsigned int upper,
	       bool partial);
 
    ~AliasRange(){};

    virtual std::string debug() const;

    virtual void printXMLHierarchy(std::ostream& os) const; 

    /**
     * name as specified in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name of member myLower/UpperAddress 
     * as specified in XAIF schema
     */
    static const std::string our_myLowerAddress_XAIFName;
    static const std::string our_myUpperAddress_XAIFName;

    /**
     * name of member myPartial 
     * as specified in XAIF schema
     */
    static const std::string our_myPartial_XAIFName;

    unsigned int max() const;
    unsigned int min() const;

    /**
     * almost operator '==' like but didn't 
     * use operator since people could 
     * epxect them to behave differently
     */
    bool sameAs(const AliasRange&) const;

    /**
     * almost operator '>' like but didn't 
     * use operator since people could 
     * epxect them to behave differently
     */
    bool isGreaterThan(const AliasRange&) const;

    /**
     * returns true for containment or 
     * equality
     */
    bool isContainedIn(const AliasRange&) const;

    /**
     * returns true for overlap but no containment
     */
    bool overlapsWith(const AliasRange&) const;

    /**
     * returns true if there is no gap between the ranges
     */
    bool bordersWith(const AliasRange&) const;

    /**
     * absorb the other range
     */
    void absorb(const AliasRange&);

    bool isPartial()const;

  private:

    unsigned int myLowerAddress;
    unsigned int myUpperAddress;

    void max(unsigned int);
    void min(unsigned int);
    
    /**
     * no def
     */
    AliasRange();

    /**
     * no def
     */
    AliasRange(const AliasRange&);

    /**
     * no def
     */
    AliasRange& operator=(const AliasRange&);

    /** 
     * indicates if this is a full 
     * or a partial reference
     */
    const bool myPartial;
    
  }; // end of class AliasRange

} // end of namespace xaifBooster

#endif
