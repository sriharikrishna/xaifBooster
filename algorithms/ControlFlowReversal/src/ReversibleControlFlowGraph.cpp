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
#include "xaifBooster/system/inc/BooleanOperation.hpp"

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ReversibleControlFlowGraph.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/ControlFlowGraphVertexAlg.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/CallGraphAlg.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"
#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/ArgumentSubstitute.hpp"


using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 
  ReversibleControlFlowGraph::ReversibleControlFlowGraph(const ControlFlowGraph& theOriginal_r) : myOriginalGraph_r(theOriginal_r) {}

  void
  ReversibleControlFlowGraph::makeThisACopyOfOriginalControlFlowGraph() {
    std::list<std::pair<const ControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> > vertexCopy_l;
    ControlFlowGraph::ConstVertexIteratorPair p(myOriginalGraph_r.vertices());
    ControlFlowGraph::ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt) {
      ReversibleControlFlowGraphVertex* anOriginalVertex=new ReversibleControlFlowGraphVertex(&(*beginIt));
      vertexCopy_l.push_back(std::make_pair(&(*beginIt),anOriginalVertex));  
      supplyAndAddVertexInstance(*anOriginalVertex);
    }
    ControlFlowGraph::ConstEdgeIteratorPair pe(myOriginalGraph_r.edges());
    ControlFlowGraph::ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte) {
      const ControlFlowGraphVertex& theOriginalSource_r(myOriginalGraph_r.getSourceOf(*beginIte));
      const ControlFlowGraphVertex& theOriginalTarget_r(myOriginalGraph_r.getTargetOf(*beginIte));
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
    oss << dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature().c_str() << "e_" << getNextEdgeId() << std::ends;
    return (oss.str());
  }

