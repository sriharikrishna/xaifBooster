#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationListActiveRHS.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  VertexIdentificationListActiveRHS::IdentificationResult 
  VertexIdentificationListActiveRHS::canIdentify(const Variable& theVariable) const { 
    if (theVariable.getDuUdMapKey().getKind()!=DuUdMapKey::NO_INFO) { 
      for (ListItemPList::const_iterator aListIterator=myList.begin();
	   aListIterator!=myList.end(); 
	   ++aListIterator) { 
	ListItem& theItem(dynamic_cast<ListItem&>(**aListIterator));
	if (ConceptuallyStaticInstances::instance()->
	    getCallGraph().getDuUdMap().sameDefinition(theVariable.getDuUdMapKey(),
						       theItem.getDuUdMapKey())) { 
	  return IdentificationResult(UNIQUELY_IDENTIFIED,theItem.myPrivateLinearizedComputationalGraphVertex_p);
	} // end if 
      } // end for 
    } // end if 
    return VertexIdentificationListActive::canIdentify(theVariable);
  } 

} // end of namespace 

