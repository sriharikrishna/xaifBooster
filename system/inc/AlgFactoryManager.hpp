#ifndef _ALGFACTORYMANAGER_INCLUDE_
#define _ALGFACTORYMANAGER_INCLUDE_

#include "xaifBooster/utils/inc/Mutex.hpp"

namespace xaifBooster { 

class ArgumentAlgFactory;
class AssignmentAlgFactory;
class BasicBlockAlgFactory;
class BooleanOperationAlgFactory;
class ConstantAlgFactory;
class ExpressionAlgFactory;
class ExpressionEdgeAlgFactory;
class IntrinsicAlgFactory;
class ControlFlowGraphAlgFactory;
class ControlFlowGraphVertexAlgFactory;
class IfStatementAlgFactory;
class PreLoopAlgFactory;
class ForLoopAlgFactory;
class EntryAlgFactory;
class ExitAlgFactory;
class EndLoopAlgFactory;
class EndBranchAlgFactory;
class CallGraphVertexAlgFactory;

  /** 
   * the singleton class for 
   * setting algorithm factory pointers
   */
  class AlgFactoryManager { 

  public: 

    static AlgFactoryManager* instance();

    /** 
     * set a selection 
     * of factories 
     * overwriting earlier settings 
     * using the reset methods. 
     */
    virtual void init(); 

    ArgumentAlgFactory* getArgumentAlgFactory() const ;
    AssignmentAlgFactory* getAssignmentAlgFactory() const ;
    BasicBlockAlgFactory* getBasicBlockAlgFactory() const ;
    BooleanOperationAlgFactory* getBooleanOperationAlgFactory() const ;
    ConstantAlgFactory* getConstantAlgFactory() const ;
    ExpressionAlgFactory* getExpressionAlgFactory() const ;
    ExpressionEdgeAlgFactory* getExpressionEdgeAlgFactory() const ;
    IntrinsicAlgFactory* getIntrinsicAlgFactory() const ;
    ControlFlowGraphAlgFactory* getControlFlowGraphAlgFactory() const ;
    ControlFlowGraphVertexAlgFactory* getControlFlowGraphVertexAlgFactory() const ;
    IfStatementAlgFactory* getIfStatementAlgFactory() const ;
    PreLoopAlgFactory* getPreLoopAlgFactory() const ;
    ForLoopAlgFactory* getForLoopAlgFactory() const ;
    EntryAlgFactory* getEntryAlgFactory() const ;
    ExitAlgFactory* getExitAlgFactory() const ;
    EndLoopAlgFactory* getEndLoopAlgFactory() const ;
    EndBranchAlgFactory* getEndBranchAlgFactory() const ;
    CallGraphVertexAlgFactory* getCallGraphVertexAlgFactory() const ;

  protected: 
    
    void resetArgumentAlgFactory(ArgumentAlgFactory*);
    void resetAssignmentAlgFactory(AssignmentAlgFactory*);
    void resetBasicBlockAlgFactory(BasicBlockAlgFactory*);
    void resetBooleanOperationAlgFactory(BooleanOperationAlgFactory*);
    void resetConstantAlgFactory(ConstantAlgFactory*);
    void resetExpressionAlgFactory(ExpressionAlgFactory*);
    void resetExpressionEdgeAlgFactory(ExpressionEdgeAlgFactory*);
    void resetIntrinsicAlgFactory(IntrinsicAlgFactory*);
    void resetControlFlowGraphAlgFactory(ControlFlowGraphAlgFactory*);
    void resetControlFlowGraphVertexAlgFactory(ControlFlowGraphVertexAlgFactory*);
    void resetIfStatementAlgFactory(IfStatementAlgFactory*);
    void resetPreLoopAlgFactory(PreLoopAlgFactory*);
    void resetForLoopAlgFactory(ForLoopAlgFactory*);
    void resetEntryAlgFactory(EntryAlgFactory*);
    void resetExitAlgFactory(ExitAlgFactory*);
    void resetEndLoopAlgFactory(EndLoopAlgFactory*);
    void resetEndBranchAlgFactory(EndBranchAlgFactory*);
    void resetCallGraphVertexAlgFactory(CallGraphVertexAlgFactory*);
    
    AlgFactoryManager();

    virtual ~AlgFactoryManager();

    static AlgFactoryManager* ourInstance_p;

    /**
     * the mutex to protect the instance
     */
    static Mutex ourInstanceMutex;

  private: 

    ArgumentAlgFactory* ourArgumentAlgFactory_p;
    AssignmentAlgFactory* ourAssignmentAlgFactory_p;
    BasicBlockAlgFactory* ourBasicBlockAlgFactory_p;
    BooleanOperationAlgFactory* ourBooleanOperationAlgFactory_p;
    ConstantAlgFactory* ourConstantAlgFactory_p;
    ExpressionAlgFactory* ourExpressionAlgFactory_p;
    ExpressionEdgeAlgFactory* ourExpressionEdgeAlgFactory_p;
    IntrinsicAlgFactory* ourIntrinsicAlgFactory_p;
    ControlFlowGraphAlgFactory* ourControlFlowGraphAlgFactory_p;
    ControlFlowGraphVertexAlgFactory* ourControlFlowGraphVertexAlgFactory_p;
    IfStatementAlgFactory* ourIfStatementAlgFactory_p;
    PreLoopAlgFactory* ourPreLoopAlgFactory_p;
    ForLoopAlgFactory* ourForLoopAlgFactory_p;
    EntryAlgFactory* ourEntryAlgFactory_p;
    ExitAlgFactory* ourExitAlgFactory_p;
    EndLoopAlgFactory* ourEndLoopAlgFactory_p;
    EndBranchAlgFactory* ourEndBranchAlgFactory_p;
    CallGraphVertexAlgFactory* ourCallGraphVertexAlgFactory_p;

    /**
     * no def
     */
    AlgFactoryManager(const AlgFactoryManager&);

    /**
     * no def
     */
    AlgFactoryManager& operator=(const AlgFactoryManager&);

  }; // end of class AlgFactoryManager

}

#endif
