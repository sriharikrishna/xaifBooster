#ifndef _VERTEXIDENTIFICATIONLIST_INCLUDE_
#define _VERTEXIDENTIFICATIONLIST_INCLUDE_
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

#include "xaifBooster/utils/inc/Debuggable.hpp"
#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/system/inc/AliasMap.hpp"
#include "xaifBooster/system/inc/DuUdMap.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  /**
   * this is the list against which we will check 
   * for identities with other Variable and Argument instances
   */
  class VertexIdentificationList : public Debuggable {

  public:

    VertexIdentificationList();

    virtual ~VertexIdentificationList();

    virtual std::string debug() const;

    /** 
     * the result of an identification attempt
     */
    enum IdentificationResult_E{ NOT_IDENTIFIED,
				 AMBIGUOUSLY_IDENTIFIED,
				 UNIQUELY_IDENTIFIED };

    // JU: I don't believe ListItem should have to be 
    // public but SUN CC 5.6 insists. Moved protected down
    //  protected:

    /** 
     * an entry in the list 
     */
    class ListItem : public Debuggable { 
      
    public: 

      ListItem(const AliasMapKey& anAliasMapKey,
	       const StatementIdSetMapKey& aDuUdMapKey);

      virtual ~ListItem(){};

      const AliasMapKey& getAliasMapKey()const;

      const StatementIdSetMapKey& getDuUdMapKey()const;
      
      virtual std::string debug() const;
      
    private: 

      /**
       * no def
       */
      ListItem();

      /**
       * no def
       */
      ListItem(const ListItem&);

      /**
       * no def
       */
      ListItem& operator=(const ListItem&);

      const AliasMapKey& myAliasMapKey;
      const StatementIdSetMapKey& myDuUdMapKey;
      
    };
   
   protected: 
 
    /** 
     * retrieves the alias keys found in myList
     */
    void getAliasMapKeyPList(AliasMap::AliasMapKeyPList& anAliasMapKeyPList) const;

    /**
     * defining this here requires us
     * to do dynamic casts unless we
     * want to start deriving our own list classes...
     */
    typedef std::list<ListItem*> ListItemPList;

    /**
     * this list owns all the items in it
     */
    ListItemPList myList;

    /** 
     * lock down list behavior to be based on 
     * DuUdMap
     * once it is locked down we cannot change back
     */
    void baseOnDuUdMap()const; 

    bool isDuUdMapBased()const;

  private:

    /** 
     * track if this list is DuUdMap based or not
     * behavior changes based on this flag
     */
    mutable bool myBasedOnDuUdMapFlag;

  }; // end of class VertexIdentificationList  
   
} // end namespace 
                                                                  
#endif
