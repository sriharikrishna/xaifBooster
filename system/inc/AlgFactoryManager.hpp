#ifndef _ALGFACTORYMANAGER_INCLUDE_
#define _ALGFACTORYMANAGER_INCLUDE_

#include "xaifBooster/utils/inc/Mutex.hpp"
#include "xaifBooster/utils/inc/Debuggable.hpp"

namespace xaifBooster { 

class ArgumentAlgFactory;
class ArgumentSymbolReferenceAlgFactory;
class AssignmentAlgFactory;
class BasicBlockAlgFactory;
class BooleanOperationAlgFactory;
class BranchAlgFactory;
class CallGraphAlgFactory;
class CallGraphVertexAlgFactory;
class ConstantAlgFactory;
class ControlFlowGraphAlgFactory;
class ControlFlowGraphVertexAlgFactory;
class EndBranchAlgFactory;
class EndLoopAlgFactory;
class EntryAlgFactory;
class ExitAlgFactory;
class ExpressionAlgFactory;
class ExpressionEdgeAlgFactory;
class ForLoopAlgFactory;
class GotoAlgFactory;
class IfStatementAlgFactory;
class IntrinsicAlgFactory;
class LabelAlgFactory;
class PreLoopAlgFactory;
class SubroutineCallAlgFactory;

  /** 
   * the singleton class for 
   * setting algorithm factory pointers
   */
  class AlgFactoryManager : public Debuggable { 

  public: 

    static AlgFactoryManager* instance();

    /** 
     * uses reset and the proper 
     * settings from the respective 
     * parent manager(s)
     */
    virtual void init(); 

    /** 
     * set a selection 
     * of factories 
     * overwriting earlier settings 
     * using the reset methods. 
     */
    virtual void resets(); 

    ArgumentAlgFactory* getArgumentAlgFactory() const ;
    ArgumentSymbolReferenceAlgFactory* getArgumentSymbolReferenceAlgFactory() const ;
    AssignmentAlgFactory* getAssignmentAlgFactory() const ;
    BasicBlockAlgFactory* getBasicBlockAlgFactory() const ;
    BooleanOperationAlgFactory* getBooleanOperationAlgFactory() const ;
    BranchAlgFactory* getBranchAlgFactory() const ;
    CallGraphAlgFactory* getCallGraphAlgFactory() const ;
    CallGraphVertexAlgFactory* getCallGraphVertexAlgFactory() const ;
    ConstantAlgFactory* getConstantAlgFactory() const ;
    ControlFlowGraphAlgFactory* getControlFlowGraphAlgFactory() const ;
    ControlFlowGraphVertexAlgFactory* getControlFlowGraphVertexAlgFactory() const ;
    EndBranchAlgFactory* getEndBranchAlgFactory() const ;
    EndLoopAlgFactory* getEndLoopAlgFactory() const ;
    EntryAlgFactory* getEntryAlgFactory() const ;
    ExitAlgFactory* getExitAlgFactory() const ;
    ExpressionAlgFactory* getExpressionAlgFactory() const ;
    ExpressionEdgeAlgFactory* getExpressionEdgeAlgFactory() const ;
    ForLoopAlgFactory* getForLoopAlgFactory() const ;
    GotoAlgFactory* getGotoAlgFactory() const ;
    IfStatementAlgFactory* getIfStatementAlgFactory() const ;
    IntrinsicAlgFactory* getIntrinsicAlgFactory() const ;
    LabelAlgFactory* getLabelAlgFactory() const ;
    PreLoopAlgFactory* getPreLoopAlgFactory() const ;
    SubroutineCallAlgFactory* getSubroutineCallAlgFactory() const ;

    virtual std::string debug() const; 

  protected: 
    
