#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/ForLoop.hpp"

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ReversibleControlFlowGraphVertex.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

  ReversibleControlFlowGraphVertex::ReversibleControlFlowGraphVertex() :
    original(false), 
    adjoint(false), 
    myOriginalVertex_p(0), 
    myNewVertex_p(0),
    myVisitedFlag(false), 
    myIndex(0), 
    myReversalType(ForLoopReversalType::ANONYMOUS), 
    myCounterPart_p(0) {
  }

  ReversibleControlFlowGraphVertex::ReversibleControlFlowGraphVertex(const ControlFlowGraphVertex* theOriginal) : 
    original(true),
    adjoint(false),
    myOriginalVertex_p(theOriginal),
    myNewVertex_p(0),
    myVisitedFlag(false),
    myIndex(0),
    myReversalType(ForLoopReversalType::ANONYMOUS), 
    myCounterPart_p(0) {
    ControlFlowGraphVertexAlg::ControlFlowGraphVertexKind_E theKind=dynamic_cast<const ControlFlowGraphVertexAlg&>(theOriginal->getControlFlowGraphVertexAlgBase()).getKind();
    if (theKind==ControlFlowGraphVertexAlg::FORLOOP)
      myReversalType=dynamic_cast<const ForLoop*>(theOriginal)->getReversalType();
  }

  ReversibleControlFlowGraphVertex::~ReversibleControlFlowGraphVertex() {
    if (myNewVertex_p)
      delete myNewVertex_p;
  }

  const ControlFlowGraphVertexAlg&
  ReversibleControlFlowGraphVertex::getOriginalControlFlowGraphVertexAlg() const {
    return dynamic_cast<const ControlFlowGraphVertexAlg&>(myOriginalVertex_p->getControlFlowGraphVertexAlgBase());
  }

  const ControlFlowGraphVertexAlg&
  ReversibleControlFlowGraphVertex::getNewControlFlowGraphVertexAlg() const {
    if (!myNewVertex_p)
      THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraphVertex::getNewControlFlowGraphVertexAlg: not set");
    return dynamic_cast<const ControlFlowGraphVertexAlg&>(myNewVertex_p->getControlFlowGraphVertexAlgBase());
  }

  void 
  ReversibleControlFlowGraphVertex::supplyAndAddNewVertex(ControlFlowGraphVertex& theNewVertex) { 
    if (myNewVertex_p)
      THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraphVertex::supplyAndAddNewVertex: already set");
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

  void ReversibleControlFlowGraphVertex::setReversalType(ForLoopReversalType::ForLoopReversalType_E aReversalType) { 
    myReversalType=aReversalType;
  }

  ForLoopReversalType::ForLoopReversalType_E ReversibleControlFlowGraphVertex::getReversalType() const { 
    return myReversalType;
  }

  void ReversibleControlFlowGraphVertex::setCounterPart(ReversibleControlFlowGraphVertex& theCounterPart) { 
    if(myCounterPart_p)
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraphVertexAlg::setCounterPart: already set");
    myCounterPart_p=&theCounterPart;
  }
      
  ReversibleControlFlowGraphVertex& ReversibleControlFlowGraphVertex::getCounterPart() { 
    if (!myCounterPart_p)
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraphVertexAlg::setCounterPart: not set");
    return *myCounterPart_p;
  }

} // end of namespace

