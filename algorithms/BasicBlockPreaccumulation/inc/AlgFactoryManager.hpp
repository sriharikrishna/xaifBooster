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
