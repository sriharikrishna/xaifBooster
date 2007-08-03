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
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/ControlFlowGraph.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphAlgFactory.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

namespace xaifBooster { 

  const std::string ControlFlowGraph::ourXAIFName("xaif:ControlFlowGraph");
  const std::string ControlFlowGraph::our_myId_XAIFName("vertex_id");
  const std::string ControlFlowGraph::our_myActiveFlag_XAIFName("active");

  ControlFlowGraph::ControlFlowGraph (const Symbol& theSymbol,
				      const Scope& theScope,
				      const Scope& theCFGScope,
				      const bool activeFlag) :
    ControlFlowGraphCommonAttributes(theSymbol,theScope,theCFGScope),
    myActiveFlag(activeFlag) { 
    myControlFlowGraphAlgBase_p=ControlFlowGraphAlgFactory::instance()->makeNewAlg(*this);
  } 

  ControlFlowGraph::~ControlFlowGraph() { 
    if (myControlFlowGraphAlgBase_p) delete myControlFlowGraphAlgBase_p;
  } 

  void
  ControlFlowGraph::printXMLHierarchy(std::ostream& os) const { 
    if (myControlFlowGraphAlgBase_p
	&& 
	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY)
      getControlFlowGraphAlgBase().printXMLHierarchy(os);
    else
      printXMLHierarchyImpl(os);
  } // end of ControlFlowGraph::printXMLHierarchy

  void
  ControlFlowGraph::printXMLHierarchyImpl(std::ostream& os) const { 
    printXMLHierarchyImpl(os,mySymbolReference);
  }

