#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONREVERSE_ALGFACTORYMANAGER_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONREVERSE_ALGFACTORYMANAGER_INCLUDE_

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/AlgFactoryManager.hpp"

namespace xaifBoosterBasicBlockPreaccumulationReverse { 

  /** 
   * the singleton class for 
   * setting algorithm factory pointers
   */
  class AlgFactoryManager : public xaifBoosterBasicBlockPreaccumulationTapeAdjoint::AlgFactoryManager,
			    public xaifBoosterControlFlowReversal::AlgFactoryManager { 

  public: 

    static xaifBooster::AlgFactoryManager* instance();

    virtual void resets(); 

    virtual void init(); 

  }; // end of class AlgFactoryManager

}

#endif
