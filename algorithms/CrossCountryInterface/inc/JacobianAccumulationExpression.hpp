#ifndef _JACOBIANACCUMULATIONEXPRESSION_INCLUDE_
#define _JACOBIANACCUMULATIONEXPRESSION_INCLUDE_

#include "xaifBooster/boostWrapper/inc/GraphWrapper.hpp" 
#include "xaifBooster/boostWrapper/inc/Edge.hpp" 

#include "xaifBooster/algorithms/CrossCountryInterface/inc/JacobianAccumulationExpressionVertex.hpp" 
#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraphVertex.hpp" 

using namespace xaifBooster;

namespace xaifBoosterCrossCountryInterface { 

  class JacobianAccumulationExpression : public GraphWrapper<JacobianAccumulationExpressionVertex,
					 Edge> { 
    
  public:

    JacobianAccumulationExpression();

    void setJacobianEntry(const LinearizedComputationalGraphVertex& theDependent,
			  const LinearizedComputationalGraphVertex& theIndependent);

    bool isJacobianEntry() const;
    
    const LinearizedComputationalGraphVertex& getDependent() const ;

    const LinearizedComputationalGraphVertex& getIndependent() const ;
    
  private: 

    /** 
     * holds a pointer to a vertex representing a dependent variable
     */
    const LinearizedComputationalGraphVertex* myDependent_p;

    /** 
     * holds a pointer to a vertex representing a independent variable
     */
    const LinearizedComputationalGraphVertex* myIndependent_p;

    /** 
     * has the dependent/independent pair been set?
     */
    bool myJacobianPairFlag;

  }; // end of class  JacobianAccumulationExpression

} 

#endif 
