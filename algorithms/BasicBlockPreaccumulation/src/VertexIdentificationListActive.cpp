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
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationListActive.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  VertexIdentificationListActive::VertexIdentificationListActive() { 
  } 

  VertexIdentificationListActive::IdentificationResult::IdentificationResult(IdentificationResult_E anAnswer,
									     PrivateLinearizedComputationalGraphVertex* aPrivateLinearizedComputationalGraphVertex_p) : 
    myAnswer(anAnswer),
    myPrivateLinearizedComputationalGraphVertex_p(aPrivateLinearizedComputationalGraphVertex_p) { 
  }

  VertexIdentificationList::IdentificationResult_E
  VertexIdentificationListActive::IdentificationResult::getAnswer() const { 
    return myAnswer;
  } 

  const PrivateLinearizedComputationalGraphVertex*
  VertexIdentificationListActive::IdentificationResult::getVertexP() const { 
    if (myAnswer==NOT_IDENTIFIED ||
	!myPrivateLinearizedComputationalGraphVertex_p) 
      THROW_LOGICEXCEPTION_MACRO("VertexIdentificationListActive::getVertexP: vertex not uniquely identified");
    return myPrivateLinearizedComputationalGraphVertex_p;
  } 

  PrivateLinearizedComputationalGraphVertex*
  VertexIdentificationListActive::IdentificationResult::getVertexP() { 
    if (myAnswer==NOT_IDENTIFIED ||
	!myPrivateLinearizedComputationalGraphVertex_p) 
      THROW_LOGICEXCEPTION_MACRO("VertexIdentificationListActive::getVertexP: vertex not uniquely identified");
    return myPrivateLinearizedComputationalGraphVertex_p;
  } 

  VertexIdentificationListActive::ListItem::ListItem(const AliasMapKey& anAliasMapKey,
						     const DuUdMapKey& aDuUdMapKey,
						     PrivateLinearizedComputationalGraphVertex* aPrivateLinearizedComputationalGraphVertex_p) : 
    VertexIdentificationList::ListItem(anAliasMapKey,
				       aDuUdMapKey),
    myPrivateLinearizedComputationalGraphVertex_p(aPrivateLinearizedComputationalGraphVertex_p) { 
  }

  VertexIdentificationListActive::IdentificationResult 
  VertexIdentificationListActive::canIdentify(const Variable& theVariable) const { 
    if (isDuUdMapBased())
      THROW_LOGICEXCEPTION_MACRO("VertexIdentificationListActive::canIdentify: should ot be invoked for DuUd map based lists");
    AliasMap& theAliasMap(ConceptuallyStaticInstances::instance()->
			  getCallGraph().getAliasMap());
    AliasMap::AliasMapKeyPList anAliasMapKeyPList;
    getAliasMapKeyPList(anAliasMapKeyPList);
    if (theAliasMap.mayAlias(theVariable.getAliasMapKey(),
			     anAliasMapKeyPList)) {
      // so there is potential 
      // try to find an exact match: 
      for (ListItemPList::const_iterator aListIterator=myList.begin();
	   aListIterator!=myList.end(); 
	   ++aListIterator) { 
	ListItem& theItem(dynamic_cast<ListItem&>(**aListIterator));
	if (theAliasMap.mustAlias(theVariable.getAliasMapKey(),
				  theItem.getAliasMapKey())) 
	  return IdentificationResult(UNIQUELY_IDENTIFIED,theItem.myPrivateLinearizedComputationalGraphVertex_p);
	if (theAliasMap.mayAlias(theVariable.getAliasMapKey(),
				 theItem.getAliasMapKey())) 
	  return IdentificationResult(AMBIGUOUSLY_IDENTIFIED,theItem.myPrivateLinearizedComputationalGraphVertex_p);
      } // end for 
    } // end if aliased
    return IdentificationResult(NOT_IDENTIFIED,0);
  } 

  void VertexIdentificationListActive::removeIfIdentifiable(const Variable& theVariable) { 
    if (myList.empty())
      return;
    if (isDuUdMapBased())
      return;
    IdentificationResult idResult(canIdentify(theVariable));
    while(idResult.getAnswer()!=NOT_IDENTIFIED) { 
      ListItemPList::iterator aListIterator=myList.begin();
      for (;
	   aListIterator!=myList.end(); 
	   ++aListIterator) { 
	if (dynamic_cast<ListItem&>(**aListIterator).myPrivateLinearizedComputationalGraphVertex_p==idResult.getVertexP()) { 
	  myList.erase(aListIterator);
	  break;
	} // end if 
      } // end for
      idResult=canIdentify(theVariable);
    } // end while 
  } 

  std::string VertexIdentificationListActive::ListItem::debug() const { 
    std::ostringstream out;
    out << "VertexIdentificationListActive::ListItem[" 
	<< this
	<< ","
	<< VertexIdentificationList::ListItem::debug().c_str()
	<< "myPrivateLinearizedComputationalGraphVertex_p="
	<< myPrivateLinearizedComputationalGraphVertex_p
	<< "]" 
	<< std::ends;
    return out.str();
  }

  std::string VertexIdentificationListActive::debug () const { 
    std::ostringstream out;
    out << "VertexIdentificationListActive[" << this 
	<< ","
	<< VertexIdentificationList::debug().c_str()
	<< "]" 
	<< std::ends;
    return out.str();
  } // end of Symbol::debug

} // end of namespace 

