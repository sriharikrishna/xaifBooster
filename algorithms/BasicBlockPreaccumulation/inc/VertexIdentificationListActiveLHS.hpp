#ifndef _VERTEXIDENTIFICATIONLISTACTIVELHS_INCLUDE_
#define _VERTEXIDENTIFICATIONLISTACTIVELHS_INCLUDE_
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

#include "xaifBooster/utils/inc/ObjectWithId.hpp"

#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationListActive.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  /**
   * this is for the identification of active variables
   * RHS <-> preceding LHS
   * in the presence of alias or ud information
   * the behavior changes based on the presence or absence of duud information
   */
  class VertexIdentificationListActiveLHS : public VertexIdentificationListActive {

  public:

    /** 
     * in case of duud information present this has only 
     * a meaningfull invocation for "theVariable" being 
     * a RHS Argument
     * in case of duud information absent this can also 
     * be invoked between LHS variables.
     */
    IdentificationResult canIdentify(const Variable& theVariable) const;

    /** 
     * in case of duud information present we keep adding 
     * variables, 
     * in case of duud information absent we have to maintain 
     * uniqueness, i.e. 
     * this will only work if canIdentify returns
     * NOT_IDENTIFIED 
     */
    void addElement(const Variable& theVariable,
		    PrivateLinearizedComputationalGraphVertex* thePrivateLinearizedComputationalGraphVertex_p,
		    const ObjectWithId::Id& aStatementId);

    virtual std::string debug() const;

  private: 

    class ListItem: public VertexIdentificationListActive::ListItem { 
      
    public: 

      ListItem(const AliasMapKey& anAliasMapKey,
	       const DuUdMapKey& aDuUdMapKey,
	       PrivateLinearizedComputationalGraphVertex* aPrivateLinearizedComputationalGraphVertex_p,
	       const ObjectWithId::Id& aStatementId);

      virtual std::string debug() const;

      /**
       * this is the statement id of the assignment in which this 
       * vertex represents the LHS, i.e. it is the statementID of 
       * the single entry in the ud chain or alternatively the 
       * result of looking at the alias map,
       * this must be set or this ListItem instance is useless
       */
      const ObjectWithId::Id& myStatementId;

    };
    
    /** 
     * retrieve the list of statement IDs collected in myList
     */
    void getStatementIdList(DuUdMapDefinitionResult::StatementIdList& aStatementIdList)const;

  }; // end of class VertexIdentificationListActiveLHS  
   
} // end namespace 
                                                                  
#endif