    void resetArgumentAlgFactory(ArgumentAlgFactory*);
    void resetArgumentSymbolReferenceAlgFactory(ArgumentSymbolReferenceAlgFactory*);
    void resetAssignmentAlgFactory(AssignmentAlgFactory*);
    void resetBasicBlockAlgFactory(BasicBlockAlgFactory*);
    void resetBooleanOperationAlgFactory(BooleanOperationAlgFactory*);
    void resetBranchAlgFactory(BranchAlgFactory*);
    void resetCallGraphAlgFactory(CallGraphAlgFactory*);
    void resetCallGraphVertexAlgFactory(CallGraphVertexAlgFactory*);
    void resetConstantAlgFactory(ConstantAlgFactory*);
    void resetControlFlowGraphAlgFactory(ControlFlowGraphAlgFactory*);
    void resetControlFlowGraphVertexAlgFactory(ControlFlowGraphVertexAlgFactory*);
    void resetEndBranchAlgFactory(EndBranchAlgFactory*);
    void resetEndLoopAlgFactory(EndLoopAlgFactory*);
    void resetEntryAlgFactory(EntryAlgFactory*);
    void resetExitAlgFactory(ExitAlgFactory*);
    void resetExpressionAlgFactory(ExpressionAlgFactory*);
    void resetExpressionEdgeAlgFactory(ExpressionEdgeAlgFactory*);
    void resetForLoopAlgFactory(ForLoopAlgFactory*);
    void resetGotoAlgFactory(GotoAlgFactory*);
    void resetIfStatementAlgFactory(IfStatementAlgFactory*);
    void resetIntrinsicAlgFactory(IntrinsicAlgFactory*);
    void resetLabelAlgFactory(LabelAlgFactory*);
    void resetPreLoopAlgFactory(PreLoopAlgFactory*);
    void resetSubroutineCallAlgFactory(SubroutineCallAlgFactory*);
    
    AlgFactoryManager();

    virtual ~AlgFactoryManager();

    static AlgFactoryManager* ourInstance_p;

    /**
     * the mutex to protect the instance
     */
    static Mutex ourInstanceMutex;

  private: 

    ArgumentAlgFactory* ourArgumentAlgFactory_p;
    ArgumentSymbolReferenceAlgFactory* ourArgumentSymbolReferenceAlgFactory_p;
    AssignmentAlgFactory* ourAssignmentAlgFactory_p;
    BasicBlockAlgFactory* ourBasicBlockAlgFactory_p;
    BooleanOperationAlgFactory* ourBooleanOperationAlgFactory_p;
    BranchAlgFactory* ourBranchAlgFactory_p;
    CallGraphAlgFactory* ourCallGraphAlgFactory_p;
    CallGraphVertexAlgFactory* ourCallGraphVertexAlgFactory_p;
    ConstantAlgFactory* ourConstantAlgFactory_p;
    ControlFlowGraphAlgFactory* ourControlFlowGraphAlgFactory_p;
    ControlFlowGraphVertexAlgFactory* ourControlFlowGraphVertexAlgFactory_p;
    EndBranchAlgFactory* ourEndBranchAlgFactory_p;
    EndLoopAlgFactory* ourEndLoopAlgFactory_p;
    EntryAlgFactory* ourEntryAlgFactory_p;
    ExitAlgFactory* ourExitAlgFactory_p;
    ExpressionAlgFactory* ourExpressionAlgFactory_p;
    ExpressionEdgeAlgFactory* ourExpressionEdgeAlgFactory_p;
    ForLoopAlgFactory* ourForLoopAlgFactory_p;
    GotoAlgFactory* ourGotoAlgFactory_p;
    IfStatementAlgFactory* ourIfStatementAlgFactory_p;
    IntrinsicAlgFactory* ourIntrinsicAlgFactory_p;
    LabelAlgFactory* ourLabelAlgFactory_p;
    PreLoopAlgFactory* ourPreLoopAlgFactory_p;
    SubroutineCallAlgFactory* ourSubroutineCallAlgFactory_p;

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
