#include <sstream>
#include "xaifBooster/system/inc/ControlFlowGraphVertex.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/ConstantFolding/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/ConstantFolding/inc/EnhancedPrivateLinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/ConstantFolding/inc/EnhancedPrivateLinearizedComputationalGraphAlgFactory.hpp"
#include "xaifBooster/algorithms/ConstantFolding/inc/EnhancedPrivateLinearizedComputationalGraphEdgeAlgFactory.hpp"
#include "xaifBooster/algorithms/ConstantFolding/inc/EnhancedPrivateLinearizedComputationalGraphVertexAlgFactory.hpp"

namespace xaifBoosterConstantFolding { 
  BasicBlockAlg::BasicBlockAlg( BasicBlock& theContaining ) :
    BasicBlockAlgBase(theContaining), xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg(theContaining) {
  }
  
  void BasicBlockAlg::algorithm_action_3() {
    SequencePList SpL = getUniqueSequencePList();
    for (SequencePList::iterator i=(SpL).begin();i!=(SpL).end();++i) {
      EnhancedPrivateLinearizedComputationalGraph& g=(dynamic_cast <EnhancedPrivateLinearizedComputationalGraph&> (*(*i)->myFlattenedSequence_p));
      g.RunConstantCheckForwardBackward();
      g.RunTrivialCheckForward();
      g.RunTrivialCheckBackwards();
    }
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::algorithm_action_3();
  }
  void BasicBlockAlg::init() {
    setPrivateLinearizedComputationalGraphAlgFactory(EnhancedPrivateLinearizedComputationalGraphAlgFactory::instance());
    setPrivateLinearizedComputationalGraphEdgeAlgFactory(EnhancedPrivateLinearizedComputationalGraphEdgeAlgFactory::instance());
    setPrivateLinearizedComputationalGraphVertexAlgFactory(EnhancedPrivateLinearizedComputationalGraphVertexAlgFactory::instance());
  } 

} // end of namespace xaifBoosterAngelInterfaceAlgorithms 
