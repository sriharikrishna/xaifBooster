#include <sstream>

#include "xaifBooster/algorithms/ControlFlowReversal/inc/BasicBlockAlg.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

  BasicBlockAlg::BasicBlockAlg(BasicBlock& theContaining) : 
    BasicBlockAlgBase(theContaining),
    ControlFlowGraphVertexAlg(theContaining),
    myReversalType(ForLoopReversalType::ANONYMOUS) {
  }

  BasicBlockAlg::~BasicBlockAlg() {}
  
  std::string
  BasicBlockAlg::debug() const {
    std::ostringstream out;
    out << "xaifBoosterControlFlowReversal::BasicBlockAlg[" << this
        << "]" << std::ends;
    return out.str();
  }

  void BasicBlockAlg::setReversalType(ForLoopReversalType::ForLoopReversalType_E aReversalType) { 
    myReversalType=aReversalType;
  }

  ForLoopReversalType::ForLoopReversalType_E BasicBlockAlg::getReversalType() const { 
    return myReversalType;
  }

} // end of namespace

