#include <sstream>

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ForLoopAlg.hpp"
#include "xaifBooster/system/inc/ForLoop.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

  ForLoopAlg::ForLoopAlg(ForLoop& theContaining) : ForLoopAlgBase(theContaining), ControlFlowGraphVertexAlg(theContaining) {}

  ForLoopAlg::~ForLoopAlg() {}

  std::string
  ForLoopAlg::debug() const {
    std::ostringstream out;
    out << "xaifBoosterControlFlowReversal::ForLoopAlg[" << this
        << "]" << std::ends;
    return out.str();
  }

} // end of namespace

