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
    AliasMap& theAliasMap(ConceptuallyStaticInstances::instance()->
			  getCallGraph().getAliasMap());
    if (theAliasMap.mayAlias(theVariable.getAliasMapKey(),
			     myAliasMapKeyList)) {
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

  void VertexIdentificationListActive::addElement(const Variable& theVariable,
						  PrivateLinearizedComputationalGraphVertex* thePrivateLinearizedComputationalGraphVertex_p) { 
    if (canIdentify(theVariable).getAnswer()!=NOT_IDENTIFIED) 
      THROW_LOGICEXCEPTION_MACRO("VertexIdentificationListActive::addElement: new element must have a unique address");
    myList.push_back(new ListItem(theVariable.getAliasMapKey(),
				  theVariable.getDuUdMapKey(),
				  thePrivateLinearizedComputationalGraphVertex_p));
    myAliasMapKeyList.push_back(&(theVariable.getAliasMapKey()));
  } 

  void VertexIdentificationListActive::removeIfIdentifiable(const Variable& theVariable) { 
    IdentificationResult idResult(canIdentify(theVariable));
    while(idResult.getAnswer()!=NOT_IDENTIFIED) { 
      ListItemPList::iterator aListIterator=myList.begin();
      AliasMap::AliasMapKeyList::iterator aKeyListIterator=myAliasMapKeyList.begin();
      for (;
	   aListIterator!=myList.end(); 
	   ++aListIterator,
	     ++aKeyListIterator) { 
	if (dynamic_cast<ListItem&>(**aListIterator).myPrivateLinearizedComputationalGraphVertex_p==idResult.getVertexP()) { 
	  myAliasMapKeyList.erase(aKeyListIterator);
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
