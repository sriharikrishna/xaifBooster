#include "xaifBooster/utils/inc/LogicException.hpp"

#include "xaifBooster/algorithms/ControlFlowReversal/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/ControlFlowGraphAlgFactory.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/ControlFlowGraphVertexAlgFactory.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/IfStatementAlgFactory.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/PreLoopAlgFactory.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/ForLoopAlgFactory.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/BasicBlockAlgFactory.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/EntryAlgFactory.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/ExitAlgFactory.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

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
    resetControlFlowGraphAlgFactory(new ControlFlowGraphAlgFactory());
    resetControlFlowGraphVertexAlgFactory(new ControlFlowGraphVertexAlgFactory());
    resetIfStatementAlgFactory(new IfStatementAlgFactory());
    resetPreLoopAlgFactory(new PreLoopAlgFactory());
    resetForLoopAlgFactory(new ForLoopAlgFactory());
    resetEntryAlgFactory(new EntryAlgFactory());
    resetExitAlgFactory(new ExitAlgFactory());
    resetBasicBlockAlgFactory(new BasicBlockAlgFactory());
  }

}

