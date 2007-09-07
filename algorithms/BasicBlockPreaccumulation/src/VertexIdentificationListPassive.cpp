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
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationListPassive.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  VertexIdentificationListPassive::VertexIdentificationListPassive() { 
  } 

  VertexIdentificationListPassive::ListItem::ListItem(const AliasMapKey& anAliasMapKey,
						      const StatementIdSetMapKey& aDuUdMapKey,
						      const ObjectWithId::Id& aStatementId) : 
    VertexIdentificationList::ListItem(anAliasMapKey,
				       aDuUdMapKey),
    myStatementId(aStatementId) { 
  }

  std::string VertexIdentificationListPassive::ListItem::debug() const { 
    std::ostringstream out;
    out << "VertexIdentificationListPassive::ListItem[" 
	<< this
	<< ","
	<< VertexIdentificationList::ListItem::debug().c_str()
	<< "myStatementId="
	<< myStatementId.c_str()
	<< "]" 
	<< std::ends;
    return out.str();
  }

  VertexIdentificationList::IdentificationResult_E 
  VertexIdentificationListPassive::canIdentify(const Variable& theVariable,
					       const ObjectWithId::Id& statementId) const { 
    IdentificationResult_E result=NOT_IDENTIFIED;
    if (isDuUdMapBased() 
	&& 
	theVariable.getDuUdMapKey().getKind()!=InfoMapKey::NO_INFO) { 
      // if we ever encounter a bit of DuUd information:
      baseOnDuUdMap();
      StatementIdList aStatementIdList;
      getStatementIdList(aStatementIdList);
      DuUdMapDefinitionResult theResult(ConceptuallyStaticInstances::instance()->
					getCallGraph().getDuUdMap().definition(theVariable.getDuUdMapKey(),
									       statementId,
									       aStatementIdList));
      // either one or more LHSs of passive statements that we have in the list
      // means this one is guaranteed to be passive too
      if (theResult.myAnswer==DuUdMapDefinitionResult::UNIQUE_INSIDE
	  ||
	  theResult.myAnswer==DuUdMapDefinitionResult::AMBIGUOUS_INSIDE) {
	result=UNIQUELY_IDENTIFIED;
      }
      // else we can't be sure 
      else { 
	result=AMBIGUOUSLY_IDENTIFIED;
      }
    }
    // have to rely on alias information:
    if (!isDuUdMapBased()) { 
      AliasMap& theAliasMap(ConceptuallyStaticInstances::instance()->
			    getCallGraph().getAliasMap());
      AliasMap::AliasMapKeyPList anAliasMapKeyPList;
      getAliasMapKeyPList(anAliasMapKeyPList);
      if (anAliasMapKeyPList.empty()) 
	result=NOT_IDENTIFIED;
      else if (theAliasMap.subSet(theVariable.getAliasMapKey(),
				  anAliasMapKeyPList)) 
	result=UNIQUELY_IDENTIFIED;
      else 
	result=AMBIGUOUSLY_IDENTIFIED;
    }
    return result;
  } 

  void VertexIdentificationListPassive::addElement(const Variable& theVariable,
						   const ObjectWithId::Id& aStatementId) { 
    if (theVariable.getDuUdMapKey().getKind()!=InfoMapKey::NO_INFO) 
      // if we ever encounter a usefull piece of duud information:
      baseOnDuUdMap();
    if (!isDuUdMapBased() 
	&& 
	canIdentify(theVariable,
		    aStatementId)==UNIQUELY_IDENTIFIED) 
      return; 
    myList.push_back(new ListItem(theVariable.getAliasMapKey(),
				  theVariable.getDuUdMapKey(),
				  aStatementId));
  } 

  void VertexIdentificationListPassive::removeIfIdentifiable(const Variable& theVariable,
							     const ObjectWithId::Id& statementId) { 
    if (isDuUdMapBased())
      return;
    if (myList.empty())
      return;
    AliasMap& theAliasMap(ConceptuallyStaticInstances::instance()->
			  getCallGraph().getAliasMap());
    IdentificationResult_E idResult(canIdentify(theVariable,
						statementId));
    while(idResult!=NOT_IDENTIFIED) { 
      for (ListItemPList::iterator aListIterator(myList.begin());
	   aListIterator!=myList.end(); 
	   ++aListIterator) { 
	if (theAliasMap.mayAlias(theVariable.getAliasMapKey(),
				 (*aListIterator)->getAliasMapKey())) { 
	  myList.erase(aListIterator);
	  break;
	}
      } // end for 
      idResult=canIdentify(theVariable,
			   statementId);
    } // end while 
  } 

  std::string VertexIdentificationListPassive::debug () const { 
    std::ostringstream out;
    out << "VertexIdentificationListPassive[" 
	<< this 
	<< VertexIdentificationList::debug().c_str()
	<< "]"
	<< std::ends;
    return out.str();
  } 

  void VertexIdentificationListPassive::getStatementIdList(StatementIdList& aStatementIdList)const { 
    for (ListItemPList::const_iterator aListIterator=myList.begin();
	 aListIterator!=myList.end(); 
	 ++aListIterator) { 
      aStatementIdList.push_back((dynamic_cast<ListItem&>(**aListIterator)).myStatementId);
    }
  } 

} // end of namespace 

