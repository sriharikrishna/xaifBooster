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
#include "xaifBooster/system/inc/CallGraphAlgFactory.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphAlgFactory.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphVertexAlgFactory.hpp"
#include "xaifBooster/system/inc/IfStatementAlgFactory.hpp"
#include "xaifBooster/system/inc/PreLoopAlgFactory.hpp"
#include "xaifBooster/system/inc/ForLoopAlgFactory.hpp"
#include "xaifBooster/system/inc/EntryAlgFactory.hpp"
#include "xaifBooster/system/inc/ExitAlgFactory.hpp"
#include "xaifBooster/system/inc/EndLoopAlgFactory.hpp"
#include "xaifBooster/system/inc/EndBranchAlgFactory.hpp"
#include "xaifBooster/system/inc/BranchAlgFactory.hpp"
#include "xaifBooster/system/inc/GotoAlgFactory.hpp"
#include "xaifBooster/system/inc/LabelAlgFactory.hpp"
#include "xaifBooster/system/inc/CallGraphVertexAlgFactory.hpp"

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
    ourIntrinsicAlgFactory_p(0), 
    ourCallGraphAlgFactory_p(0), 
    ourControlFlowGraphAlgFactory_p(0), 
    ourControlFlowGraphVertexAlgFactory_p(0), 
    ourIfStatementAlgFactory_p(0), 
    ourPreLoopAlgFactory_p(0), 
    ourForLoopAlgFactory_p(0), 
    ourEntryAlgFactory_p(0), 
    ourExitAlgFactory_p(0), 
    ourEndLoopAlgFactory_p(0), 
    ourGotoAlgFactory_p(0), 
    ourLabelAlgFactory_p(0), 
    ourBranchAlgFactory_p(0), 
    ourEndBranchAlgFactory_p(0), 
    ourCallGraphVertexAlgFactory_p(0) 
  {
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
    if (ourCallGraphAlgFactory_p)
      delete ourCallGraphAlgFactory_p;
    if (ourControlFlowGraphAlgFactory_p)
      delete ourControlFlowGraphAlgFactory_p;
    if (ourControlFlowGraphVertexAlgFactory_p)
      delete ourControlFlowGraphVertexAlgFactory_p;
    if (ourIfStatementAlgFactory_p)
      delete ourIfStatementAlgFactory_p;
    if (ourPreLoopAlgFactory_p)
      delete ourPreLoopAlgFactory_p;
    if (ourForLoopAlgFactory_p)
      delete ourForLoopAlgFactory_p;
    if (ourEntryAlgFactory_p)
      delete ourEntryAlgFactory_p;
    if (ourExitAlgFactory_p)
      delete ourExitAlgFactory_p;
    if (ourEndLoopAlgFactory_p)
      delete ourEndLoopAlgFactory_p;
    if (ourBranchAlgFactory_p)
      delete ourBranchAlgFactory_p;
    if (ourEndBranchAlgFactory_p)
      delete ourEndBranchAlgFactory_p;
    if (ourLabelAlgFactory_p)
      delete ourLabelAlgFactory_p;
    if (ourGotoAlgFactory_p)
      delete ourGotoAlgFactory_p;
    if (ourCallGraphVertexAlgFactory_p)
      delete ourCallGraphVertexAlgFactory_p;
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
    resetCallGraphAlgFactory(new CallGraphAlgFactory());
    resetControlFlowGraphAlgFactory(new ControlFlowGraphAlgFactory());
    resetControlFlowGraphVertexAlgFactory(new ControlFlowGraphVertexAlgFactory());
    resetIfStatementAlgFactory(new IfStatementAlgFactory());
    resetPreLoopAlgFactory(new PreLoopAlgFactory());
    resetForLoopAlgFactory(new ForLoopAlgFactory());
    resetEntryAlgFactory(new EntryAlgFactory());
    resetExitAlgFactory(new ExitAlgFactory());
    resetEndLoopAlgFactory(new EndLoopAlgFactory());
    resetBranchAlgFactory(new BranchAlgFactory());
    resetEndBranchAlgFactory(new EndBranchAlgFactory());
    resetLabelAlgFactory(new LabelAlgFactory());
    resetGotoAlgFactory(new GotoAlgFactory());
    resetCallGraphVertexAlgFactory(new CallGraphVertexAlgFactory());
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

  void AlgFactoryManager::resetControlFlowGraphAlgFactory(ControlFlowGraphAlgFactory* anotherControlFlowGraphAlgFactory_p){ 
    if(ourControlFlowGraphAlgFactory_p) 
      delete ourControlFlowGraphAlgFactory_p;
    ourControlFlowGraphAlgFactory_p=anotherControlFlowGraphAlgFactory_p;
  }

  void AlgFactoryManager::resetControlFlowGraphVertexAlgFactory(ControlFlowGraphVertexAlgFactory* anotherControlFlowGraphVertexAlgFactory_p){ 
    if(ourControlFlowGraphVertexAlgFactory_p) 
      delete ourControlFlowGraphVertexAlgFactory_p;
    ourControlFlowGraphVertexAlgFactory_p=anotherControlFlowGraphVertexAlgFactory_p;
  }

  void AlgFactoryManager::resetIfStatementAlgFactory(IfStatementAlgFactory* anotherIfStatementAlgFactory_p){ 
    if(ourIfStatementAlgFactory_p) 
      delete ourIfStatementAlgFactory_p;
    ourIfStatementAlgFactory_p=anotherIfStatementAlgFactory_p;
  }

  void AlgFactoryManager::resetPreLoopAlgFactory(PreLoopAlgFactory* anotherPreLoopAlgFactory_p){ 
    if(ourPreLoopAlgFactory_p) 
      delete ourPreLoopAlgFactory_p;
    ourPreLoopAlgFactory_p=anotherPreLoopAlgFactory_p;
  }

  void AlgFactoryManager::resetForLoopAlgFactory(ForLoopAlgFactory* anotherForLoopAlgFactory_p){ 
    if(ourForLoopAlgFactory_p) 
      delete ourForLoopAlgFactory_p;
    ourForLoopAlgFactory_p=anotherForLoopAlgFactory_p;
  }

  void AlgFactoryManager::resetEntryAlgFactory(EntryAlgFactory* anotherEntryAlgFactory_p){ 
    if(ourEntryAlgFactory_p) 
      delete ourEntryAlgFactory_p;
    ourEntryAlgFactory_p=anotherEntryAlgFactory_p;
  }

  void AlgFactoryManager::resetExitAlgFactory(ExitAlgFactory* anotherExitAlgFactory_p){ 
    if(ourExitAlgFactory_p) 
      delete ourExitAlgFactory_p;
    ourExitAlgFactory_p=anotherExitAlgFactory_p;
  }


  void AlgFactoryManager::resetCallGraphVertexAlgFactory(CallGraphVertexAlgFactory* anotherCallGraphVertexAlgFactory_p){ 
    if(ourCallGraphVertexAlgFactory_p) 
      delete ourCallGraphVertexAlgFactory_p;
    ourCallGraphVertexAlgFactory_p=anotherCallGraphVertexAlgFactory_p;
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

  ControlFlowGraphAlgFactory* AlgFactoryManager::getControlFlowGraphAlgFactory() const { 
    if (!ourControlFlowGraphAlgFactory_p)
      THROW_LOGICEXCEPTION_MACRO("AlgFactoryManager::getControlFlowGraphAlgFactory: not set");
    return ourControlFlowGraphAlgFactory_p;
  }

  ControlFlowGraphVertexAlgFactory* AlgFactoryManager::getControlFlowGraphVertexAlgFactory() const { 
    if (!ourControlFlowGraphVertexAlgFactory_p)
      THROW_LOGICEXCEPTION_MACRO("AlgFactoryManager::getControlFlowGraphVertexAlgFactory: not set");
    return ourControlFlowGraphVertexAlgFactory_p;
  }

  IfStatementAlgFactory* AlgFactoryManager::getIfStatementAlgFactory() const { 
    if (!ourIfStatementAlgFactory_p)
      THROW_LOGICEXCEPTION_MACRO("AlgFactoryManager::getIfStatementAlgFactory: not set");
    return ourIfStatementAlgFactory_p;
  }

  PreLoopAlgFactory* AlgFactoryManager::getPreLoopAlgFactory() const { 
    if (!ourPreLoopAlgFactory_p)
      THROW_LOGICEXCEPTION_MACRO("AlgFactoryManager::getPreLoopAlgFactory: not set");
    return ourPreLoopAlgFactory_p;
  }

  ForLoopAlgFactory* AlgFactoryManager::getForLoopAlgFactory() const { 
    if (!ourForLoopAlgFactory_p)
      THROW_LOGICEXCEPTION_MACRO("AlgFactoryManager::getForLoopAlgFactory: not set");
    return ourForLoopAlgFactory_p;
  }

  EntryAlgFactory* AlgFactoryManager::getEntryAlgFactory() const { 
    if (!ourEntryAlgFactory_p)
      THROW_LOGICEXCEPTION_MACRO("AlgFactoryManager::getEntryAlgFactory: not set");
    return ourEntryAlgFactory_p;
  }

  ExitAlgFactory* AlgFactoryManager::getExitAlgFactory() const { 
    if (!ourExitAlgFactory_p)
      THROW_LOGICEXCEPTION_MACRO("AlgFactoryManager::getExitAlgFactory: not set");
    return ourExitAlgFactory_p;
  }

  CallGraphVertexAlgFactory* AlgFactoryManager::getCallGraphVertexAlgFactory() const { 
    if (!ourCallGraphVertexAlgFactory_p)
      THROW_LOGICEXCEPTION_MACRO("AlgFactoryManager::getCallGraphVertexAlgFactory: not set");
    return ourCallGraphVertexAlgFactory_p;
  }

  void AlgFactoryManager::resetEndLoopAlgFactory(EndLoopAlgFactory* anotherEndLoopAlgFactory_p){ 
    if(ourEndLoopAlgFactory_p) 
      delete ourEndLoopAlgFactory_p;
    ourEndLoopAlgFactory_p=anotherEndLoopAlgFactory_p;
  }

  EndLoopAlgFactory* AlgFactoryManager::getEndLoopAlgFactory() const { 
    if (!ourEndLoopAlgFactory_p)
      THROW_LOGICEXCEPTION_MACRO("AlgFactoryManager::getEndLoopAlgFactory: not set");
    return ourEndLoopAlgFactory_p;
  }

  void AlgFactoryManager::resetEndBranchAlgFactory(EndBranchAlgFactory* anotherEndBranchAlgFactory_p){ 
    if(ourEndBranchAlgFactory_p) 
      delete ourEndBranchAlgFactory_p;
    ourEndBranchAlgFactory_p=anotherEndBranchAlgFactory_p;
  }

  EndBranchAlgFactory* AlgFactoryManager::getEndBranchAlgFactory() const { 
    if (!ourEndBranchAlgFactory_p)
      THROW_LOGICEXCEPTION_MACRO("AlgFactoryManager::getEndBranchAlgFactory: not set");
    return ourEndBranchAlgFactory_p;
  }

  void AlgFactoryManager::resetGotoAlgFactory(GotoAlgFactory* anotherGotoAlgFactory_p){ 
    if(ourGotoAlgFactory_p) 
      delete ourGotoAlgFactory_p;
    ourGotoAlgFactory_p=anotherGotoAlgFactory_p;
  }

  GotoAlgFactory* AlgFactoryManager::getGotoAlgFactory() const { 
    if (!ourGotoAlgFactory_p)
      THROW_LOGICEXCEPTION_MACRO("AlgFactoryManager::getGotoAlgFactory: not set");
    return ourGotoAlgFactory_p;
  }

  void AlgFactoryManager::resetLabelAlgFactory(LabelAlgFactory* anotherLabelAlgFactory_p){ 
    if(ourLabelAlgFactory_p) 
      delete ourLabelAlgFactory_p;
    ourLabelAlgFactory_p=anotherLabelAlgFactory_p;
  }

  LabelAlgFactory* AlgFactoryManager::getLabelAlgFactory() const { 
    if (!ourLabelAlgFactory_p)
      THROW_LOGICEXCEPTION_MACRO("AlgFactoryManager::getLabelAlgFactory: not set");
    return ourLabelAlgFactory_p;
  }

  void AlgFactoryManager::resetBranchAlgFactory(BranchAlgFactory* anotherBranchAlgFactory_p){ 
    if(ourBranchAlgFactory_p) 
      delete ourBranchAlgFactory_p;
    ourBranchAlgFactory_p=anotherBranchAlgFactory_p;
  }

  BranchAlgFactory* AlgFactoryManager::getBranchAlgFactory() const { 
    if (!ourBranchAlgFactory_p)
      THROW_LOGICEXCEPTION_MACRO("AlgFactoryManager::getBranchAlgFactory: not set");
    return ourBranchAlgFactory_p;
  }

  void AlgFactoryManager::resetCallGraphAlgFactory(CallGraphAlgFactory* anotherCallGraphAlgFactory_p){ 
    if(ourCallGraphAlgFactory_p) 
      delete ourCallGraphAlgFactory_p;
    ourCallGraphAlgFactory_p=anotherCallGraphAlgFactory_p;
  }

  CallGraphAlgFactory* AlgFactoryManager::getCallGraphAlgFactory() const { 
    if (!ourCallGraphAlgFactory_p)
      THROW_LOGICEXCEPTION_MACRO("AlgFactoryManager::getCallGraphAlgFactory: not set");
    return ourCallGraphAlgFactory_p;
  }

  std::string AlgFactoryManager::debug() const {
    std::ostringstream out;
    out << "AlgFactoryManager[" << this; 
    if (ourArgumentAlgFactory_p) 
      out << "ourArgumentAlgFactory_p=" << ourArgumentAlgFactory_p->debug().c_str() << ",";
    if (ourAssignmentAlgFactory_p) 
      out << "ourAssignmentAlgFactory_p=" << ourAssignmentAlgFactory_p->debug().c_str() << ",";
    if (ourBasicBlockAlgFactory_p)
      out << "ourBasicBlockAlgFactory_p=" << ourBasicBlockAlgFactory_p->debug().c_str() << ",";
    if (ourBooleanOperationAlgFactory_p)
      out << "ourBooleanOperationAlgFactory_p=" << ourBooleanOperationAlgFactory_p->debug().c_str() << ",";
    if (ourConstantAlgFactory_p)
      out << "ourConstantAlgFactory_p=" << ourConstantAlgFactory_p->debug().c_str() << ",";
    if (ourExpressionAlgFactory_p)
      out << "ourExpressionAlgFactory_p=" << ourExpressionAlgFactory_p->debug().c_str() << ",";
    if (ourExpressionEdgeAlgFactory_p)
      out << "ourExpressionEdgeAlgFactory_p=" << ourExpressionEdgeAlgFactory_p->debug().c_str() << ",";
    if (ourIntrinsicAlgFactory_p)
      out << "ourIntrinsicAlgFactory_p=" << ourIntrinsicAlgFactory_p->debug().c_str() << ",";
    if (ourCallGraphAlgFactory_p)
      out << "ourCallGraphAlgFactory_p=" << ourCallGraphAlgFactory_p->debug().c_str() << ",";
    if (ourControlFlowGraphAlgFactory_p)
      out << "ourControlFlowGraphAlgFactory_p=" << ourControlFlowGraphAlgFactory_p->debug().c_str() << ",";
    if (ourControlFlowGraphVertexAlgFactory_p)
      out << "ourControlFlowGraphVertexAlgFactory_p=" << ourControlFlowGraphVertexAlgFactory_p->debug().c_str() << ",";
    if (ourIfStatementAlgFactory_p)
      out << "ourIfStatementAlgFactory_p=" << ourIfStatementAlgFactory_p->debug().c_str() << ",";
    if (ourPreLoopAlgFactory_p)
      out << "ourPreLoopAlgFactory_p=" << ourPreLoopAlgFactory_p->debug().c_str() << ",";
    if (ourForLoopAlgFactory_p)
      out << "ourForLoopAlgFactory_p=" << ourForLoopAlgFactory_p->debug().c_str() << ",";
    if (ourEntryAlgFactory_p)
      out << "ourEntryAlgFactory_p=" << ourEntryAlgFactory_p->debug().c_str() << ",";
    if (ourExitAlgFactory_p)
      out << "ourExitAlgFactory_p=" << ourExitAlgFactory_p->debug().c_str() << ",";
    if (ourEndLoopAlgFactory_p)
      out << "ourEndLoopAlgFactory_p=" << ourEndLoopAlgFactory_p->debug().c_str() << ",";
    if (ourBranchAlgFactory_p)
      out << "ourBranchAlgFactory_p=" << ourBranchAlgFactory_p->debug().c_str() << ",";
    if (ourEndBranchAlgFactory_p)
      out << "ourEndBranchAlgFactory_p=" << ourEndBranchAlgFactory_p->debug().c_str() << ",";
    if (ourLabelAlgFactory_p)
      out << "ourLabelAlgFactory_p=" << ourLabelAlgFactory_p->debug().c_str() << ",";
    if (ourGotoAlgFactory_p)
      out << "ourGotoAlgFactory_p=" << ourGotoAlgFactory_p->debug().c_str() << ",";
    if (ourCallGraphVertexAlgFactory_p)
      out << "ourCallGraphVertexAlgFactory_p=" << ourCallGraphVertexAlgFactory_p->debug().c_str() << ",";
    out << "]" << std::ends;  
    return out.str();
  } // end of AlgFactoryManager::~AlgFactoryManager

}

