#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/GraphVizDisplay.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ReversibleControlFlowGraph.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/ControlFlowGraphVertexAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

  ReversibleControlFlowGraph::ReversibleControlFlowGraph(const ControlFlowGraph& theOriginal) : myOriginalGraph_r(theOriginal) {
    std::list<std::pair<const ControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> > vertexCopyList;
    ControlFlowGraph::ConstVertexIteratorPair p(theOriginal.vertices());
    ControlFlowGraph::ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt) {
      ReversibleControlFlowGraphVertex* anOriginalVertex=new ReversibleControlFlowGraphVertex(&(*beginIt));
      vertexCopyList.push_back(std::make_pair(&(*beginIt),anOriginalVertex));  
      supplyAndAddVertexInstance(*anOriginalVertex);
    }
    ControlFlowGraph::ConstEdgeIteratorPair pe(theOriginal.edges());
    ControlFlowGraph::ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte) {
      const ControlFlowGraphVertex& theOriginalSource(theOriginal.getSourceOf(*beginIte));
      const ControlFlowGraphVertex& theOriginalTarget(theOriginal.getTargetOf(*beginIte));
      std::list<std::pair<const ControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> >::iterator vertexCopyListSrcIt, vertexCopyListTgtIt;
      for (vertexCopyListSrcIt=vertexCopyList.begin();
           vertexCopyListSrcIt!=vertexCopyList.end();vertexCopyListSrcIt++) {
        if ((*vertexCopyListSrcIt).first==&theOriginalSource) {
          for (vertexCopyListTgtIt=vertexCopyList.begin();
               vertexCopyListTgtIt!=vertexCopyList.end();vertexCopyListTgtIt++) {
            if ((*vertexCopyListTgtIt).first==&theOriginalTarget) {
              ReversibleControlFlowGraphEdge* theEdgeCopy=new ReversibleControlFlowGraphEdge(&(*beginIte));
              supplyAndAddEdgeInstance(*theEdgeCopy,*(*vertexCopyListSrcIt).second,*(*vertexCopyListTgtIt).second);
              break;
            }
          }
          break;
        }
      }
    }
    
  }

  ReversibleControlFlowGraphVertex&
  ReversibleControlFlowGraph::getEntry() {
    ReversibleControlFlowGraph::VertexIteratorPair p(vertices());
    ReversibleControlFlowGraph::VertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt) 
      if ((*beginIt).original) 
        if ((*beginIt).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::ENTRY) 
          return *beginIt;
    THROW_LOGICEXCEPTION_MACRO("Missing ENTRY node in control flow graph"); 
  }
  
  ReversibleControlFlowGraphVertex&
  ReversibleControlFlowGraph::getExit() {
    ReversibleControlFlowGraph::VertexIteratorPair p(vertices());
    ReversibleControlFlowGraph::VertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt) 
      if ((*beginIt).original) 
        if ((*beginIt).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::EXIT) 
          return *beginIt;
    THROW_LOGICEXCEPTION_MACRO("Missing EXIT node in control flow graph"); 
  }

  void 
  ReversibleControlFlowGraph::augmentControlFlowGraphRecursively(ReversibleControlFlowGraphVertex& theCurrentVertex) {
    if (!theCurrentVertex.getVisited()) {
      theCurrentVertex.setVisited(true); 
     
      if (numInEdgesOf(theCurrentVertex)>1) {

        // BEGIN canonicalize loops to have two indeges
        // this is already the case in whirl2xaif output
        if ((theCurrentVertex.getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::FORLOOP)||(theCurrentVertex.getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::PRELOOP)) {
          if (numInEdgesOf(theCurrentVertex)>2) {
            ReversibleControlFlowGraph::InEdgeIteratorPair pie(getInEdgesOf(theCurrentVertex));
            ReversibleControlFlowGraph::InEdgeIterator beginItie(pie.first),endItie(pie.second);
            // find all inedges that are not a back-edge
            std::list<ReversibleControlFlowGraph::InEdgeIterator> iel;
            for (;beginItie!=endItie ;++beginItie) {
              if (!(*beginItie).isBackEdge(*this)) iel.push_back(beginItie);
            } 
            // ... to be continued
          }
        }
        // END canonicalize loops to have two indeges
        else {
          // merge point should be strictly forward, that
          // is no back edges
          ReversibleControlFlowGraph::InEdgeIteratorPair pie(getInEdgesOf(theCurrentVertex));
          ReversibleControlFlowGraph::InEdgeIterator beginItie(pie.first),endItie(pie.second);
          std::list<ReversibleControlFlowGraph::InEdgeIterator> ieil;
          // for all inedges: insert a basic block to store index of
          // branch that was taken
          for (;beginItie!=endItie ;++beginItie) ieil.push_back(beginItie);
          std::list<ReversibleControlFlowGraph::InEdgeIterator>::iterator ieilit;
          for (ieilit=ieil.begin();ieilit!=ieil.end();++ieilit) {
            ReversibleControlFlowGraphVertex* aNewVertex=new ReversibleControlFlowGraphVertex();
            supplyAndAddVertexInstance(*aNewVertex);
            Scope& theScope(myOriginalGraph_r.getScope());
            aNewVertex->myNewVertex_p=new BasicBlock(theScope);
            ReversibleControlFlowGraphEdge* aNewInEdge=new ReversibleControlFlowGraphEdge();
            ReversibleControlFlowGraphEdge* aNewOutEdge=new ReversibleControlFlowGraphEdge();

            supplyAndAddEdgeInstance(*aNewInEdge,getSourceOf(*(*ieilit)),*aNewVertex);
            supplyAndAddEdgeInstance(*aNewOutEdge,*aNewVertex,getTargetOf(*(*ieilit)));

            augmentControlFlowGraphRecursively(getSourceOf(*(*ieilit))); 

            removeAndDeleteEdge(*(*ieilit));
          }
          
        }

        std::cout << "Control flow merges: Predecessors " << numInEdgesOf(theCurrentVertex) << std::endl;
      }
      else {
        ReversibleControlFlowGraph::InEdgeIteratorPair pie(getInEdgesOf(theCurrentVertex));
        ReversibleControlFlowGraph::InEdgeIterator beginItie(pie.first),endItie(pie.second);
        for (;beginItie!=endItie ;++beginItie) 
          augmentControlFlowGraphRecursively(getSourceOf(*beginItie)); 
      } 
    }
  }

  void 
  ReversibleControlFlowGraph::initVisit() {
    ReversibleControlFlowGraph::VertexIteratorPair p(vertices());
    ReversibleControlFlowGraph::VertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt) (*beginIt).setVisited(false);
  }

  void 
  ReversibleControlFlowGraph::topologicalSortRecursively(ReversibleControlFlowGraphVertex& theCurrentVertex, int& idx) {
    if (!theCurrentVertex.getVisited()) {
      theCurrentVertex.setVisited(true); 
      {
        ReversibleControlFlowGraph::OutEdgeIteratorPair pie(getOutEdgesOf(theCurrentVertex));
        ReversibleControlFlowGraph::OutEdgeIterator beginItie(pie.first),endItie(pie.second);
        for (;beginItie!=endItie ;++beginItie) 
          if (getTargetOf(*beginItie).getIndex()==-1)
            getTargetOf(*beginItie).setIndex(idx++);
      }
      {
        ReversibleControlFlowGraph::OutEdgeIteratorPair pie(getOutEdgesOf(theCurrentVertex));
        ReversibleControlFlowGraph::OutEdgeIterator beginItie(pie.first),endItie(pie.second);
        for (;beginItie!=endItie ;++beginItie) 
          topologicalSortRecursively(getTargetOf(*beginItie),idx); 
      }
    }
  }

  void 
  ReversibleControlFlowGraph::topologicalSort() {
    int idx=0;
    initVisit();
    getEntry().setIndex(idx++);
    topologicalSortRecursively(getEntry(),idx);
  }

  void 
  ReversibleControlFlowGraph::storeControlFlow() {
    initVisit();
    augmentControlFlowGraphRecursively(getExit());

/*
    ReversibleControlFlowGraph::VertexIteratorPair p(vertices());
    ReversibleControlFlowGraph::VertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt) {
      if ((*beginIt).original) {
        if ((*beginIt).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::IF) {
          
          std::cout << "IF (" << numInEdgesOf(*beginIt) << ")" << std::endl;
        }
        else if ((*beginIt).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::PRELOOP) {
          std::cout << "PRELOOP (" << numInEdgesOf(*beginIt) << ")" << std::endl;
        }
        else if ((*beginIt).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::FORLOOP) {
          std::cout << "FORLOOP (" << numInEdgesOf(*beginIt) << ")" << std::endl;
        }
        else if ((*beginIt).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::BASICBLOCK) {
          std::cout << "BASICBLOCK (" << numInEdgesOf(*beginIt) << ")" << std::endl;
        }
        else if ((*beginIt).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::ENTRY) {
          std::cout << "ENTRY (" << numInEdgesOf(*beginIt) << ")" << std::endl;
        }
        else if ((*beginIt).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::EXIT) {
          std::cout << "EXIT (" << numInEdgesOf(*beginIt) << ")" << std::endl;
          std::cout << "getEXIT (" << numInEdgesOf(getExit()) << ")" << std::endl;
        }
        else if ((*beginIt).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::UNDEF) {
          std::cout << "UNDEF (" << numInEdgesOf(*beginIt) << ")" << std::endl;
        }
      }
    }
*/
  }

  
  void
  ReversibleControlFlowGraph::printXMLHierarchy(std::ostream& os) const {
    ReversibleControlFlowGraph::ConstVertexIteratorPair p(vertices());
    ReversibleControlFlowGraph::ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt)
      (*beginIt).printXMLHierarchy(os);
    ReversibleControlFlowGraph::ConstEdgeIteratorPair pe=edges();
    ReversibleControlFlowGraph::ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte)
      (*beginIte).printXMLHierarchy(os,*this);
  }

  std::string
  ReversibleControlFlowGraph::debug() const {
     std::ostringstream out;
     out << "xaifBoosterControlFlowReversal::ControlFlowGraph["
        << this
        << "]" << std::ends;
    return out.str();
  }

  void ReversibleControlFlowGraph::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
  }

} // end of namespace

