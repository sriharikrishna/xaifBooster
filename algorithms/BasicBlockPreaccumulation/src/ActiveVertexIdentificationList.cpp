#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/ActiveVertexIdentificationList.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  ActiveVertexIdentificationList::ActiveVertexIdentificationList() { 
  } 

  ActiveVertexIdentificationList::IdentificationResult::IdentificationResult(IdentificationResult_E anAnswer,
									     const PrivateLinearizedComputationalGraphVertex* aPrivateLinearizedComputationalGraphVertex_p) : 
    myAnswer(anAnswer),
    myPrivateLinearizedComputationalGraphVertex_p(aPrivateLinearizedComputationalGraphVertex_p) { 
  }

  VertexIdentificationList::IdentificationResult_E
  ActiveVertexIdentificationList::IdentificationResult::getAnswer() const { 
    return myAnswer;
  } 

  const PrivateLinearizedComputationalGraphVertex*
  ActiveVertexIdentificationList::IdentificationResult::getVertexP() const { 
    if (myAnswer==NOT_IDENTIFIED ||
	!myPrivateLinearizedComputationalGraphVertex_p) 
      THROW_LOGICEXCEPTION_MACRO("ActiveVertexIdentificationList::getVertexP: vertex not uniquely identified");
    return myPrivateLinearizedComputationalGraphVertex_p;
  } 

  ActiveVertexIdentificationList::ListItem::ListItem() : 
    myPrivateLinearizedComputationalGraphVertex_p(0) { 
  }

  ActiveVertexIdentificationList::IdentificationResult 
  ActiveVertexIdentificationList::canIdentify(const Variable& theVariable) const { 
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
	  return IdentificationResult(UNIQUELY_IDENTIFIED,(*aListIterator).myPrivateLinearizedComputationalGraphVertex_p);
	if (theAliasMap.mayAlias(theVariable.getAliasMapKey(),
				 *((*aListIterator).myAliasMapKey_p))) 
	  return IdentificationResult(POSSIBLY_ALIASED,(*aListIterator).myPrivateLinearizedComputationalGraphVertex_p);
      } // end for 
    } // end if aliased
    return IdentificationResult(NOT_IDENTIFIED,0);
  } 

  void ActiveVertexIdentificationList::addElement(const Variable& theVariable,
						  const PrivateLinearizedComputationalGraphVertex* thePrivateLinearizedComputationalGraphVertex_p) { 
    // add a block dealing with ud info
    // *******************************
    // TODO: JU incomplete
    // *******************************
    // here is the block dealing with alias info
    if (canIdentify(theVariable).getAnswer()!=NOT_IDENTIFIED) 
      THROW_LOGICEXCEPTION_MACRO("ActiveVertexIdentificationList::addElement: new element must have a unique address");
    ListItem theItem;
    theItem.myPrivateLinearizedComputationalGraphVertex_p=thePrivateLinearizedComputationalGraphVertex_p;
    theItem.myAliasMapKey_p=&(theVariable.getAliasMapKey());
    myList.push_back(theItem);
    myAliasMapKeyList.push_back(&(theVariable.getAliasMapKey()));
  } 

  void ActiveVertexIdentificationList::replaceOrAddElement(const Variable& theVariable,
							   const PrivateLinearizedComputationalGraphVertex* thePrivateLinearizedComputationalGraphVertex_p) { 
    // add a block dealing with ud info
    // *******************************
    // TODO: JU incomplete
    // *******************************
    // here is the block dealing with alias info
    IdentificationResult idResult(canIdentify(theVariable));
    if (idResult.getAnswer()==NOT_IDENTIFIED) 
      addElement(theVariable,
		 thePrivateLinearizedComputationalGraphVertex_p);
    else if (idResult.getAnswer()==UNIQUELY_IDENTIFIED) { 
      for (ListType::iterator aListIterator=myList.begin();
	   aListIterator!=myList.end(); 
	   ++aListIterator) { 
	if ((*aListIterator).myPrivateLinearizedComputationalGraphVertex_p==idResult.getVertexP()) { 
	  (*aListIterator).myPrivateLinearizedComputationalGraphVertex_p=thePrivateLinearizedComputationalGraphVertex_p;
	  break;
	} // end if 
      } // end for
    } // end else if
    else  
      THROW_LOGICEXCEPTION_MACRO("ActiveVertexIdentificationList::addElement: ambiguous identification, we should not be here");
  } 

  void ActiveVertexIdentificationList::removeIfAliased(const Variable& theVariable) { 
    // add a block dealing with ud info
    // *******************************
    // TODO: JU incomplete
    // *******************************
    // here is the block dealing with alias info
    IdentificationResult idResult(canIdentify(theVariable));
    while(idResult.getAnswer()!=NOT_IDENTIFIED) { 
      ListType::iterator aListIterator=myList.begin();
      AliasMap::AliasMapKeyList::iterator aKeyListIterator=myAliasMapKeyList.begin();
      for (;
	   aListIterator!=myList.end(); 
	   ++aListIterator,
	     ++aKeyListIterator) { 
	if ((*aListIterator).myPrivateLinearizedComputationalGraphVertex_p==idResult.getVertexP()) { 
	  myAliasMapKeyList.erase(aKeyListIterator);
	  myList.erase(aListIterator);
	  break;
	} // end if 
      } // end for
      idResult=canIdentify(theVariable);
    } // end while 
  } 

  std::string ActiveVertexIdentificationList::debug () const { 
    std::ostringstream out;
    out << "ActiveVertexIdentificationList[" << this 
	<< ",myList=";  
    for (ListType::const_iterator aListIterator=myList.begin();
	 aListIterator!=myList.end(); 
	 ++aListIterator) { 
      out << "("
	  << (*aListIterator).myPrivateLinearizedComputationalGraphVertex_p
	  << ",";
      if ((*aListIterator).myAliasMapKey_p)
	out << (*aListIterator).myAliasMapKey_p->debug().c_str();
      else 
	out << "0";
      out << ")";
    } // end for 
    out << std::ends;
    return out.str();
  } // end of Symbol::debug

} // end of namespace 

