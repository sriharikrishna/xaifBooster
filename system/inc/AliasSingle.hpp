#ifndef _ALIASSINGLE_INCLUDE_
#define _ALIASSINGLE_INCLUDE_

#include "xaifBooster/system/inc/BaseAlias.hpp"

namespace xaifBooster{ 

  /**
   * Base class to hold alias information 
   */
  class AliasSingle : public BaseAlias { 
    
  public: 
  
    AliasSingle(unsigned int anAddress): 
      myAddress(anAddress) {}; 
 
    virtual ~AliasSingle(){};

    virtual std::string debug() const;

    virtual void printXMLHierarchy(std::ostream& os) const; 

    /**
     * name as specified in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name of member myAddress as specified in XAIF schema
     */
    static const std::string our_myAddress_XAIFName;

  private:

    const unsigned int myAddress;

    virtual unsigned int max() const;
    virtual unsigned int min() const;

    virtual void max(unsigned int);
    virtual void min(unsigned int);
    
    /**
     * no def
     */
    AliasSingle();

    /**
     * no def
     */
    AliasSingle(const AliasSingle&);

    /**
     * no def
     */
    AliasSingle operator=(const AliasSingle&);
    
  }; // end of class AliasSingle

} // end of namespace xaifBooster

#endif
