#include "xaifBooster/algorithms/CrossCountryInterface/inc/JacobianAccumulationExpressionList.hpp"

namespace xaifBoosterCrossCountryInterface {

  JacobianAccumulationExpressionList::~JacobianAccumulationExpressionList() {
    for (GraphList::iterator it=myGraphList.begin();
	 it!=myGraphList.end();
	 it++) { 
      if (*it)
	delete (*it);
    } 
  } 

  JacobianAccumulationExpression& 
  JacobianAccumulationExpressionList::addExpression() { 
    // deallocated in dtor
    JacobianAccumulationExpression* theGraph_p=new JacobianAccumulationExpression();
    myGraphList.push_back(theGraph_p);
    return *theGraph_p;
  }

  const JacobianAccumulationExpressionList::GraphList& 
  JacobianAccumulationExpressionList::getGraphList() const { 
    return myGraphList;
  } 

} 
