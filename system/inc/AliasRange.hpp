#ifndef _ALIASRANGE_INCLUDE_
#define _ALIASRANGE_INCLUDE_

#include "xaifBooster/system/inc/BaseAlias.hpp"

namespace xaifBooster{ 

  /**
   * Base class to hold alias information 
   */
  class AliasRange : public BaseAlias { 
    
  public: 
  
    AliasRange(unsigned int lower,
	       unsigned int upper);
 
    virtual ~AliasRange(){};

    virtual std::string debug() const;

    virtual void printXMLHierarchy(std::ostream& os) const; 

    /**
     * name as specified in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name of member myLower/UpperAddress 
     * as specified in XAIF schema
     */
    static const std::string our_myLowerAddress_XAIFName;
    static const std::string our_myUpperAddress_XAIFName;

  private:

    unsigned int myLowerAddress;
    unsigned int myUpperAddress;

    virtual unsigned int max() const;
    virtual unsigned int min() const;

    virtual void max(unsigned int);
    virtual void min(unsigned int);
    
    /**
     * no def
     */
    AliasRange();

    /**
     * no def
     */
    AliasRange(const AliasRange&);

    /**
     * no def
     */
    AliasRange operator=(const AliasRange&);
    
  }; // end of class AliasRange

} // end of namespace xaifBooster

#endif
