#ifndef _ALIASSET_INCLUDE_
#define _ALIASSET_INCLUDE_

#include "utils/inc/XMLPrintable.hpp"
#include <list>

namespace xaifBooster{ 

  class BaseAlias;

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

  private:

    void addAlias(BaseAlias* anAlias);

    typedef std::list<BaseAlias*> AliasList;

    AliasList myAliasList;

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
