#include "xaifBooster/utils/inc/LogicException.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/BasicBlockAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/AssignmentAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/SubroutineCallAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/MarkerAlgFactory.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/AlgFactoryManager.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationTapeAdjoint { 

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
    resetBasicBlockAlgFactory(new BasicBlockAlgFactory());
    resetAssignmentAlgFactory(new AssignmentAlgFactory());
    resetSubroutineCallAlgFactory(new SubroutineCallAlgFactory());
    resetMarkerAlgFactory(new MarkerAlgFactory());
  }

  void AlgFactoryManager::init() {
    xaifBoosterBasicBlockPreaccumulationTape::AlgFactoryManager::init();
    xaifBoosterBasicBlockPreaccumulationTapeAdjoint::AlgFactoryManager::resets();
  }

}

