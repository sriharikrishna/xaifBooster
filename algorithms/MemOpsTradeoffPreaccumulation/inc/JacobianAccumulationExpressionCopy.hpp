/********************************************************************************************************
 * Andrew Lyons, MCS Division, Argonne National Laboratory
 * Under the supervision of Paul Hovland and Uwe Naumann
 * JacobianAccumulationExpressionCopy.hpp          Last Updated: 03/11/04 12:54
 * Class to facilitate implementation of jacobian accumulation expressions for LCG copies.
 * This class fills the need for direct access to the maximal vertex of the expression.
 */

#ifndef _JACOBIANACCUMULATIONEXPRESSIONCOPY_INCLUDE_
#define _JACOBIANACCUMULATIONEXPRESSIONCOPY_INCLUDE_

#include "xaifBooster/algorithms/CrossCountryInterface/inc/JacobianAccumulationExpression.hpp"

using namespace xaifBoosterCrossCountryInterface;

namespace MemOpsTradeoffPreaccumulation {

  class JacobianAccumulationExpressionCopy {
  
  public:

    /**
     * Constructor sets the expression member of the class upon creation
     */
    JacobianAccumulationExpressionCopy(JacobianAccumulationExpression& theNewExpression): myExpression(theNewExpression){};
    
    /**
     * sets the myMaximal pointer to the maximal vertex of the expression
     */
    void setMaximal(const JacobianAccumulationExpressionVertex& theMaximal);

    /**
     * returns a reference to the maximal vertex of the expression
     */
    JacobianAccumulationExpressionVertex& getMaximal() const;

    JacobianAccumulationExpression& myExpression;

  private: 

    JacobianAccumulationExpressionVertex* myMaximal;

  }; // end of class JacobianAccumulationExpressionCopy

} // end of namespace MemOpsTradeoffPreaccumulation
                                                                     
#endif
