#include "utils/inc/BaseException.hpp"

namespace xaifBooster { 

  void BaseException::convertToOneLineReason(std::ostringstream& err) { 
    err << std::ends; 
    myReason=err.str(); 
  } // end of BaseException::convertToOneLineReason
  
} // end of namespace xaifBooster

