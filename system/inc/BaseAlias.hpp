#ifndef _BASEALIAS_INCLUDE_
#define _BASEALIAS_INCLUDE_

#include "xaifBooster/utils/inc/XMLPrintable.hpp"

namespace xaifBooster{ 

  /**
   * Base class to hold alias information 
   */
  class BaseAlias : public XMLPrintable { 
    
  public: 
  
    BaseAlias(){}; 
 
    virtual ~BaseAlias(){};

    //    virtual std::string debug() const ;

    //    virtual void printXMLHierarchy(std::ostream& os) const; 

    /**
     * almost operator '>' like but didn't 
     * use operator since people could 
     * epxect them to behave differently
     */
    bool isGreaterThan(const BaseAlias&) const;

    /**
     * returns true for containment or 
     * equality
     */
    bool isContainedIn(const BaseAlias&) const;

    /**
     * returns true for overlap but no containment
     */
    bool overlapsWith(const BaseAlias&) const;

    /**
     * creates the union of two truly overlapping BaseAliases 
     */
    void add(const BaseAlias&);

  private:

    virtual unsigned int max() const =0;
    virtual unsigned int min() const =0;

    virtual void max(unsigned int)=0;
    virtual void min(unsigned int)=0;
    
    /**
     * no def
     */
    BaseAlias(const BaseAlias&);

    /**
     * no def
     */
    BaseAlias& operator=(const BaseAlias&);
    
  }; // end of class BaseAlias

} // end of namespace xaifBooster

#endif
