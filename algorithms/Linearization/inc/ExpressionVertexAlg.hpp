#ifndef _EXPRESSIONVERTEXALG_INCLUDE_
#define _EXPRESSIONVERTEXALG_INCLUDE_

#include "xaifBooster/system/inc/ExpressionVertexAlgBase.hpp"
#include "xaifBooster/system/inc/PartialDerivativeKind.hpp"
#include "xaifBooster/system/inc/Symbol.hpp"
#include "xaifBooster/system/inc/Scope.hpp"
#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"

using namespace xaifBooster; 

namespace xaifBoosterLinearization { 

  /**
   * class to implement linearization steps
   */
  class ExpressionVertexAlg : public ExpressionVertexAlgBase {

  public:
    
    ExpressionVertexAlg(ExpressionVertex& theContainingExpressionVertex);

    virtual ~ExpressionVertexAlg();

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    void makeAuxilliaryVariable(const Symbol& aSymbol,
				const Scope& aScope);

    bool hasAuxilliaryVariable() const ;

    const Variable& getAuxilliaryVariable() const ;

    bool hasReplacement() const; 

    Assignment& makeReplacementAssignment(); 

    /** 
     * is this vertex active?
     */
    bool isActive() const;

    /**
     * during clipping of passive subexpressions
     * we may passivate vertices
     */
    void passivate();

  private: 

    /** 
     * no def
     */
    ExpressionVertexAlg();

    /** 
     * no def
     */
    ExpressionVertexAlg(const ExpressionVertexAlg&);

    /** 
     * no def
     */
    ExpressionVertexAlg operator=(const ExpressionVertexAlg&);

    /**
     * this is used for static single assignment code 
     * when we assign an intermediate result to an 
     * auxilliary variable to avoid recomputations
     * for use in partial derivatives
     * this will be set during linearization
     * this is owned by this class 
     * by means of calling makeAuxilliaryVariable;
     * deleted in the dtor
     */
    Variable* myAuxilliaryVariable_p; 

    /**
     * for each vertex with auxilliary Variable
     * we will have to built an assignment that replaces 
     * the subgraph with this vertex as maximal element 
     * in the original RHS
     * owned by this, deleted in the dtor
     */
    Assignment* myReplacementAssignment_p;

    /**
     * we maintain a flag indicating activity; 
     * the initialization is always to active;
     * the flag may change from active to 
     * passive using passivate;
     */
    bool myActiveFlag;

  };
 
} 
                                                                     
#endif
