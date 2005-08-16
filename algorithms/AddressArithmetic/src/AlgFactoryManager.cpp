#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/algorithms/AddressArithmetic/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/AddressArithmetic/inc/CallGraphVertexAlgFactory.hpp"

using namespace xaifBooster;

namespace xaifBoosterAddressArithmetic { 

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

  void AlgFactoryManager::resets() {
    // we have to pick a path
    xaifBoosterBasicBlockPreaccumulationTapeAdjoint::AlgFactoryManager::resetCallGraphVertexAlgFactory(new CallGraphVertexAlgFactory());
  }

  void AlgFactoryManager::init() {
    // need to pick a path
    dynamic_cast<xaifBoosterBasicBlockPreaccumulationTapeAdjoint::AlgFactoryManager*>(this)->xaifBooster::AlgFactoryManager::init();
    xaifBoosterLinearization::AlgFactoryManager::resets();
    xaifBoosterBasicBlockPreaccumulation::AlgFactoryManager::resets();
    xaifBoosterBasicBlockPreaccumulationTape::AlgFactoryManager::resets();
    xaifBoosterBasicBlockPreaccumulationTapeAdjoint::AlgFactoryManager::resets();
    xaifBoosterControlFlowReversal::AlgFactoryManager::resets();
    xaifBoosterAddressArithmetic::AlgFactoryManager::resets();
  }

}

