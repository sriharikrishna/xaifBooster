#ifndef _FORLOOPREVERSALTYPE_INCLUDE_
#define _FORLOOPREVERSALTYPE_INCLUDE_

#include <string>
#include "xaifBooster/utils/inc/PrintingIntException.hpp"

namespace xaifBooster { 
  class ForLoopReversalType { 
  public:
    enum ForLoopReversalType_E {EXPLICIT,
				ANONYMOUS};
    static std::string toString(const ForLoopReversalType_E& aType) throw (PrintingIntException);

    static const ForLoopReversalType_E fromString(const std::string& aName);
    
    static const std::string our_attribute_XAIFName;

  }; // end of class ForLoopReversalType

} // end of namespace xaifBooster
                                                                     
#endif
