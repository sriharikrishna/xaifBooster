#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PassiveVertexIdentificationList.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  PassiveVertexIdentificationList::PassiveVertexIdentificationList() { 
  } 

  VertexIdentificationList::IdentificationResult_E 
  PassiveVertexIdentificationList::canIdentify(const Variable& theVariable) const { 
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
      for (ListType::const_iterator aListIterator=myList.begin();
	   aListIterator!=myList.end(); 
	   ++aListIterator) { 
	if (theAliasMap.mustAlias(theVariable.getAliasMapKey(),
				  *((*aListIterator).myAliasMapKey_p))) 
          if (result==NOT_IDENTIFIED)
	    result=UNIQUELY_IDENTIFIED;
	if (theAliasMap.mayAlias(theVariable.getAliasMapKey(),
				 *((*aListIterator).myAliasMapKey_p))) 
	  result=POSSIBLY_ALIASED;
      } // end for 
    } // end if aliased
    return result;
  } 

  void PassiveVertexIdentificationList::addElement(const Variable& theVariable) { 
    // add a block dealing with ud info
    // *******************************
    // TODO: JU incomplete
    // *******************************
    // here is the block dealing with alias info
    if (canIdentify(theVariable)==UNIQUELY_IDENTIFIED) 
      // nothing to do 
      return; 
    ListItem theItem;
    theItem.myAliasMapKey_p=&(theVariable.getAliasMapKey());
    myList.push_back(theItem);
    myAliasMapKeyList.push_back(&(theVariable.getAliasMapKey()));
  } 

  void PassiveVertexIdentificationList::removeIfAliased(const Variable& theVariable) { 
    // add a block dealing with ud info
    // *******************************
    // TODO: JU incomplete
    // *******************************
    // here is the block dealing with alias info
    AliasMap& theAliasMap(ConceptuallyStaticInstances::instance()->
			  getCallGraph().getAliasMap());
    IdentificationResult_E idResult(canIdentify(theVariable));
    while(idResult!=NOT_IDENTIFIED) { 
      ListType::iterator aListIterator(myList.begin());
      AliasMap::AliasMapKeyList::iterator aKeyListIterator(myAliasMapKeyList.begin());
      for (;
	   aListIterator!=myList.end(); 
	   ++aListIterator,
	     ++aKeyListIterator) { 
	if (theAliasMap.mayAlias(theVariable.getAliasMapKey(),
				 *((*aListIterator).myAliasMapKey_p))) { 
	  myAliasMapKeyList.erase(aKeyListIterator);
	  myList.erase(aListIterator);
	  break;
	}
      } // end for 
      idResult=canIdentify(theVariable);
    } // end while 
  } 

  std::string PassiveVertexIdentificationList::debug () const { 
    std::ostringstream out;
    out << "PassiveVertexIdentificationList[" << this 
	<< ",myList=";  
    for (ListType::const_iterator aListIterator=myList.begin();
	 aListIterator!=myList.end(); 
	 ++aListIterator) { 
      if ((*aListIterator).myAliasMapKey_p)
	out << (*aListIterator).myAliasMapKey_p->debug().c_str();
      else 
	out << "0";
      out << ",";
    } // end for 
    out << std::ends;
    return out.str();
  } // end of Symbol::debug

} // end of namespace 

