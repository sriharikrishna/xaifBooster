#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATION_ALGFACTORYMANAGER_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATION_ALGFACTORYMANAGER_INCLUDE_

#include "xaifBooster/algorithms/Linearization/inc/AlgFactoryManager.hpp"

namespace xaifBoosterBasicBlockPreaccumulation { 

  /** 
   * the singleton class for 
   * setting algorithm factory pointers
   */
  class AlgFactoryManager : public xaifBoosterLinearization::AlgFactoryManager { 

  public: 

    static xaifBooster::AlgFactoryManager* instance();

    virtual void resets(); 

    virtual void init(); 

  }; // end of class AlgFactoryManager

}

#endif
