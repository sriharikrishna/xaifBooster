#include <sstream>

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ExitAlg.hpp"
#include "xaifBooster/system/inc/Exit.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

  ExitAlg::ExitAlg(Exit& theContaining) : ExitAlgBase(theContaining), ControlFlowGraphVertexAlg(theContaining) {}

  ExitAlg::~ExitAlg() {}

  std::string
  ExitAlg::debug() const {
    std::ostringstream out;
    out << "xaifBoosterControlFlowReversal::ExitAlg[" << this
        << "]" << std::ends;
    return out.str();
  }

} // end of namespace

