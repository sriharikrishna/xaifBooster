#ifndef _DUUDMAPENTRY_INCLUDE_
#define _DUUDMAPENTRY_INCLUDE_

#include "xaifBooster/utils/inc/XMLPrintable.hpp"


namespace xaifBooster{ 

  /**
   * \todo is incomplete
   */
  class DuUdMapEntry { 
    
  public: 
  
    DuUdMapEntry(unsigned int theKey) : 
      myKey(theKey) {}; 
 
    ~DuUdMapEntry(){};

  private:

    /**
     * keys start with 1
     * in XAIF schema the default is 0 
     * but does not have an instance in 
     * DuUdMap
     */
    const unsigned int myKey;

    /**
     * no def
     */
    DuUdMapEntry();

    /**
     * no def
     */
    DuUdMapEntry(const DuUdMapEntry&);

    /**
     * no def
     */
    DuUdMapEntry operator=(const DuUdMapEntry&);
    
  }; // end of class DuUdMapEntry

} // end of namespace xaifBooster

#endif
