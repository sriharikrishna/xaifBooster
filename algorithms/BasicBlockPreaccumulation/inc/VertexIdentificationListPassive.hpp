#ifndef _VERTEXIDENTIFICATIONLISTPASSIVE_INCLUDE_
#define _VERTEXIDENTIFICATIONLISTPASSIVE_INCLUDE_
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

#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationList.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  class PrivateLinearizedComputationalGraphVertex;

  /**
   * this is for the identification (RHS to preceeding LHS) 
   * of passive variables   
   * in difference to active identification we allow here 
   * a set of variables that can alias each other
   */
  class VertexIdentificationListPassive : public VertexIdentificationList {

  public:

    VertexIdentificationListPassive();

    ~VertexIdentificationListPassive(){};

    virtual std::string debug() const;

    /** 
     * Note, that here the question is merely is it passive or ambiguous 
     * or we don't know.
     * therefore passive is signified by  UNIQELY_IDENTIFIED and this doesn't 
     * mean we need to know exactly what it is identified with 
     */
    virtual IdentificationResult_E canIdentify(const Variable& theVariable) const;

    void addElement(const Variable& theVariable,
		    const ObjectWithId::Id& aStatementId);

    void removeIfIdentifiable(const Variable& theVariable); 

  private:

    class ListItem: public VertexIdentificationList::ListItem { 
      
    public: 

      ListItem(const AliasMapKey& anAliasMapKey,
	       const DuUdMapKey& aDuUdMapKey,
	       const ObjectWithId::Id& aStatementId);

      virtual std::string debug() const;

      /**
       * this is the statement id of the assignment in which this 
       * vertex represents the LHS
       * this must be set or this ListItem instance is useless
       */
      const ObjectWithId::Id& myStatementId;

    };
    
    /** 
     * retrieve the list of statement IDs collected in myList
     */
    void getStatementIdList(DuUdMapDefinitionResult::StatementIdList& aStatementIdList)const;

  }; // end of class VertexIdentificationListPassive  
   
} // end namespace 
                                                                  
#endif
