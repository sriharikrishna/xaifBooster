#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationListPassive.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  VertexIdentificationListPassive::VertexIdentificationListPassive() { 
  } 

  VertexIdentificationList::IdentificationResult_E 
  VertexIdentificationListPassive::canIdentify(const Variable& theVariable) const { 
    IdentificationResult_E result=NOT_IDENTIFIED;
    // add a block dealing with ud info
    // *******************************
    // TODO: JU incomplete
    // *******************************
    // here is the block dealing with alias info
    AliasMap& theAliasMap(ConceptuallyStaticInstances::instance()->
			  getCallGraph().getAliasMap());
    if (theAliasMap.mayAlias(theVariable.getAliasMapKey(),
			     myAliasMapKeyList)) {
      // so there is potential 
      // try to find an exact match: 
      for (ListItemPList::const_iterator aListIterator=myList.begin();
	   aListIterator!=myList.end(); 
	   ++aListIterator) { 
	if (theAliasMap.mustAlias(theVariable.getAliasMapKey(),
				  (*aListIterator)->getAliasMapKey())) 
          if (result==NOT_IDENTIFIED)
	    result=UNIQUELY_IDENTIFIED;
	if (theAliasMap.mayAlias(theVariable.getAliasMapKey(),
				 (*aListIterator)->getAliasMapKey())) 
	  result=AMBIGUOUSLY_IDENTIFIED;
      } // end for 
    } // end if aliased
    return result;
  } 

  void VertexIdentificationListPassive::addElement(const Variable& theVariable) { 
    // add a block dealing with ud info
    // *******************************
    // TODO: JU incomplete
    // *******************************
    // here is the block dealing with alias info
    if (canIdentify(theVariable)==UNIQUELY_IDENTIFIED) 
      // nothing to do 
      return; 
    myList.push_back(new ListItem(theVariable.getAliasMapKey(),
				  theVariable.getDuUdMapKey()));
    myAliasMapKeyList.push_back(&(theVariable.getAliasMapKey()));
  } 

  void VertexIdentificationListPassive::removeIfIdentifiable(const Variable& theVariable) { 
    // add a block dealing with ud info
    // *******************************
    // TODO: JU incomplete
    // *******************************
    // here is the block dealing with alias info
    AliasMap& theAliasMap(ConceptuallyStaticInstances::instance()->
			  getCallGraph().getAliasMap());
    IdentificationResult_E idResult(canIdentify(theVariable));
    while(idResult!=NOT_IDENTIFIED) { 
      ListItemPList::iterator aListIterator(myList.begin());
      AliasMap::AliasMapKeyList::iterator aKeyListIterator(myAliasMapKeyList.begin());
      for (;
	   aListIterator!=myList.end(); 
	   ++aListIterator,
	     ++aKeyListIterator) { 
	if (theAliasMap.mayAlias(theVariable.getAliasMapKey(),
				 (*aListIterator)->getAliasMapKey())) { 
	  myAliasMapKeyList.erase(aKeyListIterator);
	  myList.erase(aListIterator);
	  break;
	}
      } // end for 
      idResult=canIdentify(theVariable);
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
  } // end of Symbol::debug

} // end of namespace 

