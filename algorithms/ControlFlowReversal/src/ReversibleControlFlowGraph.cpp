#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"

#include "xaifBooster/system/inc/GraphVizDisplay.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/Intrinsic.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"
#include "xaifBooster/system/inc/Constant.hpp"
#include "xaifBooster/system/inc/SubroutineCall.hpp"

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ReversibleControlFlowGraph.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/ControlFlowGraphVertexAlg.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/CallGraphAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 
  ReversibleControlFlowGraph::ReversibleControlFlowGraph(const ControlFlowGraph& theOriginal_r) : myOriginalGraph_r(theOriginal_r) {
    std::list<std::pair<const ControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> > vertexCopy_l;
    ControlFlowGraph::ConstVertexIteratorPair p(theOriginal_r.vertices());
    ControlFlowGraph::ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt) {
      ReversibleControlFlowGraphVertex* anOriginalVertex=new ReversibleControlFlowGraphVertex(&(*beginIt));
      vertexCopy_l.push_back(std::make_pair(&(*beginIt),anOriginalVertex));  
      supplyAndAddVertexInstance(*anOriginalVertex);
    }
    ControlFlowGraph::ConstEdgeIteratorPair pe(theOriginal_r.edges());
    ControlFlowGraph::ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte) {
      const ControlFlowGraphVertex& theOriginalSource_r(theOriginal_r.getSourceOf(*beginIte));
      const ControlFlowGraphVertex& theOriginalTarget_r(theOriginal_r.getTargetOf(*beginIte));
      std::list<std::pair<const ControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> >::iterator vertexCopyListSrcIt, vertexCopyListTgtIt;
      for (vertexCopyListSrcIt=vertexCopy_l.begin();
           vertexCopyListSrcIt!=vertexCopy_l.end();vertexCopyListSrcIt++) {
        if ((*vertexCopyListSrcIt).first==&theOriginalSource_r) {
          for (vertexCopyListTgtIt=vertexCopy_l.begin();
               vertexCopyListTgtIt!=vertexCopy_l.end();vertexCopyListTgtIt++) {
            if ((*vertexCopyListTgtIt).first==&theOriginalTarget_r) {
              ReversibleControlFlowGraphEdge* theEdgeCopy_p=new ReversibleControlFlowGraphEdge(&(*beginIte));
              theEdgeCopy_p->set_has_condition_value((*beginIte).has_condition_value());
              theEdgeCopy_p->set_condition_value((*beginIte).get_condition_value());
              supplyAndAddEdgeInstance(*theEdgeCopy_p,*(*vertexCopyListSrcIt).second,*(*vertexCopyListTgtIt).second);
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

  // this does not guarantee uniqueness in the case of an existing
  // graph getting expanded
  // depends on prefix
  std::string 
  ReversibleControlFlowGraph::makeUniqueVertexId() {
    std::ostringstream oss;
    oss << dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature().c_str() << "v_" << getNextVertexId() << std::ends;
    return (oss.str());
  }
  std::string 
  ReversibleControlFlowGraph::makeUniqueEdgeId() {
    std::ostringstream oss;
    oss << dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature().c_str() << "new_edge_" << getNextEdgeId() << std::ends;
    return (oss.str());
  }

  BasicBlock&
  ReversibleControlFlowGraph::insert_basic_block(const ReversibleControlFlowGraphVertex& after, const ReversibleControlFlowGraphVertex& before, const ReversibleControlFlowGraphEdge& replacedEdge_r) {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
// myOriginalGraph_r does not have a scope yet since nobody sets it
// use the global scope for the time being
//    aNewReversibleControlFlowGraphVertex->myNewVertex_p=new BasicBlock(myOriginalGraph_r.getScope());
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p=new BasicBlock(ConceptuallyStaticInstances::instance()->getCallGraph().getScopeTree().getGlobalScope());
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
    ReversibleControlFlowGraphEdge* aNewReversibleControlFlowGraphInEdge_p=new ReversibleControlFlowGraphEdge();
    aNewReversibleControlFlowGraphInEdge_p->myNewEdge_p = new ControlFlowGraphEdge();
    aNewReversibleControlFlowGraphInEdge_p->myNewEdge_p->setId(makeUniqueEdgeId());
    if (replacedEdge_r.original) {
      aNewReversibleControlFlowGraphInEdge_p->myNewEdge_p->set_has_condition_value(replacedEdge_r.myOriginalEdge_p->has_condition_value());
      aNewReversibleControlFlowGraphInEdge_p->myNewEdge_p->set_condition_value(replacedEdge_r.myOriginalEdge_p->get_condition_value());
    }
    else {
      aNewReversibleControlFlowGraphInEdge_p->myNewEdge_p->set_has_condition_value(replacedEdge_r.myNewEdge_p->has_condition_value());
      aNewReversibleControlFlowGraphInEdge_p->myNewEdge_p->set_condition_value(replacedEdge_r.myNewEdge_p->get_condition_value());
    }
    ReversibleControlFlowGraphEdge* aNewReversibleControlFlowGraphOutEdge_p=new ReversibleControlFlowGraphEdge();
    aNewReversibleControlFlowGraphOutEdge_p->myNewEdge_p = new ControlFlowGraphEdge();
    aNewReversibleControlFlowGraphOutEdge_p->myNewEdge_p->setId(makeUniqueEdgeId());

    supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphInEdge_p,after,*aNewReversibleControlFlowGraphVertex_p);
    supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphOutEdge_p,*aNewReversibleControlFlowGraphVertex_p,before);
    return dynamic_cast<BasicBlock&>(*(aNewReversibleControlFlowGraphVertex_p->myNewVertex_p));
  }

  ReversibleControlFlowGraphVertex*
  ReversibleControlFlowGraph::new_basic_block() {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
// myOriginalGraph_r does not have a scope yet since nobody sets it
// use the global scope for the time being
//    aNewReversibleControlFlowGraphVertex->myNewVertex_p=new BasicBlock(myOriginalGraph_r.getScope());
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p=new BasicBlock(ConceptuallyStaticInstances::instance()->getCallGraph().getScopeTree().getGlobalScope());
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
    return aNewReversibleControlFlowGraphVertex_p;
  }

  ReversibleControlFlowGraphVertex*
  ReversibleControlFlowGraph::new_entry() {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p=new Entry();
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
    return aNewReversibleControlFlowGraphVertex_p;
  }

  ReversibleControlFlowGraphVertex*
  ReversibleControlFlowGraph::new_exit() {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p=new Exit();
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
    return aNewReversibleControlFlowGraphVertex_p;
  }

  ReversibleControlFlowGraphVertex*
  ReversibleControlFlowGraph::new_branch() {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p=new Branch();
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
    return aNewReversibleControlFlowGraphVertex_p;
  }

  ReversibleControlFlowGraphVertex*
  ReversibleControlFlowGraph::new_if() {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p=new IfStatement();
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
    return aNewReversibleControlFlowGraphVertex_p;
  }

  ReversibleControlFlowGraphVertex*
  ReversibleControlFlowGraph::new_forloop() {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p=new ForLoop();
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
    return aNewReversibleControlFlowGraphVertex_p;
  }

  ReversibleControlFlowGraphVertex*
  ReversibleControlFlowGraph::new_endbranch() {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p=new EndBranch();
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
    return aNewReversibleControlFlowGraphVertex_p;
  }

  ReversibleControlFlowGraphVertex*
  ReversibleControlFlowGraph::new_endloop() {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p=new EndLoop();
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
    return aNewReversibleControlFlowGraphVertex_p;
  }

  const Symbol*
  ReversibleControlFlowGraph::makeAuxilliaryIntegerLHS(Assignment& theAssignment, BasicBlock& theBasicBlock_r) {
    const Symbol& theLhsSymbol_r(theBasicBlock_r.getScope().getSymbolTable().addUniqueAuxSymbol(SymbolKind::VARIABLE,SymbolType::INTEGER_STYPE,SymbolShape::SCALAR,false));
    VariableSymbolReference* theVariableSymbolReference_p=new VariableSymbolReference(theLhsSymbol_r,theBasicBlock_r.getScope());
    theVariableSymbolReference_p->setId("1"); 
    theAssignment.getLHS().supplyAndAddVertexInstance(*theVariableSymbolReference_p);
    theAssignment.getLHS().getAliasMapKey().setTemporary();
    theAssignment.getLHS().getDuUdMapKey().setTemporary();
    return &theLhsSymbol_r;
  }


  void    
  ReversibleControlFlowGraph::insert_increment_integer(const Symbol* theIntegerSymbol_p,BasicBlock& theBasicBlock_r) {
    // not active, no algorithm
    Assignment* theAssignment_p=new Assignment(false,false);
    theAssignment_p->setId(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature() + "increment");

    // set lhs

    VariableSymbolReference* theVariableSymbolReference_p=new VariableSymbolReference(*theIntegerSymbol_p,theBasicBlock_r.getScope());
    theVariableSymbolReference_p->setId("1");
    theAssignment_p->getLHS().supplyAndAddVertexInstance(*theVariableSymbolReference_p);
    theAssignment_p->getLHS().getAliasMapKey().setTemporary();
    theAssignment_p->getLHS().getDuUdMapKey().setTemporary();

    // set rhs

    // counter
    Argument* theUse_p=new Argument(false); // no algorithm
    theUse_p->setId("2");
    theVariableSymbolReference_p=new VariableSymbolReference(*theIntegerSymbol_p,theBasicBlock_r.getScope());
    theVariableSymbolReference_p->setId("1");
    theUse_p->getVariable().supplyAndAddVertexInstance(*theVariableSymbolReference_p);
    theUse_p->getVariable().getAliasMapKey().setTemporary();
    theUse_p->getVariable().getDuUdMapKey().setTemporary();
    theAssignment_p->getRHS().supplyAndAddVertexInstance(*theUse_p);
    
    // 1
    Constant* theOne_p=new Constant(SymbolType::INTEGER_STYPE,false);
    theOne_p->setint(1);
    theOne_p->setId("3");
    theAssignment_p->getRHS().supplyAndAddVertexInstance(*theOne_p);

    // +
    Intrinsic* theAddition_p=new Intrinsic(std::string("add_scal_scal"),false);
    theAddition_p->setId("1");
    theAssignment_p->getRHS().supplyAndAddVertexInstance(*theAddition_p);
    
    // add assignment to basic block
    theBasicBlock_r.supplyAndAddBasicBlockElementInstance(*theAssignment_p); 
  }

  const Symbol*
  ReversibleControlFlowGraph::insert_init_integer(int value, BasicBlock& theBasicBlock_r) {
    // not active, no algorithm
    Assignment* theAssignment_p=new Assignment(false,false);
    theAssignment_p->setId(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature() + "init");
    // set lhs
    const Symbol* theLhsSymbol=makeAuxilliaryIntegerLHS(*theAssignment_p,theBasicBlock_r);
    // set rhs
    Constant* theOne=new Constant(SymbolType::INTEGER_STYPE,false);
    theOne->setint(value);
    theOne->setId("1");
    theAssignment_p->getRHS().supplyAndAddVertexInstance(*theOne);
    theBasicBlock_r.supplyAndAddBasicBlockElementInstance(*theAssignment_p); 
    return theLhsSymbol;
  }

  void
  ReversibleControlFlowGraph::insert_push_integer(const Symbol* theIntegerSymbol_p, BasicBlock& theBasicBlock_r) {
    SubroutineCall* theSubroutineCall_p=new SubroutineCall(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getPushIntegerSymbol(),theBasicBlock_r.getScope(),false);
    theSubroutineCall_p->setId(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature() + "push");
    ConcreteArgument* theConcreteArgument_p=new ConcreteArgument(1);
    VariableSymbolReference* theVariableSymbolReference_p=new VariableSymbolReference(*theIntegerSymbol_p,theBasicBlock_r.getScope());
    theVariableSymbolReference_p->setId("1");
    theConcreteArgument_p->getVariable().supplyAndAddVertexInstance(*theVariableSymbolReference_p);
    theConcreteArgument_p->getVariable().getAliasMapKey().setTemporary();
    theConcreteArgument_p->getVariable().getDuUdMapKey().setTemporary();
    theSubroutineCall_p->getArgumentList().push_back(theConcreteArgument_p);
    theBasicBlock_r.supplyAndAddBasicBlockElementInstance(*theSubroutineCall_p);
  }

  /**
   * Augmentation of cfg to record the flow of control. This assumes
   * that all vertices have at most two inedges (loops and endbranches)
   * and at most two outedges (loops and branches)
   */

  void 
  ReversibleControlFlowGraph::storeControlFlow() {
    std::stack<const Symbol*> theLoopCounterSymbolStack_r;
    std::list<ReversibleControlFlowGraphVertex*>::iterator the_mySortedVertices_p_l_it;
    for (the_mySortedVertices_p_l_it=mySortedVertices_p_l.begin(); the_mySortedVertices_p_l_it!=mySortedVertices_p_l.end(); the_mySortedVertices_p_l_it++) {
      switch ((*the_mySortedVertices_p_l_it)->getOriginalControlFlowGraphVertexAlg().getKind()) {
        /*
        Both FORLOOP and PRELOOP are control flow merge points,
        that is they have two predecessors. One of the indeges is a
        back edge with source of kind ENDLOOP.
        */
        case ControlFlowGraphVertexAlg::FORLOOP : 
        case ControlFlowGraphVertexAlg::PRELOOP : {
          int endLoopIndex;
          // insert "counter=0" before theCurrentVertex_r
          // push counter symbol onto theLoopCounterSymbolStack_r
          InEdgeIteratorPair pie(getInEdgesOf(*(*the_mySortedVertices_p_l_it)));
          InEdgeIterator beginItie(pie.first),endItie(pie.second);
          /*
          We need to work on a copy of the inedges because the
          InEdgeIterator gets messed up when deleting inedges inside
          of it.
          */
          std::list<InEdgeIterator> ieil;
          const Symbol* theLoopCounterSymbol_p;
          for (;beginItie!=endItie ;++beginItie) ieil.push_back(beginItie);
          std::list<InEdgeIterator>::iterator ieilIt;
          for (ieilIt=ieil.begin();ieilIt!=ieil.end();++ieilIt) {
            if (!((*(*ieilIt)).isBackEdge(*this))) {
              BasicBlock& theBasicBlock_r(insert_basic_block(getSourceOf(*(*ieilIt)),getTargetOf(*(*ieilIt)),(*(*ieilIt))));
              theLoopCounterSymbol_p=insert_init_integer(0,theBasicBlock_r);
              theLoopCounterSymbolStack_r.push(theLoopCounterSymbol_p);
              removeAndDeleteEdge(*(*ieilIt));
            }  
            else {
              // store index of corresponding ENDLOOP node
              endLoopIndex=getSourceOf(*(*ieilIt)).getIndex();
            }
          }
          // insert "call push_cfg(counter)" after end of the loop
          // to find the correct outedge we check if the index is 
          // greater than the one of the corresponding ENDLOOP node for
          // all targets. 
          OutEdgeIteratorPair poe(getOutEdgesOf(*(*the_mySortedVertices_p_l_it)));
          OutEdgeIterator beginItoe(poe.first),endItoe(poe.second);
          std::list<OutEdgeIterator> oeil;
          for (;beginItoe!=endItoe ;++beginItoe) oeil.push_back(beginItoe);
          std::list<OutEdgeIterator>::iterator oeilIt;
          for (oeilIt=oeil.begin();oeilIt!=oeil.end();++oeilIt) 
            if (getTargetOf(*(*oeilIt)).getIndex()>endLoopIndex) {
                BasicBlock& theBasicBlock_r(insert_basic_block(getSourceOf(*(*oeilIt)),getTargetOf(*(*oeilIt)),(*(*oeilIt))));
                insert_push_integer(theLoopCounterSymbol_p,theBasicBlock_r);
                removeAndDeleteEdge(*(*oeilIt));
                break;
              }
          break;
        } 
        case ControlFlowGraphVertexAlg::ENDLOOP : {
          // pop counter symbol from theLoopCounterSymbolStack_r
          // insert "counter=counter+1" before *(*the_mySortedVertices_p_l_it)
          InEdgeIteratorPair pie(getInEdgesOf(*(*the_mySortedVertices_p_l_it)));
          InEdgeIterator beginItie(pie.first);
          BasicBlock& theBasicBlock_r(insert_basic_block(getSourceOf((*beginItie)),getTargetOf((*beginItie)),(*beginItie)));
          insert_increment_integer(theLoopCounterSymbolStack_r.top(),theBasicBlock_r);
          theLoopCounterSymbolStack_r.pop();
          removeAndDeleteEdge((*beginItie));
          break;
        }
        case ControlFlowGraphVertexAlg::ENDBRANCH : {
          std::cout << "ENDBRANCH " << theLoopCounterSymbolStack_r.size() << std::endl;
          /*
          insert 
                 branch_index=1 
                 call push_cfg(branch_index) 
          before *(*the_mySortedVertices_p_l_it) in if branch
          */
          /*
          insert 
                 branch_index=0 
                 call push_cfg(branch_index) 
          before *(*the_mySortedVertices_p_l_it) in else branch if present
          */
          InEdgeIteratorPair pie(getInEdgesOf(*(*the_mySortedVertices_p_l_it)));
          InEdgeIterator beginItie(pie.first),endItie(pie.second);
          /*
          We need to work on a copy of the inedges because the
          InEdgeIterator gets messed up when deleting inedges inside
          of it.
          */
          std::list<InEdgeIterator> ieil;
          for (;beginItie!=endItie ;++beginItie) ieil.push_back(beginItie);
          std::list<InEdgeIterator>::iterator ieilIt;
          int branch_idx=1;
          for (ieilIt=ieil.begin();ieilIt!=ieil.end();++ieilIt,--branch_idx) {
            ReversibleControlFlowGraphVertex& theSource_r(getSourceOf(*(*ieilIt)));
            BasicBlock& theBasicBlock_r(insert_basic_block(theSource_r,getTargetOf(*(*ieilIt)),(*(*ieilIt))));
            const Symbol* theLhsSymbol=insert_init_integer(branch_idx,theBasicBlock_r);
            insert_push_integer(theLhsSymbol,theBasicBlock_r);
            removeAndDeleteEdge(*(*ieilIt));
          }
          break;
        }
        default : break;
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
  ReversibleControlFlowGraph::clearIndeces() {
    ReversibleControlFlowGraph::VertexIteratorPair p(vertices());
    ReversibleControlFlowGraph::VertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt) (*beginIt).setIndex(-1);
  }

  bool
  ReversibleControlFlowGraph::isLoopBodyEntryEdge(const ReversibleControlFlowGraphVertex& theEndLoopVertex_r, const ReversibleControlFlowGraphEdge& theEdge_r) {
    if (getTargetOf(theEdge_r).getVisited()) return false;
    getTargetOf(theEdge_r).setVisited(true);
    if (&(getTargetOf(theEdge_r))==&(theEndLoopVertex_r)) return true;
    OutEdgeIteratorPair poe(getOutEdgesOf(getTargetOf(theEdge_r)));
    OutEdgeIterator beginItoe(poe.first),endItoe(poe.second);
    bool return_value=false;
    for (;beginItoe!=endItoe ;++beginItoe) 
        if (isLoopBodyEntryEdge(theEndLoopVertex_r,*beginItoe)) return true;
    return return_value;
  }

  const ReversibleControlFlowGraphEdge&
  ReversibleControlFlowGraph::find_corresponding_branch_entry_edge_rec(const ReversibleControlFlowGraphEdge& theCurrentEdge_r, int& nesting_depth) const {
    const ReversibleControlFlowGraphVertex& theSource_cr(getSourceOf(theCurrentEdge_r));
    if (theSource_cr.isOriginal()&&theSource_cr.getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::BRANCH) {
      if (nesting_depth==0) 
        return theCurrentEdge_r;
      else 
        nesting_depth--;
    }
    if (theSource_cr.isOriginal()&&theSource_cr.getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::ENDBRANCH) {
      nesting_depth++;
    }
    ConstInEdgeIteratorPair pie(getInEdgesOf(theSource_cr));
    ConstInEdgeIterator beginItie(pie.first),endItie(pie.second);
    for (;beginItie!=endItie ;++beginItie) {
      // We do not want the inedge that emanates from an ENDLOOP to avoid
      // endless looping
      if (getSourceOf(*beginItie).isOriginal()&&getSourceOf(*beginItie).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::ENDLOOP) continue;
      return find_corresponding_branch_entry_edge_rec(*beginItie, nesting_depth);
    }
    // should never get here, just to calm the compiler...
    return find_corresponding_branch_entry_edge_rec(theCurrentEdge_r, nesting_depth);
  }

  /* 
   The branch entry edges are marked by has_condition_value()==true and
   a corresponding integer get_condition_value().
   This information is projected onto the branch exit edges.
   */
  void 
  ReversibleControlFlowGraph::markBranchExitEdges() {
    ReversibleControlFlowGraph::VertexIteratorPair p(vertices());
    ReversibleControlFlowGraph::VertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt) 
      if ((*beginIt).isOriginal()&&(*beginIt).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::ENDBRANCH) {
        InEdgeIteratorPair pie(getInEdgesOf(*beginIt));
        InEdgeIterator beginItie(pie.first),endItie(pie.second);
        for (;beginItie!=endItie ;++beginItie) {
          int nesting_depth=0; 
          const ReversibleControlFlowGraphEdge& theEntryEdge_cr(find_corresponding_branch_entry_edge_rec((*beginItie),nesting_depth));
          (*beginItie).set_has_condition_value(theEntryEdge_cr.has_condition_value());
          (*beginItie).set_condition_value(theEntryEdge_cr.get_condition_value());
        }
      }
  }

  const ReversibleControlFlowGraphEdge&
  ReversibleControlFlowGraph::find_corresponding_branch_exit_edge_rec(const ReversibleControlFlowGraphEdge& theCurrentEdge_r, int& nesting_depth) const {
    const ReversibleControlFlowGraphVertex& theTarget_cr(getTargetOf(theCurrentEdge_r));
    if (!(theTarget_cr.isOriginal())&&theTarget_cr.getNewControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::ENDBRANCH) {
      if (nesting_depth==0)
        return theCurrentEdge_r;
      else
        nesting_depth--;
    }
    if (!(theTarget_cr.isOriginal())&&theTarget_cr.getNewControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::BRANCH) {
      nesting_depth++;
    }
    ConstOutEdgeIteratorPair pie(getOutEdgesOf(theTarget_cr));
    ConstOutEdgeIterator beginItie(pie.first),endItie(pie.second);
    for (;beginItie!=endItie ;++beginItie) {
      // We do not want the outedge that emanates from an LOOP into its
      // body to avoid endless looping
      if (!(getSourceOf(*beginItie)).isOriginal()&&(
          getSourceOf(*beginItie).getNewControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::PRELOOP||
          getSourceOf(*beginItie).getNewControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::FORLOOP)&&
          (*beginItie).has_condition_value()) continue;
      return find_corresponding_branch_exit_edge_rec(*beginItie, nesting_depth);
    }
    // should never get here, just to calm the compiler...
    return find_corresponding_branch_exit_edge_rec(theCurrentEdge_r, nesting_depth);
  }

  /*
   Assuming that the branch exit edges are marked by has_condition_value()==
   true and a corresponding integer get_condition_value() this information is 
   projected onto the branch entry edges.
   */
  void
  ReversibleControlFlowGraph::markBranchEntryEdges() {
    ReversibleControlFlowGraph::VertexIteratorPair p(vertices());
    ReversibleControlFlowGraph::VertexIterator beginIt(p.first),endIt(p.second);    for (;beginIt!=endIt ;++beginIt)
      if (!((*beginIt).isOriginal())&&(*beginIt).getNewControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::BRANCH) {
        OutEdgeIteratorPair pie(getOutEdgesOf(*beginIt));
        OutEdgeIterator beginItie(pie.first),endItie(pie.second);
        for (;beginItie!=endItie ;++beginItie) {
          int nesting_depth=0;
          const ReversibleControlFlowGraphEdge& theExitEdge_cr(find_corresponding_branch_exit_edge_rec((*beginItie),nesting_depth));
          (*beginItie).set_has_condition_value(theExitEdge_cr.has_condition_value());
          (*beginItie).set_condition_value(theExitEdge_cr.get_condition_value());
        }
      }
  }

  void 
  ReversibleControlFlowGraph::markLoopBodyEntryEdges() {
    ReversibleControlFlowGraph::VertexIteratorPair p(vertices());
    ReversibleControlFlowGraph::VertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt) 
      if ((*beginIt).isOriginal()&&(*beginIt).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::ENDLOOP) {
        initVisit();
        // single successor of ENDLOOP is LOOP
        OutEdgeIteratorPair poe_aux(getOutEdgesOf(*beginIt));
        OutEdgeIterator beginItoe_aux(poe_aux.first); 
        ReversibleControlFlowGraphVertex& theLoopVertex(getTargetOf(*beginItoe_aux));
        OutEdgeIteratorPair poe(getOutEdgesOf(theLoopVertex));
        OutEdgeIterator beginItoe(poe.first), endItoe(poe.second); 
        for (;beginItoe!=endItoe ;++beginItoe) 
          if (isLoopBodyEntryEdge(*beginIt,*beginItoe)) {
            std::cout << "Loop Body Entry" << std::endl;
            (*beginItoe).toLoopBody=true;
            break;
          }
      }
  }

  bool 
  ReversibleControlFlowGraph::topologicalSortRecursively(ReversibleControlFlowGraphVertex& theCurrentVertex_r, int& idx,std::vector<ReversibleControlFlowGraphVertex*>& tmpSortedVertices_p_v) {
    theCurrentVertex_r.setVisited(true);
    if (theCurrentVertex_r.isOriginal()&&theCurrentVertex_r.getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::GOTO) return false;
    if ((!(theCurrentVertex_r.isOriginal()))||theCurrentVertex_r.isOriginal()&&theCurrentVertex_r.getOriginalControlFlowGraphVertexAlg().getKind()!= ControlFlowGraphVertexAlg::ENDLOOP) {
      if (theCurrentVertex_r.isOriginal()&&(theCurrentVertex_r.getOriginalControlFlowGraphVertexAlg().getKind()!= ControlFlowGraphVertexAlg::FORLOOP||theCurrentVertex_r.getOriginalControlFlowGraphVertexAlg().getKind()!= ControlFlowGraphVertexAlg::PRELOOP)) {
        { // loop body first
        OutEdgeIteratorPair pie(getOutEdgesOf(theCurrentVertex_r));
        OutEdgeIterator beginItie(pie.first),endItie(pie.second);
        for (;beginItie!=endItie ;++beginItie) 
          if ((*beginItie).toLoopBody) {
            getTargetOf(*beginItie).setIndex(idx++);
            tmpSortedVertices_p_v.push_back(&getTargetOf(*beginItie));
            if (!topologicalSortRecursively(getTargetOf(*beginItie),idx,tmpSortedVertices_p_v)) return false; 
          }
        }
        { // then rest
        OutEdgeIteratorPair pie(getOutEdgesOf(theCurrentVertex_r));
        OutEdgeIterator beginItie(pie.first),endItie(pie.second);
        for (;beginItie!=endItie ;++beginItie) 
          if (!((*beginItie).toLoopBody)) {
            if (getTargetOf(*beginItie).getVisited())
              tmpSortedVertices_p_v[getTargetOf(*beginItie).getIndex()]=0;
            getTargetOf(*beginItie).setIndex(idx++);
            tmpSortedVertices_p_v.push_back(&getTargetOf(*beginItie));
            if (!topologicalSortRecursively(getTargetOf(*beginItie),idx,tmpSortedVertices_p_v)) return false; 
          }
        }
      }
      else {
        {
        OutEdgeIteratorPair pie(getOutEdgesOf(theCurrentVertex_r));
        OutEdgeIterator beginItie(pie.first),endItie(pie.second);
        for (;beginItie!=endItie ;++beginItie)
          if (getTargetOf(*beginItie).getVisited())
            tmpSortedVertices_p_v[getTargetOf(*beginItie).getIndex()]=0;
          getTargetOf(*beginItie).setIndex(idx++);
          if (!topologicalSortRecursively(getTargetOf(*beginItie),idx,tmpSortedVertices_p_v)) return false; 
        }
        {
        OutEdgeIteratorPair pie(getOutEdgesOf(theCurrentVertex_r));
        OutEdgeIterator beginItie(pie.first),endItie(pie.second);
        for (;beginItie!=endItie ;++beginItie) 
          if (!topologicalSortRecursively(getTargetOf(*beginItie),idx,tmpSortedVertices_p_v)) return false; 
        }
      }
    }
    return true;
  }

  void
  ReversibleControlFlowGraph::topologicalSort() {
    markLoopBodyEntryEdges();
    initVisit();
    clearIndeces();
    mySortedVertices_p_l.clear();
    int idx=0;
    getEntry().setIndex(idx++);
    std::vector<ReversibleControlFlowGraphVertex*> tmpSortedVertices_p_v;
    tmpSortedVertices_p_v.push_back(&getEntry());
    if (!topologicalSortRecursively(getEntry(),idx,tmpSortedVertices_p_v))
      THROW_LOGICEXCEPTION_MACRO("Trying to sort an unstructured flow graph");

    // print mySortedVertices_p_v
  {
    std::vector<ReversibleControlFlowGraphVertex*>::iterator tmpSortedVertices_p_v_it;
    for (tmpSortedVertices_p_v_it=tmpSortedVertices_p_v.begin();tmpSortedVertices_p_v_it!=tmpSortedVertices_p_v.end();tmpSortedVertices_p_v_it++)
      if (*tmpSortedVertices_p_v_it) 
        std::cout << (*tmpSortedVertices_p_v_it)->getIndex() << std::endl;
      else
        std::cout << "NULL" << std::endl;

  }

    // copy into dense list
    std::vector<ReversibleControlFlowGraphVertex*>::iterator tmpSortedVertices_p_v_it;
    for (tmpSortedVertices_p_v_it=tmpSortedVertices_p_v.begin();tmpSortedVertices_p_v_it!=tmpSortedVertices_p_v.end();tmpSortedVertices_p_v_it++)
      if (*tmpSortedVertices_p_v_it) mySortedVertices_p_l.push_back(*tmpSortedVertices_p_v_it);

    // print mySortedVertices_p_l
    std::list<ReversibleControlFlowGraphVertex*>::iterator mySortedVertices_p_l_it;
    for (mySortedVertices_p_l_it=mySortedVertices_p_l.begin();mySortedVertices_p_l_it!=mySortedVertices_p_l.end();mySortedVertices_p_l_it++)
      if (*mySortedVertices_p_l_it)
        std::cout << (*mySortedVertices_p_l_it)->getIndex() << std::endl;
      else
        std::cout << "NULL" << std::endl;
  }

  /*
     This makes only sense if we are looking at a chain of dilation, 
     which we do
   */
  
  ReversibleControlFlowGraphVertex*
  ReversibleControlFlowGraph::findClosestOriginalPredecessor(ReversibleControlFlowGraphVertex* theVertex_p) {
    InEdgeIteratorPair pie(getInEdgesOf(*theVertex_p));
    InEdgeIterator beginItie(pie.first),endItie(pie.second);
    for (;beginItie!=endItie ;++beginItie) {
      if (!(*beginItie).isBackEdge(*this)) {
        if(getSourceOf(*beginItie).isOriginal()) return &(getSourceOf(*beginItie));
        return findClosestOriginalPredecessor(&(getSourceOf(*beginItie)));
      } 
    }
    // to calm the compiler
    return NULL;
  }
 
  void
  ReversibleControlFlowGraph::buildAdjointControlFlowGraph() {
    std::list<std::pair<ReversibleControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> > the_vertex_ppl;
    std::list<ReversibleControlFlowGraphVertex*>::reverse_iterator the_mySortedVertices_p_l_rit;
    for (the_mySortedVertices_p_l_rit=mySortedVertices_p_l.rbegin(); the_mySortedVertices_p_l_rit!=mySortedVertices_p_l.rend(); the_mySortedVertices_p_l_rit++) {
      ReversibleControlFlowGraphVertex* theReversibleControlFlowGraphVertex_p;
      switch ((*the_mySortedVertices_p_l_rit)->getOriginalControlFlowGraphVertexAlg().getKind()) {
        case ControlFlowGraphVertexAlg::EXIT : {
          theReversibleControlFlowGraphVertex_p=new_entry();
          break;
        }
        case ControlFlowGraphVertexAlg::ENTRY : {
          theReversibleControlFlowGraphVertex_p=new_exit();
          break;
        }
        case ControlFlowGraphVertexAlg::BRANCH : {
          theReversibleControlFlowGraphVertex_p=new_endbranch();
          break;
        }
        case ControlFlowGraphVertexAlg::BASICBLOCK : {
          theReversibleControlFlowGraphVertex_p=new_basic_block();
          break;
        }
        case ControlFlowGraphVertexAlg::ENDBRANCH : {
          theReversibleControlFlowGraphVertex_p=new_branch();
          break;
        }
        case ControlFlowGraphVertexAlg::PRELOOP : 
        case ControlFlowGraphVertexAlg::FORLOOP : {
          theReversibleControlFlowGraphVertex_p=new_endloop();
          break;
        }
        case ControlFlowGraphVertexAlg::ENDLOOP : {
          theReversibleControlFlowGraphVertex_p=new_forloop();
          break;
        }
        default: break;
      }
      the_vertex_ppl.push_back(std::make_pair(*the_mySortedVertices_p_l_rit,theReversibleControlFlowGraphVertex_p)); 
    }
    // add reversed edges
    std::list<std::pair<ReversibleControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> >::iterator the_vertex_ppl_it;
    for (the_vertex_ppl_it=the_vertex_ppl.begin();the_vertex_ppl_it!=the_vertex_ppl.end();the_vertex_ppl_it++) {
      switch ((*the_vertex_ppl_it).second->getNewControlFlowGraphVertexAlg().getKind()) {
        case ControlFlowGraphVertexAlg::ENTRY : 
        case ControlFlowGraphVertexAlg::ENDBRANCH : 
        case ControlFlowGraphVertexAlg::BASICBLOCK : 
        case ControlFlowGraphVertexAlg::BRANCH : {
          const ReversibleControlFlowGraphVertex& theOriginalVertex_cr(*((*the_vertex_ppl_it).first));
          InEdgeIteratorPair pie(getInEdgesOf(theOriginalVertex_cr));
          InEdgeIterator beginItie(pie.first),endItie(pie.second);
          for (;beginItie!=endItie ;++beginItie) {
            // find new vertex s corresponding to source of inedge
            // insert edge between adjoint entry and s unless s is LOOP
            std::list<std::pair<ReversibleControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> >::iterator the_source_ppl_it;
            // if s is LOOP then connect current vertex with corresponding
            // LOOP in reversed code
            if (getSourceOf(*beginItie).isOriginal()&&(getSourceOf(*beginItie).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::FORLOOP||getSourceOf(*beginItie).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::PRELOOP)&&!(*beginItie).has_condition_value()) {
              // find original ENDLOOP
              ReversibleControlFlowGraphVertex* theOriginalEndLoop_p;
              InEdgeIteratorPair pie1(getInEdgesOf(getSourceOf(*beginItie)));
              InEdgeIterator beginItie1(pie1.first),endItie1(pie1.second);
              for (;beginItie1!=endItie1 ;++beginItie1) 
                if (getSourceOf(*beginItie1).isOriginal()&&getSourceOf(*beginItie1).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::ENDLOOP) {
                  theOriginalEndLoop_p=&getSourceOf(*beginItie1);
                  break;
                }
              // find new FORLOOP node the corresponds to original ENDLOOP
              // and insert edges
              for (the_source_ppl_it=the_vertex_ppl.begin();the_source_ppl_it!=the_vertex_ppl.end();the_source_ppl_it++) {
                if ((*the_source_ppl_it).first==theOriginalEndLoop_p) {
                  ReversibleControlFlowGraphEdge* aNewReversibleControlFlowGraphEdge_p=new ReversibleControlFlowGraphEdge();
                  aNewReversibleControlFlowGraphEdge_p->myNewEdge_p = new ControlFlowGraphEdge();
                  aNewReversibleControlFlowGraphEdge_p->myNewEdge_p->setId(makeUniqueEdgeId());
                  aNewReversibleControlFlowGraphEdge_p->set_has_condition_value((*beginItie).has_condition_value());
                  aNewReversibleControlFlowGraphEdge_p->set_condition_value((*beginItie).get_condition_value());
                  supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphEdge_p,*((*the_vertex_ppl_it).second),*((*the_source_ppl_it).second));
                  break;
                }
              }
            }
            else {
              for (the_source_ppl_it=the_vertex_ppl.begin();the_source_ppl_it!=the_vertex_ppl.end();the_source_ppl_it++) {
                if ((*the_source_ppl_it).first==&(getSourceOf(*beginItie))) {
                  ReversibleControlFlowGraphEdge* aNewReversibleControlFlowGraphEdge_p=new ReversibleControlFlowGraphEdge();
                  aNewReversibleControlFlowGraphEdge_p->myNewEdge_p = new ControlFlowGraphEdge();
                  aNewReversibleControlFlowGraphEdge_p->myNewEdge_p->setId(makeUniqueEdgeId());
                  aNewReversibleControlFlowGraphEdge_p->set_has_condition_value((*beginItie).has_condition_value());
                  aNewReversibleControlFlowGraphEdge_p->set_condition_value((*beginItie).get_condition_value());
                  supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphEdge_p,*((*the_vertex_ppl_it).second),*((*the_source_ppl_it).second));
                  break;
                }
              }
            }
          }
          break;
        }
        case ControlFlowGraphVertexAlg::PRELOOP :
        case ControlFlowGraphVertexAlg::FORLOOP : {
          const ReversibleControlFlowGraphVertex& theOriginalVertex_cr(*((*the_vertex_ppl_it).first));
          InEdgeIteratorPair pie(getInEdgesOf(theOriginalVertex_cr));
          InEdgeIterator beginItie(pie.first),endItie(pie.second);
          for (;beginItie!=endItie ;++beginItie) {
            // find new vertex s corresponding to source of inedge
            // insert edge between adjoint entry and s unless s is LOOP
            std::list<std::pair<ReversibleControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> >::iterator the_source_ppl_it;
            // if s is LOOP then connect current vertex with corresponding
            // LOOP in reversed code
            if (getSourceOf(*beginItie).isOriginal()&&(getSourceOf(*beginItie).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::FORLOOP||getSourceOf(*beginItie).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::PRELOOP)&&!(*beginItie).has_condition_value()) {
              // find original ENDLOOP
              ReversibleControlFlowGraphVertex* theOriginalEndLoop_p;
              InEdgeIteratorPair pie1(getInEdgesOf(getSourceOf(*beginItie)));
              InEdgeIterator beginItie1(pie1.first),endItie1(pie1.second);
              for (;beginItie1!=endItie1 ;++beginItie1) 
                if (getSourceOf(*beginItie1).isOriginal()&&getSourceOf(*beginItie1).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::ENDLOOP) {
                  theOriginalEndLoop_p=&getSourceOf(*beginItie1);
                  break;
                }
              // find new FORLOOP node the corresponds to original ENDLOOP
              // and insert edges
              for (the_source_ppl_it=the_vertex_ppl.begin();the_source_ppl_it!=the_vertex_ppl.end();the_source_ppl_it++) {
                if ((*the_source_ppl_it).first==theOriginalEndLoop_p) {
                  ReversibleControlFlowGraphEdge* aNewReversibleControlFlowGraphEdge_p=new ReversibleControlFlowGraphEdge();
                  aNewReversibleControlFlowGraphEdge_p->myNewEdge_p = new ControlFlowGraphEdge();
                  aNewReversibleControlFlowGraphEdge_p->myNewEdge_p->setId(makeUniqueEdgeId());
                  aNewReversibleControlFlowGraphEdge_p->set_has_condition_value((*beginItie).has_condition_value());
                  aNewReversibleControlFlowGraphEdge_p->set_condition_value((*beginItie).get_condition_value());
                  supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphEdge_p,*((*the_vertex_ppl_it).second),*((*the_source_ppl_it).second));
                  break;
                }
              }
            }
            else {
              for (the_source_ppl_it=the_vertex_ppl.begin();the_source_ppl_it!=the_vertex_ppl.end();the_source_ppl_it++) {
                if ((*the_source_ppl_it).first==&(getSourceOf(*beginItie))) {
                  ReversibleControlFlowGraphEdge* aNewReversibleControlFlowGraphEdge_p=new ReversibleControlFlowGraphEdge();
                  aNewReversibleControlFlowGraphEdge_p->myNewEdge_p = new ControlFlowGraphEdge();
                  aNewReversibleControlFlowGraphEdge_p->myNewEdge_p->setId(makeUniqueEdgeId());
                  aNewReversibleControlFlowGraphEdge_p->set_has_condition_value((*beginItie).has_condition_value());
                  aNewReversibleControlFlowGraphEdge_p->set_condition_value((*beginItie).get_condition_value());
                  supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphEdge_p,*((*the_vertex_ppl_it).second),*((*the_source_ppl_it).second));
                  break;
                }
              }
            }
          }
          { // begin scope
          // and we want edge to original predecessor of LOOP node 
          // corresponding to l
          // TODO: need the special LOOP treatment here too!!!
          OutEdgeIteratorPair pie(getOutEdgesOf(*((*the_vertex_ppl_it).first)));
          // ENDLOOP has only one outedge
          ReversibleControlFlowGraphVertex* theClosestOriginalPredecessor_p=findClosestOriginalPredecessor(&getTargetOf(*(pie.first)));
          std::list<std::pair<ReversibleControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> >::iterator the_source_ppl_it;
          for (the_source_ppl_it=the_vertex_ppl.begin();the_source_ppl_it!=the_vertex_ppl.end();the_source_ppl_it++) {
            if ((*the_source_ppl_it).first==theClosestOriginalPredecessor_p) {
              ReversibleControlFlowGraphEdge* aNewReversibleControlFlowGraphEdge_p=new ReversibleControlFlowGraphEdge();
              aNewReversibleControlFlowGraphEdge_p->myNewEdge_p = new ControlFlowGraphEdge();
              aNewReversibleControlFlowGraphEdge_p->myNewEdge_p->setId(makeUniqueEdgeId());
              supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphEdge_p,*((*the_vertex_ppl_it).second),*((*the_source_ppl_it).second));
              break;
            }
          }
          } // end scope
          break;
        }
        case ControlFlowGraphVertexAlg::ENDLOOP : {
          // the corresp LOOP node l
          // we want an edge to the ENDLOOP node that goes along with l
          const ReversibleControlFlowGraphVertex& theOriginalVertex_cr(*((*the_vertex_ppl_it).first));
          InEdgeIteratorPair pie(getInEdgesOf(theOriginalVertex_cr));
          InEdgeIterator beginItie(pie.first),endItie(pie.second);
          for (;beginItie!=endItie ;++beginItie) {
            if (getSourceOf(*beginItie).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::ENDLOOP) { 
              std::list<std::pair<ReversibleControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> >::iterator the_source_ppl_it;
              for (the_source_ppl_it=the_vertex_ppl.begin();the_source_ppl_it!=the_vertex_ppl.end();the_source_ppl_it++) {
                if ((*the_source_ppl_it).first==&(getSourceOf(*beginItie))) {
                  ReversibleControlFlowGraphEdge* aNewReversibleControlFlowGraphEdge_p=new ReversibleControlFlowGraphEdge();
                  aNewReversibleControlFlowGraphEdge_p->myNewEdge_p = new ControlFlowGraphEdge();
                  aNewReversibleControlFlowGraphEdge_p->myNewEdge_p->setId(makeUniqueEdgeId());
                  supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphEdge_p,*((*the_vertex_ppl_it).second),*((*the_source_ppl_it).second));
                  break;
                }
              }
            }
          }
          break;
        }
        default: break;
      }
    }
    markBranchEntryEdges();
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

