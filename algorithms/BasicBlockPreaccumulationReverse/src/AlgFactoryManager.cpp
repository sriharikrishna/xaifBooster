#include "xaifBooster/utils/inc/LogicException.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/CallGraphVertexAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/BasicBlockAlgFactory.hpp"
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
	ourInstance_p=dynamic_cast<xaifBoosterBasicBlockPreaccumulation::AlgFactoryManager*>(new AlgFactoryManager());
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
    xaifBoosterBasicBlockPreaccumulationTapeAdjoint::AlgFactoryManager::resetBasicBlockAlgFactory(new BasicBlockAlgFactory());
  }

  void AlgFactoryManager::init() {
    // need to pick a path
    dynamic_cast<xaifBoosterBasicBlockPreaccumulationTapeAdjoint::AlgFactoryManager*>(this)->xaifBooster::AlgFactoryManager::init();
    xaifBoosterLinearization::AlgFactoryManager::resets();
    xaifBoosterBasicBlockPreaccumulation::AlgFactoryManager::resets();
    xaifBoosterBasicBlockPreaccumulationTape::AlgFactoryManager::resets();
    xaifBoosterBasicBlockPreaccumulationTapeAdjoint::AlgFactoryManager::resets();
    DBG_MACRO(DbgGroup::TEMPORARY,
	      "before: " 
	      << dynamic_cast<xaifBoosterBasicBlockPreaccumulationTapeAdjoint::AlgFactoryManager*>(this)->debug().c_str());
    xaifBoosterControlFlowReversal::AlgFactoryManager::resets();
    DBG_MACRO(DbgGroup::TEMPORARY,
	      "after: " 
	      << dynamic_cast<xaifBoosterBasicBlockPreaccumulationTapeAdjoint::AlgFactoryManager*>(this)->debug().c_str());
    xaifBoosterBasicBlockPreaccumulationReverse::AlgFactoryManager::resets();
  }

}

