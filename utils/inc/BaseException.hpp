#ifndef _BASEEXCEPTION_INCLUDE_
#define _BASEEXCEPTION_INCLUDE_

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
