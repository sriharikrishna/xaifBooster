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

  protected: 
    
    void resetArgumentAlgFactory(ArgumentAlgFactory*);
    void resetAssignmentAlgFactory(AssignmentAlgFactory*);
    void resetBasicBlockAlgFactory(BasicBlockAlgFactory*);
    void resetBooleanOperationAlgFactory(BooleanOperationAlgFactory*);
    void resetConstantAlgFactory(ConstantAlgFactory*);
    void resetExpressionAlgFactory(ExpressionAlgFactory*);
    void resetExpressionEdgeAlgFactory(ExpressionEdgeAlgFactory*);
    void resetIntrinsicAlgFactory(IntrinsicAlgFactory*);
    
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
