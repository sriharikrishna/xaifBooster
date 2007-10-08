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
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationListActiveRHS.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertex.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  VertexIdentificationListActiveRHS::IdentificationResult 
  VertexIdentificationListActiveRHS::canIdentify(const Variable& theVariable) const { 
    if (isDuUdMapBased() 
	&& 
	theVariable.getDuUdMapKey().getKind()!=InfoMapKey::NO_INFO) {
      bool isDisjoint=true;
      for (ListItemPList::const_iterator aListIterator=myList.begin();
	   aListIterator!=myList.end(); 
	   ++aListIterator) { 
	ListItem& theItem(dynamic_cast<ListItem&>(**aListIterator));
	if (ConceptuallyStaticInstances::instance()->
	    getCallGraph().getDuUdMap().sameDefinition(theVariable.getDuUdMapKey(),
						       theItem.getDuUdMapKey())) { 
	  return IdentificationResult(UNIQUELY_IDENTIFIED,theItem.myPrivateLinearizedComputationalGraphVertex_p);
	} // end if 
	if (!ConceptuallyStaticInstances::instance()->
	    getCallGraph().getDuUdMap().disjointDefinition(theVariable.getDuUdMapKey(),
							   theItem.getDuUdMapKey())) { 
	  isDisjoint=false;
	} // end if 
      } // end for 
      if (isDisjoint)
	return IdentificationResult(NOT_IDENTIFIED,0);
    } // end if 
    if (!isDuUdMapBased()){ 
      // if we still don't know try alias information
      return VertexIdentificationListActive::canIdentify(theVariable);
    }
    return IdentificationResult(AMBIGUOUSLY_IDENTIFIED,0);
  } 

  void VertexIdentificationListActiveRHS::addElement(const Variable& theVariable,
						     const ObjectWithId::Id& statementId,
						     PrivateLinearizedComputationalGraphVertex* thePrivateLinearizedComputationalGraphVertex_p,
						     const StatementIdList& theKnownAssignmentsList) { 
    if (theVariable.getDuUdMapKey().getKind()!=InfoMapKey::NO_INFO) 
      // if we ever encounter a usefull piece of duud information:
      baseOnDuUdMap();
    if (!isDuUdMapBased() 
	&& 
	canIdentify(theVariable).getAnswer()!=NOT_IDENTIFIED) 
      THROW_LOGICEXCEPTION_MACRO("VertexIdentificationListActiveRHS::addElement: new element must have a unique address");
    if (isDuUdMapBased() && theVariable.getDuUdMapKey().getKind()!=InfoMapKey::NO_INFO) { 
      // if this ud chain isn't referring to single assignments we will skip it
      // in order to be an assignment in needs to occur in theKnownAssignmentsList
      if (ConceptuallyStaticInstances::instance()->
	  getCallGraph().getDuUdMap().definition(theVariable.getDuUdMapKey(),
						 statementId,
						 theKnownAssignmentsList).myAnswer
	  !=
	  DuUdMapDefinitionResult::UNIQUE_INSIDE) { 
	// if we don't do this we may identify variables for subroutine calls 
	// which of course would be wrong as multiple variables can be defined 
	// by the same subroutine call and they all share the same statement id. 
	// see for example in testRoundTrip/examples/nested_calls_3
	return; 
      }
    }
    myList.push_back(new ListItem(theVariable.getAliasMapKey(),
				  theVariable.getDuUdMapKey(),
				  thePrivateLinearizedComputationalGraphVertex_p));
  } 


} // end of namespace 

