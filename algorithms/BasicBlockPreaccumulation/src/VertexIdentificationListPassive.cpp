#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationListPassive.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  VertexIdentificationListPassive::VertexIdentificationListPassive() { 
  } 

  VertexIdentificationListPassive::ListItem::ListItem(const AliasMapKey& anAliasMapKey,
						      const DuUdMapKey& aDuUdMapKey,
						      const ObjectWithId::Id& aStatementId) : 
    VertexIdentificationList::ListItem(anAliasMapKey,
				       aDuUdMapKey),
    myStatementId(aStatementId) { 
  }

  std::string VertexIdentificationListPassive::ListItem::debug() const { 
    std::ostringstream out;
    out << "VertexIdentificationListPassive::ListItem[" 
	<< this
	<< ","
	<< VertexIdentificationList::ListItem::debug().c_str()
	<< "myStatementId="
	<< myStatementId.c_str()
	<< "]" 
	<< std::ends;
    return out.str();
  }

  VertexIdentificationList::IdentificationResult_E 
  VertexIdentificationListPassive::canIdentify(const Variable& theVariable) const { 
    IdentificationResult_E result=NOT_IDENTIFIED;
    if (theVariable.getDuUdMapKey().getKind()!=DuUdMapKey::NO_INFO) { 
      DuUdMapDefinitionResult::StatementIdList aStatementIdList;
      getStatementIdList(aStatementIdList);
      DuUdMapDefinitionResult theResult(ConceptuallyStaticInstances::instance()->
					getCallGraph().getDuUdMap().definition(theVariable.getDuUdMapKey(),
									       aStatementIdList));
      // either one or more LHSs of passive statements that we have in the list
      // means this one is guaranteed to be passive too
      if (theResult.myAnswer==DuUdMapDefinitionResult::UNIQUE_INSIDE
	  ||
	  theResult.myAnswer==DuUdMapDefinitionResult::AMBIGUOUS_INSIDE) {
	result=UNIQUELY_IDENTIFIED;
      }
      // else we can't be sure 
      else { 
	result=AMBIGUOUSLY_IDENTIFIED;
      }
    }
    // have to rely on alias information:
    else { 
      AliasMap& theAliasMap(ConceptuallyStaticInstances::instance()->
			    getCallGraph().getAliasMap());
      AliasMap::AliasMapKeyPList anAliasMapKeyPList;
      getAliasMapKeyPList(anAliasMapKeyPList);
      if (anAliasMapKeyPList.empty()) 
	result=NOT_IDENTIFIED;
      else if (theAliasMap.subSet(theVariable.getAliasMapKey(),
				  anAliasMapKeyPList)) 
	result=UNIQUELY_IDENTIFIED;
      else 
	result=AMBIGUOUSLY_IDENTIFIED;
    } // end else (look at alias information) 
    return result;
  } 

  void VertexIdentificationListPassive::addElement(const Variable& theVariable,
						   const ObjectWithId::Id& aStatementId) { 
    if (canIdentify(theVariable)==UNIQUELY_IDENTIFIED) 
      return; 
    myList.push_back(new ListItem(theVariable.getAliasMapKey(),
				  theVariable.getDuUdMapKey(),
				  aStatementId));
  } 

  void VertexIdentificationListPassive::removeIfIdentifiable(const Variable& theVariable) { 
    if (theVariable.getDuUdMapKey().getKind()!=DuUdMapKey::NO_INFO) { 
      DuUdMapDefinitionResult::StatementIdList aStatementIdList;
      getStatementIdList(aStatementIdList);
      DuUdMapDefinitionResult theResult(ConceptuallyStaticInstances::instance()->
					getCallGraph().getDuUdMap().definition(theVariable.getDuUdMapKey(),
									       aStatementIdList));
      while (theResult.myAnswer==DuUdMapDefinitionResult::UNIQUE_INSIDE 
	     ||
	     theResult.myAnswer==DuUdMapDefinitionResult::AMBIGUOUS_INSIDE
	     ||
	     theResult.myAnswer==DuUdMapDefinitionResult::AMBIGUOUS_BOTHSIDES) { 
	for (ListItemPList::iterator aListIterator(myList.begin());
	     aListIterator!=myList.end(); 
	     ++aListIterator) { 
	  if (theResult.myStatementId==(dynamic_cast<ListItem&>(**aListIterator)).myStatementId) { 
	    myList.erase(aListIterator);
	    break;
	  }
	} // end for 
	getStatementIdList(aStatementIdList);
	theResult=ConceptuallyStaticInstances::instance()->
	  getCallGraph().getDuUdMap().definition(theVariable.getDuUdMapKey(),
						 aStatementIdList);
      } // end while
    }
    // have to rely on alias information:
    else { 
      AliasMap& theAliasMap(ConceptuallyStaticInstances::instance()->
			    getCallGraph().getAliasMap());
      IdentificationResult_E idResult(canIdentify(theVariable));
      while(idResult!=NOT_IDENTIFIED) { 
	for (ListItemPList::iterator aListIterator(myList.begin());
	     aListIterator!=myList.end(); 
	     ++aListIterator) { 
	  if (theAliasMap.mayAlias(theVariable.getAliasMapKey(),
				   (*aListIterator)->getAliasMapKey())) { 
	    myList.erase(aListIterator);
	    break;
	  }
	} // end for 
	idResult=canIdentify(theVariable);
      } // end while 
    } // end else 
  } 

  std::string VertexIdentificationListPassive::debug () const { 
    std::ostringstream out;
    out << "VertexIdentificationListPassive[" 
	<< this 
	<< VertexIdentificationList::debug().c_str()
	<< "]"
	<< std::ends;
    return out.str();
  } 

  void VertexIdentificationListPassive::getStatementIdList(DuUdMapDefinitionResult::StatementIdList& aStatementIdList)const { 
    for (ListItemPList::const_iterator aListIterator=myList.begin();
	 aListIterator!=myList.end(); 
	 ++aListIterator) { 
      aStatementIdList.push_back((dynamic_cast<ListItem&>(**aListIterator)).myStatementId);
    }
  } 

} // end of namespace 

