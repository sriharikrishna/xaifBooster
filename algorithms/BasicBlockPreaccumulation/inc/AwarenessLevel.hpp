#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATION_AWARENESSLEVEL_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATION_AWARENESSLEVEL_INCLUDE_

#include <string>

#include "xaifBooster/utils/inc/PrintingIntException.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {

  class AwarenessLevel {
  public:

    enum AwarenessLevel_E {
      NO_AWARENESS = 0,
      UNIT_AWARENESS = 1,
      CONSTANT_AWARENESS = 2
    };

    static void
    checkValid(const AwarenessLevel_E& anAwarenessLevel);
    
    static std::string
    toString(const AwarenessLevel_E& anAwarenessLevel) throw (PrintingIntException);

  }; // end class AwarenessLevel

} // end namespace xaifBoosterBasicBlockPreaccumulation

#endif

