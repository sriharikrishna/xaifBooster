#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/GraphVizDisplay.hpp"

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ControlFlowGraphAlg.hpp"
#include "xaifBooster/system/inc/ControlFlowGraph.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

  ControlFlowGraphAlg::ControlFlowGraphAlg(const ControlFlowGraph& theContaining) : ControlFlowGraphAlgBase(theContaining), myTransformedControlFlowGraph(NULL) {
  }

  ControlFlowGraphAlg::~ControlFlowGraphAlg() {
    if (myTransformedControlFlowGraph) delete myTransformedControlFlowGraph;
  }

  ReversibleControlFlowGraph& 
  ControlFlowGraphAlg::getTransformedControlFlowGraph() {
    return *myTransformedControlFlowGraph;
  }

  const ReversibleControlFlowGraph& 
  ControlFlowGraphAlg::getTransformedControlFlowGraph() const {
    return *myTransformedControlFlowGraph;
  }

  const ControlFlowGraphVertex& 
  ControlFlowGraphAlg::getOriginalEntry() const {
    ControlFlowGraph::ConstVertexIteratorPair p(getContaining().vertices());
    ControlFlowGraph::ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt) {
      ControlFlowGraph::ConstInEdgeIteratorPair pe=getContaining().getInEdgesOf(*beginIt);
      ControlFlowGraph::ConstInEdgeIterator beginIte(pe.first),endIte(pe.second);
      if (beginIte==endIte) return *beginIt;
    }
    THROW_LOGICEXCEPTION_MACRO("ControlFlowReversal::ControlFlowGraphAlg::getOriginalEntry: not found");

  }

  const ControlFlowGraphVertex& 
  ControlFlowGraphAlg::getOriginalExit() const {
    ControlFlowGraph::ConstVertexIteratorPair p(getContaining().vertices());
    ControlFlowGraph::ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt) {
      ControlFlowGraph::ConstOutEdgeIteratorPair pe=getContaining().getOutEdgesOf(*beginIt);
      ControlFlowGraph::ConstOutEdgeIterator beginIte(pe.first),endIte(pe.second);
      if (beginIte==endIte) return *beginIt;
    }
    THROW_LOGICEXCEPTION_MACRO("ControlFlowReversal::ControlFlowGraphAlg::getOriginalExit: not found");
  }

  

  class VertexLabelWriter {
  public:
    VertexLabelWriter(const ReversibleControlFlowGraph& g) : myG(g) {};
    template <class BoostIntenalVertexDescriptor>
    void operator()(std::ostream& out, const BoostIntenalVertexDescriptor& v) const {
      ReversibleControlFlowGraphVertex* theReversibleControlFlowGraphVertex_p=boost::get(boost::get(BoostVertexContentType(),myG.getInternalBoostGraph()),v);
      std::string theVertexKind;
      if (theReversibleControlFlowGraphVertex_p->isOriginal()) 
        theVertexKind=dynamic_cast<const ControlFlowGraphVertexAlg&>(theReversibleControlFlowGraphVertex_p->getOriginalVertex().getControlFlowGraphVertexAlgBase()).kindToString();
      else
        theVertexKind=dynamic_cast<const ControlFlowGraphVertexAlg&>(theReversibleControlFlowGraphVertex_p->getNewVertex().getControlFlowGraphVertexAlgBase()).kindToString();
        
      out << "[label=\"" << boost::get(boost::get(BoostVertexContentType(),
                                                  myG.getInternalBoostGraph()),
                                       v)->getIndex() << ": "
          << theVertexKind << "\"]";
    };
    const ReversibleControlFlowGraph& myG;
  };

  void ControlFlowGraphAlg::algorithm_action_4() {
    DBG_MACRO(DbgGroup::CALLSTACK,
              "xaifBoosterControlFlowReversal::ControlFlowGraphAlg::algorithm_action_4(reverse control flow) called for: "
              << debug().c_str());
      myTransformedControlFlowGraph=new ReversibleControlFlowGraph(getContaining());
      if (DbgLoggerManager::instance()->isSelected(DbgGroup::TEMPORARY)) {     
	GraphVizDisplay::show(*myTransformedControlFlowGraph,"transformed_cfg_1",
			      VertexLabelWriter(*myTransformedControlFlowGraph));
      }
      myTransformedControlFlowGraph->topologicalSort();
      if (DbgLoggerManager::instance()->isSelected(DbgGroup::TEMPORARY)) {     
	GraphVizDisplay::show(*myTransformedControlFlowGraph,"transformed_cfg_2",
			      VertexLabelWriter(*myTransformedControlFlowGraph));
      }
      myTransformedControlFlowGraph->storeControlFlow();
      if (DbgLoggerManager::instance()->isSelected(DbgGroup::TEMPORARY)) {     
	GraphVizDisplay::show(*myTransformedControlFlowGraph,"transformed_cfg_3",
			      VertexLabelWriter(*myTransformedControlFlowGraph));
      }
/*
      myTransformedControlFlowGraph->reverseControlFlow();
      if (DbgLoggerManager::instance()->isSelected(DbgGroup::TEMPORARY)) {     
	GraphVizDisplay::show(*myTransformedControlFlowGraph,"transformed_cfg_4",
			      VertexLabelWriter(*myTransformedControlFlowGraph));
      }
*/
  } // end AssignmentAlg::algorithm_action_4() 

  void
  ControlFlowGraphAlg::printXMLHierarchy(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent()
       << "<"
       << getContaining().ourXAIFName.c_str()
       << " ";
    getContaining().printAttributes(os);
    os << " "
       << getContaining().our_myActiveFlag_XAIFName.c_str()
       << "=\""
       << getContaining().getActiveFlag()
       << "\">"
       << std::endl;
    getContaining().getArgumentList().printXMLHierarchy(os);

    myTransformedControlFlowGraph->printXMLHierarchy(os);

        os << pm.indent()
       << "</"
       << getContaining().ourXAIFName
       << ">"
       << std::endl;
    pm.releaseInstance();

  }

  std::string
  ControlFlowGraphAlg::debug() const {
     std::ostringstream out;
     out << "xaifBoosterControlFlowReversal::ControlFlowGraphAlg["
        << this
        << "]" << std::ends;
    return out.str();
  }

  void ControlFlowGraphAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
  }

} // end of namespace

