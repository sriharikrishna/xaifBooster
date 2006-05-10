#ifndef _UNDEFINEDSUBROUTINEEXCEPTION_INCLUDE_
#define _UNDEFINEDSUBROUTINEEXCEPTION_INCLUDE_

#include "xaifBooster/utils/inc/LogicException.hpp"

namespace xaifBooster { 

  /** 
   * specific exception to be thrown in cases of a
   * reference to a subroutine that cannot 
   * be found in the call graph, i.e. is not defined
   */
  class UndefinedSubroutineException : public LogicException { 

  public:

    /** 
     * param what should be one line, 
     */
    UndefinedSubroutineException(std::string aFileName,
				 int aLineNumber,
				 std::string what);
    ~UndefinedSubroutineException(){};
  }; // end of class UndefinedSubroutineException 

} // end of namespace xaifBooster
                                                                     
#endif
