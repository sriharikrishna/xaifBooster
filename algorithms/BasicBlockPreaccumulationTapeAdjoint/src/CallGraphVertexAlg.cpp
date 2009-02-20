#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/CallGraphVertexAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationTapeAdjoint {

  CallGraphVertexAlg::CallGraphVertexAlg(CallGraphVertex& theContaining) : 
    xaifBooster::CallGraphVertexAlgBase(theContaining),
    xaifBoosterBasicBlockPreaccumulationTape::CallGraphVertexAlg(theContaining) {
  } // end CallGraphVertexAlg::CallGraphVertexAlg()

  CallGraphVertexAlg::~CallGraphVertexAlg() {
  } // end CallGraphVertexAlg::~CallGraphVertexAlg()

  void
  CallGraphVertexAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
  } // end CallGraphVertexAlg::traverseToChildren()

} // end namespace xaifBoosterBasicBlockPreaccumulationTapeAdjoint

