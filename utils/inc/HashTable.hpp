#ifndef _HASHTABLE_INCLUDE_
#define _HASHTABLE_INCLUDE_

#include <string>
#include <map>

#include "Debuggable.hpp"

namespace xaifBooster { 

  template <class HashTableElement> 
  class HashTable : virtual public Debuggable {
  public:

    HashTable() {};

    ~HashTable() {};

    virtual std::string debug() const;

    bool hasElement(const std::string& aKey) const;

    HashTableElement& getElement(const std::string& aKey);
    const HashTableElement& getElement(const std::string& aKey) const;

    void addElement(std::string theKey,
		    const HashTableElement& theElement);

    void removeElement(std::string theKey);

  protected:
    
    struct myLtOp;

    typedef
    std::map<std::string, 
	     HashTableElement, 
	     myLtOp> InternalHashMapType;
    InternalHashMapType myHashMap; 
    
    struct myLtOp {
      bool operator()(const std::string s1, const std::string s2) const {
	return (s1<s2);
      }
    };

  }; // end of class HashTable

} // end of namespace 

#include "xaifBooster/utils/inc/TemplateImpl/HashTable.cpp" 

#endif
