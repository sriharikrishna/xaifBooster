#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationList.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  VertexIdentificationList::VertexIdentificationList() { 
  } 

  VertexIdentificationList::IdentificationResult::IdentificationResult(IdentificationResult_E anAnswer,
								       const PrivateLinearizedComputationalGraphVertex* aPrivateLinearizedComputationalGraphVertex_p) : 
    myAnswer(anAnswer),
    myPrivateLinearizedComputationalGraphVertex_p(aPrivateLinearizedComputationalGraphVertex_p) { 
  }

  VertexIdentificationList::IdentificationResult_E
  VertexIdentificationList::IdentificationResult::getAnswer() const { 
    return myAnswer;
  } 

  const PrivateLinearizedComputationalGraphVertex*
  VertexIdentificationList::IdentificationResult::getVertexP() const { 
    if (myAnswer==NOT_IDENTIFIED ||
	!myPrivateLinearizedComputationalGraphVertex_p) 
      THROW_LOGICEXCEPTION_MACRO("VertexIdentificationList::getVertexP: vertex not uniquely identified");
    return myPrivateLinearizedComputationalGraphVertex_p;
  } 

  VertexIdentificationList::ListItem::ListItem() : 
    myPrivateLinearizedComputationalGraphVertex_p(0),
    myAliasMapKey_p(0) { 
  }

  VertexIdentificationList::IdentificationResult 
  VertexIdentificationList::canIdentify(const Variable& theVariable) const { 
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

  void VertexIdentificationList::addElement(const Variable& theVariable,
					    const PrivateLinearizedComputationalGraphVertex* thePrivateLinearizedComputationalGraphVertex_p) { 
    // add a block dealing with ud info
    // *******************************
    // TODO: JU incomplete
    // *******************************
    // here is the block dealing with alias info
    if (canIdentify(theVariable).getAnswer()!=NOT_IDENTIFIED) 
      THROW_LOGICEXCEPTION_MACRO("VertexIdentificationList::addElement: new element must have a unique address");
    ListItem theItem;
    theItem.myPrivateLinearizedComputationalGraphVertex_p=thePrivateLinearizedComputationalGraphVertex_p;
    theItem.myAliasMapKey_p=&(theVariable.getAliasMapKey());
    myList.push_back(theItem);
    myAliasMapKeyList.push_back(&(theVariable.getAliasMapKey()));
  } 

  void VertexIdentificationList::replaceOrAddElement(const Variable& theVariable,
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
      THROW_LOGICEXCEPTION_MACRO("VertexIdentificationList::addElement: ambiguous identification, we should not be here");
  } 

  void VertexIdentificationList::removeIfAliased(const Variable& theVariable) { 
    // add a block dealing with ud info
    // *******************************
    // TODO: JU incomplete
    // *******************************
    // here is the block dealing with alias info
    IdentificationResult idResult(canIdentify(theVariable));
    while(idResult.getAnswer()!=NOT_IDENTIFIED) { 
      for (ListType::iterator aListIterator=myList.begin();
	   aListIterator!=myList.end(); 
	   ++aListIterator) { 
	if ((*aListIterator).myPrivateLinearizedComputationalGraphVertex_p==idResult.getVertexP()) { 
	  myList.erase(aListIterator);
	  break;
	} // end if 
      } // end for
      idResult=canIdentify(theVariable);
    } // end while 
  } 

  std::string VertexIdentificationList::debug () const { 
    std::ostringstream out;
    out << "VertexIdentificationList[" << this 
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

