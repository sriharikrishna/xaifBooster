#include "utils/inc/PrintingIntException.hpp"

namespace xaifBooster { 

  PrintingIntException::PrintingIntException(std::string what, 
					     int aValue) { 
    std::ostringstream reason;
    reason << "PrintingIntException: " << what << " (" << aValue << ")";
    convertToOneLineReason(reason);
  } // end of PrintingIntException::PrintingIntException
  
} // end of namespace xaifBooster
                                                                     


