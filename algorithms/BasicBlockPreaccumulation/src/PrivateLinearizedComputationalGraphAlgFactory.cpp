#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"

namespace xaifBoosterBasicBlockPreaccumulation {
  xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphAlgFactory* PrivateLinearizedComputationalGraphAlgFactory::instance() {
    return BasicBlockAlg::getPrivateLinearizedComputationalGraphAlgFactory();
  }

  std::string PrivateLinearizedComputationalGraphAlgFactory::debug() const {
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulation::"
	<< "PrivateLinearizedComputationalGraph"
	<< "AlgFactory["
	<< this
	<<"]"<<std::ends;
    return out.str();  
  }
}
