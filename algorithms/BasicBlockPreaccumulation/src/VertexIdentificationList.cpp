#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationList.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  VertexIdentificationList::VertexIdentificationList() { 
  } 

  VertexIdentificationList::~VertexIdentificationList() {
    for (ListItemPList::iterator i=myList.begin();
	 i!=myList.end();
	 ++i) { 
      if (*i)
	delete *i;
    }
  } 

  std::string VertexIdentificationList::debug () const { 
    std::ostringstream out;
    out << "VertexIdentificationList[" 
	<< this
	<< ","
	<< "myList=";
    for (ListItemPList::const_iterator aListIterator=myList.begin();
	 aListIterator!=myList.end(); 
	 ++aListIterator)
      out << "("
	  << (*aListIterator)->debug().c_str()
	  << ")";
    out << "]" 
	<< std::ends;
    return out.str();
  } // end of Symbol::debug

  VertexIdentificationList::ListItem::ListItem(const AliasMapKey& anAliasMapKey,
					       const DuUdMapKey& aDuUdMapKey) : 
    myAliasMapKey(anAliasMapKey),
    myDuUdMapKey(aDuUdMapKey) {
  }
  
  const AliasMapKey& VertexIdentificationList::ListItem::getAliasMapKey() const {
    return myAliasMapKey;
  }
   
  const DuUdMapKey& VertexIdentificationList::ListItem::getDuUdMapKey() const { 
    return myDuUdMapKey;
  }

  std::string VertexIdentificationList::ListItem::debug() const { 
    std::ostringstream out;
    out << "VertexIdentificationList::ListItem[" 
	<< this
	<< ","
	<< "myAliasMapKey="
	<< myAliasMapKey.debug().c_str()
	<< ","
	<< "myDuUdMapKey="
	<< myDuUdMapKey.debug().c_str()
	<< "]" 
	  << std::ends;
    return out.str();
  }

} // end of namespace 

