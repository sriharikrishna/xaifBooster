#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/GraphVizDisplay.hpp"

#include "xaifBooster/algorithms/ControlFlowReversal/inc/CallGraphVertexAlg.hpp"
#include "xaifBooster/system/inc/CallGraphVertex.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

  CallGraphVertexAlg::CallGraphVertexAlg(CallGraphVertex& theContaining) : CallGraphVertexAlgBase(theContaining), myTapingControlFlowGraph(NULL), myAdjointControlFlowGraph(NULL) {
  }

  CallGraphVertexAlg::~CallGraphVertexAlg() {
    if (myTapingControlFlowGraph) delete myTapingControlFlowGraph;
    if (myAdjointControlFlowGraph) delete myAdjointControlFlowGraph;
  }

  ReversibleControlFlowGraph&
  CallGraphVertexAlg::getTapingControlFlowGraph() {
    return *myTapingControlFlowGraph;
  }
                                                                                
  const ReversibleControlFlowGraph&
  CallGraphVertexAlg::getTapingControlFlowGraph() const {
    return *myTapingControlFlowGraph;
  }

  ReversibleControlFlowGraph&
  CallGraphVertexAlg::getAdjointControlFlowGraph() {
    return *myAdjointControlFlowGraph;
  }
                                                                                
  const ReversibleControlFlowGraph&
  CallGraphVertexAlg::getAdjointControlFlowGraph() const {
    return *myAdjointControlFlowGraph;
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
      out << "[label=\"" << boost::get(boost::get(BoostVertexContentType(), myG.getInternalBoostGraph()), v)->getIndex() << " (" << theXaifId.c_str() << "): " << theVertexKind.c_str() << "\"]";
    }
    const ReversibleControlFlowGraph& myG;
  }

  class ControlFlowGraphEdgeLabelWriter {
  public:
    ControlFlowGraphEdgeLabelWriter(const ReversibleControlFlowGraph& g) : myG(g) {}
    template <class BoostIntenalEdgeDescriptor>
    void operator()(std::ostream& out, const BoostIntenalEdgeDescriptor& v) const {
      ReversibleControlFlowGraphEdge* theReversibleControlFlowGraphEdge_p=boost::get(boost::get(BoostEdgeContentType(),myG.getInternalBoostGraph()),v);
      /*
	if (theReversibleControlFlowGraphEdge_p->isOriginal()) {
        if (theReversibleControlFlowGraphEdge_p->getOriginalEdge().has_condition_value()) out << "[label=\"1\"]";
	}
	else {
        if (theReversibleControlFlowGraphEdge_p->getNewEdge().has_condition_value()) out << "[label=\"1\"]";
	}
      */
      if (theReversibleControlFlowGraphEdge_p->has_condition_value()) out << "[label=\"1\"]";
    }
    const ReversibleControlFlowGraph& myG;
  }

  void CallGraphVertexAlg::algorithm_action_4() {
    DBG_MACRO(DbgGroup::CALLSTACK,
              "xaifBoosterControlFlowReversal::CallGraphVertexAlg::algorithm_action_4(reverse control flow) called for: "
              << debug().c_str());
    if (!getContaining().getControlFlowGraph().numVertices())
      // for instance modules may have an empty CallGraph
      return; 
    myTapingControlFlowGraph=new ReversibleControlFlowGraph(getContaining().getControlFlowGraph());
    myAdjointControlFlowGraph=new ReversibleControlFlowGraph(getContaining().getControlFlowGraph());
    myTapingControlFlowGraph->makeThisACopyOfOriginalControlFlowGraph();
    //	GraphVizDisplay::show(*myTapingControlFlowGraph,"cfg_copy", ControlFlowGraphVertexLabelWriter(*myTapingControlFlowGraph),ControlFlowGraphEdgeLabelWriter(*myTapingControlFlowGraph));
    myTapingControlFlowGraph->topologicalSort();
    if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {     
      GraphVizDisplay::show(*myTapingControlFlowGraph,"cfg_topologically_sorted", ControlFlowGraphVertexLabelWriter(*myTapingControlFlowGraph),ControlFlowGraphEdgeLabelWriter(*myTapingControlFlowGraph));
    }
    // buildAdjointControlFlowGraph() should always be based on the
    // original CFG, that is, it should preceed the call to 
    // storeControlFlow()
    myTapingControlFlowGraph->buildAdjointControlFlowGraph(*myAdjointControlFlowGraph);
    if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {     
      GraphVizDisplay::show(*myAdjointControlFlowGraph,"cfg_adjoint", ControlFlowGraphVertexLabelWriter(*myAdjointControlFlowGraph),ControlFlowGraphEdgeLabelWriter(*myTapingControlFlowGraph));
    }
    myTapingControlFlowGraph->markBranchExitEdges();
    if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {     
      GraphVizDisplay::show(*myTapingControlFlowGraph,"cfg_branch_marked", ControlFlowGraphVertexLabelWriter(*myTapingControlFlowGraph),ControlFlowGraphEdgeLabelWriter(*myTapingControlFlowGraph));
    }
    myTapingControlFlowGraph->storeControlFlow();
    if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {     
      GraphVizDisplay::show(*myTapingControlFlowGraph,"cfg_taping", ControlFlowGraphVertexLabelWriter(*myTapingControlFlowGraph),ControlFlowGraphEdgeLabelWriter(*myTapingControlFlowGraph));
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
                                                                                
    myTapingControlFlowGraph->printXMLHierarchy(os);
    // short cut: has 2 ENTRIES and EXITS in one cfg
    myAdjointControlFlowGraph->printXMLHierarchy(os);
                                                                                
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

