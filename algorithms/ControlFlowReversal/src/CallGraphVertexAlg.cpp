#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/GraphVizDisplay.hpp"

#include "xaifBooster/algorithms/ControlFlowReversal/inc/CallGraphVertexAlg.hpp"
#include "xaifBooster/system/inc/CallGraphVertex.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

  CallGraphVertexAlg::CallGraphVertexAlg(CallGraphVertex& theContaining) : 
    CallGraphVertexAlgBase(theContaining), 
    myTapingControlFlowGraph_p(NULL), 
    myAdjointControlFlowGraph_p(NULL) {
  }

  CallGraphVertexAlg::~CallGraphVertexAlg() {
    if (myTapingControlFlowGraph_p) delete myTapingControlFlowGraph_p;
    if (myAdjointControlFlowGraph_p) delete myAdjointControlFlowGraph_p;
  }

  bool CallGraphVertexAlg::hasTapingControlFlowGraph() const { 
    return (myTapingControlFlowGraph_p?true:false);
  }
  
  ReversibleControlFlowGraph&
  CallGraphVertexAlg::getTapingControlFlowGraph() {
    if (!myTapingControlFlowGraph_p) 
      THROW_LOGICEXCEPTION_MACRO("CallGraphVertexAlg::getTapingControlFlowGraph: not set");
    return *myTapingControlFlowGraph_p;
  }
                                                                                
  const ReversibleControlFlowGraph&
  CallGraphVertexAlg::getTapingControlFlowGraph() const {
    if (!myTapingControlFlowGraph_p) 
      THROW_LOGICEXCEPTION_MACRO("CallGraphVertexAlg::getTapingControlFlowGraph: not set");
    return *myTapingControlFlowGraph_p;
  }

  bool CallGraphVertexAlg::hasAdjointControlFlowGraph() const { 
    return (myAdjointControlFlowGraph_p?true:false);
  }

  ReversibleControlFlowGraph&
  CallGraphVertexAlg::getAdjointControlFlowGraph() {
    if (!myAdjointControlFlowGraph_p) 
      THROW_LOGICEXCEPTION_MACRO("CallGraphVertexAlg::getAdjointControlFlowGraph: not set");
    return *myAdjointControlFlowGraph_p;
  }
                                                                                
  const ReversibleControlFlowGraph&
  CallGraphVertexAlg::getAdjointControlFlowGraph() const {
    if (!myAdjointControlFlowGraph_p) 
      THROW_LOGICEXCEPTION_MACRO("CallGraphVertexAlg::getAdjointControlFlowGraph: not set");
    return *myAdjointControlFlowGraph_p;
  }

  class ControlFlowGraphVertexLabelWriter {
  public:
    ControlFlowGraphVertexLabelWriter(const ReversibleControlFlowGraph& g) : myG(g) {}
    template <class BoostIntenalVertexDescriptor>
    void operator()(std::ostream& out, const BoostIntenalVertexDescriptor& v) const {
      ReversibleControlFlowGraphVertex* theReversibleControlFlowGraphVertex_p=boost::get(boost::get(BoostVertexContentType(),myG.getInternalBoostGraph()),v);
      std::string theVertexKind;
      std::string theXaifId;
      if (theReversibleControlFlowGraphVertex_p->isOriginal()) {
        theVertexKind=dynamic_cast<const ControlFlowGraphVertexAlg&>(theReversibleControlFlowGraphVertex_p->getOriginalVertex().getControlFlowGraphVertexAlgBase()).kindToString();
        theXaifId=dynamic_cast<const ControlFlowGraphVertex&>(theReversibleControlFlowGraphVertex_p->getOriginalVertex()).getId();
        
      }
      else {
        theVertexKind=dynamic_cast<const ControlFlowGraphVertexAlg&>(theReversibleControlFlowGraphVertex_p->getNewVertex().getControlFlowGraphVertexAlgBase()).kindToString();
        theXaifId=dynamic_cast<const ControlFlowGraphVertex&>(theReversibleControlFlowGraphVertex_p->getNewVertex()).getId();
      }
      if (theReversibleControlFlowGraphVertex_p->getReversalType()==ForLoopReversalType::EXPLICIT) { 
	std::ostringstream temp;
	temp << theXaifId.c_str() << ".e" << std::ends;
	theXaifId=temp.str();
      }
      out << "[label=\"" << boost::get(boost::get(BoostVertexContentType(), myG.getInternalBoostGraph()), v)->getIndex() << " (" << theXaifId.c_str() << "): " << theVertexKind.c_str() << "\"]";
    }
    const ReversibleControlFlowGraph& myG;
  };

  class ControlFlowGraphEdgeLabelWriter {
  public:
    ControlFlowGraphEdgeLabelWriter(const ReversibleControlFlowGraph& g) : myG(g) {}
    template <class BoostIntenalEdgeDescriptor>
    void operator()(std::ostream& out, const BoostIntenalEdgeDescriptor& v) const {
      ReversibleControlFlowGraphEdge* theReversibleControlFlowGraphEdge_p=boost::get(boost::get(BoostEdgeContentType(),myG.getInternalBoostGraph()),v);
      if (theReversibleControlFlowGraphEdge_p->hasConditionValue() ||
	  theReversibleControlFlowGraphEdge_p->hasRevConditionValue()) { 
	out << "[label=\"";
	if (theReversibleControlFlowGraphEdge_p->hasConditionValue())
	  out << theReversibleControlFlowGraphEdge_p->getConditionValue();
	if (theReversibleControlFlowGraphEdge_p->hasRevConditionValue())
	  out << "r" << theReversibleControlFlowGraphEdge_p->getRevConditionValue();
	out << "\"]";
      }
    }
    const ReversibleControlFlowGraph& myG;
  };

  void CallGraphVertexAlg::algorithm_action_4() {
    DBG_MACRO(DbgGroup::CALLSTACK,
              "xaifBoosterControlFlowReversal::CallGraphVertexAlg::algorithm_action_4(reverse control flow) called for: "
              << debug().c_str());
    if (!getContaining().getControlFlowGraph().numVertices())
      // for instance modules may have an empty CallGraph
      return; 
    myTapingControlFlowGraph_p=new ReversibleControlFlowGraph(getContaining().getControlFlowGraph());
    myAdjointControlFlowGraph_p=new ReversibleControlFlowGraph(getContaining().getControlFlowGraph());
    myTapingControlFlowGraph_p->makeThisACopyOfOriginalControlFlowGraph();
    //	GraphVizDisplay::show(*myTapingControlFlowGraph_p,"cfg_copy", ControlFlowGraphVertexLabelWriter(*myTapingControlFlowGraph_p),ControlFlowGraphEdgeLabelWriter(*myTapingControlFlowGraph_p));
    myTapingControlFlowGraph_p->topologicalSort();
    if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {     
      GraphVizDisplay::show(*myTapingControlFlowGraph_p,"cfg_topologically_sorted", ControlFlowGraphVertexLabelWriter(*myTapingControlFlowGraph_p),ControlFlowGraphEdgeLabelWriter(*myTapingControlFlowGraph_p));
    }
    myTapingControlFlowGraph_p->markBranchExitEdges();
    if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {     
      GraphVizDisplay::show(*myTapingControlFlowGraph_p,"cfg_branch_marked", ControlFlowGraphVertexLabelWriter(*myTapingControlFlowGraph_p),ControlFlowGraphEdgeLabelWriter(*myTapingControlFlowGraph_p));
    }
    // buildAdjointControlFlowGraph() should always be based on the
    // original CFG, that is, it should precede the call to 
    // storeControlFlow()
    // but we should have found out how to label branch edges...
    myTapingControlFlowGraph_p->buildAdjointControlFlowGraph(*myAdjointControlFlowGraph_p);
    if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {     
      GraphVizDisplay::show(*myAdjointControlFlowGraph_p,"cfg_adjoint", ControlFlowGraphVertexLabelWriter(*myAdjointControlFlowGraph_p),ControlFlowGraphEdgeLabelWriter(*myAdjointControlFlowGraph_p));
    }
    myTapingControlFlowGraph_p->storeControlFlow();
    if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {     
      GraphVizDisplay::show(*myTapingControlFlowGraph_p,"cfg_taping", ControlFlowGraphVertexLabelWriter(*myTapingControlFlowGraph_p),ControlFlowGraphEdgeLabelWriter(*myTapingControlFlowGraph_p));
    }
  } // end CallGraphVertexAlg::algorithm_action_4() 

  void
  CallGraphVertexAlg::printXMLHierarchy(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent()
       << "<"
       << getContaining().getControlFlowGraph().ourXAIFName.c_str()
       << " ";
    getContaining().getControlFlowGraph().printAttributes(os);
    os << " "
       << getContaining().getControlFlowGraph().our_myActiveFlag_XAIFName.c_str()
       << "=\""
       << getContaining().getControlFlowGraph().getActiveFlag()
       << "\">"
       << std::endl;
    getContaining().getControlFlowGraph().getArgumentList().printXMLHierarchy(os);

    // This is for testing purposes only,
    // if the following graphs have been created we have multiple ENTRIES and EXITS in one cfg                              
    // they may not have been created for empty graphs as e.g. possible for modules
    if (myTapingControlFlowGraph_p)
      myTapingControlFlowGraph_p->printXMLHierarchy(os);

    if (myAdjointControlFlowGraph_p)
      myAdjointControlFlowGraph_p->printXMLHierarchy(os);
                                                                                
    os << pm.indent()
       << "</"
       << getContaining().getControlFlowGraph().ourXAIFName
       << ">"
       << std::endl;
    pm.releaseInstance();
  }

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

