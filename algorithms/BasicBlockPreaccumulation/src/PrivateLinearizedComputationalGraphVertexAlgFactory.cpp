#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertexAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertex.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"

namespace xaifBoosterBasicBlockPreaccumulation {

  xaifBoosterBasicBlockPreaccumulation ::PrivateLinearizedComputationalGraphVertexAlgFactory* PrivateLinearizedComputationalGraphVertexAlgFactory::instance() {
    return BasicBlockAlg::getPrivateLinearizedComputationalGraphVertexAlgFactory();
  }

  std::string PrivateLinearizedComputationalGraphVertexAlgFactory::debug() const {
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulation::"
	<< "PrivateLinearizedComputationalGraphVertex"
	<< "AlgFactory["
	<< this
	<<"]"<<std::ends;
    return out.str();  
  }
}

