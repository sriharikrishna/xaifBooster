#ifndef _INTENTTYPE_INCLUDE_
#define _INTENTTYPE_INCLUDE_

#include <string>
#include "utils/inc/PrintingIntException.hpp"

namespace xaifBooster { 
  class IntentType { 
  public:
    enum IntentType_E {IN_ITYPE,
		       OUT_ITYPE,
		       INOUT_ITYPE};
    static std::string toString(const IntentType_E& aType) throw (PrintingIntException);

    static const IntentType_E fromString(const std::string& aName);
    
    static const std::string our_attribute_XAIFName;

  }; // end of class IntentType

} // end of namespace xaifBooster
                                                                     
#endif
