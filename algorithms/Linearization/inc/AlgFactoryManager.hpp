#ifndef _XAIFBOOSTERLINEARIZATION_ALGFACTORYMANAGER_INCLUDE_
#define _XAIFBOOSTERLINEARIZATION_ALGFACTORYMANAGER_INCLUDE_

#include "xaifBooster/system/inc/AlgFactoryManager.hpp"

namespace xaifBoosterLinearization { 

  /** 
   * the singleton class for 
   * setting algorithm factory pointers
   */
  class AlgFactoryManager : public xaifBooster::AlgFactoryManager { 

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
