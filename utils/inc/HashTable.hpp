#ifndef _HASHTABLE_INCLUDE_
#define _HASHTABLE_INCLUDE_

#ifdef __GNUC__
#if __GNUC__ < 3
#include <hash_map.h>
namespace Sgi { using ::hash_map; }; // inherit globals
#else
#include <ext/hash_map>
#if __GNUC_MINOR__ == 0
namespace Sgi = std;               // GCC 3.0
#else
namespace Sgi = ::__gnu_cxx;       // GCC 3.1 and later
#endif
#endif
#else      // ...  there are other compilers, right?
namespace Sgi = std;
#endif

#include <string>

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
    
    struct myHash;
    struct myEqual;

    typedef
    Sgi::hash_map<const std::string, 
		  HashTableElement, 
		  myHash, 
		  myEqual> InternalHashMapType;
    InternalHashMapType myHashMap; 

  private:

    struct myHash{
      std::size_t operator()(const std::string __s) const { 
	return Sgi::__stl_hash_string(__s.c_str()); 
      };
    };
    
    struct myEqual {
      bool operator()(const std::string s1, const std::string s2) const {
	return (s1==s2);
      }
    };

  }; // end of class HashTable

} // end of namespace 

#include "xaifBooster/utils/inc/TemplateImpl/HashTable.cpp" 

#endif
