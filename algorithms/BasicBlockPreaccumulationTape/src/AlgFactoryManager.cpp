#include "xaifBooster/utils/inc/LogicException.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/BasicBlockAlgFactory.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/AlgFactoryManager.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationTape { 

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
    xaifBoosterBasicBlockPreaccumulation::AlgFactoryManager::init();
    resetBasicBlockAlgFactory(new BasicBlockAlgFactory());
  }

}
