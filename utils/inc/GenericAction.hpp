
#ifndef _GENERICACTION_INCLUDE_
#define _GENERICACTION_INCLUDE_

#include <string>
#include "utils/inc/PrintingIntException.hpp"

namespace xaifBooster { 

  /** 
   * enum class to identify an action
   * to be performed by an algorithm.
   */
  class GenericAction { 
public:

    enum GenericAction_E {ALGORITHM_INIT,
			  ALGORITHM_ACTION_1,
			  ALGORITHM_ACTION_2};

    static std::string toString(const GenericAction_E& anAction) throw (PrintingIntException);

    static const GenericAction_E fromString(const std::string& aName);
    
    static const std::string our_attribute_XAIFName;

  }; // end of class GenericAction

} // end of namespace xaifBooster
                                                                     
#endif
