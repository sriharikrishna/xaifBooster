#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"

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
  ReversibleControlFlowGraphVertex::supplyAndAddNewVertex(ControlFlowGraphVertex& theNewVertex) { 
    myNewVertex_p=&theNewVertex; 
  }

  void
  ReversibleControlFlowGraphVertex::printXMLHierarchy(std::ostream& os) const {
    if (!original) { 
      // JU: this is not nice! These things have Alg objects which  when 
      // inherited in a different algorithm override printing which shouldn't 
      // happen here. So we have to forcibly override it. 
      xaifBooster::PrintVersion::PrintVersion_E aPrintVersion(xaifBooster::ConceptuallyStaticInstances::instance()->
							      getPrintVersion());
      xaifBooster::ConceptuallyStaticInstances::instance()->setPrintVersion(xaifBooster::PrintVersion::SYSTEM_ONLY);
      myNewVertex_p->printXMLHierarchy(os);
      xaifBooster::ConceptuallyStaticInstances::instance()->setPrintVersion(aPrintVersion);
    }
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
	 << ",original="
	 << original
	 << ",adjoint="
	 << adjoint
	 << ",myIndex="
	 << myIndex
	 << ",getKind():"
	 << getKind()
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
                                                                    
  ControlFlowGraphVertexAlg::ControlFlowGraphVertexKind_E 
  ReversibleControlFlowGraphVertex::getKind() const {
    if (original)
      return getOriginalControlFlowGraphVertexAlg().getKind();
    else
      return getNewControlFlowGraphVertexAlg().getKind();
  }

} // end of namespace

