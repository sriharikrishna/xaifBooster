#include <sstream>

#include "xaifBooster/algorithms/ControlFlowReversal/inc/IfStatementAlg.hpp"
#include "xaifBooster/system/inc/IfStatement.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

  IfStatementAlg::IfStatementAlg(IfStatement& theContaining) : IfStatementAlgBase(theContaining), ControlFlowGraphVertexAlg(theContaining) {
  }

  IfStatementAlg::~IfStatementAlg() {}
  
  std::string
  IfStatementAlg::debug() const {
    std::ostringstream out;
    out << "xaifBoosterControlFlowReversal::IfStatementAlg[" << this
        << "]" << std::ends;
    return out.str();
  }

} // end of namespace

