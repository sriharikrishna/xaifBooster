#ifndef _XAIFBOOSTERCODEREPLACEMENT_PRINTVERSION_INCLUDE_
#define _XAIFBOOSTERCODEREPLACEMENT_PRINTVERSION_INCLUDE_

#include <string>
#include "xaifBooster/utils/inc/PrintingIntException.hpp"

using namespace xaifBooster;

namespace xaifBoosterCodeReplacement { 

  /**
   * version of printing 
   * to be chosen
   */
  class PrintVersion { 

  public:
    
    enum PrintVersion_E {ORIGINAL,
			 AUGMENTED,
			 ADJOINT};

    static std::string toString(const PrintVersion_E& aKind) throw (PrintingIntException);

    static const PrintVersion_E fromString(const std::string& aName);
    
  }; // end of class PrintVersion

} 
                                                                     
#endif
