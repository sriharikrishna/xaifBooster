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

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 
  std::string ReversibleControlFlowGraph::myAnnotationSignature(std::string("__cfg_rev_"));

  ReversibleControlFlowGraph::ReversibleControlFlowGraph(const ControlFlowGraph& theOriginal_r) : myOriginalGraph_r(theOriginal_r),
    myPushIntegerSymbol_r(ConceptuallyStaticInstances::instance()->getCallGraph().getScopeTree().getGlobalScope().getSymbolTable().addSymbol(std::string("push_integer"),SymbolKind::SUBROUTINE,SymbolType::VOID_STYPE,SymbolShape::SCALAR,false,true)),
    myPopIntegerSymbol_r(ConceptuallyStaticInstances::instance()->getCallGraph().getScopeTree().getGlobalScope().getSymbolTable().addSymbol(std::string("pop_integer"),SymbolKind::SUBROUTINE,SymbolType::VOID_STYPE,SymbolShape::SCALAR,false,true))
 {
    myPushIntegerSymbol_r.setAnnotation(myAnnotationSignature);
    myPopIntegerSymbol_r.setAnnotation(myAnnotationSignature);
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

  // this does not guarantee uniqueness in the case of an existing
  // graph getting expanded
  // depends on prefix
  std::string 
  ReversibleControlFlowGraph::makeUniqueVertexId() {
    std::ostringstream oss;
    oss << myAnnotationSignature.c_str() << "new_vertex_" << getNextVertexId() << std::ends;
    return (oss.str());
  }
  std::string 
  ReversibleControlFlowGraph::makeUniqueEdgeId() {
    std::ostringstream oss;
    oss << myAnnotationSignature.c_str() << "new_edge_" << getNextEdgeId() << std::ends;
    return (oss.str());
  }

  BasicBlock&
  ReversibleControlFlowGraph::insert_basic_block(const ReversibleControlFlowGraphVertex& after, const ReversibleControlFlowGraphVertex& before) {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
// myOriginalGraph_r does not have a scope yet since nobody sets it
// use the global scope for the time being
//    aNewReversibleControlFlowGraphVertex->myNewVertex_p=new BasicBlock(myOriginalGraph_r.getScope());
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p=new BasicBlock(ConceptuallyStaticInstances::instance()->getCallGraph().getScopeTree().getGlobalScope());
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setAnnotation(myAnnotationSignature);
    ReversibleControlFlowGraphEdge* aNewReversibleControlFlowGraphInEdge_p=new ReversibleControlFlowGraphEdge();
    aNewReversibleControlFlowGraphInEdge_p->myNewEdge_p = new ControlFlowGraphEdge();
    aNewReversibleControlFlowGraphInEdge_p->myNewEdge_p->setId(makeUniqueEdgeId());
    ReversibleControlFlowGraphEdge* aNewReversibleControlFlowGraphOutEdge_p=new ReversibleControlFlowGraphEdge();
    aNewReversibleControlFlowGraphOutEdge_p->myNewEdge_p = new ControlFlowGraphEdge();
    aNewReversibleControlFlowGraphOutEdge_p->myNewEdge_p->setId(makeUniqueEdgeId());

    supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphInEdge_p,after,*aNewReversibleControlFlowGraphVertex_p);
    supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphOutEdge_p,*aNewReversibleControlFlowGraphVertex_p,before);
    return dynamic_cast<BasicBlock&>(*(aNewReversibleControlFlowGraphVertex_p->myNewVertex_p));
  }

  IfStatement*
  ReversibleControlFlowGraph::insert_if(const ReversibleControlFlowGraphVertex& pred_r, std::list<const ReversibleControlFlowGraphVertex*> succ_l) {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p=new IfStatement();
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setAnnotation(myAnnotationSignature);

    // pred
    ReversibleControlFlowGraphEdge* aNewReversibleControlFlowGraphInEdge_p=new ReversibleControlFlowGraphEdge();
    aNewReversibleControlFlowGraphInEdge_p->myNewEdge_p = new ControlFlowGraphEdge();
    aNewReversibleControlFlowGraphInEdge_p->myNewEdge_p->setId(makeUniqueEdgeId());
    supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphInEdge_p,pred_r,*aNewReversibleControlFlowGraphVertex_p);
    // succs
    std::list<const ReversibleControlFlowGraphVertex*>::iterator succ_it;
    for (succ_it=succ_l.begin();succ_it!=succ_l.end();succ_it++) {
      ReversibleControlFlowGraphEdge* aNewReversibleControlFlowGraphOutEdge_p=new ReversibleControlFlowGraphEdge();
      aNewReversibleControlFlowGraphOutEdge_p->myNewEdge_p = new ControlFlowGraphEdge();
      aNewReversibleControlFlowGraphOutEdge_p->myNewEdge_p->setId(makeUniqueEdgeId());
      supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphOutEdge_p,*aNewReversibleControlFlowGraphVertex_p,*(*succ_it));
    }
    return dynamic_cast<IfStatement*>(aNewReversibleControlFlowGraphVertex_p->myNewVertex_p);
  }

  EndBranch*
  ReversibleControlFlowGraph::insert_endbranch(std::list<const ReversibleControlFlowGraphVertex*> pred_l, const ReversibleControlFlowGraphVertex& succ_r) {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p=new EndBranch();
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setAnnotation(myAnnotationSignature);

    // preds
    std::list<const ReversibleControlFlowGraphVertex*>::iterator pred_it;
    for (pred_it=pred_l.begin();pred_it!=pred_l.end();pred_it++) {
      ReversibleControlFlowGraphEdge* aNewReversibleControlFlowGraphInEdge_p=new ReversibleControlFlowGraphEdge();
      aNewReversibleControlFlowGraphInEdge_p->myNewEdge_p = new ControlFlowGraphEdge();
      aNewReversibleControlFlowGraphInEdge_p->myNewEdge_p->setId(makeUniqueEdgeId());
      supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphInEdge_p,*(*pred_it),*aNewReversibleControlFlowGraphVertex_p);
    }
    // succ
    ReversibleControlFlowGraphEdge* aNewReversibleControlFlowGraphOutEdge_p=new ReversibleControlFlowGraphEdge();
    aNewReversibleControlFlowGraphOutEdge_p->myNewEdge_p = new ControlFlowGraphEdge();
    aNewReversibleControlFlowGraphOutEdge_p->myNewEdge_p->setId(makeUniqueEdgeId());
    supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphOutEdge_p,*aNewReversibleControlFlowGraphVertex_p,succ_r);
    return dynamic_cast<EndBranch*>(aNewReversibleControlFlowGraphVertex_p->myNewVertex_p);
  }

  ForLoop*
  ReversibleControlFlowGraph::insert_forloop(std::list<const ReversibleControlFlowGraphVertex*> pred_l, std::list<const ReversibleControlFlowGraphVertex*> succ_l) {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p=new ForLoop();
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setAnnotation(myAnnotationSignature);

    // preds
    std::list<const ReversibleControlFlowGraphVertex*>::iterator pred_it;
    for (pred_it=pred_l.begin();pred_it!=pred_l.end();pred_it++) {
      ReversibleControlFlowGraphEdge* aNewReversibleControlFlowGraphInEdge_p=new ReversibleControlFlowGraphEdge();
      aNewReversibleControlFlowGraphInEdge_p->myNewEdge_p = new ControlFlowGraphEdge();
      aNewReversibleControlFlowGraphInEdge_p->myNewEdge_p->setId(makeUniqueEdgeId());
      supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphInEdge_p,*(*pred_it),*aNewReversibleControlFlowGraphVertex_p);
    }
    // succ
    std::list<const ReversibleControlFlowGraphVertex*>::iterator succ_it;
    for (succ_it=succ_l.begin();succ_it!=succ_l.end();succ_it++) {
      ReversibleControlFlowGraphEdge* aNewReversibleControlFlowGraphInEdge_p=new ReversibleControlFlowGraphEdge();
      aNewReversibleControlFlowGraphInEdge_p->myNewEdge_p = new ControlFlowGraphEdge();
      aNewReversibleControlFlowGraphInEdge_p->myNewEdge_p->setId(makeUniqueEdgeId());
      supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphInEdge_p,*aNewReversibleControlFlowGraphVertex_p,*(*succ_it));
    }
    return dynamic_cast<ForLoop*>(aNewReversibleControlFlowGraphVertex_p->myNewVertex_p);
  }

  EndLoop*
  ReversibleControlFlowGraph::insert_endloop(const ReversibleControlFlowGraphVertex& pred_r, const ReversibleControlFlowGraphVertex& succ_r) {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p=new EndLoop();
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p->setAnnotation(myAnnotationSignature);

    // pred
    ReversibleControlFlowGraphEdge* aNewReversibleControlFlowGraphInEdge_p=new ReversibleControlFlowGraphEdge();
    aNewReversibleControlFlowGraphInEdge_p->myNewEdge_p = new ControlFlowGraphEdge();
    aNewReversibleControlFlowGraphInEdge_p->myNewEdge_p->setId(makeUniqueEdgeId());
    supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphInEdge_p,pred_r,*aNewReversibleControlFlowGraphVertex_p);

    // succ
    ReversibleControlFlowGraphEdge* aNewReversibleControlFlowGraphOutEdge_p=new ReversibleControlFlowGraphEdge();
    aNewReversibleControlFlowGraphOutEdge_p->myNewEdge_p = new ControlFlowGraphEdge();
    aNewReversibleControlFlowGraphOutEdge_p->myNewEdge_p->setId(makeUniqueEdgeId());
    supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphOutEdge_p,*aNewReversibleControlFlowGraphVertex_p,succ_r);
    return dynamic_cast<EndLoop*>(aNewReversibleControlFlowGraphVertex_p->myNewVertex_p);
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
    theAssignment_p->setId(myAnnotationSignature + "increment");

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
    theAssignment_p->setId(myAnnotationSignature + "init");
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
    SubroutineCall* theSubroutineCall_p=new SubroutineCall(myPushIntegerSymbol_r,theBasicBlock_r.getScope(),false);
    theSubroutineCall_p->setId(myAnnotationSignature + "push");
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
  ReversibleControlFlowGraph::storeControlFlowGraphRecursively(ReversibleControlFlowGraphVertex& theCurrentVertex_r, std::stack<const Symbol*>& theLoopCounterSymbolStack_r) {
    if (!theCurrentVertex_r.getVisited()) {
      theCurrentVertex_r.setVisited(true); 
      switch (theCurrentVertex_r.getOriginalControlFlowGraphVertexAlg().getKind()) {
        /*
        Both FORLOOP and PRELOOP are control flow merge points,
        that is the have two predecessors. One of the indeges is a
        back edge with source of kind ENDLOOP.
        */
        case ControlFlowGraphVertexAlg::FORLOOP : 
        case ControlFlowGraphVertexAlg::PRELOOP : {
          std::cout << "LOOP " << theLoopCounterSymbolStack_r.size() << std::endl;
          // insert "counter=0" before theCurrentVertex_r
          // push counter symbol onto theLoopCounterSymbolStack_r
          InEdgeIteratorPair pie(getInEdgesOf(theCurrentVertex_r));
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
              BasicBlock& theBasicBlock_r(insert_basic_block(getSourceOf(*(*ieilIt)),getTargetOf(*(*ieilIt))));
              theLoopCounterSymbol_p=insert_init_integer(0,theBasicBlock_r);
              theLoopCounterSymbolStack_r.push(theLoopCounterSymbol_p);
              // insert "call push_cfg(counter)" after end of the loop
              // to find the correct outedge we check getVisited() for
              // all targets. If the target is an original cfg vertex
              // and none that gets augmented by a preceeding basic block
              // to record the flow of control then BINGO!
              OutEdgeIteratorPair poe(getOutEdgesOf(theCurrentVertex_r));
              OutEdgeIterator beginItoe(poe.first),endItoe(poe.second);
              std::list<OutEdgeIterator> oeil;
              for (;beginItoe!=endItoe ;++beginItoe) oeil.push_back(beginItoe);
              std::list<OutEdgeIterator>::iterator oeilIt;
              for (oeilIt=oeil.begin();oeilIt!=oeil.end();++oeilIt) 
                if (getTargetOf(*(*oeilIt)).getVisited())
                  if (!(getTargetOf(*(*oeilIt)).isOriginal()&&(
                     (getTargetOf(*(*oeilIt)).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::FORLOOP)||
                     (getTargetOf(*(*oeilIt)).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::PRELOOP)||
                     (getTargetOf(*(*oeilIt)).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::ENDBRANCH)))) {
                    BasicBlock& theBasicBlock_r(insert_basic_block(getSourceOf(*(*oeilIt)),getTargetOf(*(*oeilIt))));
                    insert_push_integer(theLoopCounterSymbol_p,theBasicBlock_r);
                    removeAndDeleteEdge(*(*oeilIt));
                    break;
                  }
              storeControlFlowGraphRecursively(getSourceOf(*(*ieilIt)),theLoopCounterSymbolStack_r);
              removeAndDeleteEdge(*(*ieilIt));
            }
            else {
              storeControlFlowGraphRecursively(getSourceOf(*(*ieilIt)),theLoopCounterSymbolStack_r);
            }
          }
          break;
        } 
        case ControlFlowGraphVertexAlg::ENDLOOP : {
          std::cout << "ENDLOOP " << theLoopCounterSymbolStack_r.size() << std::endl;
          // pop counter symbol from theLoopCounterSymbolStack_r
          // insert "counter=counter+1" before theCurrentVertex_r
          InEdgeIteratorPair pie(getInEdgesOf(theCurrentVertex_r));
          InEdgeIterator beginItie(pie.first);
          BasicBlock& theBasicBlock_r(insert_basic_block(getSourceOf((*beginItie)),getTargetOf((*beginItie))));
          insert_increment_integer(theLoopCounterSymbolStack_r.top(),theBasicBlock_r);
          theLoopCounterSymbolStack_r.pop();
          storeControlFlowGraphRecursively(getSourceOf((*beginItie)),theLoopCounterSymbolStack_r);
          removeAndDeleteEdge((*beginItie));
          break;
        }
        case ControlFlowGraphVertexAlg::ENDBRANCH : {
          std::cout << "ENDBRANCH " << theLoopCounterSymbolStack_r.size() << std::endl;
          /*
          insert 
                 branch_index=1 
                 call push_cfg(branch_index) 
          before theCurrentVertex_r in if branch
          */
          /*
          insert 
                 branch_index=0 
                 call push_cfg(branch_index) 
          before theCurrentVertex_r in else branch if present
          */
          InEdgeIteratorPair pie(getInEdgesOf(theCurrentVertex_r));
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
            BasicBlock& theBasicBlock_r(insert_basic_block(theSource_r,getTargetOf(*(*ieilIt))));
            const Symbol* theLhsSymbol=insert_init_integer(branch_idx,theBasicBlock_r);
            insert_push_integer(theLhsSymbol,theBasicBlock_r);
            removeAndDeleteEdge(*(*ieilIt));
            storeControlFlowGraphRecursively(theSource_r,theLoopCounterSymbolStack_r);
          }
          break;
        }
        default : {
          std::cout << "OTHER " << theLoopCounterSymbolStack_r.size() << std::endl;
          InEdgeIteratorPair pie(getInEdgesOf(theCurrentVertex_r));
          InEdgeIterator beginItie(pie.first),endItie(pie.second);
          std::list<InEdgeIterator> ieil;
          for (;beginItie!=endItie ;++beginItie) ieil.push_back(beginItie);
          std::list<InEdgeIterator>::iterator ieilIt;
          for (ieilIt=ieil.begin();ieilIt!=ieil.end();++ieilIt) {
          // for (;beginItie!=endItie ;++beginItie) {
            std::cout << "#InEdges=" << numInEdgesOf(theCurrentVertex_r) << std::endl;
          //  storeControlFlowGraphRecursively(getSourceOf(*beginItie),theLoopCounterSymbolStack_r);
            storeControlFlowGraphRecursively(getSourceOf(*(*ieilIt)),theLoopCounterSymbolStack_r);
          }
        }
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

  void 
  ReversibleControlFlowGraph::topologicalNumberingRecursively(ReversibleControlFlowGraphVertex& theCurrentVertex_r, int& idx) {
    if ((!theCurrentVertex_r.isOriginal())||theCurrentVertex_r.isOriginal()&&theCurrentVertex_r.getOriginalControlFlowGraphVertexAlg().getKind()!= ControlFlowGraphVertexAlg::ENDLOOP) {
      if (theCurrentVertex_r.isOriginal()&&(theCurrentVertex_r.getOriginalControlFlowGraphVertexAlg().getKind()!= ControlFlowGraphVertexAlg::FORLOOP||theCurrentVertex_r.getOriginalControlFlowGraphVertexAlg().getKind()!= ControlFlowGraphVertexAlg::PRELOOP)) {
        { // loop body first
        OutEdgeIteratorPair pie(getOutEdgesOf(theCurrentVertex_r));
        OutEdgeIterator beginItie(pie.first),endItie(pie.second);
        for (;beginItie!=endItie ;++beginItie) 
          if ((*beginItie).toLoopBody) {
            getTargetOf(*beginItie).setIndex(idx++);
            topologicalNumberingRecursively(getTargetOf(*beginItie),idx); 
          }
        }
        { // then rest
        OutEdgeIteratorPair pie(getOutEdgesOf(theCurrentVertex_r));
        OutEdgeIterator beginItie(pie.first),endItie(pie.second);
        for (;beginItie!=endItie ;++beginItie) 
          if (!(*beginItie).toLoopBody) {
            getTargetOf(*beginItie).setIndex(idx++);
            topologicalNumberingRecursively(getTargetOf(*beginItie),idx); 
          }
        }
      }
      else {
      { // if not loop then standard
      OutEdgeIteratorPair pie(getOutEdgesOf(theCurrentVertex_r));
      OutEdgeIterator beginItie(pie.first),endItie(pie.second);
      for (;beginItie!=endItie ;++beginItie) 
        getTargetOf(*beginItie).setIndex(idx++);
      }
      {
      OutEdgeIteratorPair pie(getOutEdgesOf(theCurrentVertex_r));
      OutEdgeIterator beginItie(pie.first),endItie(pie.second);
      for (;beginItie!=endItie ;++beginItie) 
        topologicalNumberingRecursively(getTargetOf(*beginItie),idx); 
      }
      }
    }
  }

  void 
  ReversibleControlFlowGraph::topologicalNumbering() {
    int idx=0;
    initVisit();
    getEntry().setIndex(idx++);
    topologicalNumberingRecursively(getEntry(),idx);
  }

  void 
  ReversibleControlFlowGraph::topologicalSortRecursively(ReversibleControlFlowGraphVertex& theCurrentVertex_r, int& idx,std::vector<const ReversibleControlFlowGraphVertex*>& tmpSortedVertices_cp_v) {
    theCurrentVertex_r.setVisited(true);
    if ((!(theCurrentVertex_r.isOriginal()))||theCurrentVertex_r.isOriginal()&&theCurrentVertex_r.getOriginalControlFlowGraphVertexAlg().getKind()!= ControlFlowGraphVertexAlg::ENDLOOP) {
      if (theCurrentVertex_r.isOriginal()&&(theCurrentVertex_r.getOriginalControlFlowGraphVertexAlg().getKind()!= ControlFlowGraphVertexAlg::FORLOOP||theCurrentVertex_r.getOriginalControlFlowGraphVertexAlg().getKind()!= ControlFlowGraphVertexAlg::PRELOOP)) {
        { // loop body first
        OutEdgeIteratorPair pie(getOutEdgesOf(theCurrentVertex_r));
        OutEdgeIterator beginItie(pie.first),endItie(pie.second);
        for (;beginItie!=endItie ;++beginItie) 
          if ((*beginItie).toLoopBody) {
            getTargetOf(*beginItie).setIndex(idx++);
            tmpSortedVertices_cp_v.push_back(&getTargetOf(*beginItie));
            topologicalSortRecursively(getTargetOf(*beginItie),idx,tmpSortedVertices_cp_v); 
          }
        }
        { // then rest
        OutEdgeIteratorPair pie(getOutEdgesOf(theCurrentVertex_r));
        OutEdgeIterator beginItie(pie.first),endItie(pie.second);
        for (;beginItie!=endItie ;++beginItie) 
          if (!((*beginItie).toLoopBody)) {
            if (getTargetOf(*beginItie).getVisited())
              tmpSortedVertices_cp_v[getTargetOf(*beginItie).getIndex()]=0;
            getTargetOf(*beginItie).setIndex(idx++);
            tmpSortedVertices_cp_v.push_back(&getTargetOf(*beginItie));
            topologicalSortRecursively(getTargetOf(*beginItie),idx,tmpSortedVertices_cp_v); 
          }
        }
      }
      else {
        {
        OutEdgeIteratorPair pie(getOutEdgesOf(theCurrentVertex_r));
        OutEdgeIterator beginItie(pie.first),endItie(pie.second);
        for (;beginItie!=endItie ;++beginItie)
          if (getTargetOf(*beginItie).getVisited())
            tmpSortedVertices_cp_v[getTargetOf(*beginItie).getIndex()]=0;
          getTargetOf(*beginItie).setIndex(idx++);
          tmpSortedVertices_cp_v.push_back(&getTargetOf(*beginItie));
        }
        {
        OutEdgeIteratorPair pie(getOutEdgesOf(theCurrentVertex_r));
        OutEdgeIterator beginItie(pie.first),endItie(pie.second);
        for (;beginItie!=endItie ;++beginItie) 
          topologicalSortRecursively(getTargetOf(*beginItie),idx,tmpSortedVertices_cp_v); 
        }
      }
    }
  }

  void
  ReversibleControlFlowGraph::topologicalSort() {
    markLoopBodyEntryEdges();
    initVisit();
    clearIndeces();
    mySortedVertices_cp_l.clear();
    int idx=0;
    getEntry().setIndex(idx++);
    std::vector<const ReversibleControlFlowGraphVertex*> tmpSortedVertices_cp_v;
    tmpSortedVertices_cp_v.push_back(&getEntry());
    topologicalSortRecursively(getEntry(),idx,tmpSortedVertices_cp_v);

    // print mySortedVertices_cp_v
  {
    std::vector<const ReversibleControlFlowGraphVertex*>::iterator tmpSortedVertices_cp_v_it;
    for (tmpSortedVertices_cp_v_it=tmpSortedVertices_cp_v.begin();tmpSortedVertices_cp_v_it!=tmpSortedVertices_cp_v.end();tmpSortedVertices_cp_v_it++)
      if (*tmpSortedVertices_cp_v_it) 
        std::cout << (*tmpSortedVertices_cp_v_it)->getIndex() << std::endl;
      else
        std::cout << "NULL" << std::endl;

  }

    // copy into dense list
    std::vector<const ReversibleControlFlowGraphVertex*>::iterator tmpSortedVertices_cp_v_it;
    for (tmpSortedVertices_cp_v_it=tmpSortedVertices_cp_v.begin();tmpSortedVertices_cp_v_it!=tmpSortedVertices_cp_v.end();tmpSortedVertices_cp_v_it++)
      if (*tmpSortedVertices_cp_v_it) mySortedVertices_cp_l.push_back(*tmpSortedVertices_cp_v_it);

    // print mySortedVertices_cp_l
    std::list<const ReversibleControlFlowGraphVertex*>::iterator mySortedVertices_cp_l_it;
    for (mySortedVertices_cp_l_it=mySortedVertices_cp_l.begin();mySortedVertices_cp_l_it!=mySortedVertices_cp_l.end();mySortedVertices_cp_l_it++)
      if (*mySortedVertices_cp_l_it)
        std::cout << (*mySortedVertices_cp_l_it)->getIndex() << std::endl;
      else
        std::cout << "NULL" << std::endl;
  }


  void 
  ReversibleControlFlowGraph::topologicalSortReverseRecursively(ReversibleControlFlowGraphVertex& theCurrentVertex_r, int& idx,std::vector<const ReversibleControlFlowGraphVertex*>& tmpSortedVertices_cp_v) {
    theCurrentVertex_r.setVisited(true);
    {
    InEdgeIteratorPair pie(getInEdgesOf(theCurrentVertex_r));
    InEdgeIterator beginItie(pie.first),endItie(pie.second);
    for (;beginItie!=endItie ;++beginItie) {
      ReversibleControlFlowGraphVertex& theSource(getSourceOf(*beginItie));
      if ((*beginItie).isBackEdge(*this)&&theSource.getVisited()) continue;
      if (theSource.getVisited()) 
        tmpSortedVertices_cp_v[theSource.getIndex()]=0;
      tmpSortedVertices_cp_v.push_back(&theSource);
      theSource.setIndex(idx++);
    }  
    }
    {
    InEdgeIteratorPair pie(getInEdgesOf(theCurrentVertex_r));
    InEdgeIterator beginItie(pie.first),endItie(pie.second);
    for (;beginItie!=endItie ;++beginItie) {
      if ((*beginItie).isBackEdge(*this)&&getSourceOf(*beginItie).getVisited()) continue;
      topologicalSortReverseRecursively(getSourceOf(*beginItie),idx,tmpSortedVertices_cp_v); 
    }
    }
  }

  void 
  ReversibleControlFlowGraph::topologicalSortReverse() {
    initVisit();
    clearIndeces();
    mySortedVertices_cp_l.clear();
    int idx=0;
    getExit().setIndex(idx++);
    std::vector<const ReversibleControlFlowGraphVertex*> tmpSortedVertices_cp_v;
    topologicalSortReverseRecursively(getExit(),idx,tmpSortedVertices_cp_v);
    // copy into dense list
    std::vector<const ReversibleControlFlowGraphVertex*>::iterator tmpSortedVertices_cp_v_it;
    for (tmpSortedVertices_cp_v_it=tmpSortedVertices_cp_v.begin();tmpSortedVertices_cp_v_it!=tmpSortedVertices_cp_v.end();tmpSortedVertices_cp_v_it++)
      if (*tmpSortedVertices_cp_v_it) mySortedVertices_cp_l.push_back(*tmpSortedVertices_cp_v_it);
    // print mySortedVertices_cp_l
    std::list<const ReversibleControlFlowGraphVertex*>::iterator mySortedVertices_cp_l_it;
    for (mySortedVertices_cp_l_it=mySortedVertices_cp_l.begin();mySortedVertices_cp_l_it!=mySortedVertices_cp_l.end();mySortedVertices_cp_l_it++) 
      if (*mySortedVertices_cp_l_it)
        std::cout << (*mySortedVertices_cp_l_it)->getIndex() << std::endl;
      else
        std::cout << "NULL" << std::endl;
  }

  void 
  ReversibleControlFlowGraph::storeControlFlow() {
    initVisit();
    std::stack<const Symbol*> theLoopCounterSymbolStack;
    storeControlFlowGraphRecursively(getExit(),theLoopCounterSymbolStack);
  }

  void 
  ReversibleControlFlowGraph::reverseControlFlowGraphRecursively(ReversibleControlFlowGraphVertex& theCurrentVertex_r) {
    if (!theCurrentVertex_r.getVisited()) {
      theCurrentVertex_r.setVisited(true); 
      switch (theCurrentVertex_r.getOriginalControlFlowGraphVertexAlg().getKind()) {
        case ControlFlowGraphVertexAlg::BASICBLOCK : {
          if (theCurrentVertex_r.isOriginal()) {
          // insert adjoint basic block

          }  
        }
        case ControlFlowGraphVertexAlg::FORLOOP :  
        case ControlFlowGraphVertexAlg::PRELOOP : {
          // insert ENDLOOP
        }
        case ControlFlowGraphVertexAlg::IF : {
          // insert ENDIF
        }
        case ControlFlowGraphVertexAlg::ENDBRANCH : {
          // insert if (pop_cfg()) then ... else ... 
        }
        case ControlFlowGraphVertexAlg::ENDLOOP : {
          // insert for (i=1;i<=pop_cfg();i++) ...
        }
        default : {
          InEdgeIteratorPair pie(getInEdgesOf(theCurrentVertex_r));
          InEdgeIterator beginItie(pie.first),endItie(pie.second);
          for (;beginItie!=endItie ;++beginItie)
            reverseControlFlowGraphRecursively(getSourceOf(*beginItie));
        }
      }
    }
  }

  void 
  ReversibleControlFlowGraph::reverseControlFlow() {
    initVisit();
    reverseControlFlowGraphRecursively(getExit());
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

