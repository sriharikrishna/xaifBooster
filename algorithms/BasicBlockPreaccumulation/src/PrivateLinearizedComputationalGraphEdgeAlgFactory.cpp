#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdgeAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdge.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"

namespace xaifBoosterBasicBlockPreaccumulation {
  PrivateLinearizedComputationalGraphEdgeAlgFactory* PrivateLinearizedComputationalGraphEdgeAlgFactory::ourPrivateLinearizedComputationalGraphEdgeAlgFactoryInstance_p(0);
  xaifBoosterBasicBlockPreaccumulation ::PrivateLinearizedComputationalGraphEdgeAlgFactory* PrivateLinearizedComputationalGraphEdgeAlgFactory::instance() {
    if (!ourPrivateLinearizedComputationalGraphEdgeAlgFactoryInstance_p)
      ourPrivateLinearizedComputationalGraphEdgeAlgFactoryInstance_p=new PrivateLinearizedComputationalGraphEdgeAlgFactory();
    return ourPrivateLinearizedComputationalGraphEdgeAlgFactoryInstance_p;
  }

  std::string PrivateLinearizedComputationalGraphEdgeAlgFactory::debug() const {
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulation::"
	<< "PrivateLinearizedComputationalGraphEdge"
	<< "AlgFactory["
	<< this
	<<"]"<<std::ends;
    return out.str();  
  }
}

