#ifndef _LOGICEXCEPTION_INCLUDE_
#define _LOGICEXCEPTION_INCLUDE_

#include <string>
#include "utils/inc/BaseException.hpp"

namespace xaifBooster { 

  /** 
   * class to be used for any generic exception
   * we expect complete failure upon any such exception
   * Exceptions that point to non-fatal problem 
   * should get their own type to allow selective 
   * handling by the calling environment
   */
  class LogicException : public BaseException { 

  public:

    /** 
     * param what should be one line, 
     * used in THROW_LOGICEXCEPTION_MACRO
     */
    LogicException(std::string aFileName,
		   int aLineNumber,
		   std::string what);
    ~LogicException(){};
  }; // end of class LogicException 
  
  /**
   * use of preprocessor defined __FILE__ and __LINE__ requires 
   * use of a macro. We have to define a strange name 
   * for local variables to avoid accidental name matching - 
   * the niceties of macros!
   * Note the enclosing {} allowing for 
   * if (...) 
   *   THROW_LOGICEXCEPTION_MACRO(...);
   * without extra brackets but the compiler will complain 
   * about 
   * if (...) { 
   *   THROW_LOGICEXCEPTION_MACRO(...);
   * } 
   * because it doesn't know what to do with the extra ';' in the end;
   * make your choice.
   * the  argument is an argument to an 
   * ostream << operator.
   */
#ifndef THROW_LOGICEXCEPTION_MACRO
#define THROW_LOGICEXCEPTION_MACRO(StreamArgs) \
   { \
     std::ostringstream aLoNgAnDwEiRdLoCaLnAmeFoRtHiSmAcRoOnLy; \
     aLoNgAnDwEiRdLoCaLnAmeFoRtHiSmAcRoOnLy << StreamArgs << std::ends; \
     throw LogicException(__FILE__,__LINE__,aLoNgAnDwEiRdLoCaLnAmeFoRtHiSmAcRoOnLy.str()); \
   }
#else
#error macro name for THROW_LOGICEXCEPTION_MACRO already in use
#endif

} // end of namespace xaifBooster
                                                                     
#endif
