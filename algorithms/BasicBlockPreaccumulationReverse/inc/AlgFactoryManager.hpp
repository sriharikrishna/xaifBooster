#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONREVERSE_ALGFACTORYMANAGER_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONREVERSE_ALGFACTORYMANAGER_INCLUDE_

#include "xaifBooster/algorithms/ControlFlowReversal/inc/AlgFactoryManager.hpp"

namespace xaifBoosterBasicBlockPreaccumulationReverse { 

  /** 
   * the singleton class for 
   * setting algorithm factory pointers
   */
  class AlgFactoryManager : public xaifBoosterControlFlowReversal::AlgFactoryManager { 

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
