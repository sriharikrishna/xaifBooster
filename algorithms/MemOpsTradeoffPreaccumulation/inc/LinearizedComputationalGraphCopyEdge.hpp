#ifndef _LINEARIZEDCOMPUTATIONALGRAPHCOPYEDGE_INCLUDE_
#define _LINEARIZEDCOMPUTATIONALGRAPHCOPYEDGE_INCLUDE_

#include "xaifBooster/boostWrapper/inc/Edge.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraphEdge.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/JacobianAccumulationExpressionCopy.hpp"

using namespace xaifBoosterCrossCountryInterface;

namespace MemOpsTradeoffPreaccumulation {
 
  class LinearizedComputationalGraphCopyEdge : public Edge {
  
  public:

    LinearizedComputationalGraphCopyEdge():jacobianRef(NULL) {};

    ~LinearizedComputationalGraphCopyEdge(){
      if(jacobianRef){
	delete jacobianRef;
      }
    };

    void setOriginalRef(const LinearizedComputationalGraphEdge& theOriginalEdge);
    void setJacobianRef(MemOpsTradeoffPreaccumulation::JacobianAccumulationExpressionCopy* theJacobianExpression_pt);

    const LinearizedComputationalGraphEdge& getOriginalRef() const;
    MemOpsTradeoffPreaccumulation::JacobianAccumulationExpressionCopy& getJacobianRef() const;

    enum EdgeCopyRefType { TO_ORIGINAL_EDGE,
			   TO_INTERNAL_EXPRESSION};

    EdgeCopyRefType getRefType() const;

  private:
    
    const LinearizedComputationalGraphEdge* originalRef;
    MemOpsTradeoffPreaccumulation::JacobianAccumulationExpressionCopy* jacobianRef;

    EdgeCopyRefType myCopyReferenceType;

  }; // end of class LinearizedComputationalGraphCopyEdge
 
} //end of namespace MemOpsTradeoffPreaccumulation
                                                                     
#endif
