#ifndef _PARTIALDERIVATIVEKIND_INCLUDE_
#define _PARTIALDERIVATIVEKIND_INCLUDE_

#include <string>
#include "xaifBooster/utils/inc/PrintingIntException.hpp"

namespace xaifBooster { 
  class PartialDerivativeKind { 
public:
    enum PartialDerivativeKind_E {PASSIVE,
				  LINEAR_ONE,
				  LINEAR_MINUS_ONE,
				  LINEAR,
				  NONLINEAR};
    static std::string toString(const PartialDerivativeKind_E& aKind) throw (PrintingIntException);

    static const PartialDerivativeKind_E fromString(const std::string& aName);
    
    static const std::string our_attribute_XAIFName;

  }; // end of class PartialDerivativeKind

} // end of namespace xaifBooster
                                                                     
#endif
