#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdgeAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdge.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"

namespace xaifBoosterBasicBlockPreaccumulation {

  xaifBoosterBasicBlockPreaccumulation ::PrivateLinearizedComputationalGraphEdgeAlgFactory* PrivateLinearizedComputationalGraphEdgeAlgFactory::instance() {
    return BasicBlockAlg::getPrivateLinearizedComputationalGraphEdgeAlgFactory();
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

