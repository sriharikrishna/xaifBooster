#ifndef _HASHTABLE_INCLUDE_
#include "xaifBooster/utils/inc/HashTable.hpp"
#endif 

#include <sstream>
#include "xaifBooster/utils/inc/LogicException.hpp"


namespace xaifBooster { 

  template <class HashTableElement> 
  std::string 
  HashTable<HashTableElement>::debug() const {
    std::ostringstream out;
      out << "HashTable[" << this 
	  << ",#items=" << myHashMap.size() 
	  << "]" << std::ends; 
      return out.str();
  }; // end of HashTable::debug

  template <class HashTableElement> 
  const HashTableElement&
  HashTable<HashTableElement>::getElement(const std::string& aKey) const {
    typename InternalHashMapType::const_iterator theFinder=
      myHashMap.find(aKey);
    if(theFinder==myHashMap.end())
      THROW_LOGICEXCEPTION_MACRO("HashTable.getElement: no element with key >" 
			   << aKey.c_str() << "<");
    return (*theFinder).second;
  };

  template <class HashTableElement> 
  HashTableElement&
  HashTable<HashTableElement>::getElement(const std::string& aKey) {
    typename InternalHashMapType::iterator theFinder=
      myHashMap.find(aKey);
    if(theFinder==myHashMap.end())
      THROW_LOGICEXCEPTION_MACRO("HashTable.getElement: no element with key >" 
			   << aKey.c_str() << "<");
    return (*theFinder).second;
  };

  template <class HashTableElement> 
  bool
  HashTable<HashTableElement>::hasElement(const std::string& aKey) const {
    typename InternalHashMapType::const_iterator theFinder=
      myHashMap.find(aKey);
    return (theFinder!=myHashMap.end());
  };

  template <class HashTableElement> 
  void
  HashTable<HashTableElement>::addElement(std::string theKey,
					  const HashTableElement& theElement) { 
    typename InternalHashMapType::iterator myHashMap_iterator=
      myHashMap.find(theKey);
    if (myHashMap_iterator==myHashMap.end()) 
      myHashMap.insert(std::make_pair(theKey,theElement));
    else 
      THROW_LOGICEXCEPTION_MACRO("HashTable::addElement key >" 
			   << theKey.c_str()
			   << "< already exists");
  }; // end of HashTable<HashTableElement>::addElement

  template <class HashTableElement> 
  void 
  HashTable<HashTableElement>::removeElement(std::string theKey) { 
    myHashMap.erase(theKey);
  } 

} // end of namespace
