#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationList.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

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
    if (myAnswer!=UNIQUELY_IDENTIFIED ||
	!myPrivateLinearizedComputationalGraphVertex_p) 
      THROW_LOGICEXCEPTION_MACRO("VertexIdentificationList::addElement: vertex not uniquely identified");
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
    if (theAliasMap.isAliased(theVariable.getAliasMapKey(),
			      myAliasMapKeyList)) {
      // so there is potential 
      // try to find an exact match: 
      ListType::const_iterator aListIterator=myList.begin();
      for (;aListIterator!=myList.end(); ++aListIterator) { 
	if (theAliasMap.mustAlias(theVariable.getAliasMapKey(),
				  *((*aListIterator).myAliasMapKey_p))) 
	  return IdentificationResult(UNIQUELY_IDENTIFIED,(*aListIterator).myPrivateLinearizedComputationalGraphVertex_p);
      } // end for 
      return IdentificationResult(POSSIBLY_ALIASED,0);
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
      ListType::iterator aListIterator=myList.begin();
      for (;aListIterator!=myList.end(); ++aListIterator) { 
	if ((*aListIterator).myPrivateLinearizedComputationalGraphVertex_p==idResult.getVertexP()) { 
	  (*aListIterator).myPrivateLinearizedComputationalGraphVertex_p=thePrivateLinearizedComputationalGraphVertex_p;
	  break;
	} // end if 
      } // end for
    } // end else if
    else  
      THROW_LOGICEXCEPTION_MACRO("VertexIdentificationList::addElement: ambiguous identification, we should not be here");
  } 

} // end of namespace 

