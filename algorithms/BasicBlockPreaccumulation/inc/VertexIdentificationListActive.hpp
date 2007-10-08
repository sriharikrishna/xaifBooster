#ifndef _VERTEXIDENTIFICATIONLISTACTIVE_INCLUDE_
#define _VERTEXIDENTIFICATIONLISTACTIVE_INCLUDE_
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
   * this is for the identification fo active variables   
   */
  class VertexIdentificationListActive : public VertexIdentificationList {

  public:

    VertexIdentificationListActive();

    ~VertexIdentificationListActive(){};

    virtual std::string debug() const;

    class IdentificationResult {

    public: 

      IdentificationResult(IdentificationResult_E,
			   PrivateLinearizedComputationalGraphVertex*);

      ~IdentificationResult(){};

      IdentificationResult_E getAnswer() const;

      /**
       *this will be valid only if myAnswer!=NOT_IDENTIFIED
       */
      const PrivateLinearizedComputationalGraphVertex* getVertexP() const;

      /**
       *this will be valid only if myAnswer!=NOT_IDENTIFIED
       */
      PrivateLinearizedComputationalGraphVertex* getVertexP();

    private:

      /** 
       * no def 
       */
      IdentificationResult();

      IdentificationResult_E myAnswer;

      /**
       * this is valid only if myAnswer!=NOT_IDENTIFIED
       */
      PrivateLinearizedComputationalGraphVertex* myPrivateLinearizedComputationalGraphVertex_p;

    };

    /**
     * this is a fall back method utilizing only alias information 
     * as opposed to the overwriting methods which look at DuUd information 
     * this method should not ever be invoked for duud based lists
     * it is overwritten in the derived classes
     */
    virtual IdentificationResult canIdentify(const Variable& theVariable) const;

    /** 
     * in case of duud information present we do nothing
     * in case of duud information absent we have use canIdentify to 
     * check and remove all list elements may aliased to theVariable
     */
    virtual void removeIfIdentifiable(const Variable& theVariable); 

    // JU: I don't believe ListItem should have to be
    // public (as opposed to be protected) but SUN CC 5.6 insists. 
    // this may have something to do with 2 stage lookup.
    //  protected:
    
    /** 
     * an entry in the list 
     */
    class ListItem: public VertexIdentificationList::ListItem { 

    public: 
      
      ListItem(const AliasMapKey& anAliasMapKey,
	       const StatementIdSetMapKey& aDuUdMapKey,
	       PrivateLinearizedComputationalGraphVertex* aPrivateLinearizedComputationalGraphVertex_p);

      virtual std::string debug() const;

      /**
       * the pointer to a vertex in the PrivateLinearizedComputationalGraph
       * always set, 
       * we don't own this pointer
       */ 
      PrivateLinearizedComputationalGraphVertex* myPrivateLinearizedComputationalGraphVertex_p;
      
    };
    
  }; // end of class VertexIdentificationListActive  
   
} // end namespace 
                                                                  
#endif
