#ifndef _ALIASSET_INCLUDE_
#define _ALIASSET_INCLUDE_

#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include <list>

namespace xaifBooster{ 

  class AliasRange;

  /**
   * class to hold an alias sets 
   */
  class AliasSet : public XMLPrintable { 
    
  public: 
  
    AliasSet(); 
 
    ~AliasSet();

    std::string debug() const ; 

    void printXMLHierarchy(std::ostream& os) const; 

    void addAlias(unsigned int address);

    void addAlias(unsigned int lower,
		  unsigned int upper);

    bool sharesAliasWith(const AliasSet& anotherSet) const;

    bool mustAlias(const AliasSet& anotherSet) const;

    bool subSetOf(const AliasSet& anotherSet) const;

    typedef std::list<AliasRange*> AliasRangePList;

    const AliasRangePList& getAliasRangePList() const;

  private:

    AliasRangePList myAliasRangePList;

    /**
     * no def
     */
    AliasSet(const AliasSet&);

    /**
     * no def
     */
    AliasSet operator=(const AliasSet&);
    
  }; // end of class AliasSet

} // end of namespace xaifBooster

#endif
