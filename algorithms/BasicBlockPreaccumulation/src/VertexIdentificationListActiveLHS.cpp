#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationListActiveLHS.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  VertexIdentificationListActiveLHS::ListItem::ListItem(const AliasMapKey& anAliasMapKey,
							const DuUdMapKey& aDuUdMapKey,
							PrivateLinearizedComputationalGraphVertex* aPrivateLinearizedComputationalGraphVertex_p,
							const ObjectWithId::Id& aStatementId) : 
    VertexIdentificationListActive::ListItem(anAliasMapKey,
					     aDuUdMapKey,
					     aPrivateLinearizedComputationalGraphVertex_p), myStatementId(aStatementId) {
 
  }

  VertexIdentificationListActiveLHS::IdentificationResult 
  VertexIdentificationListActiveLHS::canIdentify(const Variable& theVariable) const { 
    if (isDuUdMapBased() 
	&& 
	theVariable.getDuUdMapKey().getKind()!=DuUdMapKey::NO_INFO) { 
      DuUdMapDefinitionResult::StatementIdList aStatementIdList;
      getStatementIdList(aStatementIdList);
      DuUdMapDefinitionResult theResult(ConceptuallyStaticInstances::instance()->
					getCallGraph().getDuUdMap().definition(theVariable.getDuUdMapKey(),
									       aStatementIdList));
      if (theResult.myAnswer==DuUdMapDefinitionResult::UNIQUE_INSIDE) {
	for (ListItemPList::const_iterator aListIterator=myList.begin();
	     aListIterator!=myList.end(); 
	     ++aListIterator) { 
	  ListItem& theItem(dynamic_cast<ListItem&>(**aListIterator));
	  if (theResult.myStatementId==theItem.myStatementId) 
	    return IdentificationResult(UNIQUELY_IDENTIFIED,theItem.myPrivateLinearizedComputationalGraphVertex_p);
	} // end for
	// we are in trouble 
	THROW_LOGICEXCEPTION_MACRO("VertexIdentificationListActiveLHS::canIdentify: cannot match statement for "
				   << theResult.myStatementId 
				   << " in " 
				   << debug().c_str());
      } // end if
      else if (theResult.myAnswer==DuUdMapDefinitionResult::UNIQUE_OUTSIDE
	       ||
	       theResult.myAnswer==DuUdMapDefinitionResult::AMBIGUOUS_OUTSIDE) {
	return IdentificationResult(NOT_IDENTIFIED,0);
      }
      else if (theResult.myAnswer==DuUdMapDefinitionResult::AMBIGUOUS_INSIDE
	       ||
	       theResult.myAnswer==DuUdMapDefinitionResult::AMBIGUOUS_BOTHSIDES) {
	return IdentificationResult(AMBIGUOUSLY_IDENTIFIED,0);
      }
    }
    if (!isDuUdMapBased()){ 
      return VertexIdentificationListActive::canIdentify(theVariable);
    }
    return IdentificationResult(AMBIGUOUSLY_IDENTIFIED,0);
  } 

  void VertexIdentificationListActiveLHS::addElement(const Variable& theVariable,
						     PrivateLinearizedComputationalGraphVertex* thePrivateLinearizedComputationalGraphVertex_p,
						     const ObjectWithId::Id& aStatementId) { 
    if (theVariable.getDuUdMapKey().getKind()!=DuUdMapKey::NO_INFO) 
      // if we ever encounter a usefull piece of duud information:
      baseOnDuUdMap();
    if (!isDuUdMapBased() 
	&& 
	canIdentify(theVariable).getAnswer()!=NOT_IDENTIFIED) 
      THROW_LOGICEXCEPTION_MACRO("VertexIdentificationListActive::addElement: new element must have a unique address");
    myList.push_back(new ListItem(theVariable.getAliasMapKey(),
     				  theVariable.getDuUdMapKey(),
     				  thePrivateLinearizedComputationalGraphVertex_p,
     				  aStatementId));
  } 

  std::string VertexIdentificationListActiveLHS::ListItem::debug() const { 
    std::ostringstream out;
    out << "VertexIdentificationListActiveLHS::ListItem[" 
	<< this
	<< ","
	<< VertexIdentificationListActive::ListItem::debug().c_str()
	<< "myStatementId="
	<< myStatementId
	<< "]" 
	<< std::ends;
    return out.str();
  }

  std::string VertexIdentificationListActiveLHS::debug () const { 
    std::ostringstream out;
    out << "VertexIdentificationListActiveLHS[" 
	<< this 
	<< ","
	<< VertexIdentificationListActive::debug().c_str()
	<< "]" 
	<< std::ends;
    return out.str();
  } 

  void VertexIdentificationListActiveLHS::getStatementIdList(DuUdMapDefinitionResult::StatementIdList& aStatementIdList)const { 
    for (ListItemPList::const_iterator aListIterator=myList.begin();
	 aListIterator!=myList.end(); 
	 ++aListIterator) { 
      aStatementIdList.push_back((dynamic_cast<ListItem&>(**aListIterator)).myStatementId);
    }
  } 

} // end of namespace 
