#ifndef _DEBUGGABLE_INCLUDE_
#define _DEBUGGABLE_INCLUDE_

#include <string>

namespace xaifBooster { 

  /**
   *  an abstract base class for debugging
   */
  class Debuggable {
  public:

    Debuggable() {};

    virtual ~Debuggable() {};
    
    /** 
     * one line debug information of the object instance
     * without descend into the hierarchy. This should 
     * facilitate grep/awk through a large number of debugged 
     * instances. 
     */
    virtual std::string debug() const =0; 

  };  // end  of class Debuggable 

} // end of namespace xaifBooster
                                                                     
#endif

