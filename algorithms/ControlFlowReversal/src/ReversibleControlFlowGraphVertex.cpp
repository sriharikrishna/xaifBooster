#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ReversibleControlFlowGraphVertex.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

  ReversibleControlFlowGraphVertex::ReversibleControlFlowGraphVertex() : original(false), adjoint(false), myOriginalVertex_p(NULL), myNewVertex_p(NULL) {}

  ReversibleControlFlowGraphVertex::ReversibleControlFlowGraphVertex(const ControlFlowGraphVertex* theOriginal) : original(true), adjoint(false), myOriginalVertex_p(theOriginal), myNewVertex_p(NULL) {}

  ReversibleControlFlowGraphVertex::~ReversibleControlFlowGraphVertex() { 
    if (!original) delete myNewVertex_p;
  }

  void
  ReversibleControlFlowGraphVertex::printXMLHierarchy(std::ostream& os) const {
    if (!original)
      myNewVertex_p->printXMLHierarchy(os);
    else {
      if (adjoint)
        myOriginalVertex_p->printXMLHierarchy(os);
      else
        myOriginalVertex_p->printXMLHierarchy(os);
    }
  }

  std::string
  ReversibleControlFlowGraphVertex::debug() const {
     std::ostringstream out;
     out << "xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex["
        << this
        << "]" << std::ends;
    return out.str();
  }

  void ReversibleControlFlowGraphVertex::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
  }

} // end of namespace

