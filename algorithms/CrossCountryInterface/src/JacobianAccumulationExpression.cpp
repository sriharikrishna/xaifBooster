#include "JacobianAccumulationExpression.hpp"

namespace xaifBooster { 

  JacobianAccumulationExpression::JacobianAccumulationExpression() : 
    myDependent_p(0),
    myIndependent_p(0),
    myJacobianPairFlag(false) { 
  }; 

  void
  JacobianAccumulationExpression::setJacobianEntry(const LinearizedComputationalGraphVertex& theDependent,
						   const LinearizedComputationalGraphVertex& theIndependent) { 
    if (myJacobianPairFlag)
      THROW_LOGICEXCEPTION_MACRO("JacobianAccumulationExpression::setJacobianEntry: entry already set");
    myJacobianPairFlag=true;
    // conceptually constant
    myDependent_p=&theDependent;
    myIndependent_p=&theIndependent;
  }; 

  const LinearizedComputationalGraphVertex& 
  JacobianAccumulationExpression::getDependent() const { 
    if (!myJacobianPairFlag)
      THROW_LOGICEXCEPTION_MACRO("JacobianAccumulationExpression::getDependent: entry not set");
    return *myDependent_p;
  } // end of JacobianAccumulationExpression::getDependent

  const LinearizedComputationalGraphVertex& 
  JacobianAccumulationExpression::getIndependent() const { 
    if (!myJacobianPairFlag)
      THROW_LOGICEXCEPTION_MACRO("JacobianAccumulationExpression::getIndependent: entry not set");
    return *myIndependent_p;
  } // end of JacobianAccumulationExpression::getIndependent


  bool 
  JacobianAccumulationExpression::isJacobianEntry() const {
    return myJacobianPairFlag;
  };

} 
