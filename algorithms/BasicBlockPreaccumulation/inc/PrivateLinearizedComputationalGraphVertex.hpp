#ifndef _PRIVATELINEARIZEDCOMPUTATIONALGRAPHVERTEX_INCLUDE_
#define _PRIVATELINEARIZEDCOMPUTATIONALGRAPHVERTEX_INCLUDE_

#include "LinearizedComputationalGraphVertex.hpp"

namespace xaifBooster { 
  
  class BaseVariableReference;

  class PrivateLinearizedComputationalGraphVertex : public LinearizedComputationalGraphVertex {
  public:

    PrivateLinearizedComputationalGraphVertex(); 

    ~PrivateLinearizedComputationalGraphVertex(){};

    void setRHSBaseVariableReference(const BaseVariableReference& aBaseVariableReference);

    void setLHSBaseVariableReference(const BaseVariableReference& aBaseVariableReference);
    
    const BaseVariableReference& getRHSBaseVariableReference() const;

    const BaseVariableReference& getLHSBaseVariableReference() const;

    std::string debug() const ;
    
  private:
    
    /**
     * this refers to some BaseVariableReference in
     * right hand side of an assignment in a 
     * basic block for independent variables
     * or a BaseVariableReference as the LHS of an Assignment
     * for a dependent variable
     * this class doesn't own the BaseVariableReference pointed 
     * to by myRHSBaseVariableReference_p
     */
    const BaseVariableReference* myRHSBaseVariableReference_p;

    /**
     * this refers to the BaseVariableReference in
     * the left hand side of an Assignment 
     * The distinction has to be made in order to 
     * allow two references to be assigned for 
     * something like y=x where this vertex needs to 
     * keep a reference to both y and x 
     * this class doesn't own the BaseVariableReference pointed 
     * to by myLHSBaseVariableReference_p
     */
    const BaseVariableReference* myLHSBaseVariableReference_p;
 
  }; // end of class PrivateLinearizedComputationalGraphVertex
 
} // end of namespace xaifBooster
                                                                     
#endif
