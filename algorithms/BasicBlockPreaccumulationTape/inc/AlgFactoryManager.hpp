#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPE_ALGFACTORYMANAGER_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPE_ALGFACTORYMANAGER_INCLUDE_

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/AlgFactoryManager.hpp"

namespace xaifBoosterBasicBlockPreaccumulationTape { 

  /** 
   * the singleton class for 
   * setting algorithm factory pointers
   */
  class AlgFactoryManager : public xaifBoosterBasicBlockPreaccumulation::AlgFactoryManager { 

  public: 

    static xaifBooster::AlgFactoryManager* instance();

    virtual void resets(); 

    virtual void init(); 

  }; // end of class AlgFactoryManager

}

#endif
