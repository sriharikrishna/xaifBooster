#include <sstream>

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/CallGraphVertexAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationTape {

  CallGraphVertexAlg::CallGraphVertexAlg(CallGraphVertex& theContaining) : 
    CallGraphVertexAlgBase(theContaining) {
  }

  CallGraphVertexAlg::~CallGraphVertexAlg() {
  }

  std::string
  CallGraphVertexAlg::debug() const {
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulationTape::CallGraphVertexAlg[" << this
        << ",myContaining=" << getContaining().debug().c_str()
        << ",myCFRRequiredValueSet=" << myCFRRequiredValueSet.debug().c_str()
        << "]" << std::ends;
    return out.str();
  } // end CallGraphVertexAlg::debug()

  void
  CallGraphVertexAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
  } // end CallGraphVertexAlg::traverseToChildren()

  void
  CallGraphVertexAlg::markRequiredValue(const Expression& theExpression,
                                        const ControlFlowGraphVertex& theControlFlowGraphVertex,
                                        const std::string theOriginStr) {
    myRequiredValueSet.addValueToRequiredSet(theExpression,
                                             theControlFlowGraphVertex,
                                             theOriginStr);
  } // end CallGraphVertexAlg::markRequiredValue()

  void
  CallGraphVertexAlg::markCFRRequiredValue(const Expression& theExpression,
                                        const ControlFlowGraphVertex& theControlFlowGraphVertex,
                                        const std::string theOriginStr) {
    myCFRRequiredValueSet.addValueToRequiredSet(theExpression,
                                             theControlFlowGraphVertex,
                                             theOriginStr);
  } // end CallGraphVertexAlg::markRequiredValue()

} // end namespace xaifBoosterBasicBlockPreaccumulationTape

