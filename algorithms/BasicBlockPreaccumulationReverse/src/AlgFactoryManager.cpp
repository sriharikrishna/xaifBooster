#include "xaifBooster/utils/inc/LogicException.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/CallGraphVertexAlgFactory.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/AlgFactoryManager.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationReverse { 

  xaifBooster::AlgFactoryManager* 
  AlgFactoryManager::instance() { 
    if (ourInstance_p)
      return ourInstance_p;
    ourInstanceMutex.lock();
    try { 
      if (!ourInstance_p)
	ourInstance_p=new AlgFactoryManager();
      if (!ourInstance_p) { 
	THROW_LOGICEXCEPTION_MACRO("AlgFactoryManager::instance");
      } // end if 
    } // end try 
    catch (...) { 
      ourInstanceMutex.unlock();
      throw;
    } // end catch
    ourInstanceMutex.unlock();
    return ourInstance_p;
  } // end of AlgFactoryManager::instance

  void AlgFactoryManager::init() {
    xaifBoosterBasicBlockPreaccumulationTape::AlgFactoryManager::init();
    resetCallGraphVertexAlgFactory(new CallGraphVertexAlgFactory());
  }

}

