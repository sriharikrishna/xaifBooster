#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/GraphVizDisplay.hpp"

#include "xaifBooster/algorithms/ControlFlowReversal/inc/CallGraphVertexAlg.hpp"
#include "xaifBooster/system/inc/CallGraphVertex.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

  CallGraphVertexAlg::CallGraphVertexAlg(CallGraphVertex& theContaining) : CallGraphVertexAlgBase(theContaining), myTransformedControlFlowGraph(NULL) {
  }

  CallGraphVertexAlg::~CallGraphVertexAlg() {
    if (myTransformedControlFlowGraph) delete myTransformedControlFlowGraph;
  }

  ReversibleControlFlowGraph&
  CallGraphVertexAlg::getTransformedControlFlowGraph() {
    return *myTransformedControlFlowGraph;
  }
                                                                                
  const ReversibleControlFlowGraph&
  CallGraphVertexAlg::getTransformedControlFlowGraph() const {
    return *myTransformedControlFlowGraph;
  }

  class ControlFlowGraphVertexLabelWriter {
  public:
    ControlFlowGraphVertexLabelWriter(const ReversibleControlFlowGraph& g) : myG(g) {};
    template <class BoostIntenalVertexDescriptor>
    void operator()(std::ostream& out, const BoostIntenalVertexDescriptor& v) const {
      ReversibleControlFlowGraphVertex* theReversibleControlFlowGraphVertex_p=boost::get(boost::get(BoostVertexContentType(),myG.getInternalBoostGraph()),v);
      std::string theVertexIdx;
      std::string theVertexKind;
      if (theReversibleControlFlowGraphVertex_p->isOriginal()) {
        theVertexKind=dynamic_cast<const ControlFlowGraphVertexAlg&>(theReversibleControlFlowGraphVertex_p->getOriginalVertex().getControlFlowGraphVertexAlgBase()).kindToString();
        theVertexIdx=theReversibleControlFlowGraphVertex_p->getOriginalVertex().getId();
      }
      else {
        theVertexKind=dynamic_cast<const ControlFlowGraphVertexAlg&>(theReversibleControlFlowGraphVertex_p->getNewVertex().getControlFlowGraphVertexAlgBase()).kindToString();
        theVertexIdx=theReversibleControlFlowGraphVertex_p->getNewVertex().getId();
      }
        
      out << "[label=\"" << boost::get(boost::get(BoostVertexContentType(),
                                                  myG.getInternalBoostGraph()),
                                       v)->getIndex() << ": " 
          << theVertexIdx.c_str() << " " 
          << theVertexKind.c_str() << "\"]";
    };
    const ReversibleControlFlowGraph& myG;
  };

  class ControlFlowGraphEdgeLabelWriter {
  public:
    ControlFlowGraphEdgeLabelWriter(const ReversibleControlFlowGraph& g) : myG(g) {};
    template <class BoostIntenalEdgeDescriptor>
    void operator()(std::ostream& out, const BoostIntenalEdgeDescriptor& v) const {
      ReversibleControlFlowGraphEdge* theReversibleControlFlowGraphEdge_p=boost::get(boost::get(BoostEdgeContentType(),myG.getInternalBoostGraph()),v);
      out << "[label=\"" << theReversibleControlFlowGraphEdge_p->has_condition_value() << "\"]";
    };
    const ReversibleControlFlowGraph& myG;
  };

  void CallGraphVertexAlg::algorithm_action_4() {
    DBG_MACRO(DbgGroup::CALLSTACK,
              "xaifBoosterControlFlowReversal::CallGraphVertexAlg::algorithm_action_4(reverse control flow) called for: "
              << debug().c_str());
      myTransformedControlFlowGraph=new ReversibleControlFlowGraph(getContaining().getControlFlowGraph());
      if (DbgLoggerManager::instance()->isSelected(DbgGroup::TEMPORARY)) {     
	GraphVizDisplay::show(*myTransformedControlFlowGraph,"transformed_cfg_1",
			      ControlFlowGraphVertexLabelWriter(*myTransformedControlFlowGraph),ControlFlowGraphEdgeLabelWriter(*myTransformedControlFlowGraph));
      }
      myTransformedControlFlowGraph->topologicalSort();
      if (DbgLoggerManager::instance()->isSelected(DbgGroup::TEMPORARY)) {     
	GraphVizDisplay::show(*myTransformedControlFlowGraph,"transformed_cfg_2",
			      ControlFlowGraphVertexLabelWriter(*myTransformedControlFlowGraph),ControlFlowGraphEdgeLabelWriter(*myTransformedControlFlowGraph));
      }
      // buildAdjointControlFlowGraph() should always be based on the
      // original CFG, that is, it should preceed the call to 
      // storeControlFlow()
      myTransformedControlFlowGraph->buildAdjointControlFlowGraph();
      if (DbgLoggerManager::instance()->isSelected(DbgGroup::TEMPORARY)) {     
	GraphVizDisplay::show(*myTransformedControlFlowGraph,"transformed_cfg_4",
			      ControlFlowGraphVertexLabelWriter(*myTransformedControlFlowGraph),ControlFlowGraphEdgeLabelWriter(*myTransformedControlFlowGraph));
      }
      myTransformedControlFlowGraph->storeControlFlow();
      if (DbgLoggerManager::instance()->isSelected(DbgGroup::TEMPORARY)) {     
	GraphVizDisplay::show(*myTransformedControlFlowGraph,"transformed_cfg_3",
			      ControlFlowGraphVertexLabelWriter(*myTransformedControlFlowGraph),ControlFlowGraphEdgeLabelWriter(*myTransformedControlFlowGraph));
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
                                                                                
    myTransformedControlFlowGraph->printXMLHierarchy(os);
                                                                                
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

