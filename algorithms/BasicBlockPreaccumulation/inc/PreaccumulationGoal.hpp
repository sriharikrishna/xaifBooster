#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATION_PREACCUMULATIONGOAL_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATION_PREACCUMULATIONGOAL_INCLUDE_

#include <string>

#include "xaifBooster/utils/inc/PrintingIntException.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {

  class PreaccumulationGoal {
  public:

    enum PreaccumulationGoal_E {
      OPERATIONS = 0,
      SCARCITY = 1
    };

    static void
    checkValid(const PreaccumulationGoal_E& aGoal);
    
    static std::string
    toString(const PreaccumulationGoal_E& aGoal) throw (PrintingIntException);

  }; // end class PreaccumulationGoal

} // end namespace xaifBoosterBasicBlockPreaccumulation

#endif

