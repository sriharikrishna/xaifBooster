#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/algorithms/PushPop/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/PushPop/inc/CallGraphVertexAlgFactory.hpp"

using namespace xaifBooster;

namespace xaifBoosterPushPop { 

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
  } // end of AlgFactoryManager::instance()

  void AlgFactoryManager::resets() {
    resetCallGraphVertexAlgFactory(new CallGraphVertexAlgFactory());
    DBG_MACRO(DbgGroup::CALLSTACK,"at the end of xaifBoosterPushPop::AlgFactoryManager::resets: " << debug().c_str());
  } // end AlgFactoryManager::resets()

  void AlgFactoryManager::init() {
    xaifBooster::AlgFactoryManager::init();
    xaifBoosterPushPop::AlgFactoryManager::resets();
  } // end AlgFactoryManager::init()

} // end namespace xaifBoosterPushPop