  void
  ControlFlowGraph::printXMLHierarchyImpl(std::ostream& os,
					  const SymbolReference& anAlternativeSymbolReference) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str() 
       << " ";
    printAttributes(os,anAlternativeSymbolReference);
    os << " " 
       << our_myActiveFlag_XAIFName.c_str() 
       << "=\"" 
       << myActiveFlag
       << "\">" 
       << std::endl;
    myArgumentList.printXMLHierarchy(os);
    myModLocalList.printXMLHierarchy(SideEffectListType::our_ModLocal_XAIFName,
				     os);
    myModList.printXMLHierarchy(SideEffectListType::our_Mod_XAIFName,
				os);
    myReadLocalList.printXMLHierarchy(SideEffectListType::our_ReadLocal_XAIFName,
				      os);
    myReadList.printXMLHierarchy(SideEffectListType::our_Read_XAIFName,
				 os);
    ControlFlowGraph::ConstVertexIteratorPair p(vertices());
    ControlFlowGraph::ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt)
      (*beginIt).printXMLHierarchy(os);
    ControlFlowGraph::ConstEdgeIteratorPair pe=edges();
    ControlFlowGraph::ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte)
      (*beginIte).printXMLHierarchy(os,
				    *this);
    os << pm.indent()
       << "</"
       << ourXAIFName
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of ControlFlowGraph::printXMLHierarchyImpl

  std::string ControlFlowGraph::debug () const { 
    std::ostringstream out;
    out << "ControlFlowGraph[" 
	<< this
	<< ","
	<< ControlFlowGraphCommonAttributes::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  } // end of ControlFlowGraph::debug

  ControlFlowGraphAlgBase&
  ControlFlowGraph::getControlFlowGraphAlgBase() {
    if (!myControlFlowGraphAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraph::getControlFlowGraphAlgBase: not set");
    return *myControlFlowGraphAlgBase_p;
  }
                                                                                
  const ControlFlowGraphAlgBase&
  ControlFlowGraph::getControlFlowGraphAlgBase() const {
    if (!myControlFlowGraphAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraph::getControlFlowGraphAlgBase: not set");
    return *myControlFlowGraphAlgBase_p;
  }

  void ControlFlowGraph::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
    getControlFlowGraphAlgBase().genericTraversal(anAction_c);
    myArgumentList.genericTraversal(anAction_c);
    GraphWrapperTraversable<ControlFlowGraphVertex,ControlFlowGraphEdge>::traverseToChildren(anAction_c);
  }
  
  const bool& 
  ControlFlowGraph::getActiveFlag() const { 
    return myActiveFlag;
  } 

  ArgumentList& 
  ControlFlowGraph::getArgumentList() { 
    return myArgumentList;
  } 
  
  const ArgumentList& 
  ControlFlowGraph::getArgumentList() const { 
    return myArgumentList;
  } 
  
  // non-const return is a temporary hack
  Scope& ControlFlowGraph::getScope() const { 
    return const_cast<Scope&>(myScope);
  }

  // uncomment this when the above is fixed
  // Scope& ControlFlowGraph::getScope() { 
  //   return myArgumentList.getScope();
  // }

  Variable& ControlFlowGraph::addSideEffectReference(SideEffectListType::SideEffectListType_E aType) { 
    return getSideEffectList(aType).addSideEffectReference();
  }

  SideEffectList& ControlFlowGraph::getSideEffectList(SideEffectListType::SideEffectListType_E aType) { 
    SideEffectList* aSideEffectList_p=0;
    switch(aType) { 
    case SideEffectListType::MOD_LIST : 
      aSideEffectList_p=&myModList;
      break;
    case SideEffectListType::MOD_LOCAL_LIST : 
      aSideEffectList_p=&myModLocalList;
      break;
    case SideEffectListType::READ_LIST : 
      aSideEffectList_p=&myReadList;
      break;
    case SideEffectListType::READ_LOCAL_LIST : 
      aSideEffectList_p=&myReadLocalList;
      break;
    default:
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraph::getSideEffectList: unknown list type >" << aType << "<.");
      break;
    }
    return  *aSideEffectList_p;
  }

  const SideEffectList& ControlFlowGraph::getSideEffectList(SideEffectListType::SideEffectListType_E aType) const { 
    const SideEffectList* aSideEffectList_p=0;
    switch(aType) { 
    case SideEffectListType::MOD_LIST : 
      aSideEffectList_p=&myModList;
      break;
    case SideEffectListType::MOD_LOCAL_LIST : 
      aSideEffectList_p=&myModLocalList;
      break;
    case SideEffectListType::READ_LIST : 
      aSideEffectList_p=&myReadList;
      break;
    case SideEffectListType::READ_LOCAL_LIST : 
      aSideEffectList_p=&myReadLocalList;
      break;
    default:
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraph::getSideEffectList: unknown list type >" << aType << "<.");
      break;
    }
    return  *aSideEffectList_p;
  }

  const ControlFlowGraphVertex& ControlFlowGraph::getContainingVertex(const ObjectWithId::Id& aStatementId) const { 
    ControlFlowGraph::ConstVertexIteratorPair p(vertices());
    ControlFlowGraph::ConstVertexIterator beginIt(p.first),endIt(p.second);
    const ControlFlowGraphVertex *aControlFlowGraphVertex_p(0);
    for (;beginIt!=endIt ;++beginIt) { 
      if ((*beginIt).hasStatement(aStatementId)) { 
	if (aControlFlowGraphVertex_p)
	  THROW_LOGICEXCEPTION_MACRO("ControlFlowGraph::getContainingVertex: ambiguous id " << aStatementId.c_str() << " in " <<  getSymbolReference().getSymbol().getId().c_str());
	aControlFlowGraphVertex_p=&(*beginIt);
      }
    }
    if (!aControlFlowGraphVertex_p)  
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraph::getContainingVertex: no id " << aStatementId.c_str() << " in " <<  getSymbolReference().getSymbol().getId().c_str());
    return *aControlFlowGraphVertex_p;
  } 

  void
  ControlFlowGraph::augmentGraphInfoRecursively(ControlFlowGraphVertex& theCurrentVertex_r, 
						int& idx,
						std::stack<ControlFlowGraphVertex*>& endNodes_p_s_r, 
						ForLoopReversalType::ForLoopReversalType_E aReversalType,
						ControlFlowGraphVertex* aTopExplicitLoopVertex_p,
						ControlFlowGraphVertex* enclosingControlFlowVertex_p) {
    if (theCurrentVertex_r.wasVisited()) return;
    theCurrentVertex_r.setVisited();
    // push current node to stack if ENDBRANCH and return
    if (theCurrentVertex_r.getKind()==ControlFlowGraphVertexKind::ENDBRANCH_VKIND) {
      endNodes_p_s_r.push(&theCurrentVertex_r);
      return;
    } 
    // set index of current node and increment
    theCurrentVertex_r.setIndex(idx++);
    // upgrade the reversal type if needed
    if (theCurrentVertex_r.getReversalType()==ForLoopReversalType::ANONYMOUS
	&& 
	aReversalType==ForLoopReversalType::EXPLICIT) 
      theCurrentVertex_r.setReversalType(aReversalType);
    if (aTopExplicitLoopVertex_p)
      theCurrentVertex_r.setTopExplicitLoop(*aTopExplicitLoopVertex_p);
    // return if ENDLOOP
    if (theCurrentVertex_r.getKind()==ControlFlowGraphVertexKind::ENDLOOP_VKIND) { 
      // the end loop should have exactly one out edge to the loop node:
      if (numOutEdgesOf(theCurrentVertex_r)>1) 
	THROW_LOGICEXCEPTION_MACRO("ControlFlowGraph::augmentGraphInfoRecursively: ENDLOOP with more than 1 out edge");
      ControlFlowGraphVertex& theCounterPart(getTargetOf(*(getOutEdgesOf(theCurrentVertex_r).first)));
      theCounterPart.setCounterPart(theCurrentVertex_r);
      theCurrentVertex_r.setCounterPart(theCounterPart);
      theCurrentVertex_r.inheritLoopVariables(theCounterPart);
      if (theCounterPart.hasEnclosingControlFlow())
	theCurrentVertex_r.setEnclosingControlFlow(theCounterPart.getEnclosingControlFlow());
      return;
    }
    if (enclosingControlFlowVertex_p)
      theCurrentVertex_r.setEnclosingControlFlow(*enclosingControlFlowVertex_p);
    inheritLoopVariables(aReversalType,theCurrentVertex_r);
    // for loops make sure that loop body is tranversed first
    if (theCurrentVertex_r.getKind()==ControlFlowGraphVertexKind::PRELOOP_VKIND
	||
	theCurrentVertex_r.getKind()==ControlFlowGraphVertexKind::FORLOOP_VKIND) {
      ControlFlowGraphVertex* aNewEnclosingControlFlowVertex_p=&theCurrentVertex_r;
      ForLoopReversalType::ForLoopReversalType_E aNewReversalType(aReversalType);
      ControlFlowGraphVertex* aNewTopExplicitLoopVertex_p=aTopExplicitLoopVertex_p;
      // we only require explicit reversal to be specified at the top loop 
      // construct and have to hand it down to all sub graphs
      if (theCurrentVertex_r.getKind()==ControlFlowGraphVertexKind::FORLOOP_VKIND 
	  &&
	  theCurrentVertex_r.getReversalType()==ForLoopReversalType::EXPLICIT
	  && 
	  !aNewTopExplicitLoopVertex_p) { 
	aNewReversalType=ForLoopReversalType::EXPLICIT;
	aNewTopExplicitLoopVertex_p=&theCurrentVertex_r;
      }
      // reset the reversal type
      theCurrentVertex_r.setReversalType(aNewReversalType);
      if (aNewTopExplicitLoopVertex_p)
	theCurrentVertex_r.setTopExplicitLoop(*aNewTopExplicitLoopVertex_p);
      if (aNewReversalType==ForLoopReversalType::EXPLICIT) { 
	theCurrentVertex_r.addLoopVariable();
      }
      OutEdgeIteratorPair theCurrentVertex_oeip(getOutEdgesOf(theCurrentVertex_r));
      // sort loop body
      OutEdgeIterator begin_oei_toLoopBody(theCurrentVertex_oeip.first),end_oei_toLoopBody(theCurrentVertex_oeip.second);
      for (;begin_oei_toLoopBody!=end_oei_toLoopBody;++begin_oei_toLoopBody) 
        if ((*begin_oei_toLoopBody).leadsToLoopBody()) 
          augmentGraphInfoRecursively(getTargetOf(*begin_oei_toLoopBody),
				     idx,
				     endNodes_p_s_r,
				     aNewReversalType,
				     aNewTopExplicitLoopVertex_p,
				     aNewEnclosingControlFlowVertex_p); 
      // sort nodes after loop
      OutEdgeIterator begin_oei_toAfterLoop(theCurrentVertex_oeip.first),end_oei_toAfterLoop(theCurrentVertex_oeip.second);
      for (;begin_oei_toAfterLoop!=end_oei_toAfterLoop;++begin_oei_toAfterLoop) 
        if (!(*begin_oei_toAfterLoop).leadsToLoopBody()) 
          augmentGraphInfoRecursively(getTargetOf(*begin_oei_toAfterLoop),
				     idx,
				     endNodes_p_s_r,
				     aReversalType,
				     aTopExplicitLoopVertex_p,
				     enclosingControlFlowVertex_p); 
    }
    else { // go for all successors otherwise
      ControlFlowGraphVertex* aNewEnclosingControlFlowVertex_p=enclosingControlFlowVertex_p;
      if (theCurrentVertex_r.getKind()==ControlFlowGraphVertexKind::BRANCH_VKIND) 
	aNewEnclosingControlFlowVertex_p=&theCurrentVertex_r;
      OutEdgeIteratorPair theCurrentVertex_oeip(getOutEdgesOf(theCurrentVertex_r));
      OutEdgeIterator begin_oei(theCurrentVertex_oeip.first),end_oei(theCurrentVertex_oeip.second);
      for (;begin_oei!=end_oei;++begin_oei) 
        augmentGraphInfoRecursively(getTargetOf(*begin_oei),
				   idx,
				   endNodes_p_s_r,
				   aReversalType,
				   aTopExplicitLoopVertex_p,
				   aNewEnclosingControlFlowVertex_p); 
    }
    // if branch node then handle corresponding end node
    if (theCurrentVertex_r.getKind()==ControlFlowGraphVertexKind::BRANCH_VKIND) {
      ControlFlowGraphVertex* the_endBranch_p=endNodes_p_s_r.top();
      endNodes_p_s_r.pop();
      the_endBranch_p->setIndex(idx++);
      the_endBranch_p->setReversalType(aReversalType);
      the_endBranch_p->setCounterPart(theCurrentVertex_r);
      the_endBranch_p->inheritLoopVariables(theCurrentVertex_r);
      if (aReversalType==ForLoopReversalType::EXPLICIT) { 
	the_endBranch_p->setTopExplicitLoop(theCurrentVertex_r.getTopExplicitLoop());
      }
      if (enclosingControlFlowVertex_p)
	the_endBranch_p->setEnclosingControlFlow(*enclosingControlFlowVertex_p);
      theCurrentVertex_r.setCounterPart(*the_endBranch_p);
      // sort successor  
      OutEdgeIteratorPair theCurrentVertex_oeip(getOutEdgesOf(*(the_endBranch_p)));
      augmentGraphInfoRecursively(getTargetOf(*(theCurrentVertex_oeip.first)),
 				 idx,
 				 endNodes_p_s_r,
 				 aReversalType,
 				 aTopExplicitLoopVertex_p,
				 enclosingControlFlowVertex_p); 
    }
  }

  void ControlFlowGraph::augmentGraphInfo() {
    // do this only for non-null graphs
    if (isNull())
      return; 
    initVisit();
    int idx=1;
    std::stack<ControlFlowGraphVertex*> endNodes_p_s;
    augmentGraphInfoRecursively(getEntry(),idx,endNodes_p_s, ForLoopReversalType::ANONYMOUS,0,0);
    finishVisit();
  }

  void 
  ControlFlowGraph::inheritLoopVariables(ForLoopReversalType::ForLoopReversalType_E aReversalType,
					 ControlFlowGraphVertex& theCurrentVertex_r) { 
    // just ensure the proper logic, i.e. the kind of 
    // vertices we get the inheritance from.
    // this is not intended to be done for the 'end' bits 
    // ENDBRANCH etc. 
    switch (theCurrentVertex_r.getKind()) { 
    case ControlFlowGraphVertexKind::FORLOOP_VKIND: 
    case ControlFlowGraphVertexKind::PRELOOP_VKIND: 
    case ControlFlowGraphVertexKind::BASICBLOCK_VKIND: 
    case ControlFlowGraphVertexKind::BRANCH_VKIND: 
      if ( aReversalType==ForLoopReversalType::EXPLICIT) { 
	// iterate through the in edges
	InEdgeIteratorPair anInEdgeIteratorPair(getInEdgesOf(theCurrentVertex_r));
	InEdgeIterator anInEdgeI(anInEdgeIteratorPair.first),anInEdgeIEnd(anInEdgeIteratorPair.second);
	for (;anInEdgeI!=anInEdgeIEnd;++anInEdgeI) { 
	  if ((theCurrentVertex_r.getKind()==ControlFlowGraphVertexKind::FORLOOP_VKIND 
	       || 
	       theCurrentVertex_r.getKind()==ControlFlowGraphVertexKind::PRELOOP_VKIND)
	      && 
	      getSourceOf(*anInEdgeI).getKind()!=ControlFlowGraphVertexKind::ENDLOOP_VKIND) { 
	    theCurrentVertex_r.inheritLoopVariables(getSourceOf(*anInEdgeI));
	    break;
	  } 
	  else { 
	    // all others that we allow after the switch above should have a single in-edge 
	    // always assuming structured graphs
	    theCurrentVertex_r.inheritLoopVariables(getSourceOf(*anInEdgeI));
	  }
	}
      } 
      break;
    case ControlFlowGraphVertexKind::ENTRY_VKIND: 
    case ControlFlowGraphVertexKind::EXIT_VKIND: 
    case ControlFlowGraphVertexKind::LABEL_VKIND: 
    case ControlFlowGraphVertexKind::GOTO_VKIND: 
      // do nothing
      break;
    default: 
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraph::inheritLoopVariables: cannot use this for "
				 << ControlFlowGraphVertexKind::toString(theCurrentVertex_r.getKind()).c_str());
      break;
    } 
  } 

  ControlFlowGraphVertex& ControlFlowGraph::getEntry()  {
    ControlFlowGraph::VertexIteratorPair p(vertices());
    ControlFlowGraph::VertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt) 
      if ((*beginIt).getKind()==ControlFlowGraphVertexKind::ENTRY_VKIND) 
	return *beginIt;
    THROW_LOGICEXCEPTION_MACRO("Missing ENTRY node in control flow graph"); 
  }

  bool ControlFlowGraph::overwrites(const SymbolReference& theSymbolReference) const { 
    const SideEffectList::VariablePList& theModList(getSideEffectList(SideEffectListType::MOD_LIST).getVariablePList()); 
    for (SideEffectList::VariablePList::const_iterator listI=theModList.begin();
	 listI!=theModList.end();
	 ++listI) {
      if ((*listI)->getVariableSymbolReference().refersToSameSymbolAs(theSymbolReference))
	return true; 
    }
    return false; 
  }

} // end of namespace xaifBooster 
