#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPEADJOINT_ALGFACTORYMANAGER_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPEADJOINT_ALGFACTORYMANAGER_INCLUDE_

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/AlgFactoryManager.hpp"

namespace xaifBoosterBasicBlockPreaccumulationTapeAdjoint { 

  /** 
   * the singleton class for 
   * setting algorithm factory pointers
   */
  class AlgFactoryManager : public xaifBoosterBasicBlockPreaccumulationTape::AlgFactoryManager { 

  public: 

    static xaifBooster::AlgFactoryManager* instance();

    /** 
     * set a selection 
     * of factories 
     * overwriting earlier settings 
     * using the reset methods. 
     */
    virtual void init(); 

  }; // end of class AlgFactoryManager

}

#endif
