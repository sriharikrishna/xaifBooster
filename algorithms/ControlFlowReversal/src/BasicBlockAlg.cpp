#include <sstream>

#include "xaifBooster/algorithms/ControlFlowReversal/inc/BasicBlockAlg.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

  BasicBlockAlg::BasicBlockAlg(BasicBlock& theContaining) : BasicBlockAlgBase(theContaining), ControlFlowGraphVertexAlg(theContaining) {
  }

  BasicBlockAlg::~BasicBlockAlg() {}
  
  std::string
  BasicBlockAlg::debug() const {
    std::ostringstream out;
    out << "xaifBoosterControlFlowReversal::BasicBlockAlg[" << this
        << "]" << std::ends;
    return out.str();
  }

} // end of namespace

