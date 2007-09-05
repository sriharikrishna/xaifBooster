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
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationListActiveLHS.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  VertexIdentificationListActiveLHS::ListItem::ListItem(const AliasMapKey& anAliasMapKey,
							const DuUdMapKey& aDuUdMapKey,
							PrivateLinearizedComputationalGraphVertex* aPrivateLinearizedComputationalGraphVertex_p,
							const ObjectWithId::Id& aStatementId) : 
    VertexIdentificationListActive::ListItem(anAliasMapKey,
					     aDuUdMapKey,
					     aPrivateLinearizedComputationalGraphVertex_p), myStatementId(aStatementId) {
 
  }

  VertexIdentificationListActiveLHS::IdentificationResult 
  VertexIdentificationListActiveLHS::canIdentify(const Variable& theVariable,
						 const ObjectWithId::Id& statementId) const { 
    if (isDuUdMapBased() 
	&& 
	theVariable.getDuUdMapKey().getKind()!=DuUdMapKey::NO_INFO) { 
      DuUdMapDefinitionResult::StatementIdList aStatementIdList;
      getStatementIdList(aStatementIdList);
      DuUdMapDefinitionResult theResult(ConceptuallyStaticInstances::instance()->
					getCallGraph().getDuUdMap().definition(theVariable.getDuUdMapKey(),
									       statementId,
									       aStatementIdList));
      if (theResult.myAnswer==DuUdMapDefinitionResult::UNIQUE_INSIDE) {
	for (ListItemPList::const_iterator aListIterator=myList.begin();
	     aListIterator!=myList.end(); 
	     ++aListIterator) { 
	  ListItem& theItem(dynamic_cast<ListItem&>(**aListIterator));
	  if (theResult.myStatementId==theItem.myStatementId) 
	    return IdentificationResult(UNIQUELY_IDENTIFIED,theItem.myPrivateLinearizedComputationalGraphVertex_p);
	} // end for
	// we are in trouble 
	THROW_LOGICEXCEPTION_MACRO("VertexIdentificationListActiveLHS::canIdentify: cannot match statement for "
				   << theResult.myStatementId 
				   << " in " 
				   << debug().c_str());
      } // end if
      else if (theResult.myAnswer==DuUdMapDefinitionResult::UNIQUE_OUTSIDE
	       ||
	       theResult.myAnswer==DuUdMapDefinitionResult::AMBIGUOUS_OUTSIDE) {
	return IdentificationResult(NOT_IDENTIFIED,0);
      }
      else if (theResult.myAnswer==DuUdMapDefinitionResult::AMBIGUOUS_INSIDE
	       ||
	       theResult.myAnswer==DuUdMapDefinitionResult::AMBIGUOUS_BOTHSIDES) {
	return IdentificationResult(AMBIGUOUSLY_IDENTIFIED,0);
      }
    }
    if (!isDuUdMapBased()){ 
      return VertexIdentificationListActive::canIdentify(theVariable);
    }
    return IdentificationResult(AMBIGUOUSLY_IDENTIFIED,0);
  } 

  void VertexIdentificationListActiveLHS::addElement(const Variable& theVariable,
						     PrivateLinearizedComputationalGraphVertex* thePrivateLinearizedComputationalGraphVertex_p,
						     const ObjectWithId::Id& aStatementId) { 
    if (theVariable.getDuUdMapKey().getKind()!=DuUdMapKey::NO_INFO) 
      // if we ever encounter a usefull piece of duud information:
      baseOnDuUdMap();
    if (!isDuUdMapBased() 
	&& 
	canIdentify(theVariable,
		    aStatementId).getAnswer()!=NOT_IDENTIFIED) 
      THROW_LOGICEXCEPTION_MACRO("VertexIdentificationListActive::addElement: new element must have a unique address");
    myList.push_back(new ListItem(theVariable.getAliasMapKey(),
     				  theVariable.getDuUdMapKey(),
     				  thePrivateLinearizedComputationalGraphVertex_p,
     				  aStatementId));
  } 

  std::string VertexIdentificationListActiveLHS::ListItem::debug() const { 
    std::ostringstream out;
    out << "VertexIdentificationListActiveLHS::ListItem[" 
	<< this
	<< ","
	<< VertexIdentificationListActive::ListItem::debug().c_str()
	<< "myStatementId="
	<< myStatementId
	<< "]" 
	<< std::ends;
    return out.str();
  }

  std::string VertexIdentificationListActiveLHS::debug () const { 
    std::ostringstream out;
    out << "VertexIdentificationListActiveLHS[" 
	<< this 
	<< ","
	<< VertexIdentificationListActive::debug().c_str()
	<< "]" 
	<< std::ends;
    return out.str();
  } 

  void VertexIdentificationListActiveLHS::getStatementIdList(DuUdMapDefinitionResult::StatementIdList& aStatementIdList)const { 
    for (ListItemPList::const_iterator aListIterator=myList.begin();
	 aListIterator!=myList.end(); 
	 ++aListIterator) { 
      aStatementIdList.push_back((dynamic_cast<ListItem&>(**aListIterator)).myStatementId);
    }
  } 

} // end of namespace 
