#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationListActiveRHS.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  VertexIdentificationListActiveRHS::IdentificationResult 
  VertexIdentificationListActiveRHS::canIdentify(const Variable& theVariable) const { 
    if (isDuUdMapBased() 
	&& 
	theVariable.getDuUdMapKey().getKind()!=DuUdMapKey::NO_INFO) {
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
						     PrivateLinearizedComputationalGraphVertex* thePrivateLinearizedComputationalGraphVertex_p) { 
    if (theVariable.getDuUdMapKey().getKind()!=DuUdMapKey::NO_INFO) 
      // if we ever encounter a usefull piece of duud information:
      baseOnDuUdMap();
    if (!isDuUdMapBased() 
	&& 
	canIdentify(theVariable).getAnswer()!=NOT_IDENTIFIED) 
      THROW_LOGICEXCEPTION_MACRO("VertexIdentificationListActiveRHS::addElement: new element must have a unique address");
    myList.push_back(new ListItem(theVariable.getAliasMapKey(),
				  theVariable.getDuUdMapKey(),
				  thePrivateLinearizedComputationalGraphVertex_p));
  } 


} // end of namespace 

