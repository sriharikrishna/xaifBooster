#ifndef _BASEEXCEPTION_INCLUDE_
#define _BASEEXCEPTION_INCLUDE_
// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

#include <sstream>
#include <string>

namespace xaifBooster { 

  /** 
   * base class for any exception thrown 
   * by xaifbooster
   */
  class BaseException { 
  public:
    
    /** 
     * a one line reason text for the exception
     */
    std::string getReason() const {return myReason;};

    virtual ~BaseException(){};

  protected:

    /** 
     * to be used by the derived classes
     * for convenience with a stream to avoid 
     * explicit conversions
     */
    void convertToOneLineReason(std::ostringstream& err);

    BaseException(){};

  private:

    /** 
     * a one liner for the reason
     */
    std::string myReason;

  }; // end of class PrintingException 

} // end of namespace xaifBooster
                                                                     
#endif
