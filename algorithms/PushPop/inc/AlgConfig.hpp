#ifndef _XAIFBOOSTERPUSHPOP_ALGCONFIG_INCLUDE_
#define _XAIFBOOSTERPUSHPOP_ALGCONFIG_INCLUDE_

#include "xaifBooster/algorithms/AddressArithmetic/inc/AlgConfig.hpp"

namespace xaifBoosterPushPop { 

  /**
   * configuration and usage for this transformation
   */
  class AlgConfig : public xaifBoosterAddressArithmetic::AlgConfig {

  public:

    AlgConfig(int argc,
	      char** argv,
	      const std::string& buildStamp);

    virtual void usage();

    virtual void config();

  protected:

    virtual std::string getSwitches();

  };

} // end namespace xaifBoosterPushPop

#endif

