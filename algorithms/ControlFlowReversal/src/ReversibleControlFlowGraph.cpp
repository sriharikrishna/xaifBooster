// ========== begin copyright notice ==============
// This file is part of 
// ---------------
// xaifBooster
// ---------------
// Distributed under the BSD license as follows:
// Copyright (c) 2005, The University of Chicago
// All rights reserved.
//
// Redistribution and use in source and binary forms, 
// with or without modification, are permitted provided that the following conditions are met:
//
//    - Redistributions of source code must retain the above copyright notice, 
//      this list of conditions and the following disclaimer.
//    - Redistributions in binary form must reproduce the above copyright notice, 
//      this list of conditions and the following disclaimer in the documentation 
//      and/or other materials provided with the distribution.
//    - Neither the name of The University of Chicago nor the names of its contributors 
//      may be used to endorse or promote products derived from this software without 
//      specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
// OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
// SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
// LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
// General Information:
// xaifBooster is intended for the transformation of 
// numerical programs represented as xml files according 
// to the XAIF schema. It is part of the OpenAD framework. 
// The main application is automatic 
// differentiation, i.e. the generation of code for 
// the computation of derivatives. 
// The following people are the principal authors of the 
// current version: 
// 	Uwe Naumann
//	Jean Utke
// Additional contributors are: 
//	Andrew Lyons
//	Peter Fine
//
// For more details about xaifBooster and its use in OpenAD please visit:
//   http://www.mcs.anl.gov/openad
//
// This work is partially supported by:
// 	NSF-ITR grant OCE-0205590
// ========== end copyright notice ==============
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
#include "xaifBooster/algorithms/ControlFlowReversal/inc/BasicBlockAlg.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

  ReversibleControlFlowGraph::ReversibleControlFlowGraph(const ControlFlowGraph& theOriginal_r) : 
    myOriginalGraph_r(theOriginal_r) {
  }

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
	      theEdgeCopy_p->setId(makeUniqueEdgeId());
              supplyAndAddEdgeInstance(*theEdgeCopy_p,*(*vertexCopyListSrcIt).second,*(*vertexCopyListTgtIt).second);
              break;
            }
          }
          break;
        }
      }
    }
  }

  ReversibleControlFlowGraphVertex& ReversibleControlFlowGraph::getEntry() {
    ReversibleControlFlowGraph::VertexIteratorPair p(vertices());
    ReversibleControlFlowGraph::VertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt) 
      if ((*beginIt).isOriginal()) 
        if ((*beginIt).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::ENTRY) 
          return *beginIt;
    THROW_LOGICEXCEPTION_MACRO("Missing ENTRY node in control flow graph"); 
  }
  
  ReversibleControlFlowGraphVertex& ReversibleControlFlowGraph::getExit() {
    ReversibleControlFlowGraph::VertexIteratorPair p(vertices());
    ReversibleControlFlowGraph::VertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt) 
      if ((*beginIt).isOriginal()) 
        if ((*beginIt).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::EXIT) 
          return *beginIt;
    THROW_LOGICEXCEPTION_MACRO("Missing EXIT node in control flow graph"); 
  }

  // this does not guarantee uniqueness in the case of an existing
  // graph getting expanded
  // depends on prefix
  std::string ReversibleControlFlowGraph::makeUniqueVertexId() {
    std::ostringstream oss;
    oss << dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).
      getAlgorithmSignature().c_str() << "v_" << getNextVertexId() << std::ends;
    return (oss.str());
  }

  std::string ReversibleControlFlowGraph::makeUniqueEdgeId() {
    std::ostringstream oss;
    oss << dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).
      getAlgorithmSignature().c_str() << "e_" << getNextEdgeId() << std::ends;
    return (oss.str());
  }

  // direction indicates if the characteristics of the replaceEdge should
  // be preserved by the new in (false) or outedge (true)
  BasicBlock&
  ReversibleControlFlowGraph::insert_basic_block(const ReversibleControlFlowGraphVertex& after, 
						 const ReversibleControlFlowGraphVertex& before, 
						 const ReversibleControlFlowGraphEdge& replacedEdge_r, 
						 bool direction) {
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
    aNewReversibleControlFlowGraphInEdge_p->setId(makeUniqueEdgeId());
    if (!direction && replacedEdge_r.hasConditionValue()) {
      aNewReversibleControlFlowGraphInEdge_p->setConditionValue(replacedEdge_r.getConditionValue());
    }
    if (!direction && replacedEdge_r.hasRevConditionValue()) {
      aNewReversibleControlFlowGraphInEdge_p->setRevConditionValue(replacedEdge_r.getRevConditionValue());
    }
    ReversibleControlFlowGraphEdge* aNewReversibleControlFlowGraphOutEdge_p=new ReversibleControlFlowGraphEdge();
    aNewReversibleControlFlowGraphOutEdge_p->setId(makeUniqueEdgeId());
    if (direction && replacedEdge_r.hasConditionValue()) {
      aNewReversibleControlFlowGraphOutEdge_p->setConditionValue(replacedEdge_r.getConditionValue());
    }
    if (direction && replacedEdge_r.hasRevConditionValue()) {
      aNewReversibleControlFlowGraphOutEdge_p->setRevConditionValue(replacedEdge_r.getRevConditionValue());
    }
    supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphInEdge_p,after,*aNewReversibleControlFlowGraphVertex_p);
    supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphOutEdge_p,*aNewReversibleControlFlowGraphVertex_p,before);
    return dynamic_cast<BasicBlock&>(aNewReversibleControlFlowGraphVertex_p->getNewVertex());
  }

  ReversibleControlFlowGraphVertex* ReversibleControlFlowGraph::old_basic_block(const BasicBlock& theOriginalBasicBlock) {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex(&theOriginalBasicBlock);
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    return aNewReversibleControlFlowGraphVertex_p;
  }

  ReversibleControlFlowGraphVertex* ReversibleControlFlowGraph::new_entry() {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->supplyAndAddNewVertex(*(new Entry()));
    //    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
    return aNewReversibleControlFlowGraphVertex_p;
  }

  ReversibleControlFlowGraphVertex* ReversibleControlFlowGraph::new_exit() {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->supplyAndAddNewVertex(*(new Exit()));
    //    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
    return aNewReversibleControlFlowGraphVertex_p;
  }

  ReversibleControlFlowGraphVertex* ReversibleControlFlowGraph::new_branch() {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->supplyAndAddNewVertex(*(new Branch()));
    //    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
    return aNewReversibleControlFlowGraphVertex_p;
  }

  ReversibleControlFlowGraphVertex* ReversibleControlFlowGraph::new_if() {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->supplyAndAddNewVertex(*(new IfStatement()));
    //    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
    return aNewReversibleControlFlowGraphVertex_p;
  }

  ReversibleControlFlowGraphVertex*
  ReversibleControlFlowGraph::new_forloop(ForLoopReversalType::ForLoopReversalType_E aForLoopReversalType) {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->supplyAndAddNewVertex(*(new ForLoop(aForLoopReversalType)));
    //    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
    return aNewReversibleControlFlowGraphVertex_p;
  }

  ReversibleControlFlowGraphVertex* ReversibleControlFlowGraph::new_endbranch() {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->supplyAndAddNewVertex(*(new EndBranch()));
    //    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
    return aNewReversibleControlFlowGraphVertex_p;
  }

  ReversibleControlFlowGraphVertex* ReversibleControlFlowGraph::new_endloop() {
    ReversibleControlFlowGraphVertex* aNewReversibleControlFlowGraphVertex_p=new ReversibleControlFlowGraphVertex();
    aNewReversibleControlFlowGraphVertex_p->setVisited(true);
    supplyAndAddVertexInstance(*aNewReversibleControlFlowGraphVertex_p);
    aNewReversibleControlFlowGraphVertex_p->supplyAndAddNewVertex(*(new EndLoop()));
    //   aNewReversibleControlFlowGraphVertex_p->getNewVertex().setId(makeUniqueVertexId());
    aNewReversibleControlFlowGraphVertex_p->getNewVertex().setAnnotation(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().getCallGraphAlgBase()).getAlgorithmSignature());
    return aNewReversibleControlFlowGraphVertex_p;
  }

  const Symbol* ReversibleControlFlowGraph::makeAuxilliaryIntegerLHS(Assignment& theAssignment, 
								     BasicBlock& theBasicBlock_r) {
    const Symbol& theLhsSymbol_r(theBasicBlock_r.getScope().getSymbolTable().
				 addUniqueAuxSymbol(SymbolKind::VARIABLE,SymbolType::INTEGER_STYPE,SymbolShape::SCALAR,false));
    VariableSymbolReference* theVariableSymbolReference_p=new VariableSymbolReference(theLhsSymbol_r,theBasicBlock_r.getScope());
    theVariableSymbolReference_p->setId("1"); 
    theVariableSymbolReference_p->setAnnotation("xaifBoosterControlFlowReversal::ReversibleControlFlowGraph::makeAuxilliaryIntegerLHS"); 
    theAssignment.getLHS().supplyAndAddVertexInstance(*theVariableSymbolReference_p);
    theAssignment.getLHS().getAliasMapKey().setTemporary();
    theAssignment.getLHS().getDuUdMapKey().setTemporary();
    return &theLhsSymbol_r;
  }


  void ReversibleControlFlowGraph::insert_increment_integer(const Symbol* theIntegerSymbol_p,
							    BasicBlock& theBasicBlock_r) {
    // not active, no algorithm
    Assignment* theAssignment_p=new Assignment(false);
    theAssignment_p->setId(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().
							     getCallGraphAlgBase()).getAlgorithmSignature() + "increment");
    // set lhs
    VariableSymbolReference* theVariableSymbolReference_p=new VariableSymbolReference(*theIntegerSymbol_p,theBasicBlock_r.getScope());
    theVariableSymbolReference_p->setId("1");
    theVariableSymbolReference_p->setAnnotation("xaifBoosterControlFlowReversal::ReversibleControlFlowGraph::insert_increment_integer(lhs)");
    theAssignment_p->getLHS().supplyAndAddVertexInstance(*theVariableSymbolReference_p);
    theAssignment_p->getLHS().getAliasMapKey().setTemporary();
    theAssignment_p->getLHS().getDuUdMapKey().setTemporary();
    // set rhs
    // counter
    Argument* theUse_p=new Argument(false); // no algorithm
    theUse_p->setId("2");
    theVariableSymbolReference_p=new VariableSymbolReference(*theIntegerSymbol_p,theBasicBlock_r.getScope());
    theVariableSymbolReference_p->setId("1");
    theVariableSymbolReference_p->setAnnotation("xaifBoosterControlFlowReversal::ReversibleControlFlowGraph::insert_increment_integer(counter)");
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

  const Symbol* ReversibleControlFlowGraph::insert_init_integer(int value, 
								BasicBlock& theBasicBlock_r) {
    // not active, no algorithm
    Assignment* theAssignment_p=new Assignment(false);
    theAssignment_p->setId(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().
							     getCallGraphAlgBase()).getAlgorithmSignature() + "init");
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

  void ReversibleControlFlowGraph::insert_push_integer(const Symbol* theIntegerSymbol_p, 
						       BasicBlock& theBasicBlock_r) {
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theInlinableSubroutineCall_p = new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_i");
    theInlinableSubroutineCall_p->setId(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().
									  getCallGraphAlgBase()).getAlgorithmSignature() + "push_i");
    Variable theSubstitutionArgument;
    VariableSymbolReference* theVariableSymbolReference_p=new VariableSymbolReference(*theIntegerSymbol_p,theBasicBlock_r.getScope());
    theVariableSymbolReference_p->setId("1");
    theVariableSymbolReference_p->setAnnotation("xaifBoosterControlFlowReversal::ReversibleControlFlowGraph::insert_push_integer");
    theSubstitutionArgument.supplyAndAddVertexInstance(*theVariableSymbolReference_p);
    theSubstitutionArgument.getAliasMapKey().setTemporary();
    theSubstitutionArgument.getDuUdMapKey().setTemporary();
    theSubstitutionArgument.copyMyselfInto(theInlinableSubroutineCall_p->addConcreteArgument(1).getArgument().getVariable());
    theBasicBlock_r.supplyAndAddBasicBlockElementInstance(*theInlinableSubroutineCall_p);
  }

  const Symbol& ReversibleControlFlowGraph::insert_pop_integer(BasicBlock& theBasicBlock_r) {
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theInlinableSubroutineCall_p = new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("pop_i");
    theInlinableSubroutineCall_p->setId(dynamic_cast<const CallGraphAlg&>(ConceptuallyStaticInstances::instance()->getCallGraph().
									  getCallGraphAlgBase()).getAlgorithmSignature() + "pop_i");
    Variable theSubstitutionArgument;
    Symbol* theIntegerSymbol_p= new Symbol(theBasicBlock_r.getScope().getSymbolTable().
					   addUniqueAuxSymbol(SymbolKind::VARIABLE,SymbolType::INTEGER_STYPE,SymbolShape::SCALAR,false));
    VariableSymbolReference* theVariableSymbolReference_p=new VariableSymbolReference(*theIntegerSymbol_p,theBasicBlock_r.getScope());
    theVariableSymbolReference_p->setId("1");
    theVariableSymbolReference_p->setAnnotation("xaifBoosterControlFlowReversal::ReversibleControlFlowGraph::insert_pop_integer");
    theSubstitutionArgument.supplyAndAddVertexInstance(*theVariableSymbolReference_p);
    theSubstitutionArgument.getAliasMapKey().setTemporary();
    theSubstitutionArgument.getDuUdMapKey().setTemporary();
    theSubstitutionArgument.copyMyselfInto(theInlinableSubroutineCall_p->addConcreteArgument(1).getArgument().getVariable());
    theBasicBlock_r.supplyAndAddBasicBlockElementInstance(*theInlinableSubroutineCall_p);
    return *theIntegerSymbol_p;
  }

  void 
  ReversibleControlFlowGraph::storeControlFlow() {
    std::stack<const Symbol*> theLoopCounterSymbolStack_r;
    std::list<ReversibleControlFlowGraphVertex*>::iterator the_mySortedVertices_p_l_it;
    for (the_mySortedVertices_p_l_it=mySortedVertices_p_l.begin(); 
	 the_mySortedVertices_p_l_it!=mySortedVertices_p_l.end(); 
	 ++the_mySortedVertices_p_l_it) {
      if ((*the_mySortedVertices_p_l_it)->getReversalType()==ForLoopReversalType::ANONYMOUS) { 
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
	  for (ieilIt=ieil.begin();ieilIt!=ieil.end();++ieilIt,branch_idx++) {
	    ReversibleControlFlowGraphVertex& theSource_r(getSourceOf(*(*ieilIt)));
	    BasicBlock& theBasicBlock_r(insert_basic_block(theSource_r,getTargetOf(*(*ieilIt)),(*(*ieilIt)),true));
	    theBasicBlock_r.setId(std::string("_aug_")+makeUniqueVertexId());
	    const Symbol* theLhsSymbol;
	    if (ieil.size()==2) {
	      // this is a true if-then-else
	      if ((*(*ieilIt)).hasRevConditionValue())
		theLhsSymbol=insert_init_integer(1,theBasicBlock_r);
	      else 
		theLhsSymbol=insert_init_integer(0,theBasicBlock_r);
	    }
	    else { 
	      // this is a switch, all of them should have a value assigned now
	      if ((*(*ieilIt)).hasRevConditionValue())
		theLhsSymbol=insert_init_integer((*(*ieilIt)).getRevConditionValue(),theBasicBlock_r);
	      else
		THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraph::storeControlFlow: switch branch exit without condition value");
	    }
	    insert_push_integer(theLhsSymbol,theBasicBlock_r);
	    removeAndDeleteEdge(*(*ieilIt));
	  }
	  break;
	}
	default : break;
	}
      }
      else { // this is an EXPLICIT vertex reversal
	if ((*the_mySortedVertices_p_l_it)->getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::BASICBLOCK) { 
	  BasicBlockAlg& aBasicBlockAlg(dynamic_cast<BasicBlockAlg&>((*the_mySortedVertices_p_l_it)->getOriginalControlFlowGraphVertexAlg()));
	  aBasicBlockAlg.setReversalType((*the_mySortedVertices_p_l_it)->getReversalType());
	} 
      } 
    } 
  } 

  void ReversibleControlFlowGraph::initVisit() {
    ReversibleControlFlowGraph::VertexIteratorPair p(vertices());
    ReversibleControlFlowGraph::VertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt) (*beginIt).setVisited(false);
  }

  void ReversibleControlFlowGraph::clearIndeces() {
    ReversibleControlFlowGraph::VertexIteratorPair p(vertices());
    ReversibleControlFlowGraph::VertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt) { 
      (*beginIt).setIndex(0);
      (*beginIt).setReversalType(ForLoopReversalType::ANONYMOUS);
    }
  }

  const ReversibleControlFlowGraphEdge& ReversibleControlFlowGraph::find_corresponding_branch_entry_edge_rec(const ReversibleControlFlowGraphEdge& theCurrentEdge_r, 
													     int& nesting_depth) const {
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
      if (getSourceOf(*beginItie).isOriginal()&&getSourceOf(*beginItie).getOriginalControlFlowGraphVertexAlg().getKind()
	  ==
	  ControlFlowGraphVertexAlg::ENDLOOP) 
	continue;
      return find_corresponding_branch_entry_edge_rec(*beginItie, nesting_depth);
    }
    // should never get here, just to calm the compiler...
    return find_corresponding_branch_entry_edge_rec(theCurrentEdge_r, nesting_depth);
  }

  /* 
     The branch entry edges are marked by hasConditionValue()==true and
     a corresponding integer getConditionValue().
     This information is projected onto the branch exit edges.
  */
  void ReversibleControlFlowGraph::markBranchExitEdges() {
    ReversibleControlFlowGraph::VertexIteratorPair p(vertices());
    ReversibleControlFlowGraph::VertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt) { 
      if ((*beginIt).isOriginal()&&(*beginIt).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::ENDBRANCH) {
        InEdgeIteratorPair pie(getInEdgesOf(*beginIt));
        InEdgeIterator beginItie(pie.first),endItie(pie.second);
	int branchIdx=1;
        for (;beginItie!=endItie ;++beginItie,branchIdx++) {
          int nesting_depth=0; 
          const ReversibleControlFlowGraphEdge& theEntryEdge_cr(find_corresponding_branch_entry_edge_rec((*beginItie),nesting_depth));
	  if (numInEdgesOf(*beginIt)==2) { 
	    // this is a if-then-else branch
	    if (theEntryEdge_cr.hasConditionValue())
	      (*beginItie).setRevConditionValue(theEntryEdge_cr.getConditionValue());
	  }
	  else { 
	    (*beginItie).setRevConditionValue(branchIdx);
	  } 
        }
      }
    }
  }

  const ReversibleControlFlowGraphEdge& ReversibleControlFlowGraph::find_corresponding_branch_exit_edge_rec(const ReversibleControlFlowGraphEdge& theCurrentEdge_r, 
													    int& nesting_depth) const {
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
          (*beginItie).hasConditionValue()) continue;
      return find_corresponding_branch_exit_edge_rec(*beginItie, nesting_depth);
    }
    // should never get here, just to calm the compiler...
    return find_corresponding_branch_exit_edge_rec(theCurrentEdge_r, nesting_depth);
  }

