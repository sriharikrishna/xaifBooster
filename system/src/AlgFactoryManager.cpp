#include "xaifBooster/utils/inc/LogicException.hpp"

#include "xaifBooster/system/inc/AlgFactoryManager.hpp"
#include "xaifBooster/system/inc/ArgumentAlgFactory.hpp"
#include "xaifBooster/system/inc/AssignmentAlgFactory.hpp"
#include "xaifBooster/system/inc/BasicBlockAlgFactory.hpp"
#include "xaifBooster/system/inc/BooleanOperationAlgFactory.hpp"
#include "xaifBooster/system/inc/ConstantAlgFactory.hpp"
#include "xaifBooster/system/inc/ExpressionAlgFactory.hpp"
#include "xaifBooster/system/inc/ExpressionEdgeAlgFactory.hpp"
#include "xaifBooster/system/inc/IntrinsicAlgFactory.hpp"

namespace xaifBooster { 

  AlgFactoryManager* AlgFactoryManager::ourInstance_p=0;
  Mutex AlgFactoryManager::ourInstanceMutex;

  AlgFactoryManager* 
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

  AlgFactoryManager::AlgFactoryManager() : 
    ourArgumentAlgFactory_p(0),
    ourAssignmentAlgFactory_p(0),
    ourBasicBlockAlgFactory_p(0),
    ourBooleanOperationAlgFactory_p(0),
    ourConstantAlgFactory_p(0),
    ourExpressionAlgFactory_p(0),
    ourExpressionEdgeAlgFactory_p(0),
    ourIntrinsicAlgFactory_p(0) {
  }

  AlgFactoryManager::~AlgFactoryManager() {
    if (ourArgumentAlgFactory_p) 
      delete ourArgumentAlgFactory_p;
    if (ourAssignmentAlgFactory_p) 
      delete ourAssignmentAlgFactory_p;
    if (ourBasicBlockAlgFactory_p)
      delete ourBasicBlockAlgFactory_p;
    if (ourBooleanOperationAlgFactory_p)
      delete ourBooleanOperationAlgFactory_p;
    if (ourConstantAlgFactory_p)
      delete ourConstantAlgFactory_p;
    if (ourExpressionAlgFactory_p)
      delete ourExpressionAlgFactory_p;
    if (ourExpressionEdgeAlgFactory_p)
      delete ourExpressionEdgeAlgFactory_p;
    if (ourIntrinsicAlgFactory_p)
      delete ourIntrinsicAlgFactory_p;
  } // end of AlgFactoryManager::~AlgFactoryManager

  void AlgFactoryManager::init() {
    resetArgumentAlgFactory(new ArgumentAlgFactory());
    resetAssignmentAlgFactory(new AssignmentAlgFactory());
    resetBasicBlockAlgFactory(new BasicBlockAlgFactory());
    resetBooleanOperationAlgFactory(new BooleanOperationAlgFactory());
    resetConstantAlgFactory(new ConstantAlgFactory());
    resetExpressionAlgFactory(new ExpressionAlgFactory());
    resetExpressionEdgeAlgFactory(new ExpressionEdgeAlgFactory());
    resetIntrinsicAlgFactory(new IntrinsicAlgFactory());
  }

  void AlgFactoryManager::resetArgumentAlgFactory(ArgumentAlgFactory* anotherArgumentAlgFactory_p){ 
    if(ourArgumentAlgFactory_p) 
      delete ourArgumentAlgFactory_p;
    ourArgumentAlgFactory_p=anotherArgumentAlgFactory_p;
  }
  
  void AlgFactoryManager::resetAssignmentAlgFactory(AssignmentAlgFactory* anotherAssignmentAlgFactory_p){ 
    if(ourAssignmentAlgFactory_p)
      delete ourAssignmentAlgFactory_p;
    ourAssignmentAlgFactory_p=anotherAssignmentAlgFactory_p;
  }

  void AlgFactoryManager::resetBasicBlockAlgFactory(BasicBlockAlgFactory* anotherBasicBlockAlgFactory_p){ 
    if(ourBasicBlockAlgFactory_p) 
      delete ourBasicBlockAlgFactory_p; 
    ourBasicBlockAlgFactory_p=anotherBasicBlockAlgFactory_p;
  }

