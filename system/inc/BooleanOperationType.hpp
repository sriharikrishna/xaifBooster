#ifndef _BOOLEANOPERATIONTYPE_INCLUDE_
#define _BOOLEANOPERATIONTYPE_INCLUDE_

#include <string>
#include "xaifBooster/utils/inc/PrintingIntException.hpp"

namespace xaifBooster { 
  class BooleanOperationType { 
public:
    enum BooleanOperationType_E {LESS_THAN_OTYPE,
				 LESS_OR_EQUAL_OTYPE,
				 GREATER_THAN_OTYPE,
				 GREATER_OR_EQUAL_OTYPE,
				 EQUAL_OTYPE,
				 NOT_EQUAL_OTYPE};
    static std::string toString(const BooleanOperationType_E& aType) throw (PrintingIntException);

    static const BooleanOperationType_E fromString(const std::string& aName);
    
  }; // end of class BooleanOperationType

} // end of namespace xaifBooster
                                                                     
#endif
