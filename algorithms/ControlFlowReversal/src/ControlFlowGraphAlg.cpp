#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/GraphVizDisplay.hpp"

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ControlFlowGraphAlg.hpp"
#include "xaifBooster/system/inc/ControlFlowGraph.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

  ControlFlowGraphAlg::ControlFlowGraphAlg(ControlFlowGraph& theContaining) : ControlFlowGraphAlgBase(theContaining) {
  }

  ControlFlowGraphAlg::AugmentedControlFlowGraphType& 
  ControlFlowGraphAlg::getTransformedControlFlowGraph() {
    return myTransformedControlFlowGraph;
  }

  const ControlFlowGraphAlg::AugmentedControlFlowGraphType& 
  ControlFlowGraphAlg::getTransformedControlFlowGraph() const {
    return myTransformedControlFlowGraph;
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

  void ControlFlowGraphAlg::initTransformedControlFlowGraph() {
    std::list<std::pair<const ControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> > vertexCopyList;
    ControlFlowGraph::ConstVertexIteratorPair p(getContaining().vertices());
    ControlFlowGraph::ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt) {
      ReversibleControlFlowGraphVertex* anOriginalVertex=new ReversibleControlFlowGraphVertex(&(*beginIt));
      vertexCopyList.push_back(std::make_pair(&(*beginIt),anOriginalVertex));  
      myTransformedControlFlowGraph.supplyAndAddVertexInstance(*anOriginalVertex);
    }
    ControlFlowGraph::ConstEdgeIteratorPair pe(getContaining().edges());
    ControlFlowGraph::ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte) {
      const ControlFlowGraphVertex& theOriginalSource(getContaining().getSourceOf(*beginIte));
      const ControlFlowGraphVertex& theOriginalTarget(getContaining().getTargetOf(*beginIte));
      std::list<std::pair<const ControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> >::iterator vertexCopyListSrcIt, vertexCopyListTgtIt;
      for (vertexCopyListSrcIt=vertexCopyList.begin();
           vertexCopyListSrcIt!=vertexCopyList.end();vertexCopyListSrcIt++) {
        if ((*vertexCopyListSrcIt).first==&theOriginalSource) {
          for (vertexCopyListTgtIt=vertexCopyList.begin();
               vertexCopyListTgtIt!=vertexCopyList.end();vertexCopyListTgtIt++) {
            if ((*vertexCopyListTgtIt).first==&theOriginalTarget) {
              EdgeTraversable* theEdgeCopy=new EdgeTraversable;
              myTransformedControlFlowGraph.supplyAndAddEdgeInstance(*theEdgeCopy,*(*vertexCopyListSrcIt).second,*(*vertexCopyListTgtIt).second);
              break;
            }
          }
          break;
        }
      }
    }
    
  }
  

  void ControlFlowGraphAlg::algorithm_action_4() {
    DBG_MACRO(DbgGroup::CALLSTACK,
              "xaifBoosterControlFlowReversal::ControlFlowGraphAlg::algorithm_action_4(reverse control flow) called for: "
              << debug().c_str());

      initTransformedControlFlowGraph();
      GraphVizDisplay::show(myTransformedControlFlowGraph,"transformed_cfg");
  } // end AssignmentAlg::algorithm_action_4() 

  void
  ControlFlowGraphAlg::printXMLHierarchy(std::ostream& os) const {
    getContaining().printXMLHierarchyImpl(os);
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

