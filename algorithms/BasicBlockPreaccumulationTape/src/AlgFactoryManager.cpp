// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================
#include "xaifBooster/utils/inc/LogicException.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/AlgConfig.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/BasicBlockAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/CallGraphVertexAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/SubroutineCallAlgFactory.hpp"

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

  void AlgFactoryManager::resets() {
    resetBasicBlockAlgFactory(new BasicBlockAlgFactory());
    resetCallGraphVertexAlgFactory(new CallGraphVertexAlgFactory());
    resetSubroutineCallAlgFactory(new SubroutineCallAlgFactory());
  }

  void AlgFactoryManager::init() {
    xaifBoosterBasicBlockPreaccumulation::AlgFactoryManager::init();
    xaifBoosterBasicBlockPreaccumulationTape::AlgFactoryManager::resets();
  }

  ALG_CONFIG_ACCESS_DEF_MACRO

} 

