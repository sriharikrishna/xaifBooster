#ifndef _PRIVATELINEARIZEDCOMPUTATIONALGRAPHEDGE_INCLUDE_
#define _PRIVATELINEARIZEDCOMPUTATIONALGRAPHEDGE_INCLUDE_

#include "LinearizedComputationalGraphEdge.hpp"

namespace xaifBooster { 
  
  class ExpressionEdge;
  
  class PrivateLinearizedComputationalGraphEdge : public LinearizedComputationalGraphEdge {
  public:

    PrivateLinearizedComputationalGraphEdge() : 
      myLinearizedExpressionEdge_p(0) {};

    ~PrivateLinearizedComputationalGraphEdge(){};
 
    void setLinearizedExpressionEdge(ExpressionEdge& anExpressionEdge);

    const ExpressionEdge& getLinearizedExpressionEdge() const;

    std::string debug() const ;
    
  private:
    
    /**
     * this refers to an edge in the  
     * right hand side of an assignment in a 
     * basic block
     * I.e. this is a reference to a local partial 
     * derivative
     * this class doesn't own the ExpressionEdge pointed 
     * to by myPrivateLinearizedExpressionEdge
     */
    ExpressionEdge* myLinearizedExpressionEdge_p;

  }; // end of class LinearizedComputationalGraphEdge
 
} // end of namespace xaifBooster
                                                                     
#endif
