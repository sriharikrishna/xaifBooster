#ifndef _XAIFBOOSTERCONSTANTFOLDING_ENHANCEDPRIVATELINEARIZEDCOMPUTATIONALGRAPH_INCLUDE_
#define _XAIFBOOSTERCONSTANTFOLDING_ENHANCEDPRIVATELINEARIZEDCOMPUTATIONALGRAPH_INCLUDE_

#include <list>
#include "xaifBooster/boostWrapper/inc/GraphWrapper.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdge.hpp"
#include "xaifBooster/algorithms/ConstantFolding/inc/EnhancedPrivateLinearizedComputationalGraphEdge.hpp"
#include "xaifBooster/algorithms/ConstantFolding/inc/EnhancedPrivateLinearizedComputationalGraphVertex.hpp"

using namespace xaifBooster; 

namespace xaifBoosterConstantFolding {  

  class EnhancedPrivateLinearizedComputationalGraph : public xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraph {
    
  public:
    
    EnhancedPrivateLinearizedComputationalGraph() {};
    
    virtual ~EnhancedPrivateLinearizedComputationalGraph() {};
    

    void front_elim(xaifBoosterConstantFolding::EnhancedPrivateLinearizedComputationalGraphEdge& e);
    void back_elim(xaifBoosterConstantFolding::EnhancedPrivateLinearizedComputationalGraphEdge& e);
    void ConstantFolding();
    void CheckInEdgesForTriviality(xaifBoosterConstantFolding::EnhancedPrivateLinearizedComputationalGraphVertex& j);
    void CheckOutEdgesForTriviality(xaifBoosterConstantFolding::EnhancedPrivateLinearizedComputationalGraphVertex& j);
    bool CheckInEdgesForConstants(xaifBoosterConstantFolding::EnhancedPrivateLinearizedComputationalGraphVertex& j);
    bool CheckOutEdgesForConstants(xaifBoosterConstantFolding::EnhancedPrivateLinearizedComputationalGraphVertex& j);
    void RunConstantCheckForwardBackward();
    void RunTrivialCheckForward();
    void RunTrivialCheckBackwards();

  };
  
} 

#endif