// direction indicates if the characteristics of the replaceEdge should
// be preserved by the new in (false) or outedge (true)
  BasicBlock&
  ReversibleControlFlowGraph::insert_basic_block(const ReversibleControlFlowGraphVertex& after, const ReversibleControlFlowGraphVertex& before, const ReversibleControlFlowGraphEdge& replacedEdge_r, bool direction) {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    aNewReversibleControlFlowGraphVertex_p->setIndex(numVertices()+1);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
// myOriginalGraph_r does not have a scope yet since nobody sets it
// use the global scope for the time being
//    aNewReversibleControlFlowGraphVertex->myNewVertex_p=new BasicBlock(myOriginalGraph_r.getScope());
    BasicBlock* theNewBasicBlock=new BasicBlock(ConceptuallyStaticInstances::instance()->getCallGraph().getScopeTree().getGlobalScope());
    aNewReversibleControlFlowGraphVertex_p->supplyAndAddNewVertex(*theNewBasicBlock);
//    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
    ReversibleControlFlowGraphEdge* aNewReversibleControlFlowGraphInEdge_p=new ReversibleControlFlowGraphEdge();
    aNewReversibleControlFlowGraphInEdge_p->getNewEdge().setId(makeUniqueEdgeId());
/*
    if (replacedEdge_r.original) {
      aNewReversibleControlFlowGraphInEdge_p->getNewEdge().set_has_condition_value(replacedEdge_r.getOriginalEdge().has_condition_value());
      aNewReversibleControlFlowGraphInEdge_p->getNewEdge().set_condition_value(replacedEdge_r.getOriginalEdge().get_condition_value());
    }
    else {
      aNewReversibleControlFlowGraphInEdge_p->getNewEdge().set_has_condition_value(replacedEdge_r.getNewEdge().has_condition_value());
      aNewReversibleControlFlowGraphInEdge_p->getNewEdge().set_condition_value(replacedEdge_r.getNewEdge().get_condition_value());
    }
*/
    if (!direction) {
      aNewReversibleControlFlowGraphInEdge_p->set_has_condition_value(replacedEdge_r.has_condition_value());
      aNewReversibleControlFlowGraphInEdge_p->set_condition_value(replacedEdge_r.get_condition_value());
    }
  
    ReversibleControlFlowGraphEdge* aNewReversibleControlFlowGraphOutEdge_p=new ReversibleControlFlowGraphEdge();
    aNewReversibleControlFlowGraphOutEdge_p->getNewEdge().setId(makeUniqueEdgeId());
/*
    if (replacedEdge_r.original) {
      aNewReversibleControlFlowGraphOutEdge_p->getNewEdge().set_has_condition_value(replacedEdge_r.getOriginalEdge().has_condition_value());
      aNewReversibleControlFlowGraphOutEdge_p->getNewEdge().set_condition_value(replacedEdge_r.getOriginalEdge().get_condition_value());
    }
    else {
      aNewReversibleControlFlowGraphOutEdge_p->getNewEdge().set_has_condition_value(replacedEdge_r.getNewEdge().has_condition_value());
      aNewReversibleControlFlowGraphOutEdge_p->getNewEdge().set_condition_value(replacedEdge_r.getNewEdge().get_condition_value());
    }
*/
    if (direction) {
      aNewReversibleControlFlowGraphOutEdge_p->set_has_condition_value(replacedEdge_r.has_condition_value());
      aNewReversibleControlFlowGraphOutEdge_p->set_condition_value(replacedEdge_r.get_condition_value());
    }

    supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphInEdge_p,after,*aNewReversibleControlFlowGraphVertex_p);
    supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphOutEdge_p,*aNewReversibleControlFlowGraphVertex_p,before);
    return dynamic_cast<BasicBlock&>(*(aNewReversibleControlFlowGraphVertex_p->myNewVertex_p));
  }

  ReversibleControlFlowGraphVertex*
  ReversibleControlFlowGraph::old_basic_block(const BasicBlock& theOriginalBasicBlock) {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex(&theOriginalBasicBlock);
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    return aNewReversibleControlFlowGraphVertex_p;
  }

  ReversibleControlFlowGraphVertex*
  ReversibleControlFlowGraph::new_entry() {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p=new Entry();
//    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
    return aNewReversibleControlFlowGraphVertex_p;
  }

  ReversibleControlFlowGraphVertex*
  ReversibleControlFlowGraph::new_exit() {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p=new Exit();
//    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
    return aNewReversibleControlFlowGraphVertex_p;
  }

  ReversibleControlFlowGraphVertex*
  ReversibleControlFlowGraph::new_branch() {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p=new Branch();
//    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
    return aNewReversibleControlFlowGraphVertex_p;
  }

  ReversibleControlFlowGraphVertex*
  ReversibleControlFlowGraph::new_if() {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p=new IfStatement();
//    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
    return aNewReversibleControlFlowGraphVertex_p;
  }

  ReversibleControlFlowGraphVertex*
  ReversibleControlFlowGraph::new_forloop() {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p=new ForLoop();
//    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
    return aNewReversibleControlFlowGraphVertex_p;
  }

  ReversibleControlFlowGraphVertex*
  ReversibleControlFlowGraph::new_endbranch() {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p=new EndBranch();
//    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
    return aNewReversibleControlFlowGraphVertex_p;
  }

  ReversibleControlFlowGraphVertex*
  ReversibleControlFlowGraph::new_endloop() {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->myNewVertex_p=new EndLoop();
 //   aNewReversibleControlFlowGraphVertex_p->getNewVertex().setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
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

    // edges
    ExpressionEdge& theFirstExpressionEdge(theAssignment_p->getRHS().addEdge(*theUse_p,*theAddition_p));
    theFirstExpressionEdge.setId(1);
    theFirstExpressionEdge.setPosition(1);
    ExpressionEdge& theSecondExpressionEdge(theAssignment_p->getRHS().addEdge(*theOne_p,*theAddition_p));
    theSecondExpressionEdge.setId(2);
    theSecondExpressionEdge.setPosition(2);
    
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
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theInlinableSubroutineCall_p = new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_i");
    theInlinableSubroutineCall_p->setId(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature() + "push_i");
    Variable theSubstitutionArgument;
    VariableSymbolReference* theVariableSymbolReference_p=new VariableSymbolReference(*theIntegerSymbol_p,theBasicBlock_r.getScope());
    theVariableSymbolReference_p->setId("1");
    theSubstitutionArgument.supplyAndAddVertexInstance(*theVariableSymbolReference_p);
    theSubstitutionArgument.getAliasMapKey().setTemporary();
    theSubstitutionArgument.getDuUdMapKey().setTemporary();
    theSubstitutionArgument.copyMyselfInto(theInlinableSubroutineCall_p->addArgumentSubstitute(1).getVariable());
    theBasicBlock_r.supplyAndAddBasicBlockElementInstance(*theInlinableSubroutineCall_p);
  }

  const Symbol&
  ReversibleControlFlowGraph::insert_pop_integer(BasicBlock& theBasicBlock_r) {
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theInlinableSubroutineCall_p = new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("pop_i");
    theInlinableSubroutineCall_p->setId(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature() + "pop_i");
    Variable theSubstitutionArgument;
    Symbol* theIntegerSymbol_p= new Symbol(theBasicBlock_r.getScope().getSymbolTable().addUniqueAuxSymbol(SymbolKind::VARIABLE,SymbolType::INTEGER_STYPE,SymbolShape::SCALAR,false));
    VariableSymbolReference* theVariableSymbolReference_p=new VariableSymbolReference(*theIntegerSymbol_p,theBasicBlock_r.getScope());
    theVariableSymbolReference_p->setId("1");
    theSubstitutionArgument.supplyAndAddVertexInstance(*theVariableSymbolReference_p);
    theSubstitutionArgument.getAliasMapKey().setTemporary();
    theSubstitutionArgument.getDuUdMapKey().setTemporary();
    theSubstitutionArgument.copyMyselfInto(theInlinableSubroutineCall_p->addArgumentSubstitute(1).getVariable());
    theBasicBlock_r.supplyAndAddBasicBlockElementInstance(*theInlinableSubroutineCall_p);
    return *theIntegerSymbol_p;
  }





  /**
   * Augmentation of cfg to record the flow of control. This assumes
   * that all vertices have at most two inedges (loops and endbranches)
   * and at most two outedges (loops and branches)
   */

  void 
  ReversibleControlFlowGraph::storeControlFlow() {
    markBranchExitEdges();
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
              BasicBlock& theBasicBlock_r(insert_basic_block(getSourceOf(*(*ieilIt)),getTargetOf(*(*ieilIt)),(*(*ieilIt)),false));
              theBasicBlock_r.setId(std::string("_aug_")+makeUniqueVertexId());
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
                BasicBlock& theBasicBlock_r(insert_basic_block(getSourceOf(*(*oeilIt)),getTargetOf(*(*oeilIt)),(*(*oeilIt)),true));
                theBasicBlock_r.setId(std::string("_aug_")+makeUniqueVertexId());
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
          BasicBlock& theBasicBlock_r(insert_basic_block(getSourceOf((*beginItie)),getTargetOf((*beginItie)),(*beginItie),false));
          theBasicBlock_r.setId(std::string("_aug_")+makeUniqueVertexId());
          insert_increment_integer(theLoopCounterSymbolStack_r.top(),theBasicBlock_r);
          theLoopCounterSymbolStack_r.pop();
          removeAndDeleteEdge((*beginItie));
          break;
        }
        case ControlFlowGraphVertexAlg::ENDBRANCH : {
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
            BasicBlock& theBasicBlock_r(insert_basic_block(theSource_r,getTargetOf(*(*ieilIt)),(*(*ieilIt)),true));
            theBasicBlock_r.setId(std::string("_aug_")+makeUniqueVertexId());
            const Symbol* theLhsSymbol;
            if (ieil.size()==2) {
              if ((*(*ieilIt)).has_condition_value())
                theLhsSymbol=insert_init_integer(1,theBasicBlock_r);
              else 
                theLhsSymbol=insert_init_integer(0,theBasicBlock_r);
            }
            else
              theLhsSymbol=insert_init_integer((*(*ieilIt)).get_condition_value(),theBasicBlock_r);
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
    for (;beginIt!=endIt ;++beginIt) (*beginIt).setIndex(0);
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

  /**
   * assign index to current vertex and call on successors
   */

  void
  ReversibleControlFlowGraph::topologicalSortRecursively(ReversibleControlFlowGraphVertex& theCurrentVertex_r, int& idx,std::stack<ReversibleControlFlowGraphVertex*>& endNodes_p_s_r) {
    if (theCurrentVertex_r.getVisited()) return;
    theCurrentVertex_r.setVisited(true);
    // push current node to stack if ENDBRANCH and return
    if (theCurrentVertex_r.getKind()==ControlFlowGraphVertexAlg::ENDBRANCH) {
      endNodes_p_s_r.push(&theCurrentVertex_r);
      return;
    } 
    // set index of current node and increment
    theCurrentVertex_r.setIndex(idx++);
    mySortedVertices_p_l.push_back(&theCurrentVertex_r);
    // return if ENDLOOP
    if (theCurrentVertex_r.getKind()==ControlFlowGraphVertexAlg::ENDLOOP) return;
    // for loops make sure that loop body is tranversed first
    if (theCurrentVertex_r.getKind()==ControlFlowGraphVertexAlg::PRELOOP||theCurrentVertex_r.getKind()==ControlFlowGraphVertexAlg::FORLOOP) {
      OutEdgeIteratorPair theCurrentVertex_oeip(getOutEdgesOf(theCurrentVertex_r));
      // sort loop body
      OutEdgeIterator begin_oei_toLoopBody(theCurrentVertex_oeip.first),end_oei_toLoopBody(theCurrentVertex_oeip.second);
      for (;begin_oei_toLoopBody!=end_oei_toLoopBody;++begin_oei_toLoopBody) 
        if ((*begin_oei_toLoopBody).toLoopBody) 
          topologicalSortRecursively(getTargetOf(*begin_oei_toLoopBody),idx,endNodes_p_s_r); 
      // sort nodes after loop
      OutEdgeIterator begin_oei_toAfterLoop(theCurrentVertex_oeip.first),end_oei_toAfterLoop(theCurrentVertex_oeip.second);
      for (;begin_oei_toAfterLoop!=end_oei_toAfterLoop;++begin_oei_toAfterLoop) 
        if (!(*begin_oei_toAfterLoop).toLoopBody) 
          topologicalSortRecursively(getTargetOf(*begin_oei_toAfterLoop),idx,endNodes_p_s_r); 
    }
    else { // go for all successors otherwise
      OutEdgeIteratorPair theCurrentVertex_oeip(getOutEdgesOf(theCurrentVertex_r));
      OutEdgeIterator begin_oei(theCurrentVertex_oeip.first),end_oei(theCurrentVertex_oeip.second);
      for (;begin_oei!=end_oei;++begin_oei) 
        topologicalSortRecursively(getTargetOf(*begin_oei),idx,endNodes_p_s_r); 
    }
    // if branch node then handle corresponding end node
    if (theCurrentVertex_r.getKind()==ControlFlowGraphVertexAlg::BRANCH) {
      endNodes_p_s_r.top()->setIndex(idx++);
      mySortedVertices_p_l.push_back(endNodes_p_s_r.top());
      // sort successor  
      OutEdgeIteratorPair theCurrentVertex_oeip(getOutEdgesOf(*(endNodes_p_s_r.top())));
      topologicalSortRecursively(getTargetOf(*(theCurrentVertex_oeip.first)),idx,endNodes_p_s_r); 
      endNodes_p_s_r.pop();
    }
  }

  void
  ReversibleControlFlowGraph::topologicalSort() {
    initVisit();
    clearIndeces();
    mySortedVertices_p_l.clear();
    int idx=1;
    std::stack<ReversibleControlFlowGraphVertex*> endNodes_p_s;
    topologicalSortRecursively(getEntry(),idx,endNodes_p_s);
  }

  /*
   Insert edge from theAdjointSource_cr to theAdjointTarget_cr.
   Return reference to the newly created ReversibleControlFlowGraphEdge.
   */
  ReversibleControlFlowGraphEdge&
  ReversibleControlFlowGraph::insertAdjointControlFlowGraphEdge(ReversibleControlFlowGraph& theAdjointControlFlowGraph_r, const ReversibleControlFlowGraphVertex& theAdjointSource_cr, const ReversibleControlFlowGraphVertex& theAdjointTarget_cr) {
    ReversibleControlFlowGraphEdge* aNewReversibleControlFlowGraphEdge_p=new ReversibleControlFlowGraphEdge();
    aNewReversibleControlFlowGraphEdge_p->getNewEdge().setId(theAdjointControlFlowGraph_r.makeUniqueEdgeId());
    theAdjointControlFlowGraph_r.supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphEdge_p,theAdjointSource_cr,theAdjointTarget_cr);
    return *aNewReversibleControlFlowGraphEdge_p;
  }


  /*
   For a given edge in the original control flow, build its adjoint.
   The correspondence between original and adjoint vertices is recorded in
   theVertexCorrespondence_ppl where the first entry of each pair is the
   original vertex and the second entry is the adjoint vertex.

   Add edge from the adjoint of the target to the adjoint of the source 
   if the source it is not a LOOP node and the target is not the first node 
   of the loop body, that is, its inedge.
   Otherwise, find the matching original ENDLOOP node and add edge
   from theSource_p to the ENDLOOP node's adjoint (a FORLOOP) node.
   */
  ReversibleControlFlowGraphEdge&
  ReversibleControlFlowGraph::addAdjointControlFlowGraphEdge(ReversibleControlFlowGraph& theAdjointControlFlowGraph_r, const ReversibleControlFlowGraphEdge& theOriginalEdge_cr, const std::list<std::pair<ReversibleControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> >& theVertexCorrespondence_ppl) {
    std::list<std::pair<ReversibleControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> >::const_iterator theVertexCorrespondence_ppl_cit;
    // source and target of adjoint edge to be inserted
    // source is fixed, target depends on kind of original source
    ReversibleControlFlowGraphVertex *theAdjointSource_p, *theAdjointTarget_p;
    // initialize source and target of adjoint edge to be inserted
    bool foundAdjointSource=false;
    bool foundAdjointTarget=false;
    for (theVertexCorrespondence_ppl_cit=theVertexCorrespondence_ppl.begin();theVertexCorrespondence_ppl_cit!=theVertexCorrespondence_ppl.end(),!(foundAdjointSource&&foundAdjointTarget);theVertexCorrespondence_ppl_cit++) {
      if ((*theVertexCorrespondence_ppl_cit).first==&getTargetOf(theOriginalEdge_cr)) {
        theAdjointSource_p=(*theVertexCorrespondence_ppl_cit).second; 
        foundAdjointSource=true;
      } 
      if ((*theVertexCorrespondence_ppl_cit).first==&getSourceOf(theOriginalEdge_cr)) {
       theAdjointTarget_p=(*theVertexCorrespondence_ppl_cit).second; 
        foundAdjointTarget=true;
      }
    }
    // distinguish type of original source
    if ((getSourceOf(theOriginalEdge_cr).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::FORLOOP||getSourceOf(theOriginalEdge_cr).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::PRELOOP)&&!theOriginalEdge_cr.has_condition_value()) {
       // if LOOP, then find matching original ENDLOOP
       ReversibleControlFlowGraphVertex* theOriginalEndLoop_p;
       InEdgeIteratorPair ieitp(getInEdgesOf(getSourceOf(theOriginalEdge_cr)));
       InEdgeIterator begin_ieit(ieitp.first),end_ieit(ieitp.second);
       for (;begin_ieit!=end_ieit;++begin_ieit) 
       if (getSourceOf(*begin_ieit).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::ENDLOOP) {
         theOriginalEndLoop_p=&getSourceOf(*begin_ieit);
         break;
       }
       // find adjoint FORLOOP node that corresponds to original ENDLOOP node
       for (theVertexCorrespondence_ppl_cit=theVertexCorrespondence_ppl.begin();theVertexCorrespondence_ppl_cit!=theVertexCorrespondence_ppl.end();theVertexCorrespondence_ppl_cit++) 
         if ((*theVertexCorrespondence_ppl_cit).first==theOriginalEndLoop_p) {
           theAdjointTarget_p=(*theVertexCorrespondence_ppl_cit).second; 
           break;
         }
    }
    // insert edge from *theAdjointSource_p to *theAdjointTarget_p
    ReversibleControlFlowGraphEdge& theNewReversibleControlFlowGraphEdge_r(insertAdjointControlFlowGraphEdge(theAdjointControlFlowGraph_r,*theAdjointSource_p,*theAdjointTarget_p));
    // set condition value
    theNewReversibleControlFlowGraphEdge_r.set_has_condition_value(theOriginalEdge_cr.has_condition_value());
    theNewReversibleControlFlowGraphEdge_r.set_condition_value(theOriginalEdge_cr.get_condition_value());
    return theNewReversibleControlFlowGraphEdge_r;
  }

  /*
   Construct the adjoint control flow graph.
   */
  void
  ReversibleControlFlowGraph::buildAdjointControlFlowGraph(ReversibleControlFlowGraph& theAdjointControlFlowGraph_r) {
    std::list<std::pair<ReversibleControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> > theVertexCorrespondence_ppl;
    std::list<ReversibleControlFlowGraphVertex*>::reverse_iterator the_mySortedVertices_p_l_rit;
    for (the_mySortedVertices_p_l_rit=mySortedVertices_p_l.rbegin(); the_mySortedVertices_p_l_rit!=mySortedVertices_p_l.rend(); the_mySortedVertices_p_l_rit++) {
      ReversibleControlFlowGraphVertex* theReversibleControlFlowGraphVertex_p;
      switch ((*the_mySortedVertices_p_l_rit)->getOriginalControlFlowGraphVertexAlg().getKind()) {
        case ControlFlowGraphVertexAlg::EXIT : {
          theReversibleControlFlowGraphVertex_p=theAdjointControlFlowGraph_r.new_entry();
          theReversibleControlFlowGraphVertex_p->getNewVertex().setId(std::string("_adj_")+makeUniqueVertexId());
          break;
        }
        case ControlFlowGraphVertexAlg::ENTRY : {
          theReversibleControlFlowGraphVertex_p=theAdjointControlFlowGraph_r.new_exit();
          theReversibleControlFlowGraphVertex_p->getNewVertex().setId(std::string("_adj_")+makeUniqueVertexId());
          break;
        }
        case ControlFlowGraphVertexAlg::BRANCH : {
          theReversibleControlFlowGraphVertex_p=theAdjointControlFlowGraph_r.new_endbranch();
          theReversibleControlFlowGraphVertex_p->getNewVertex().setId(std::string("_adj_")+makeUniqueVertexId());
          break;
        }
        case ControlFlowGraphVertexAlg::BASICBLOCK : {
          theReversibleControlFlowGraphVertex_p=
	    theAdjointControlFlowGraph_r.old_basic_block(dynamic_cast<const BasicBlock&>((*the_mySortedVertices_p_l_rit)->
											 getOriginalControlFlowGraphVertexAlg().getContaining()));
          break;
        }
        case ControlFlowGraphVertexAlg::ENDBRANCH : {
          theReversibleControlFlowGraphVertex_p=theAdjointControlFlowGraph_r.new_branch();
          theReversibleControlFlowGraphVertex_p->getNewVertex().setId(std::string("_adj_")+makeUniqueVertexId());
          break;
        }
        case ControlFlowGraphVertexAlg::PRELOOP : 
        case ControlFlowGraphVertexAlg::FORLOOP : {
          theReversibleControlFlowGraphVertex_p=theAdjointControlFlowGraph_r.new_endloop();
          theReversibleControlFlowGraphVertex_p->getNewVertex().setId(std::string("_adj_")+makeUniqueVertexId());
          break;
        }
        case ControlFlowGraphVertexAlg::ENDLOOP : {
          theReversibleControlFlowGraphVertex_p=theAdjointControlFlowGraph_r.new_forloop();
          theReversibleControlFlowGraphVertex_p->getNewVertex().setId(std::string("_adj_")+makeUniqueVertexId());
          break;
        }
        default: break;
      }
      theVertexCorrespondence_ppl.push_back(std::make_pair(*the_mySortedVertices_p_l_rit,theReversibleControlFlowGraphVertex_p)); 
      theReversibleControlFlowGraphVertex_p->setAdjointIndex((*the_mySortedVertices_p_l_rit)->getIndex());
    }
    // add reversed edges
    std::list<std::pair<ReversibleControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> >::const_iterator theVertexCorrespondence_ppl_cit;
    for (theVertexCorrespondence_ppl_cit=theVertexCorrespondence_ppl.begin();theVertexCorrespondence_ppl_cit!=theVertexCorrespondence_ppl.end();theVertexCorrespondence_ppl_cit++) {
      switch ((*theVertexCorrespondence_ppl_cit).second->getKind()) {
        case ControlFlowGraphVertexAlg::ENTRY : 
        case ControlFlowGraphVertexAlg::ENDBRANCH : 
        case ControlFlowGraphVertexAlg::BASICBLOCK : {
          InEdgeIteratorPair ieitp(getInEdgesOf(*((*theVertexCorrespondence_ppl_cit).first)));
          InEdgeIterator begin_ieit(ieitp.first),end_ieit(ieitp.second);
          for (;begin_ieit!=end_ieit ;++begin_ieit) addAdjointControlFlowGraphEdge(theAdjointControlFlowGraph_r,*begin_ieit,theVertexCorrespondence_ppl);
          break;
        }
        case ControlFlowGraphVertexAlg::BRANCH : {
          // insert pop() in front
          InEdgeIteratorPair singleInEdge_ieitp(getInEdgesOf(*((*theVertexCorrespondence_ppl_cit).second)));
          BasicBlock& theNewBasicBlock_r(theAdjointControlFlowGraph_r.insert_basic_block(getSourceOf(*(singleInEdge_ieitp.first)),*((*theVertexCorrespondence_ppl_cit).second),*(singleInEdge_ieitp.first),true));
          theNewBasicBlock_r.setId(std::string("_adj_")+makeUniqueVertexId());
          removeAndDeleteEdge(*(singleInEdge_ieitp.first));
          const Symbol& thePoppedIntegerSymbol_cr(theAdjointControlFlowGraph_r.insert_pop_integer(theNewBasicBlock_r));

          // add thePoppedIntegerSymbol_cr to branch condition as select value
          Expression& theSelectExpression_r(dynamic_cast<Branch*>((*theVertexCorrespondence_ppl_cit).second->myNewVertex_p)->getCondition().getExpression());
          Argument* theArgument_p=new Argument();
          theArgument_p->setId("1");
          theSelectExpression_r.supplyAndAddVertexInstance(*theArgument_p);  
          theArgument_p->getVariable().getAliasMapKey().setTemporary();
          theArgument_p->getVariable().getDuUdMapKey().setTemporary();
          VariableSymbolReference* theSelectVariableSymbolReference_p=new VariableSymbolReference(thePoppedIntegerSymbol_cr,theNewBasicBlock_r.getScope());
          theArgument_p->getVariable().supplyAndAddVertexInstance(*theSelectVariableSymbolReference_p);
          theSelectVariableSymbolReference_p->setId("1");
          
          // insert adjoint edges
          InEdgeIteratorPair ieitp(getInEdgesOf(*((*theVertexCorrespondence_ppl_cit).first)));
          InEdgeIterator begin_ieit(ieitp.first),end_ieit(ieitp.second);
          for (;begin_ieit!=end_ieit ;++begin_ieit) addAdjointControlFlowGraphEdge(theAdjointControlFlowGraph_r,*begin_ieit,theVertexCorrespondence_ppl);
          break;
        }
        case ControlFlowGraphVertexAlg::FORLOOP : {
          // insert pop() in front
          InEdgeIteratorPair singleInEdge_ieitp(getInEdgesOf(*((*theVertexCorrespondence_ppl_cit).second)));
          BasicBlock& theNewBasicBlock_r(theAdjointControlFlowGraph_r.insert_basic_block(getSourceOf(*(singleInEdge_ieitp.first)),*((*theVertexCorrespondence_ppl_cit).second),*(singleInEdge_ieitp.first),true));
          theNewBasicBlock_r.setId(std::string("_adj_")+makeUniqueVertexId());
          removeAndDeleteEdge(*(singleInEdge_ieitp.first));
          const Symbol& thePoppedIntegerSymbol_cr(theAdjointControlFlowGraph_r.insert_pop_integer(theNewBasicBlock_r));

          // fill ForLoop  
          ForLoop& theForLoop_r(dynamic_cast<ForLoop&>(*((*theVertexCorrespondence_ppl_cit).second->myNewVertex_p)));

          // initialization
          theForLoop_r.getInitialization().getAssignment().setId(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature() + "init");
          // set lhs
          const Symbol* theLoopCounterSymbol_p=makeAuxilliaryIntegerLHS(theForLoop_r.getInitialization().getAssignment(),theNewBasicBlock_r);
          // set rhs
          Constant* theOne=new Constant(SymbolType::INTEGER_STYPE,false);
          theOne->setint(1);
          theOne->setId("1");
          theForLoop_r.getInitialization().getAssignment().getRHS().supplyAndAddVertexInstance(*theOne);

          // condition
          // counter
          Argument* theLoopCounterUse_p=new Argument(false); // no algorithm
          theLoopCounterUse_p->setId("2");
          VariableSymbolReference* theVariableSymbolReference_p=new VariableSymbolReference(*theLoopCounterSymbol_p,theNewBasicBlock_r.getScope());
          theVariableSymbolReference_p->setId("1");
          theLoopCounterUse_p->getVariable().supplyAndAddVertexInstance(*theVariableSymbolReference_p);
          theLoopCounterUse_p->getVariable().getAliasMapKey().setTemporary();
          theLoopCounterUse_p->getVariable().getDuUdMapKey().setTemporary();
          theForLoop_r.getCondition().getExpression().supplyAndAddVertexInstance(*theLoopCounterUse_p);
          // the popped integer symbol
          Argument* thePoppedIntegerUse_p=new Argument(false); // no algorithm
          thePoppedIntegerUse_p->setId("3");
          theVariableSymbolReference_p=new VariableSymbolReference(thePoppedIntegerSymbol_cr,theNewBasicBlock_r.getScope());
          theVariableSymbolReference_p->setId("1");
          thePoppedIntegerUse_p->getVariable().supplyAndAddVertexInstance(*theVariableSymbolReference_p);
          thePoppedIntegerUse_p->getVariable().getAliasMapKey().setTemporary();
          thePoppedIntegerUse_p->getVariable().getDuUdMapKey().setTemporary();
          theForLoop_r.getCondition().getExpression().supplyAndAddVertexInstance(*thePoppedIntegerUse_p);
          // <=
          BooleanOperation* theLessThanOrEqualOperator_p=new BooleanOperation(BooleanOperationType::LESS_OR_EQUAL_OTYPE,false);
          theLessThanOrEqualOperator_p->setId("1");
          theForLoop_r.getCondition().getExpression().supplyAndAddVertexInstance(*theLessThanOrEqualOperator_p);
          // edges
          ExpressionEdge& theFirstExpressionEdge(theForLoop_r.getCondition().getExpression().addEdge(*theLoopCounterUse_p,*theLessThanOrEqualOperator_p));
          theFirstExpressionEdge.setId(1);
          theFirstExpressionEdge.setPosition(1);
          ExpressionEdge& theSecondExpressionEdge(theForLoop_r.getCondition().getExpression().addEdge(*thePoppedIntegerUse_p,*theLessThanOrEqualOperator_p));
          theSecondExpressionEdge.setId(2);
          theSecondExpressionEdge.setPosition(2);
          
          // update
          // set lhs
          theVariableSymbolReference_p=new VariableSymbolReference(*theLoopCounterSymbol_p,theNewBasicBlock_r.getScope());
          theVariableSymbolReference_p->setId("1");
          theForLoop_r.getUpdate().getAssignment().getLHS().supplyAndAddVertexInstance(*theVariableSymbolReference_p);
          theForLoop_r.getUpdate().getAssignment().getLHS().getAliasMapKey().setTemporary();
          theForLoop_r.getUpdate().getAssignment().getLHS().getDuUdMapKey().setTemporary();

          // set rhs
          // counter
          Argument* theUse_p=new Argument(false); // no algorithm
          theUse_p->setId("2");
          theVariableSymbolReference_p=new VariableSymbolReference(*theLoopCounterSymbol_p,theNewBasicBlock_r.getScope());
          theVariableSymbolReference_p->setId("1");
          theUse_p->getVariable().supplyAndAddVertexInstance(*theVariableSymbolReference_p);
          theUse_p->getVariable().getAliasMapKey().setTemporary();
          theUse_p->getVariable().getDuUdMapKey().setTemporary();
          theForLoop_r.getUpdate().getAssignment().getRHS().supplyAndAddVertexInstance(*theUse_p);
          // 1
          Constant* theOne_p=new Constant(SymbolType::INTEGER_STYPE,false);
          theOne_p->setint(1);
          theOne_p->setId("3");
          theForLoop_r.getUpdate().getAssignment().getRHS().supplyAndAddVertexInstance(*theOne_p);
          // +
          Intrinsic* theAddition_p=new Intrinsic(std::string("add_scal_scal"),false);
          theAddition_p->setId("1");
          theForLoop_r.getUpdate().getAssignment().getRHS().supplyAndAddVertexInstance(*theAddition_p);
          // edges
          ExpressionEdge& theFirstUpdateEdge(theForLoop_r.getUpdate().getAssignment().getRHS().addEdge(*theUse_p,*theAddition_p));
          theFirstUpdateEdge.setId(1);
          theFirstUpdateEdge.setPosition(1);
          ExpressionEdge& theSecondUpdateEdge(theForLoop_r.getUpdate().getAssignment().getRHS().addEdge(*theOne_p,*theAddition_p));
          theSecondUpdateEdge.setId(2);
          theSecondUpdateEdge.setPosition(2);
          
          // insert adjoint edges
          InEdgeIteratorPair theEndLoop_ieitp(getInEdgesOf(*((*theVertexCorrespondence_ppl_cit).first)));
          ReversibleControlFlowGraphEdge& theNewReversibleControlFlowGraphEdge_r(addAdjointControlFlowGraphEdge(theAdjointControlFlowGraph_r,*(theEndLoop_ieitp.first),theVertexCorrespondence_ppl));
          // set condition value to true because this is a loop body entry edge
          theNewReversibleControlFlowGraphEdge_r.getNewEdge().set_has_condition_value(true);

          // insert edge from current adjoint node to adjoint of the
          // predecessor of the LOOP node that matches the original
          // (LOOP) of the original (ENDLOOP) of the current adjoint node 
          ReversibleControlFlowGraphVertex *theAdjointSource_p, *theAdjointTarget_p;
          std::list<std::pair<ReversibleControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> >::const_iterator theVertexCorrespondence_ppl_cit_1;
          for (theVertexCorrespondence_ppl_cit_1=theVertexCorrespondence_ppl.begin();theVertexCorrespondence_ppl_cit_1!=theVertexCorrespondence_ppl.end();theVertexCorrespondence_ppl_cit_1++) 
            if ((*theVertexCorrespondence_ppl_cit_1).first==(*theVertexCorrespondence_ppl_cit).first) {
              theAdjointSource_p=(*theVertexCorrespondence_ppl_cit_1).second; 
              break;
            } 
          OutEdgeIteratorPair toLoop_oeitp(getOutEdgesOf(*((*theVertexCorrespondence_ppl_cit).first)));
          InEdgeIteratorPair ieitp(getInEdgesOf(getTargetOf(*toLoop_oeitp.first)));
          InEdgeIterator begin_ieit(ieitp.first),end_ieit(ieitp.second);
          for (;begin_ieit!=end_ieit ;++begin_ieit) 
            if (!(*begin_ieit).isBackEdge(*this)) {
              for (theVertexCorrespondence_ppl_cit_1=theVertexCorrespondence_ppl.begin();theVertexCorrespondence_ppl_cit_1!=theVertexCorrespondence_ppl.end();theVertexCorrespondence_ppl_cit_1++) 
                if ((*theVertexCorrespondence_ppl_cit_1).first==&getSourceOf(*begin_ieit)) {
                  theAdjointTarget_p=(*theVertexCorrespondence_ppl_cit_1).second; 
                  break;
                } 
              break;
            } 
          insertAdjointControlFlowGraphEdge(theAdjointControlFlowGraph_r,*theAdjointSource_p,*theAdjointTarget_p);
          break;
        }
        case ControlFlowGraphVertexAlg::ENDLOOP : {
          // Insert back-edge from current adjoint node to matching
          // FORLOOP node.
          // The original node corresponding to the the current adjoint
          // node is a LOOP. We need to find the adjoint corresponding to the
          // matching original ENDLOOP node. 

          // determine adjoint source 
          ReversibleControlFlowGraphVertex *theAdjointSource_p, *theAdjointTarget_p;
          std::list<std::pair<ReversibleControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> >::const_iterator theVertexCorrespondence_ppl_cit_1;
          for (theVertexCorrespondence_ppl_cit_1=theVertexCorrespondence_ppl.begin();theVertexCorrespondence_ppl_cit_1!=theVertexCorrespondence_ppl.end();theVertexCorrespondence_ppl_cit_1++) 
            if ((*theVertexCorrespondence_ppl_cit_1).first==(*theVertexCorrespondence_ppl_cit).first) {
              theAdjointSource_p=(*theVertexCorrespondence_ppl_cit_1).second; 
              break;
            } 
          // find adjoint target
          InEdgeIteratorPair ieitp(getInEdgesOf(*((*theVertexCorrespondence_ppl_cit).first)));
          InEdgeIterator begin_ieit(ieitp.first),end_ieit(ieitp.second);
          for (;begin_ieit!=end_ieit ;++begin_ieit) 
            if (getSourceOf(*begin_ieit).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::ENDLOOP)  
              for (theVertexCorrespondence_ppl_cit_1=theVertexCorrespondence_ppl.begin();theVertexCorrespondence_ppl_cit_1!=theVertexCorrespondence_ppl.end();theVertexCorrespondence_ppl_cit_1++) 
                if ((*theVertexCorrespondence_ppl_cit_1).first==&getSourceOf(*begin_ieit)) {
                  theAdjointTarget_p=(*theVertexCorrespondence_ppl_cit_1).second; 
                  break;
                } 
          insertAdjointControlFlowGraphEdge(theAdjointControlFlowGraph_r,*theAdjointSource_p,*theAdjointTarget_p);
          break;
        }
        default: break; // only EXIT left
      }
    }
    theAdjointControlFlowGraph_r.markBranchEntryEdges(); 
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

