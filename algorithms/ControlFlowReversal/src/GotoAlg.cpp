#include <sstream>

#include "xaifBooster/algorithms/ControlFlowReversal/inc/GotoAlg.hpp"
#include "xaifBooster/system/inc/Goto.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

  GotoAlg::GotoAlg(Goto& theContaining) : GotoAlgBase(theContaining), ControlFlowGraphVertexAlg(theContaining) {}

  GotoAlg::~GotoAlg() {}

  std::string
  GotoAlg::debug() const {
    std::ostringstream out;
    out << "xaifBoosterControlFlowReversal::GotoAlg[" << this
        << "]" << std::ends;
    return out.str();
  }

} // end of namespace

