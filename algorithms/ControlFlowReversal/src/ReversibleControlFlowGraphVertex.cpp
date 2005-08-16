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
    myCounterPart_p(0),
    myTopExplicitLoop_p(0),
    myTopExplicitLoopAddressArithmetic_p(0) {
  }

  ReversibleControlFlowGraphVertex::ReversibleControlFlowGraphVertex(const ControlFlowGraphVertex* theOriginal) : 
    original(true),
    adjoint(false),
    myOriginalVertex_p(theOriginal),
    myNewVertex_p(0),
    myVisitedFlag(false),
    myIndex(0),
    myReversalType(ForLoopReversalType::ANONYMOUS), 
    myCounterPart_p(0),
    myTopExplicitLoop_p(0),
    myTopExplicitLoopAddressArithmetic_p(0) {
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

  ControlFlowGraphVertexAlg&
  ReversibleControlFlowGraphVertex::getOriginalControlFlowGraphVertexAlg() {
    return dynamic_cast<ControlFlowGraphVertexAlg&>(myOriginalVertex_p->getControlFlowGraphVertexAlgBase());
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
	<< ",original="
	<< original
	<< ",adjoint="
	<< adjoint
	<< ",myIndex="
	<< myIndex
	<< ",getKind():"
	<< getKind()
	<< ",myReversalType="
	<< ForLoopReversalType::toString(myReversalType).c_str()
	<< ",myCounterPart_p="
	<< myCounterPart_p
	<< ",myTopExplicitLoop_p="
	<< myTopExplicitLoop_p
	<< ",myTopExplicitLoopAddressArithmetic_p="
	<< myTopExplicitLoopAddressArithmetic_p
	<< ",myKnownLoopVariables[";
      for (VariablePList::const_iterator knownListI= myKnownLoopVariables.begin();
	   knownListI!= myKnownLoopVariables.end();
	   ++knownListI) { 
	out << (*knownListI)->debug().c_str();
      }
      out << "]"
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
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraphVertexAlg::getCounterPart: not set");
    return *myCounterPart_p;
  }

  const ReversibleControlFlowGraphVertex::VariablePList& 
  ReversibleControlFlowGraphVertex::getKnownLoopVariables()const { 
    return myKnownLoopVariables;
  } 
    
  void 
  ReversibleControlFlowGraphVertex::inheritLoopVariables(const ReversibleControlFlowGraphVertex& aParent) {
    const ReversibleControlFlowGraphVertex::VariablePList& aParentList(aParent.getKnownLoopVariables());
    if (myKnownLoopVariables.size())
      THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraphVertex::inheritLoopVariables: already inherited once");
    for(VariablePList::const_iterator i=aParentList.begin();
	i!=aParentList.end();
	++i) { 
      myKnownLoopVariables.push_back(*i);
    }
  } 

  void 
  ReversibleControlFlowGraphVertex::addLoopVariable(const Variable& aLoopVariable) { 
    myKnownLoopVariables.push_back(&aLoopVariable);
  }


  ReversibleControlFlowGraphVertex& 
  ReversibleControlFlowGraphVertex::getTopExplicitLoop() { 
    if (myReversalType!=ForLoopReversalType::EXPLICIT) { 
      THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraphVertex::getTopExplicitLoop: the vertex is not explicit");
    } 
    if (!myTopExplicitLoop_p)
      THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraphVertex::getTopExplicitLoop: not set");
    return *myTopExplicitLoop_p;
  } 

  void 
  ReversibleControlFlowGraphVertex::setTopExplicitLoop(ReversibleControlFlowGraphVertex& theTopExplicitLoop) { 
    if (myReversalType!=ForLoopReversalType::EXPLICIT) { 
      THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraphVertex::setTopExplicitLoop: the vertex is not explicit");
    } 
    if (myTopExplicitLoop_p && myTopExplicitLoop_p!=&theTopExplicitLoop )
      THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraphVertex::setTopExplicitLoop: already set "
				 << myOriginalVertex_p->debug().c_str());
    myTopExplicitLoop_p=&theTopExplicitLoop;
  } 

  ReversibleControlFlowGraphVertex& 
  ReversibleControlFlowGraphVertex::getTopExplicitLoopAddressArithmetic() { 
    if (!myTopExplicitLoopAddressArithmetic_p)
      THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraphVertex::getTopExplicitLoopAddressArithmetic: not set for "
				 << myOriginalVertex_p->debug().c_str());
    return *myTopExplicitLoopAddressArithmetic_p;
  } 

  void 
  ReversibleControlFlowGraphVertex::setTopExplicitLoopAddressArithmetic(ReversibleControlFlowGraphVertex& theTopExplicitLoopAddressArithmetic) { 
    if (myTopExplicitLoopAddressArithmetic_p)
      THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraphVertex::setTopExplicitLoopAddressArithmetic: already set");
    myTopExplicitLoopAddressArithmetic_p=&theTopExplicitLoopAddressArithmetic;
  } 

} // end of namespace

