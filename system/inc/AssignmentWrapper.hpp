#ifndef _ASSIGNMENTWRAPPER_INCLUDE_
#define _ASSIGNMENTWRAPPER_INCLUDE_

#include "system/inc/BasicBlockElement.hpp"
#include "system/inc/Expression.hpp"
#include "system/inc/BaseVariableReference.hpp"

namespace xaifBooster { 

  /** 
   * class to represent AssignmentWrappers to lvalues
   */
  template <class VariableReference=BaseVariableReference, 
	    class Expression=Expression>
  class AssignmentWrapper : public BasicBlockElement {
  public:
    
    AssignmentWrapper (){};

    virtual ~AssignmentWrapper(){};

    VariableReference& getLHS() { return myLhs;};
    Expression& getRHS() { return myRhs;};

    const VariableReference& getLHS() const { return myLhs;};
    const Expression& getRHS() const { return myRhs;};

  private:
    
    /**
     * a class to represent an lvalue on the 
     * left hand side 
     */
    VariableReference myLhs;

    /** 
     * an expression on the right hand side
     */
    Expression myRhs;

  }; // end of class AssignmentWrapper
 
} // end of namespace xaifBooster
                                                                     
#endif
