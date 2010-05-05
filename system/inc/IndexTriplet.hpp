#ifndef _INDEXTRIPLET_INCLUDE_
#define _INDEXTRIPLET_INCLUDE_
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

#include <list>
#include "xaifBooster/system/inc/VariableVertex.hpp"
#include "xaifBooster/system/inc/Expression.hpp"

namespace xaifBooster { 

  /**
   * contains array dereference allowing 
   * for slicing and non-unit stride
   */
  class IndexTriplet {
  public:

    IndexTriplet ();

    virtual ~IndexTriplet();

    void printXMLHierarchy(std::ostream& os) const;

    void printXMLHierarchyIndexTripletElement(std::ostream& os,
					     const Expression& theIndex,
					     const std::string& anXaifName) const;

    /** 
     * \todo implementation incomplete
     */
    std::string debug() const { return std::string("IndexTriplet");} ;

    /** 
     * \todo implementation incomplete
     */
    virtual std::string equivalenceSignature() const;

    static const std::string ourXAIFName;
    static const std::string our_myIndex_XAIFName;
    static const std::string our_myBound_XAIFName;
    static const std::string our_myStride_XAIFName;

    void copyMyselfInto(IndexTriplet& anotherIndexTriplet) const ;

    enum IndexTriplet_E{
      IT_INDEX,
      IT_BOUND,
      IT_STRIDE};
      
    /** 
     * add an expression identified by discriminator
     */
    Expression& addExpression(const IndexTriplet_E& discriminator);

    /** 
     * get an expression identified by discriminator
     */
    const Expression& getExpression(const IndexTriplet_E& discriminator) const;
    Expression& getExpression(const IndexTriplet_E& discriminator);

    /** 
     * test if an expression identified by discriminator exists
     */
    bool hasExpression(const IndexTriplet_E& discriminator) const;

    typedef std::pair<IndexTriplet_E,Expression*> IndexPair;

    typedef std::list<IndexPair> IndexPairList;

    const IndexPairList& getIndexPairList() const;

    IndexPairList& getIndexPairList();

    /** 
     * if the extent of the slice is 1 
     * this returns true
     */
    bool isScalarDeref() const; 

  private:
    
    /**
     * no def
     */
    IndexTriplet(const IndexTriplet&);

    /**
     * no def
     */
    IndexTriplet& operator=(const IndexTriplet&);

    /** 
     * the list containing the index,bound,stride (all optional)
     */ 
    IndexPairList myIndexPairList;

  };
 
} // end of namespace xaifBooster
                                                                     
#endif
