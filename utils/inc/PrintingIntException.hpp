#ifndef _PRINTINGINTEXCEPTION_INCLUDE_
#define _PRINTINGINTEXCEPTION_INCLUDE_

#include "utils/inc/BaseException.hpp"

namespace xaifBooster { 

  /** 
   * as the name says we have some printing problem 
   * here which may be a non-fatal error, hence the
   * separate exception class 
   */
  class PrintingIntException : public BaseException { 

  public:

    /** 
     * param what should be one line
     * param aValue the int value for which we have some exception
     */
    PrintingIntException(std::string what, int aValue);

    ~PrintingIntException(){};

  }; // end of class PrintingException 
  
} // end of namespace xaifBooster
                                                                     
#endif