//   /*
//     Assuming that the branch exit edges are marked by hasConditionValue()==
//     true and a corresponding integer getConditionValue() this information is 
//     projected onto the branch entry edges.
//   */
//   void
//   ReversibleControlFlowGraph::markBranchEntryEdges() {
//     ReversibleControlFlowGraph::VertexIteratorPair p(vertices());
//     ReversibleControlFlowGraph::VertexIterator beginIt(p.first),endIt(p.second);   
//     for (;beginIt!=endIt ;++beginIt) { 
//       if (!((*beginIt).isOriginal())&&(*beginIt).getNewControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::BRANCH) {
//         OutEdgeIteratorPair pie(getOutEdgesOf(*beginIt));
//         OutEdgeIterator beginItie(pie.first),endItie(pie.second);
//         for (;beginItie!=endItie ;++beginItie) {
//           int nesting_depth=0;
//           const ReversibleControlFlowGraphEdge& theExitEdge_cr(find_corresponding_branch_exit_edge_rec((*beginItie),nesting_depth));
// 	  if(theExitEdge_cr.hasConditionValue())
// 	    (*beginItie).setConditionValue(theExitEdge_cr.getConditionValue());
//         }
//       }
//     }
//   }

  /**
   * assign index to current vertex and call on successors
   */
  void
  ReversibleControlFlowGraph::topologicalSortRecursively(ReversibleControlFlowGraphVertex& theCurrentVertex_r, 
							 int& idx,
							 std::stack<ReversibleControlFlowGraphVertex*>& endNodes_p_s_r, 
							 ForLoopReversalType::ForLoopReversalType_E aReversalType) {
    if (theCurrentVertex_r.getVisited()) return;
    theCurrentVertex_r.setVisited(true);
    // push current node to stack if ENDBRANCH and return
    if (theCurrentVertex_r.getKind()==ControlFlowGraphVertexAlg::ENDBRANCH) {
      endNodes_p_s_r.push(&theCurrentVertex_r);
      return;
    } 
    // set index of current node and increment
    theCurrentVertex_r.setIndex(idx++);
    theCurrentVertex_r.setReversalType(aReversalType);
    mySortedVertices_p_l.push_back(&theCurrentVertex_r);
    // return if ENDLOOP
    if (theCurrentVertex_r.getKind()==ControlFlowGraphVertexAlg::ENDLOOP) { 
      // the end loop should have exactly one out edge to the loop node:
      if (numOutEdgesOf(theCurrentVertex_r)>1) 
	THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraph::topologicalSortRecursively: ENDLOOP with more than 1 out edge");
      ReversibleControlFlowGraphVertex& theCounterPart(getTargetOf(*(getOutEdgesOf(theCurrentVertex_r).first)));
      theCounterPart.setCounterPart(theCurrentVertex_r);
      theCurrentVertex_r.setCounterPart(theCounterPart);
      return;
    }
    // for loops make sure that loop body is tranversed first
    if (theCurrentVertex_r.getKind()==ControlFlowGraphVertexAlg::PRELOOP||theCurrentVertex_r.getKind()==ControlFlowGraphVertexAlg::FORLOOP) {
      ForLoopReversalType::ForLoopReversalType_E aNewReversalType(aReversalType);
      // we only require explicit reversal to be specified at the top loop 
      // construct and have to hand it down to all sub graphs
      if (theCurrentVertex_r.getKind()==ControlFlowGraphVertexAlg::FORLOOP 
	  && 
	  dynamic_cast<const ForLoop&>(theCurrentVertex_r.getOriginalVertex()).getReversalType()==ForLoopReversalType::EXPLICIT)
	aNewReversalType=ForLoopReversalType::EXPLICIT;
      // reset the reversal type
      theCurrentVertex_r.setReversalType(aNewReversalType);
      OutEdgeIteratorPair theCurrentVertex_oeip(getOutEdgesOf(theCurrentVertex_r));
      // sort loop body
      OutEdgeIterator begin_oei_toLoopBody(theCurrentVertex_oeip.first),end_oei_toLoopBody(theCurrentVertex_oeip.second);
      for (;begin_oei_toLoopBody!=end_oei_toLoopBody;++begin_oei_toLoopBody) 
        if ((*begin_oei_toLoopBody).leadsToLoopBody()) 
          topologicalSortRecursively(getTargetOf(*begin_oei_toLoopBody),idx,endNodes_p_s_r,aNewReversalType); 
      // sort nodes after loop
      OutEdgeIterator begin_oei_toAfterLoop(theCurrentVertex_oeip.first),end_oei_toAfterLoop(theCurrentVertex_oeip.second);
      for (;begin_oei_toAfterLoop!=end_oei_toAfterLoop;++begin_oei_toAfterLoop) 
        if (!(*begin_oei_toAfterLoop).leadsToLoopBody()) 
          topologicalSortRecursively(getTargetOf(*begin_oei_toAfterLoop),idx,endNodes_p_s_r,aReversalType); 
    }
    else { // go for all successors otherwise
      OutEdgeIteratorPair theCurrentVertex_oeip(getOutEdgesOf(theCurrentVertex_r));
      OutEdgeIterator begin_oei(theCurrentVertex_oeip.first),end_oei(theCurrentVertex_oeip.second);
      for (;begin_oei!=end_oei;++begin_oei) 
        topologicalSortRecursively(getTargetOf(*begin_oei),idx,endNodes_p_s_r,aReversalType); 
    }
    // if branch node then handle corresponding end node
    if (theCurrentVertex_r.getKind()==ControlFlowGraphVertexAlg::BRANCH) {
      ReversibleControlFlowGraphVertex* the_endBranch_p=endNodes_p_s_r.top();
      endNodes_p_s_r.pop();
      the_endBranch_p->setIndex(idx++);
      the_endBranch_p->setReversalType(aReversalType);
      the_endBranch_p->setCounterPart(theCurrentVertex_r);
      theCurrentVertex_r.setCounterPart(*the_endBranch_p);
      mySortedVertices_p_l.push_back(the_endBranch_p);
      // sort successor  
      OutEdgeIteratorPair theCurrentVertex_oeip(getOutEdgesOf(*(the_endBranch_p)));
      topologicalSortRecursively(getTargetOf(*(theCurrentVertex_oeip.first)),idx,endNodes_p_s_r,aReversalType); 
    }
  }

  void ReversibleControlFlowGraph::topologicalSort() {
    initVisit();
    clearIndeces();
    mySortedVertices_p_l.clear();
    int idx=1;
    std::stack<ReversibleControlFlowGraphVertex*> endNodes_p_s;
    topologicalSortRecursively(getEntry(),idx,endNodes_p_s, ForLoopReversalType::ANONYMOUS);
  }

  /*
    Insert edge from theAdjointSource_cr to theAdjointTarget_cr.
    Return reference to the newly created ReversibleControlFlowGraphEdge.
  */
  ReversibleControlFlowGraphEdge&
  ReversibleControlFlowGraph::insertAdjointControlFlowGraphEdge(ReversibleControlFlowGraph& theAdjointControlFlowGraph_r, const ReversibleControlFlowGraphVertex& theAdjointSource_cr, const ReversibleControlFlowGraphVertex& theAdjointTarget_cr) {
    ReversibleControlFlowGraphEdge* aNewReversibleControlFlowGraphEdge_p=new ReversibleControlFlowGraphEdge();
    aNewReversibleControlFlowGraphEdge_p->setId(theAdjointControlFlowGraph_r.makeUniqueEdgeId());
    theAdjointControlFlowGraph_r.supplyAndAddEdgeInstance(*aNewReversibleControlFlowGraphEdge_p,theAdjointSource_cr,theAdjointTarget_cr);
    return *aNewReversibleControlFlowGraphEdge_p;
  }


  class ReversibleControlFlowGraphVertexLabelWriter {
  public:
    ReversibleControlFlowGraphVertexLabelWriter(const ReversibleControlFlowGraph& g) : myG(g) {};
    template <class BoostIntenalVertexDescriptor>
    void operator()(std::ostream& out, const BoostIntenalVertexDescriptor& v) const {
      ReversibleControlFlowGraphVertex* theReversibleControlFlowGraphVertex_p=boost::get(boost::get(BoostVertexContentType(),myG.getInternalBoostGraph()),v);
      std::string theVertexKind;
      std::string theXaifId;
      if (theReversibleControlFlowGraphVertex_p->isOriginal()) {
	const ControlFlowGraphVertexAlg& va(dynamic_cast<const ControlFlowGraphVertexAlg&>(theReversibleControlFlowGraphVertex_p->getOriginalVertex().getControlFlowGraphVertexAlgBase()));
        theVertexKind=va.kindToString();
	const ControlFlowGraphVertex& v(dynamic_cast<const ControlFlowGraphVertex&>(theReversibleControlFlowGraphVertex_p->getOriginalVertex()));
        theXaifId=v.getId();
        
      }
      else {
	const ControlFlowGraphVertexAlg& va(dynamic_cast<const ControlFlowGraphVertexAlg&>(theReversibleControlFlowGraphVertex_p->getNewVertex().getControlFlowGraphVertexAlgBase()));
        theVertexKind=va.kindToString();
	const ControlFlowGraphVertex& v(dynamic_cast<const ControlFlowGraphVertex&>(theReversibleControlFlowGraphVertex_p->getNewVertex()));
        theXaifId=v.getId();
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

  class ReversibleControlFlowGraphEdgeLabelWriter {
  public:
    ReversibleControlFlowGraphEdgeLabelWriter(const ReversibleControlFlowGraph& g) : myG(g) {};
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

  ReversibleControlFlowGraphEdge&
  ReversibleControlFlowGraph::addAdjointControlFlowGraphEdge(ReversibleControlFlowGraph& theAdjointControlFlowGraph_r, 
							     const ReversibleControlFlowGraphEdge& theOriginalEdge_cr, 
							     const std::list<std::pair<ReversibleControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> >& theVertexCorrespondence_ppl) {
    std::list<std::pair<ReversibleControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> >::const_iterator theVertexCorrespondence_ppl_cit;
    // source and target of adjoint edge to be inserted
    // source is fixed, target depends on kind of original source
    ReversibleControlFlowGraphVertex *theAdjointSource_p, *theAdjointTarget_p;
    // initialize source and target of adjoint edge to be inserted
    bool foundAdjointSource=false;
    bool foundAdjointTarget=false;
    for (theVertexCorrespondence_ppl_cit=theVertexCorrespondence_ppl.begin();
	 theVertexCorrespondence_ppl_cit!=theVertexCorrespondence_ppl.end()
	   &&
	   !(foundAdjointSource&&foundAdjointTarget);
	 theVertexCorrespondence_ppl_cit++) {
      if ((*theVertexCorrespondence_ppl_cit).first==&getTargetOf(theOriginalEdge_cr)) {
        theAdjointSource_p=(*theVertexCorrespondence_ppl_cit).second; 
        foundAdjointSource=true;
      } 
      if ((*theVertexCorrespondence_ppl_cit).first==&getSourceOf(theOriginalEdge_cr)) {
	theAdjointTarget_p=(*theVertexCorrespondence_ppl_cit).second; 
        foundAdjointTarget=true;
      }
    }
    // if this is the original  edge from a loop  vertex to loop construct successor, i.e. not the loop body
    // reset the target to the corresponding  adjoint FORLOOP
    // this is because the FORLOOP turns into an ENDLOOP but that is not the target of the successor in the 
    // reverse.
    if ((getSourceOf(theOriginalEdge_cr).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::FORLOOP
	 ||
	 getSourceOf(theOriginalEdge_cr).getOriginalControlFlowGraphVertexAlg().getKind()==ControlFlowGraphVertexAlg::PRELOOP)
	&&
	!theOriginalEdge_cr.hasConditionValue()) {
      // the original ENDLOOP vertex that matches the original LOOP vertex is the counterPart
      ReversibleControlFlowGraphVertex& theOriginalEndLoop=getSourceOf(theOriginalEdge_cr).getCounterPart();
      // find the adjoint FORLOOP node that corresponds to original ENDLOOP node
      for (theVertexCorrespondence_ppl_cit=theVertexCorrespondence_ppl.begin();
	   theVertexCorrespondence_ppl_cit!=theVertexCorrespondence_ppl.end();
	   ++theVertexCorrespondence_ppl_cit) {
	if ((*theVertexCorrespondence_ppl_cit).first==&theOriginalEndLoop) {
	  theAdjointTarget_p=(*theVertexCorrespondence_ppl_cit).second; 
	  break;
	}
      }
    }
    // insert edge from *theAdjointSource_p to *theAdjointTarget_p
    ReversibleControlFlowGraphEdge& theNewReversibleControlFlowGraphEdge_r(insertAdjointControlFlowGraphEdge(theAdjointControlFlowGraph_r,
													     *theAdjointSource_p,
													     *theAdjointTarget_p));
    // this gives us values on edges that normally don't have conditions but these values 
    // are needed for the branch matches:
    if (theOriginalEdge_cr.hasRevConditionValue())
      theNewReversibleControlFlowGraphEdge_r.setConditionValue(theOriginalEdge_cr.getRevConditionValue());
    //     if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {     
    //       GraphVizDisplay::show(theAdjointControlFlowGraph_r,
    // 			    "adjoint_edge_insert", 
    // 			    ReversibleControlFlowGraphVertexLabelWriter(theAdjointControlFlowGraph_r),
    // 			    ReversibleControlFlowGraphEdgeLabelWriter(theAdjointControlFlowGraph_r));
    //     }
    return theNewReversibleControlFlowGraphEdge_r;
  }

  /*
    Construct the adjoint control flow graph from this graph
  */
  void
  ReversibleControlFlowGraph::buildAdjointControlFlowGraph(ReversibleControlFlowGraph& theAdjointControlFlowGraph_r) {
    std::list<std::pair<ReversibleControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> > theVertexCorrespondence_ppl;
    std::list<ReversibleControlFlowGraphVertex*>::reverse_iterator the_mySortedVertices_p_l_rit;
    for (the_mySortedVertices_p_l_rit=mySortedVertices_p_l.rbegin(); 
	 the_mySortedVertices_p_l_rit!=mySortedVertices_p_l.rend(); 
	 ++the_mySortedVertices_p_l_rit) {
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
	BasicBlockAlg& aBasicBlockAlg(dynamic_cast<BasicBlockAlg&>((*the_mySortedVertices_p_l_rit)->getOriginalControlFlowGraphVertexAlg()));
	aBasicBlockAlg.setReversalType((*the_mySortedVertices_p_l_rit)->getReversalType());
	theReversibleControlFlowGraphVertex_p=
	  theAdjointControlFlowGraph_r.old_basic_block(dynamic_cast<const BasicBlock&>(aBasicBlockAlg.BasicBlockAlgBase::getContaining()));
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
	theReversibleControlFlowGraphVertex_p=theAdjointControlFlowGraph_r.new_forloop((*the_mySortedVertices_p_l_rit)->getReversalType());
	theReversibleControlFlowGraphVertex_p->getNewVertex().setId(std::string("_adj_")+makeUniqueVertexId());
	break;
      }
      default: 
	THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraph::buildAdjointControlFlowGraph: missing logic to handle ControlFlowGraphVertex of kind "
				   << ControlFlowGraphVertexAlg::kindToString((*the_mySortedVertices_p_l_rit)->getOriginalControlFlowGraphVertexAlg().getKind()).c_str());
	break;
      }
      theVertexCorrespondence_ppl.push_back(std::make_pair(*the_mySortedVertices_p_l_rit,theReversibleControlFlowGraphVertex_p)); 
      DBG_MACRO(DbgGroup::DATA, "copying data for index " 
		<< (*the_mySortedVertices_p_l_rit)->getIndex()
		<< " and type "
		<< (*the_mySortedVertices_p_l_rit)->getReversalType());
      theReversibleControlFlowGraphVertex_p->setAdjointIndex((*the_mySortedVertices_p_l_rit)->getIndex());
      theReversibleControlFlowGraphVertex_p->setReversalType((*the_mySortedVertices_p_l_rit)->getReversalType());
    }
    // add reversed edges
    std::list<std::pair<ReversibleControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> >::const_iterator theVertexCorrespondence_ppl_cit;
    for (theVertexCorrespondence_ppl_cit=theVertexCorrespondence_ppl.begin();
	 theVertexCorrespondence_ppl_cit!=theVertexCorrespondence_ppl.end();
	 ++theVertexCorrespondence_ppl_cit) {
      // we switch on the kind of the *adjoint* vertices:
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
	if ((*theVertexCorrespondence_ppl_cit).second->getReversalType()==ForLoopReversalType::ANONYMOUS) { 
	  // insert pop() in front
	  InEdgeIteratorPair singleInEdge_ieitp(getInEdgesOf(*((*theVertexCorrespondence_ppl_cit).second)));
	  BasicBlock& theNewBasicBlock_r(theAdjointControlFlowGraph_r.insert_basic_block(getSourceOf(*(singleInEdge_ieitp.first)),
											 *((*theVertexCorrespondence_ppl_cit).second),
											 *(singleInEdge_ieitp.first),
											 false));
	  theNewBasicBlock_r.setId(std::string("_adj_")+makeUniqueVertexId());
	  removeAndDeleteEdge(*(singleInEdge_ieitp.first));
	  const Symbol& thePoppedIntegerSymbol_cr(theAdjointControlFlowGraph_r.insert_pop_integer(theNewBasicBlock_r));
	  // add thePoppedIntegerSymbol_cr to branch condition as select value
	  Expression& theSelectExpression_r(dynamic_cast<Branch&>((*theVertexCorrespondence_ppl_cit).second->getNewVertex()).getCondition().getExpression());
	  Argument* theArgument_p=new Argument();
	  theArgument_p->setId("1");
	  theSelectExpression_r.supplyAndAddVertexInstance(*theArgument_p);  
	  theArgument_p->getVariable().getAliasMapKey().setTemporary();
	  theArgument_p->getVariable().getDuUdMapKey().setTemporary();
	  VariableSymbolReference* theSelectVariableSymbolReference_p=new VariableSymbolReference(thePoppedIntegerSymbol_cr,theNewBasicBlock_r.getScope());
	  theArgument_p->getVariable().supplyAndAddVertexInstance(*theSelectVariableSymbolReference_p);
	  theSelectVariableSymbolReference_p->setId("1");
	  theSelectVariableSymbolReference_p->setAnnotation("xaifBoosterControlFlowReversal::ReversibleControlFlowGraph::buildAdjointControlFlowGraph(BRANCH)");
	} 
	else { // explicit reversal
	  // maintain the original condition.
	  // this is the adjoint of the ENDBRANCH, i.e. we need to go to the 
	  // counterpart of the original vertex
	  // retrieve the condition expression of the new vertex:
	  Expression& theConditionExpression(dynamic_cast<Branch&>((*theVertexCorrespondence_ppl_cit).second->
								   getNewVertex()).getCondition().getExpression());
	  dynamic_cast<const Branch&>((*theVertexCorrespondence_ppl_cit).first->getCounterPart().getOriginalVertex()).
	    getCondition().getExpression().copyMyselfInto(theConditionExpression,false,false);
	}
	// insert adjoint edges
	InEdgeIteratorPair ieitp(getInEdgesOf(*((*theVertexCorrespondence_ppl_cit).first)));
	InEdgeIterator begin_ieit(ieitp.first),end_ieit(ieitp.second);
	for (;begin_ieit!=end_ieit ; ++begin_ieit) 
	  addAdjointControlFlowGraphEdge(theAdjointControlFlowGraph_r,*begin_ieit,theVertexCorrespondence_ppl);
	break;
      }
      case ControlFlowGraphVertexAlg::FORLOOP : {
	if ((*theVertexCorrespondence_ppl_cit).second->getReversalType()==ForLoopReversalType::ANONYMOUS) { 
// 	  if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {     
// 	    GraphVizDisplay::show(theAdjointControlFlowGraph_r,
// 				  "adjoint_beforeEntryMark", 
// 				  ReversibleControlFlowGraphVertexLabelWriter(theAdjointControlFlowGraph_r),
// 				  ReversibleControlFlowGraphEdgeLabelWriter(theAdjointControlFlowGraph_r));
// 	  }
	  // insert pop() in front
	  InEdgeIteratorPair singleInEdge_ieitp(getInEdgesOf(*((*theVertexCorrespondence_ppl_cit).second)));
	  if (singleInEdge_ieitp.first==singleInEdge_ieitp.second) { 
	    THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraph::buildAdjointControlFlowGraph: bad CFG (likely not well structured)");
//  	    GraphVizDisplay::show(theAdjointControlFlowGraph_r,
//  				  "adjoint_beforeEntryMark", 
//  				  ReversibleControlFlowGraphVertexLabelWriter(theAdjointControlFlowGraph_r),
//  				  ReversibleControlFlowGraphEdgeLabelWriter(theAdjointControlFlowGraph_r));
	  }
	  BasicBlock& theNewBasicBlock_r(theAdjointControlFlowGraph_r.insert_basic_block(getSourceOf(*(singleInEdge_ieitp.first)),*((*theVertexCorrespondence_ppl_cit).second),*(singleInEdge_ieitp.first),false));
	  theNewBasicBlock_r.setId(std::string("_adj_")+makeUniqueVertexId());
	  removeAndDeleteEdge(*(singleInEdge_ieitp.first));
	  const Symbol& thePoppedIntegerSymbol_cr(theAdjointControlFlowGraph_r.insert_pop_integer(theNewBasicBlock_r));

	  // fill ForLoop  
	  ForLoop& theForLoop_r(dynamic_cast<ForLoop&>((*theVertexCorrespondence_ppl_cit).second->getNewVertex()));

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
	  theVariableSymbolReference_p->setAnnotation("xaifBoosterControlFlowReversal::ReversibleControlFlowGraph::buildAdjointControlFlowGraph(FORLOOP/COUNTER)");
	  theLoopCounterUse_p->getVariable().supplyAndAddVertexInstance(*theVariableSymbolReference_p);
	  theLoopCounterUse_p->getVariable().getAliasMapKey().setTemporary();
	  theLoopCounterUse_p->getVariable().getDuUdMapKey().setTemporary();
	  theForLoop_r.getCondition().getExpression().supplyAndAddVertexInstance(*theLoopCounterUse_p);
	  // the popped integer symbol
	  Argument* thePoppedIntegerUse_p=new Argument(false); // no algorithm
	  thePoppedIntegerUse_p->setId("3");
	  theVariableSymbolReference_p=new VariableSymbolReference(thePoppedIntegerSymbol_cr,theNewBasicBlock_r.getScope());
	  theVariableSymbolReference_p->setId("1");
	  theVariableSymbolReference_p->setAnnotation("xaifBoosterControlFlowReversal::ReversibleControlFlowGraph::buildAdjointControlFlowGraph(FORLOOP/POP_INTEGER)");
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
	  theVariableSymbolReference_p->setAnnotation("xaifBoosterControlFlowReversal::ReversibleControlFlowGraph::buildAdjointControlFlowGraph(FORLOOP/LHS)");
	  theForLoop_r.getUpdate().getAssignment().getLHS().supplyAndAddVertexInstance(*theVariableSymbolReference_p);
	  theForLoop_r.getUpdate().getAssignment().getLHS().getAliasMapKey().setTemporary();
	  theForLoop_r.getUpdate().getAssignment().getLHS().getDuUdMapKey().setTemporary();

	  // set rhs
	  // counter
	  Argument* theUse_p=new Argument(false); // no algorithm
	  theUse_p->setId("2");
	  theVariableSymbolReference_p=new VariableSymbolReference(*theLoopCounterSymbol_p,theNewBasicBlock_r.getScope());
	  theVariableSymbolReference_p->setId("1");
	  theVariableSymbolReference_p->setAnnotation("xaifBoosterControlFlowReversal::ReversibleControlFlowGraph::buildAdjointControlFlowGraph(FORLOOP/RHS)");
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
          
	} 
	else { // explicit reversal
	  // the old ForLoop is the counter part of the ENDLOOP that is the original to this vertex 
	  const ForLoop& theOldForLoop(dynamic_cast<const ForLoop&>((*theVertexCorrespondence_ppl_cit).first->getCounterPart().getOriginalVertex()));
	  // figure out if we count up or down
	  const Expression& theOldUpdateRHS(theOldForLoop.getUpdate().getAssignment().getRHS());
	  // require simple expression of the form i+c or i-c where c is a constant
	  // needs 3 vertices
	  if (theOldUpdateRHS.numVertices()!=3) 
	    THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraph::buildAdjointControlFlowGraph: an explicit reversal loop update should be of the form i+c or i-c");
	  // find the intrinsic
	  const Intrinsic* theOldUpdateIntrinsic_p(dynamic_cast<const Intrinsic*>(&(theOldUpdateRHS.getMaxVertex())));
	  if (!theOldUpdateIntrinsic_p) { 
	    THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraph::buildAdjointControlFlowGraph: could not find loop update intrinsic");
	  }
	  // what is it?
	  bool countUp=true;
	  if (&(theOldUpdateIntrinsic_p->getInlinableIntrinsicsCatalogueItem())==
	      &(ConceptuallyStaticInstances::instance()->getInlinableIntrinsicsCatalogue().getElement("add_scal_scal"))) 
	    countUp=true;
	  else if (&(theOldUpdateIntrinsic_p->getInlinableIntrinsicsCatalogueItem())==
		   &(ConceptuallyStaticInstances::instance()->getInlinableIntrinsicsCatalogue().getElement("sub_scal_scal"))) 
	    countUp=false;
	  else
	    THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraph::buildAdjointControlFlowGraph: an explicit reversal loop update intrinsic does not match the form i+c or i-c");
	  // initialization depends on the original condition which should be of the form i <operator> c with c as a constant
	  const Expression& theOldCondition(theOldForLoop.getCondition().getExpression());
	  // needs 3 vertices
	  if (theOldCondition.numVertices()!=3) 
	    THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraph::buildAdjointControlFlowGraph: an explicit reversal loop condition should be of the form i <boolean operator> c");
	  // the new ForLoop  
	  ForLoop& theNewForLoop(dynamic_cast<ForLoop&>((*theVertexCorrespondence_ppl_cit).second->getNewVertex()));
	  makeLoopExplicitReversalInitialization(theOldForLoop,
						 theNewForLoop,
						 countUp);
	  makeLoopExplicitReversalCondition(theOldForLoop,
					    theNewForLoop,
					    countUp);
	  makeLoopExplicitReversalUpdate(theOldForLoop,
					 theNewForLoop,
					 countUp);
	}
	// insert adjoint edges
	InEdgeIteratorPair theEndLoop_ieitp(getInEdgesOf(*((*theVertexCorrespondence_ppl_cit).first)));
	ReversibleControlFlowGraphEdge& theNewReversibleControlFlowGraphEdge_r(addAdjointControlFlowGraphEdge(theAdjointControlFlowGraph_r,*(theEndLoop_ieitp.first),theVertexCorrespondence_ppl));
	// set condition value to true because this is a loop body entry edge
	theNewReversibleControlFlowGraphEdge_r.setConditionValue(1);

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
	// Insert back-edge from this adjoint ENDLOOP to the matching adjoint FORLOOP vertex.
	// The original vertex corresponding to this adjoint ENDLOOP is a LOOP. 
	// We need to find the adjoint vertex corresponding to the
	// original ENDLOOP counterPart. 
	// find adjoint target as the adjoint to the counterpart
	ReversibleControlFlowGraphVertex* theAdjointTarget_p(0);
	ReversibleControlFlowGraphVertex& theOriginalEndLoop((*theVertexCorrespondence_ppl_cit).first->getCounterPart());
	for (std::list<std::pair<ReversibleControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> >::const_iterator theVertexCorrespondence_ppl_cit_1=theVertexCorrespondence_ppl.begin();
	     theVertexCorrespondence_ppl_cit_1!=theVertexCorrespondence_ppl.end();
	     theVertexCorrespondence_ppl_cit_1++) { 
	  if ((*theVertexCorrespondence_ppl_cit_1).first==&theOriginalEndLoop) {
	    theAdjointTarget_p=(*theVertexCorrespondence_ppl_cit_1).second; 
	    break;
	  } 
	}
	if (!theAdjointTarget_p)
	  THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraph::buildAdjointControlFlowGraph: adjoint ENDLOOP counterpart not found");
	insertAdjointControlFlowGraphEdge(theAdjointControlFlowGraph_r,
					  *(*theVertexCorrespondence_ppl_cit).second,
					  *theAdjointTarget_p);
	break;
      }
      case ControlFlowGraphVertexAlg::EXIT : 
	// do nothing
	break;
      default: 
	THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraph::buildAdjointControlFlowGraph: missing logic to handle ControlFlowGraphVertex of kind "
				   << ControlFlowGraphVertexAlg::kindToString((*theVertexCorrespondence_ppl_cit).second->getKind()).c_str());
	break; 
      }
    }
