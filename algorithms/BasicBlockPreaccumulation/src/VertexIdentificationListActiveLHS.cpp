#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationListActiveLHS.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  VertexIdentificationListActiveLHS::ListItem::ListItem(const AliasMapKey& anAliasMapKey,
							const DuUdMapKey& aDuUdMapKey,
							PrivateLinearizedComputationalGraphVertex* aPrivateLinearizedComputationalGraphVertex_p,
							DuUdMap::StatementId aStatementId) : 
    VertexIdentificationListActive::ListItem(anAliasMapKey,
					     aDuUdMapKey,
					     aPrivateLinearizedComputationalGraphVertex_p),
    myStatementId(aStatementId) { 
  }

  VertexIdentificationListActiveLHS::IdentificationResult 
  VertexIdentificationListActiveLHS::canIdentify(const Variable& theVariable) const { 
    if (theVariable.getDuUdMapKey().getKind()!=DuUdMapKey::NO_INFO) { 
      DuUdMap::DuUdMapDefinitionResult theResult(ConceptuallyStaticInstances::instance()->
						 getCallGraph().getDuUdMap().definition(theVariable.getDuUdMapKey(),
											myStatementIdList));
      if (theResult.myAnswer==DuUdMap::UNIQUE_INSIDE) {
	for (ListItemPList::const_iterator aListIterator=myList.begin();
	     aListIterator!=myList.end(); 
	     ++aListIterator) { 
	  ListItem& theItem(dynamic_cast<ListItem&>(**aListIterator));
	  if (theResult.myStatementId==theItem.myStatementId) 
	    return IdentificationResult(UNIQUELY_IDENTIFIED,theItem.myPrivateLinearizedComputationalGraphVertex_p);
	} // end for
      } // end if
      else if (theResult.myAnswer==DuUdMap::UNIQUE_OUTSIDE
	       ||
	       theResult.myAnswer==DuUdMap::AMBIGUOUS_OUTSIDE) {
	return IdentificationResult(NOT_IDENTIFIED,0);
      }
      else if (theResult.myAnswer==DuUdMap::AMBIGUOUS_INSIDE
	       ||
	       theResult.myAnswer==DuUdMap::AMBIGUOUS_BOTHSIDES) {
	return IdentificationResult(AMBIGUOUSLY_IDENTIFIED,0);
      }
    }
    return VertexIdentificationListActive::canIdentify(theVariable);
  } 

  void VertexIdentificationListActiveLHS::addElement(const Variable& theVariable,
						     PrivateLinearizedComputationalGraphVertex* thePrivateLinearizedComputationalGraphVertex_p) { 
    if (canIdentify(theVariable).getAnswer()!=NOT_IDENTIFIED) 
      THROW_LOGICEXCEPTION_MACRO("VertexIdentificationListActive::addElement: new element must have a unique address");
    // this is a shortcut for the current duud numbering
    DuUdMap::StatementId theStatementId=(theVariable.getDuUdMapKey().getKind()==DuUdMapKey::SET)?theVariable.getDuUdMapKey().getKey():0;
    myList.push_back(new ListItem(theVariable.getAliasMapKey(),
				  theVariable.getDuUdMapKey(),
				  thePrivateLinearizedComputationalGraphVertex_p,
				  theStatementId));
    myAliasMapKeyList.push_back(&(theVariable.getAliasMapKey()));
    // this is a shortcut for the current duud numbering
    myStatementIdList.push_back(theStatementId);
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
    out << "VertexIdentificationListActiveLHS[" << this 
	<< ","
	<< VertexIdentificationListActive::debug().c_str()
	<< "myStatementIdList=";
    for (DuUdMap::StatementIdList::const_iterator aListIterator=myStatementIdList.begin();
	 aListIterator!=myStatementIdList.end(); 
	 ++aListIterator)
      out << "("
	  << *aListIterator
	  << ")";
    out << "]" 
	<< std::ends;
    return out.str();
  } // end of Symbol::debug

} // end of namespace 
