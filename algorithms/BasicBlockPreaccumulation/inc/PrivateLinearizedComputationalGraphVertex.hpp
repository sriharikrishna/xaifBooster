#ifndef _PRIVATELINEARIZEDCOMPUTATIONALGRAPHVERTEX_INCLUDE_
#define _PRIVATELINEARIZEDCOMPUTATIONALGRAPHVERTEX_INCLUDE_

#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraphVertex.hpp"

namespace xaifBooster { 
  class Variable;;
}

using namespace xaifBooster; 

namespace xaifBoosterBasicBlockPreaccumulation { 
  
  class PrivateLinearizedComputationalGraphVertex : 
    public xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex {

  public:

    PrivateLinearizedComputationalGraphVertex(); 

    ~PrivateLinearizedComputationalGraphVertex(){};

    void setRHSVariable(const Variable& aVariable);

    void setLHSVariable(const Variable& aVariable);
    
    const Variable& getRHSVariable() const;

    const Variable& getLHSVariable() const;

    bool hasLHSVariable() const; 

    std::string debug() const ;
    
  private:
    
    /**
     * this refers to some Variable in
     * right hand side of an assignment in a 
     * basic block for independent variables.
     * see also myLHSVariable_p.
     * this class doesn't own the Variable pointed 
     * to by myRHSVariable_p
     */
    const Variable* myRHSVariable_p;

    /**
     * this refers to the Variable in
     * the left hand side of an Assignment.
     * LHS and RHS while normally mutually 
     * exclusive cannot use the same data member because 
     * we have to account for 
     * something like y=x where this vertex needs to 
     * keep a reference to both y and x 
     * this class doesn't own the Variable pointed 
     * to by myLHSVariable_p
     */
    const Variable* myLHSVariable_p;
 
  }; // end of class PrivateLinearizedComputationalGraphVertex
 
} 
                                                                     
#endif
