#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/ControlFlowGraphAlg.hpp"
#include "xaifBooster/system/inc/ControlFlowGraph.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

  ControlFlowGraphAlg::ControlFlowGraphAlg(const ControlFlowGraph& theContaining) : ControlFlowGraphAlgBase(theContaining) {}

  ControlFlowGraphAlg::~ControlFlowGraphAlg() {}

  void
  ControlFlowGraphAlg::printXMLHierarchy(std::ostream& os) const {}

  std::string
  ControlFlowGraphAlg::debug() const {
     std::ostringstream out;
     out << "xaifBoosterControlFlowReversal::ControlFlowGraphAlg["
        << this
        << "]" << std::ends;
    return out.str();
  }

  void ControlFlowGraphAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
  }

} // end of namespace