//     if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {     
//       GraphVizDisplay::show(theAdjointControlFlowGraph_r,
//      			    "adjoint_beforeEntryMark", 
//      			    ReversibleControlFlowGraphVertexLabelWriter(theAdjointControlFlowGraph_r),
//      			    ReversibleControlFlowGraphEdgeLabelWriter(theAdjointControlFlowGraph_r));
//     }
//     theAdjointControlFlowGraph_r.markBranchEntryEdges(); 
  }

  void ReversibleControlFlowGraph::printXMLHierarchy(std::ostream& os) const {
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

  void ReversibleControlFlowGraph::makeLoopExplicitReversalInitialization(const ForLoop& theOldForLoop,
									  ForLoop& theNewForLoop,
									  bool countUp) { 
    // some setup 
    const Expression& theOldUpdateRHS(theOldForLoop.getUpdate().getAssignment().getRHS());
    const Intrinsic* theOldUpdateIntrinsic_p(dynamic_cast<const Intrinsic*>(&(theOldUpdateRHS.getMaxVertex())));
    if (!theOldUpdateIntrinsic_p) { 
      THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraph::makeLoopExplicitReversalInitialization: could not find loop update intrinsic");
    }
    const Expression& theOldConditionExpr(theOldForLoop.getCondition().getExpression());
    // find the maximal vertex in the old condition which should be the boolean operation 
    // which determines the behavior
    const ExpressionVertex& theOldConditionMaxVertex(theOldConditionExpr.getMaxVertex());
    // find the BooleanOperation
    const BooleanOperation* theOldConditionBooleanOperation_p(dynamic_cast<const BooleanOperation*>(&theOldConditionMaxVertex));
    if (!theOldUpdateIntrinsic_p) { 
      THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraph::makeLoopExplicitReversalInitialization: could not find loop condition boolean operation");
    }
    // copy the init assignment LHS from the old one
    theOldForLoop.getInitialization().getAssignment().getLHS().copyMyselfInto(theNewForLoop.getInitialization().getAssignment().getLHS());
    // get the new RHS
    Expression& theNewInitializationRHS(theNewForLoop.getInitialization().getAssignment().getRHS());
    // copy the old one into it
    theOldForLoop.getInitialization().getAssignment().getRHS().copyMyselfInto(theNewInitializationRHS, true, false);
    ExpressionVertex& theNewInitMaxVertex(theNewInitializationRHS.getMaxVertex());
    // add the looping amount which is bound plus/minus init divided by update
    // e.g. reverseInit=oldInit+oldUpdate*((oldBound-oldInit)/update)
    Intrinsic* newInitTop_p;
    if (countUp)
      newInitTop_p=new Intrinsic("add_scal_scal");
    else 
      newInitTop_p=new Intrinsic("sub_scal_scal");
    newInitTop_p->setId(theNewInitializationRHS.getNextVertexId());
    theNewInitializationRHS.supplyAndAddVertexInstance(*newInitTop_p);
    // add the edge from the max of the old init to the top
    ExpressionEdge* newEdge_p=new ExpressionEdge(false);
    newEdge_p->setId(theNewInitializationRHS.getNextEdgeId());
    newEdge_p->setPosition(1);
    theNewInitializationRHS.supplyAndAddEdgeInstance(*newEdge_p,theNewInitMaxVertex,*newInitTop_p);
    // the multiplication op
    Intrinsic& aMult(*(new Intrinsic("mul_scal_scal")));
    aMult.setId(theNewInitializationRHS.getNextVertexId());
    theNewInitializationRHS.supplyAndAddVertexInstance(aMult);
    // add an edge from the multiplication to the top
    newEdge_p=new ExpressionEdge(false);
    newEdge_p->setId(theNewInitializationRHS.getNextEdgeId());
    newEdge_p->setPosition(2);
    theNewInitializationRHS.supplyAndAddEdgeInstance(*newEdge_p,aMult,*newInitTop_p);
    // 1st argument to the multiplication is the constant in the old update which we expect to be 
    // the second argument of the top level intrinsic:
    // copy this into the new init
    ExpressionVertex& 
      theTopOftheUpdate(theOldUpdateRHS.copySubExpressionInto(theNewInitializationRHS,
							      theOldUpdateRHS.findPositionalSubExpressionOf(theOldUpdateRHS.getMaxVertex(),2),
							      true,
							      false));
    // make the edge to the multiplication op
    newEdge_p=new ExpressionEdge(false);
    newEdge_p->setId(theNewInitializationRHS.getNextEdgeId());
    newEdge_p->setPosition(1);
    theNewInitializationRHS.supplyAndAddEdgeInstance(*newEdge_p,theTopOftheUpdate,aMult);
    // 2nd argument to the multiplication is the integer division operation
    Intrinsic& aMod(*(new Intrinsic("div_scal_scal")));
    aMod.setId(theNewInitializationRHS.getNextVertexId());
    theNewInitializationRHS.supplyAndAddVertexInstance(aMod);
    // add an edge from the division to the multiplication
    newEdge_p=new ExpressionEdge(false);
    newEdge_p->setId(theNewInitializationRHS.getNextEdgeId());
    newEdge_p->setPosition(2);
    theNewInitializationRHS.supplyAndAddEdgeInstance(*newEdge_p,aMod,aMult);
    // 1st argument to division operation involves initializer and bound
    Intrinsic& aMinus(*(new Intrinsic("sub_scal_scal")));
    aMinus.setId(theNewInitializationRHS.getNextVertexId());
    theNewInitializationRHS.supplyAndAddVertexInstance(aMinus);
    // add an edge from the minus to the division
    newEdge_p=new ExpressionEdge(false);
    newEdge_p->setId(theNewInitializationRHS.getNextEdgeId());
    newEdge_p->setPosition(1);
    theNewInitializationRHS.supplyAndAddEdgeInstance(*newEdge_p,aMinus,aMod);
    // 2nd argument to division operation is the update which we have already
    // add an edge from the update to the division
    newEdge_p=new ExpressionEdge(false);
    newEdge_p->setId(theNewInitializationRHS.getNextEdgeId());
    newEdge_p->setPosition(2);
    theNewInitializationRHS.supplyAndAddEdgeInstance(*newEdge_p,theTopOftheUpdate,aMod);
    // one argument to the minus is the initializer which we have already, the 
    // other the boundary which we expect to be the second argument of the boolean 
    // in the old condition
    // copy this into the new init
    ExpressionVertex& 
      theTopOftheBound(theOldConditionExpr.copySubExpressionInto(theNewInitializationRHS,
								 theOldConditionExpr.findPositionalSubExpressionOf(theOldConditionMaxVertex,
														   2),
								 true,
								 false));
    newEdge_p=new ExpressionEdge(false);
    newEdge_p->setId(theNewInitializationRHS.getNextEdgeId());
    theNewInitializationRHS.supplyAndAddEdgeInstance(*newEdge_p,theTopOftheBound,aMinus);
    if (countUp)
      newEdge_p->setPosition(1);
    else 
      newEdge_p->setPosition(2);
    newEdge_p=new ExpressionEdge(false);
    newEdge_p->setId(theNewInitializationRHS.getNextEdgeId());
    theNewInitializationRHS.supplyAndAddEdgeInstance(*newEdge_p,theTopOftheUpdate,aMinus);
    if (countUp)
      newEdge_p->setPosition(2);
    else 
      newEdge_p->setPosition(1);
    // find out if we need to adjust the initialization
    bool adjustUp=false;
    bool adjustDown=false;
    switch(theOldConditionBooleanOperation_p->getType()) { 
    case BooleanOperationType::LESS_THAN_OTYPE :
      if (countUp)  
	adjustDown=true;
      else
	THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraph::makeLoopExplicitReversalInitialization: loop reversal count down and < condition logic goof up");
      break;
    case BooleanOperationType::NOT_EQUAL_OTYPE :
      if (countUp)  
	adjustDown=true;
      else
	adjustUp=true;
      break;
    case BooleanOperationType::GREATER_THAN_OTYPE :
      if (countUp) { 
	THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraph::makeLoopExplicitReversalInitialization: loop reversal count up and > condition logic goof up");
      }
      else
	adjustDown=true;
      break;
    case BooleanOperationType::LESS_OR_EQUAL_OTYPE: 
      if (!countUp)  
	THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraph::makeLoopExplicitReversalInitialization: loop reversal count down and <= condition logic goof up");
      break;
    case BooleanOperationType::GREATER_OR_EQUAL_OTYPE: 
      if (countUp)  
	THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraph::makeLoopExplicitReversalInitialization: loop reversal count up and >= condition logic goof up");
      break;
    default:
      THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraph::makeLoopExplicitReversalInitialization: don't know what to do with operation "
				 << BooleanOperationType::toString(theOldConditionBooleanOperation_p->getType()));
      break;
    } 
    if (adjustDown || adjustUp) { 
      Constant& theOne(*(new Constant(SymbolType::INTEGER_STYPE,false)));
      theOne.setId(theNewInitializationRHS.getNextVertexId());
      theNewInitializationRHS.supplyAndAddVertexInstance(theOne);
      Intrinsic* theAdjustmentIntrinsic_p;
      if (adjustDown) 
	theAdjustmentIntrinsic_p=new Intrinsic("sub_scal_scal");
      else 
	theAdjustmentIntrinsic_p=new Intrinsic("plus_scal_scal");
      theAdjustmentIntrinsic_p->setId(theNewInitializationRHS.getNextVertexId());
      theNewInitializationRHS.supplyAndAddVertexInstance(*theAdjustmentIntrinsic_p);
      // add the 2 edges
      newEdge_p=new ExpressionEdge(false);
      newEdge_p->setId(theNewInitializationRHS.getNextEdgeId());
      newEdge_p->setPosition(1);
      theNewInitializationRHS.supplyAndAddEdgeInstance(*newEdge_p,*newInitTop_p,*theAdjustmentIntrinsic_p);
      newEdge_p=new ExpressionEdge(false);
      newEdge_p->setId(theNewInitializationRHS.getNextEdgeId());
      newEdge_p->setPosition(2);
      theNewInitializationRHS.supplyAndAddEdgeInstance(*newEdge_p,theOne,*theAdjustmentIntrinsic_p);
    }
  } 

  void ReversibleControlFlowGraph::makeLoopExplicitReversalCondition(const ForLoop& theOldForLoop,
								     ForLoop& theNewForLoop,
								     bool countUp) { 
    // the stop condition is determined by the first argument to the boolean of the old condition, 
    // the old initialization and the up or down count 
    // find the first argument to the boolean
    // copy this into the new condition
    Expression& theNewConditionExpression(theNewForLoop.getCondition().getExpression());
    ExpressionVertex& 
      theTopOfConditionVarRef(theOldForLoop.getCondition().getExpression().
			      copySubExpressionInto(theNewForLoop.getCondition().getExpression(),
						    theOldForLoop.getCondition().getExpression().
						    findPositionalSubExpressionOf(theOldForLoop.getCondition().
										  getExpression().getMaxVertex(),1),
						    true,
						    false));
    // copy the old initialization:
    ExpressionVertex& theTopOftheInit(theOldForLoop.getInitialization().getAssignment().getRHS().
				      copySubExpressionInto(theNewForLoop.getCondition().getExpression(),
							    theOldForLoop.getInitialization().getAssignment().getRHS().getMaxVertex(),
							    true, 
							    false));
    BooleanOperation* theNewBooleanOp_p;
    if(countUp)
      theNewBooleanOp_p=new BooleanOperation(BooleanOperationType::GREATER_OR_EQUAL_OTYPE,false);
    else
      theNewBooleanOp_p=new BooleanOperation(BooleanOperationType::LESS_OR_EQUAL_OTYPE,false);
    theNewBooleanOp_p->setId(theNewForLoop.getCondition().getExpression().getNextVertexId());
    theNewForLoop.getCondition().getExpression().supplyAndAddVertexInstance(*theNewBooleanOp_p);
    // add the 2 edges
    ExpressionEdge* newEdge_p=new ExpressionEdge(false);
    newEdge_p->setId(theNewConditionExpression.getNextEdgeId());
    newEdge_p->setPosition(1);
    theNewConditionExpression.supplyAndAddEdgeInstance(*newEdge_p,theTopOfConditionVarRef,*theNewBooleanOp_p);
    newEdge_p=new ExpressionEdge(false);
    newEdge_p->setId(theNewConditionExpression.getNextEdgeId());
    newEdge_p->setPosition(2);
    theNewConditionExpression.supplyAndAddEdgeInstance(*newEdge_p,theTopOftheInit,*theNewBooleanOp_p);
    // update
    theOldForLoop.getUpdate().getAssignment().getLHS().copyMyselfInto(theNewForLoop.getUpdate().getAssignment().getLHS());
  }

  void ReversibleControlFlowGraph::makeLoopExplicitReversalUpdate(const ForLoop& theOldForLoop,
								  ForLoop& theNewForLoop,
								  bool countUp) { 
    // get the new RHS
    Expression& theNewUpdateRHS(theNewForLoop.getUpdate().getAssignment().getRHS());
    const Expression& theOldUpdateRHS(theOldForLoop.getUpdate().getAssignment().getRHS());
    // copy the old update left operand which we expect to be the varref into the new update
    ExpressionVertex& 
      theTopOftheNewUpdateVarRef(theOldUpdateRHS.copySubExpressionInto(theNewUpdateRHS,
								       theOldUpdateRHS.findPositionalSubExpressionOf(theOldUpdateRHS.getMaxVertex(),1),
								       true,
								       false));
    // copy the right operand which we expect to be the update constant subexpression
    // into the new update
    ExpressionVertex& 
      theTopOftheNewUpdateConstant(theOldUpdateRHS.copySubExpressionInto(theNewUpdateRHS,
									 theOldUpdateRHS.findPositionalSubExpressionOf(theOldUpdateRHS.getMaxVertex(),2),
									 true,
									 false));
    Intrinsic* theNewUpdateOp_p;
    if(countUp)
      theNewUpdateOp_p=new Intrinsic("sub_scal_scal",false);
    else
      theNewUpdateOp_p=new Intrinsic("add_scal_scal",false);
    theNewUpdateOp_p->setId(theNewForLoop.getCondition().getExpression().getNextVertexId());
    theNewUpdateRHS.supplyAndAddVertexInstance(*theNewUpdateOp_p);
    ExpressionEdge* newEdge_p=new ExpressionEdge(false);
    newEdge_p->setId(theNewUpdateRHS.getNextEdgeId());
    newEdge_p->setPosition(1);
    theNewUpdateRHS.supplyAndAddEdgeInstance(*newEdge_p,theTopOftheNewUpdateVarRef,*theNewUpdateOp_p);
    newEdge_p=new ExpressionEdge(false);
    newEdge_p->setId(theNewUpdateRHS.getNextEdgeId());
    newEdge_p->setPosition(2);
    theNewUpdateRHS.supplyAndAddEdgeInstance(*newEdge_p,theTopOftheNewUpdateConstant,*theNewUpdateOp_p);
  }

} // end of namespace

