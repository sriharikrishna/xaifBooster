#ifndef _XAIFBOOSTERCONTROLFLOWREVERSAL_ALGFACTORYMANAGER_INCLUDE_
#define _XAIFBOOSTERCONTROLFLOWREVERSAL_ALGFACTORYMANAGER_INCLUDE_

#include "xaifBooster/system/inc/AlgFactoryManager.hpp"

namespace xaifBoosterControlFlowReversal { 

  /** 
   * the singleton class for 
   * setting algorithm factory pointers
   */
  class AlgFactoryManager : virtual public xaifBooster::AlgFactoryManager { 

  public: 

    static xaifBooster::AlgFactoryManager* instance();

    virtual void resets(); 

    virtual void init(); 

  }; // end of class AlgFactoryManager

}

#endif
