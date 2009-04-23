#include "xaifBooster/system/inc/ControlFlowGraphVertexAlgBase.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphVertex.hpp"

namespace xaifBooster {

  ControlFlowGraphVertexAlgBase::ControlFlowGraphVertexAlgBase(const ControlFlowGraphVertex& theContaining) :
    AlgBase<ControlFlowGraphVertex>(theContaining) {
  } // end ControlFlowGraphVertexAlgBase::ControlFlowGraphVertexAlgBase()

  ControlFlowGraphVertexAlgBase::~ControlFlowGraphVertexAlgBase() {
  } // end ControlFlowGraphVertexAlgBase::~ControlFlowGraphVertexAlgBase()

  bool
  ControlFlowGraphVertexAlgBase::hasExpression(const Expression& anExpression) const {
    return false;
  } // end ControlFlowGraphVertexAlgBase::hasExpression()

} // end namespace xaifBooster

