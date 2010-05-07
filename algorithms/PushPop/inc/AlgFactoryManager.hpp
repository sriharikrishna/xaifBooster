#ifndef _XAIFBOOSTERPUSHPOP_ALGFACTORYMANAGER_INCLUDE_
#define _XAIFBOOSTERPUSHPOP_ALGFACTORYMANAGER_INCLUDE_

#include "xaifBooster/algorithms/AddressArithmetic/inc/AlgFactoryManager.hpp"

namespace xaifBoosterPushPop {

  /**
   * the singleton class for setting algorithm factory pointers
   */
  class AlgFactoryManager : virtual public xaifBoosterAddressArithmetic::AlgFactoryManager {

  public:

    static xaifBooster::AlgFactoryManager* instance();

    virtual void resets(); 

    virtual void init(); 

  }; // end of class AlgFactoryManager

} // end namespace xaifBoosterPushPop

#endif

