// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================
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