  void AlgFactoryManager::resetBooleanOperationAlgFactory(BooleanOperationAlgFactory* anotherBooleanOperationAlgFactory_p){ 
    if(ourBooleanOperationAlgFactory_p) 
      delete ourBooleanOperationAlgFactory_p; 
    ourBooleanOperationAlgFactory_p=anotherBooleanOperationAlgFactory_p;
  }

  void AlgFactoryManager::resetConstantAlgFactory(ConstantAlgFactory* anotherConstantAlgFactory_p){ 
    if(ourConstantAlgFactory_p)
      delete ourConstantAlgFactory_p;
    ourConstantAlgFactory_p=anotherConstantAlgFactory_p;
  }
 
  void AlgFactoryManager::resetExpressionAlgFactory(ExpressionAlgFactory* anotherExpressionAlgFactory_p){ 
    if(ourExpressionAlgFactory_p) 
      delete ourExpressionAlgFactory_p; 
    ourExpressionAlgFactory_p=anotherExpressionAlgFactory_p;
  }

  void AlgFactoryManager::resetExpressionEdgeAlgFactory(ExpressionEdgeAlgFactory* anotherExpressionEdgeAlgFactory_p){ 
    if(ourExpressionEdgeAlgFactory_p) 
      delete ourExpressionEdgeAlgFactory_p; 
    ourExpressionEdgeAlgFactory_p=anotherExpressionEdgeAlgFactory_p;
  }
 
  void AlgFactoryManager::resetIntrinsicAlgFactory(IntrinsicAlgFactory* anotherIntrinsicAlgFactory_p){ 
    if(ourIntrinsicAlgFactory_p) 
      delete ourIntrinsicAlgFactory_p;
    ourIntrinsicAlgFactory_p=anotherIntrinsicAlgFactory_p;
  }

  ArgumentAlgFactory* AlgFactoryManager::getArgumentAlgFactory() const { 
    if (!ourArgumentAlgFactory_p)
      THROW_LOGICEXCEPTION_MACRO("AlgFactoryManager::getArgumentAlgFactory: not set");
    return ourArgumentAlgFactory_p;
  }

  AssignmentAlgFactory* AlgFactoryManager::getAssignmentAlgFactory() const { 
    if (!ourAssignmentAlgFactory_p)
      THROW_LOGICEXCEPTION_MACRO("AlgFactoryManager::getAssignmentAlgFactory: not set");
    return ourAssignmentAlgFactory_p;
  }

  BasicBlockAlgFactory* AlgFactoryManager::getBasicBlockAlgFactory() const { 
    if (!ourBasicBlockAlgFactory_p)
      THROW_LOGICEXCEPTION_MACRO("AlgFactoryManager::getBasicBlockAlgFactory: not set");
    return ourBasicBlockAlgFactory_p;
  }

  BooleanOperationAlgFactory* AlgFactoryManager::getBooleanOperationAlgFactory() const { 
    if (!ourBooleanOperationAlgFactory_p)
      THROW_LOGICEXCEPTION_MACRO("AlgFactoryManager::getBooleanOperationAlgFactory: not set");
    return ourBooleanOperationAlgFactory_p;
  }

  ConstantAlgFactory* AlgFactoryManager::getConstantAlgFactory() const { 
    if (!ourConstantAlgFactory_p)
      THROW_LOGICEXCEPTION_MACRO("AlgFactoryManager::getConstantAlgFactory: not set");
    return ourConstantAlgFactory_p;
  }

  ExpressionAlgFactory* AlgFactoryManager::getExpressionAlgFactory() const { 
    if (!ourExpressionAlgFactory_p)
      THROW_LOGICEXCEPTION_MACRO("AlgsFactoryManager::getExpressionAlgFactory: not set");
    return ourExpressionAlgFactory_p;
  }
 
  ExpressionEdgeAlgFactory* AlgFactoryManager::getExpressionEdgeAlgFactory() const { 
    if (!ourExpressionEdgeAlgFactory_p)
      THROW_LOGICEXCEPTION_MACRO("AlgFactoryManager::getExpressionEdgeAlgFactory: not set");
    return ourExpressionEdgeAlgFactory_p;
  }
   
  IntrinsicAlgFactory* AlgFactoryManager::getIntrinsicAlgFactory() const { 
    if (!ourIntrinsicAlgFactory_p)
      THROW_LOGICEXCEPTION_MACRO("AlgFactoryManager::getIntrinsicAlgFactory: not set");
    return ourIntrinsicAlgFactory_p;
  }

}

