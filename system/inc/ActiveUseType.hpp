#ifndef _ACTIVEUSETYPE_INCLUDE_
#define _ACTIVEUSETYPE_INCLUDE_

#include <string>
#include "xaifBooster/utils/inc/PrintingIntException.hpp"

namespace xaifBooster { 
  class ActiveUseType { 
public:
    enum ActiveUseType_E {ACTIVEUSE,
			  PASSIVEUSE,
			  UNDEFINEDUSE};
    static std::string toString(const ActiveUseType_E& aKind) throw (PrintingIntException);

    static const ActiveUseType_E fromString(const std::string& aName);
    
    static const std::string our_attribute_XAIFName;

  }; // end of class ActiveUseType

} // end of namespace xaifBooster
                                                                     
#endif
