#ifndef _EXPRESSIONEDGEALG_INCLUDE_
#define _EXPRESSIONEDGEALG_INCLUDE_

#include "xaifBooster/system/inc/ExpressionEdgeAlgBase.hpp"
#include "xaifBooster/system/inc/PartialDerivativeKind.hpp"
#include "xaifBooster/system/inc/InlinableIntrinsicsExpression.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"

using namespace xaifBooster; 

namespace xaifBoosterLinearization { 

  /**
   * class to implement linearization steps
   */
  class ExpressionEdgeAlg : public ExpressionEdgeAlgBase {

  public:
    
    ExpressionEdgeAlg(ExpressionEdge& theContainingExpressionEdge);

    virtual ~ExpressionEdgeAlg(){};

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    const InlinableIntrinsicsExpression& getPartial() const ;

    void updatePartial(const InlinableIntrinsicsExpression& thePartial);

    void setPartial(const InlinableIntrinsicsExpression& thePartial);

    void addArgumentsConcretizationPair(const ExpressionVertex& aConcreteArgument,
					const InlinableIntrinsicsExpressionVertex& anAbstractArgument);

    void makeConcretePartialAssignment();

    Assignment& getConcretePartialAssignment();

    const Assignment& getConcretePartialAssignment() const ;

    bool hasConcretePartialAssignment() const;

    typedef std::pair<const ExpressionVertex*,const InlinableIntrinsicsExpressionVertex*> VertexPair;
    
    typedef std::list<VertexPair> VertexPairList;

    PartialDerivativeKind::PartialDerivativeKind_E getPartialDerivativeKind() const;
    void setPartialDerivativeKind(PartialDerivativeKind::PartialDerivativeKind_E );

    void passivate();

    const VertexPairList& getConcreteArgumentInstancesList() const;

  private: 

    /** 
     * no def
     */
    ExpressionEdgeAlg();

    /** 
     * no def
     */
    ExpressionEdgeAlg(const ExpressionEdgeAlg&);

    /** 
     * no def
     */
    ExpressionEdgeAlg operator=(const ExpressionEdgeAlg&);

    /**
     * a reference to the partial derivative
     * which is being set as part of the 
     * linearization. It refers to an entity in the  
     * InlinableInstrinsicsCatalogue
     */
    const InlinableIntrinsicsExpression* myPartialDerivative_p;
    
    /**
     * this is to keep track of 
     * the actual arguments in myPartialDerivative
     * the list doesn't own any of the instances pointed to
     */
    VertexPairList myConcreteArgumentInstancesList;

    /**
     * This is initially 0, it will 
     * be set during linearization 
     * when we establish a concrete 
     * instance for the partial expression 
     * based on the abstract expression 
     * referred to by myPartialDerivative_p
     * this class owns this instance
     */
    Assignment* myConcretePartialAssignment_p;

    /** 
     * this is initialized to NONLINEAR
     * will be reset upon setting of
     * myPartialDerivative_p to the value assumed 
     * there and can be changed to PASSIVE
     * with passivate
     */
    PartialDerivativeKind::PartialDerivativeKind_E myConcretePartialDerivativeKind;

  };
 
} 
                                                                     
#endif
