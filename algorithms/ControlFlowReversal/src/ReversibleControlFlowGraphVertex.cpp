#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ReversibleControlFlowGraphVertex.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

  ReversibleControlFlowGraphVertex::ReversibleControlFlowGraphVertex() : original(false), adjoint(false), myOriginalVertex_p(NULL), myVisitedFlag(false), myIndex(0) {}

  ReversibleControlFlowGraphVertex::ReversibleControlFlowGraphVertex(const ControlFlowGraphVertex* theOriginal) : original(true), adjoint(false), myOriginalVertex_p(theOriginal), myVisitedFlag(false), myIndex(0) {}

  ReversibleControlFlowGraphVertex::~ReversibleControlFlowGraphVertex() {}

  const ControlFlowGraphVertexAlg&
  ReversibleControlFlowGraphVertex::getOriginalControlFlowGraphVertexAlg() const {
    return dynamic_cast<const ControlFlowGraphVertexAlg&>(myOriginalVertex_p->getControlFlowGraphVertexAlgBase());
  }

  const ControlFlowGraphVertexAlg&
  ReversibleControlFlowGraphVertex::getNewControlFlowGraphVertexAlg() const {
    return dynamic_cast<const ControlFlowGraphVertexAlg&>(myNewVertex_p->getControlFlowGraphVertexAlgBase());
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

  void ReversibleControlFlowGraphVertex::setVisited(bool b) {
    myVisitedFlag=b;
  } 

  bool ReversibleControlFlowGraphVertex::getVisited() const {
    return myVisitedFlag;
  }

  void ReversibleControlFlowGraphVertex::setIndex(int i) {
    myIndex=i;
  } 

  void ReversibleControlFlowGraphVertex::setAdjointIndex(int i) {
    myIndex=-i;
  } 

  int ReversibleControlFlowGraphVertex::getIndex() const {
    return myIndex;
  }

} // end of namespace

