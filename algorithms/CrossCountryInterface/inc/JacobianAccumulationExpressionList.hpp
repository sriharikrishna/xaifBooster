#ifndef _JACOBIANACCUMULATIONEXPRESSIONLIST_INCLUDE_
#define _JACOBIANACCUMULATIONEXPRESSIONLIST_INCLUDE_

#include "JacobianAccumulationExpression.hpp" 
#include <list>


namespace xaifBooster { 

  /**
   * this class is the container for the 
   * results returned by Angel
   */
  class JacobianAccumulationExpressionList { 
    
  public: 

    JacobianAccumulationExpressionList(){};

    ~JacobianAccumulationExpressionList();

    JacobianAccumulationExpression& addExpression();

    typedef std::list<JacobianAccumulationExpression*> GraphList;

    const GraphList& getGraphList() const;

  private: 
    
    /**
     * this class is the owner of all the instances of 
     * JacobianAccumulationExpression
     * whose addresses are stored in this list
     */
    GraphList myGraphList;

  }; // end of class  JacobianAccumulationExpressionList

} 

#endif 
