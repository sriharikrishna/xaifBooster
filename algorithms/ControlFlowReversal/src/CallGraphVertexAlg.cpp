#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/GraphVizDisplay.hpp"

#include "xaifBooster/algorithms/ControlFlowReversal/inc/CallGraphVertexAlg.hpp"
#include "xaifBooster/system/inc/CallGraphVertex.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

  CallGraphVertexAlg::CallGraphVertexAlg(CallGraphVertex& theContaining) : CallGraphVertexAlgBase(theContaining) {
  }

  CallGraphVertexAlg::~CallGraphVertexAlg() {
  }

  void CallGraphVertexAlg::algorithm_action_4() {
    DBG_MACRO(DbgGroup::CALLSTACK,
              "xaifBoosterControlFlowReversal::CallGraphVertexAlg::algorithm_action_4(reverse control flow) called for: "
              << debug().c_str());
  } // end CallGraphVertexAlg::algorithm_action_4() 

  void
  CallGraphVertexAlg::printXMLHierarchy(std::ostream& os) const {}

  std::string
  CallGraphVertexAlg::debug() const {
     std::ostringstream out;
     out << "xaifBoosterControlFlowReversal::CallGraphVertexAlg["
        << this
        << "]" << std::ends;
    return out.str();
  }

  void CallGraphVertexAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
  }

} // end of namespace

