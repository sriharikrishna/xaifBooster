#include "xaifBooster/algorithms/ConstantFolding/inc/EnhancedPrivateLinearizedComputationalGraphEdgeAlgFactory.hpp"
#include "xaifBooster/algorithms/ConstantFolding/inc/BasicBlockAlg.hpp"
namespace xaifBoosterConstantFolding {

  EnhancedPrivateLinearizedComputationalGraphEdgeAlgFactory* EnhancedPrivateLinearizedComputationalGraphEdgeAlgFactory::ourPrivateLinearizedComputationalGraphEdgeAlgFactoryInstance_p=0;
  
  EnhancedPrivateLinearizedComputationalGraphEdge *EnhancedPrivateLinearizedComputationalGraphEdgeAlgFactory::makeNewPrivateLinearizedComputationalGraphEdge() {
    return (new EnhancedPrivateLinearizedComputationalGraphEdge()); 
  }

  EnhancedPrivateLinearizedComputationalGraphEdgeAlgFactory* EnhancedPrivateLinearizedComputationalGraphEdgeAlgFactory::instance() {
    //    return BasicBlockAlg::getPrivateLinearizedComputationalGraphEdgeAlgFactory();
    if (!(ourPrivateLinearizedComputationalGraphEdgeAlgFactoryInstance_p))
      ourPrivateLinearizedComputationalGraphEdgeAlgFactoryInstance_p=new EnhancedPrivateLinearizedComputationalGraphEdgeAlgFactory;
    return ourPrivateLinearizedComputationalGraphEdgeAlgFactoryInstance_p; 
  }
  
  std::string EnhancedPrivateLinearizedComputationalGraphEdgeAlgFactory::debug() const {
    std::ostringstream out;
    out << "xaifBoosterConstantFolding"
	<< "::"
	<< "EnhancedPrivateLinearizedComputationalGraphEdge"
	<<  "AlgFactory["
	<< this
	<< "]"<<std::ends;
    return out.str();
  }

}
