#ifndef _DBGGROUP_INCLUDE_
#define _DBGGROUP_INCLUDE_

#include <string>
#include "xaifBooster/utils/inc/PrintingIntException.hpp"

namespace xaifBooster { 

  /** 
   * enum class for categorizing debug 
   * messages created with DbgLoggerManager
   */
  class DbgGroup { 

  public:
    
    /**
     * enumeration setting bits in an integer 
     * for easy selection an combination of 
     * categories
     */
    enum DbgGroup_E {ERROR=0, // anything having to do with exceptions
		     WARNING=1, // some potentially dangerous step
		     CALLSTACK=2, // any message relating to entering/exiting a method
		     DATA=4, // any dumping of data
		     GRAPHICS=8, // anything producing graphic output 
		     TIMING=16, // anything producing a time stamp 
		     TEMPORARY=32}; // the rest of the messages that can be removed at any time

    static std::string toString(const DbgGroup_E& aKind) throw (PrintingIntException);
    
    static std::string printAll() throw (PrintingIntException);

  }; // end of class DbgGroup
  
} // end of namespace xaifBooster
                                                                     
#endif
