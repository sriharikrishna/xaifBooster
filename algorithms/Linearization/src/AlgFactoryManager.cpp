#include "xaifBooster/utils/inc/LogicException.hpp"

#include "xaifBooster/algorithms/Linearization/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ArgumentAlgFactory.hpp"
#include "xaifBooster/algorithms/Linearization/inc/AssignmentAlgFactory.hpp"
#include "xaifBooster/algorithms/Linearization/inc/BooleanOperationAlgFactory.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ConcreteArgumentAlgFactory.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ConstantAlgFactory.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ExpressionAlgFactory.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ExpressionEdgeAlgFactory.hpp"
#include "xaifBooster/algorithms/Linearization/inc/IntrinsicAlgFactory.hpp"
#include "xaifBooster/algorithms/Linearization/inc/SubroutineCallAlgFactory.hpp"

using namespace xaifBooster;

namespace xaifBoosterLinearization { 

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
    resetArgumentAlgFactory(new ArgumentAlgFactory());
    resetAssignmentAlgFactory(new AssignmentAlgFactory());
    resetBooleanOperationAlgFactory(new BooleanOperationAlgFactory());
    resetConcreteArgumentAlgFactory(new ConcreteArgumentAlgFactory());
    resetConstantAlgFactory(new ConstantAlgFactory());
    resetExpressionAlgFactory(new ExpressionAlgFactory());
    resetExpressionEdgeAlgFactory(new ExpressionEdgeAlgFactory());
    resetIntrinsicAlgFactory(new IntrinsicAlgFactory());
    resetSubroutineCallAlgFactory(new SubroutineCallAlgFactory());
  }

  void AlgFactoryManager::init() {
    xaifBooster::AlgFactoryManager::init();
    xaifBoosterLinearization::AlgFactoryManager::resets();
  }

}

