#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"

namespace xaifBoosterBasicBlockPreaccumulation {
  PrivateLinearizedComputationalGraphAlgFactory* PrivateLinearizedComputationalGraphAlgFactory::ourPrivateLinearizedComputationalGraphAlgFactoryInstance_p=0;

  xaifBoosterBasicBlockPreaccumulation ::PrivateLinearizedComputationalGraphAlgFactory* PrivateLinearizedComputationalGraphAlgFactory::instance() {
    if (!ourPrivateLinearizedComputationalGraphAlgFactoryInstance_p)
      ourPrivateLinearizedComputationalGraphAlgFactoryInstance_p= new PrivateLinearizedComputationalGraphAlgFactory;
    return ourPrivateLinearizedComputationalGraphAlgFactoryInstance_p;
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
