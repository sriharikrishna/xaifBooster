#include <sstream>

#include "xaifBooster/algorithms/ConstantFolding/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/ConstantFolding/inc/EnhancedPrivateLinearizedComputationalGraph.hpp"


namespace xaifBoosterConstantFolding { 
  BasicBlockAlg::BasicBlockAlg( BasicBlock& theContaining ) :
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg(theContaining) {
  }
  
  void BasicBlockAlg::do_ConstantFolding() {
    SequncePList& SpL =getUniqueSequencePList();
    for (SequencePList::iterator i=(&SpL).begin();i!=(&SpL).end();++i) {
      EnhancedPrivateLinearizedComputationalGraph g=(*i).myFlattenedSequence;
      g.RunConstantCheckForwardBackward();
      g.RunTrivialCheckForward();
      g.RunTrivialCheckBackwards();

    }
  }
} // end of namespace xaifBoosterAngelInterfaceAlgorithms 
