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

#include "xaifBooster/system/inc/GraphVizDisplay.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/ControlFlowGraph.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphAlgFactory.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/Branch.hpp"
#include "xaifBooster/system/inc/StatementIdSet.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"

namespace xaifBooster { 

  const std::string ControlFlowGraph::ourXAIFName("xaif:ControlFlowGraph");
  const std::string ControlFlowGraph::our_myId_XAIFName("vertex_id");
  const std::string ControlFlowGraph::our_myActiveFlag_XAIFName("active");
  const std::string ControlFlowGraph::our_myStructuredFlag_XAIFName("structured");

  class ControlFlowGraphVertexLabelWriter {
  public:
    ControlFlowGraphVertexLabelWriter(const ControlFlowGraph& g) : myG(g) {}
    template <class BoostIntenalVertexDescriptor>
    void operator()(std::ostream& out, const BoostIntenalVertexDescriptor& v) const {
      ControlFlowGraphVertex* theControlFlowGraphVertex_p=boost::get(boost::get(BoostVertexContentType(),myG.getInternalBoostGraph()),v);
      out << "[label=\"" 
	  << boost::get(boost::get(BoostVertexContentType(), myG.getInternalBoostGraph()), v)->getIndex() 
	  << " (" << theControlFlowGraphVertex_p->getId().c_str() << "): " 
	  << ControlFlowGraphVertexKind::toString(theControlFlowGraphVertex_p->getKind()).c_str() << "\"]";
    }
    const ControlFlowGraph& myG;
  };

  class ControlFlowGraphEdgeLabelWriter {
  public:
    ControlFlowGraphEdgeLabelWriter(const ControlFlowGraph& g) : myG(g) {}
    template <class BoostIntenalEdgeDescriptor>
    void operator()(std::ostream& out, const BoostIntenalEdgeDescriptor& v) const {
      ControlFlowGraphEdge* theControlFlowGraphEdge_p=boost::get(boost::get(BoostEdgeContentType(),myG.getInternalBoostGraph()),v);
      if (theControlFlowGraphEdge_p->hasConditionValue()) { 
	out << "[label=\"";
	if (theControlFlowGraphEdge_p->hasConditionValue())
	  out << theControlFlowGraphEdge_p->getConditionValue();
	out << "\"]";
      }
    }
    const ControlFlowGraph& myG;
  };

  ControlFlowGraph::ControlFlowGraph (const Symbol& theSymbol,
				      const Scope& theScope,
				      const Scope& theCFGScope,
				      const bool activeFlag) :
    ControlFlowGraphCommonAttributes(theSymbol,theScope,theCFGScope),
    myActiveFlag(activeFlag),
    mySideEffectLists(SideEffectListType::numTypes()),
    myStructuredFlag(true) { 
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
       << "\" " 
       << our_myStructuredFlag_XAIFName.c_str() 
       << "=\"" 
       << myStructuredFlag
       << "\">" 
       << std::endl;
    myArgumentList.printXMLHierarchy(os);
    if (PrintManager::isVerbose()) { 
      for (std::list<SideEffectListType::SideEffectListType_E>::const_iterator i=SideEffectListType::getTypeList().begin();
	   i!=SideEffectListType::getTypeList().end();
	   ++i) { 
	getSideEffectList(*i).printXMLHierarchy(SideEffectListType::getXAIFNames()[*i],
						os);
      }
    }
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
   
  void ControlFlowGraph::setStructured(bool aFlag) { 
    myStructuredFlag=aFlag;
  }
  
  bool ControlFlowGraph::isStructured() const { 
    return myStructuredFlag;
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
    return mySideEffectLists[aType];
  }

  const SideEffectList& ControlFlowGraph::getSideEffectList(SideEffectListType::SideEffectListType_E aType) const { 
    return mySideEffectLists[aType];
  }

  FindDefinitionResult ControlFlowGraph::findDefinition(const ObjectWithId::Id& aStatementId) const { 
    ControlFlowGraph::ConstVertexIteratorPair p(vertices());
    ControlFlowGraph::ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt) { 
      FindDefinitionResult aResult((*beginIt).findDefinition(aStatementId));
      if (aResult.foundIt())
	return aResult;
    }
    return FindDefinitionResult(0);
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
    mySortedVertices_p_l.push_back(&theCurrentVertex_r);
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
      // the following is particularly for PRELOOPs: 
      theCurrentVertex_r.setReversalType(theCurrentVertex_r.getCounterPart().getReversalType());
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
      if (theCurrentVertex_r.getKind()==ControlFlowGraphVertexKind::PRELOOP_VKIND) 
	theCurrentVertex_r.setReversalType(ForLoopReversalType::ANONYMOUS);
      else { 
	theCurrentVertex_r.setReversalType(aNewReversalType);
	if (aNewTopExplicitLoopVertex_p)
	  theCurrentVertex_r.setTopExplicitLoop(*aNewTopExplicitLoopVertex_p);
      }
      if (aNewReversalType==ForLoopReversalType::EXPLICIT
	  && 
	  theCurrentVertex_r.getKind()==ControlFlowGraphVertexKind::FORLOOP_VKIND) { 
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
      if (endNodes_p_s_r.empty()) { 
	DBG_MACRO(DbgGroup::WARNING,
		  "ControlFlowGraph::augmentGraphInfoRecursively: detected unstructured control flow in routine "
		  << getSymbolReference().getSymbol().plainName().c_str());
	setStructured(false);
	throw StructureException();
      } 
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
      mySortedVertices_p_l.push_back(the_endBranch_p);
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
    // do this only for non-null, structured graphs
    if (isNull() || !isStructured())
      return; 
    DBG_MACRO(DbgGroup::CALLSTACK,"::ControlFlowGraph::augmentGraphInfo: for  " << getSymbolReference().getSymbol().plainName().c_str());
    if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {     
      GraphVizDisplay::show(*this,getSymbolReference().getSymbol().plainName()+"_cfg", ControlFlowGraphVertexLabelWriter(*this),ControlFlowGraphEdgeLabelWriter(*this));
    }
    initVisit();
    int idx=1;
    std::stack<ControlFlowGraphVertex*> endNodes_p_s;
    try { 
      augmentGraphInfoRecursively(getEntry(),idx,endNodes_p_s, ForLoopReversalType::ANONYMOUS,0,0);
    }
    catch (StructureException& e) {
      DBG_MACRO(DbgGroup::WARNING,"::ControlFlowGraph::augmentGraphInfo: unstructured control flow detected for  " << getSymbolReference().getSymbol().plainName().c_str())
      finishVisit();
      return;
    }
    finishVisit();
    // do a little preliminary test to see if the condition variables are 
    // modified under the branch and if so the branch is definitely not explicit: 
    ControlFlowGraph::VertexIteratorPair p(vertices());
    ControlFlowGraph::VertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt) {
      if ((*beginIt).getReversalType()==ForLoopReversalType::EXPLICIT 
	  && 
	  (*beginIt).getKind()==ControlFlowGraphVertexKind::BRANCH_VKIND) { 
	Branch& theBranch(dynamic_cast<Branch&>((*beginIt)));
	Expression::CArgumentPList theArguments;
	theBranch.getCondition().getExpression().appendArguments(theArguments);
	for (Expression::CArgumentPList::const_iterator theArgIt=theArguments.begin();
	     theArgIt!=theArguments.end();
	     ++theArgIt) {
	  if (definesUnderControlFlowGraphVertex((*theArgIt)->getVariable(),
						 theBranch)) { 
	    // this is not really explicit then...
	    DBG_MACRO(DbgGroup::ERROR,"::ControlFlowGraph::augmentGraphInfo: condition variable "
		      << (*theArgIt)->getVariable().getVariableSymbolReference().getSymbol().plainName().c_str()
		      << " in "
		      << getSymbolReference().getSymbol().plainName().c_str()
		      << " redefined under Branch contained in loop marked as \'simple\'; we will suppress the flag for this branch");
	    theBranch.setReversalType(ForLoopReversalType::ANONYMOUS);
	    theBranch.getCounterPart().setReversalType(ForLoopReversalType::ANONYMOUS);
	  }
	}
      }
    }
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

  ControlFlowGraph::FormalResult ControlFlowGraph::hasFormal(const SymbolReference& theSymbolReference) const { 
    for (ArgumentList::ArgumentSymbolReferencePList::const_iterator listI=getArgumentList().getArgumentSymbolReferencePList().begin();
	 listI!=getArgumentList().getArgumentSymbolReferencePList().end();
	 ++listI) {
      if ((*listI)->refersToSameSymbolAs(theSymbolReference))
	return FormalResult(true,(*listI)->getPosition()); 
    }
    return FormalResult(false,0); 
  }

  unsigned int ControlFlowGraph::definesUnderControlFlowGraphVertex(const Variable& theVariable,
								    const ControlFlowGraphVertex& theControlFlowGraphVertex) const { 
    int defCount=0;
    if (theVariable.getDuUdMapKey().getKind()==InfoMapKey::NO_INFO) { 
      DBG_MACRO(DbgGroup::ERROR,
		"ControlFlowGraph::definesUnderControlFlowGraphVertex: (old OA) skipping definitions check since no duud key for variable " 
		<< theVariable.getVariableSymbolReference().getSymbol().getId().c_str()
		<< " (plain name: "
		<< theVariable.getVariableSymbolReference().getSymbol().plainName().c_str()
		<< ") in routine "
		<< getSymbolReference().getSymbol().plainName().c_str());
    } 
    else {
      // check all the definition locations:
      const StatementIdSet& defChain(ConceptuallyStaticInstances::instance()->
				     getCallGraph().getDuUdMap().getEntry(theVariable.getDuUdMapKey()).getStatementIdSet());
      for(StatementIdSet::const_iterator defChainI=defChain.begin();
	  defChainI!=defChain.end();
	  ++defChainI) {
	if (!(*defChainI).empty()) { 
	  DBG_MACRO(DbgGroup::DATA,
		    "ControlFlowGraph::definesUnderControlFlowGraphVertex: checking for " 
		    << (*defChainI).c_str() 
		    << " under " 
		    << theControlFlowGraphVertex.debug().c_str());
	  if (firstDominatedBySecond(getContainingVertex(*defChainI),
				     theControlFlowGraphVertex,
				     false)) { 
	    defCount++;
	  }
	  else { 
	    // have outside definition but possibly inside overwrites of that definition
	    // look at the overwrites of that definition dominated by theControlFlowGraphVertex
	    FindDefinitionResult theFinderResult(findDefinition(*defChainI));
	    if (!theFinderResult.foundAssignment()) { 
	      DBG_MACRO(DbgGroup::ERROR, "ControlFlowGraph::definesUnderControlFlowGraphVertex: cannot find assignment for id "
			<< (*defChainI).c_str());
	    }
	    else { 
	      const Assignment& theDefiningAssignment(theFinderResult.getAssignment());
	      DBG_MACRO(DbgGroup::DATA,
			"ControlFlowGraph::definesUnderControlFlowGraphVertex: the defining assignment is " 
			<< theDefiningAssignment.debug().c_str());
	      const StatementIdSet& overwriteChain(ConceptuallyStaticInstances::instance()->
						   getCallGraph().getDoMap().getEntry(theDefiningAssignment.getDoMapKey()).getStatementIdSet());
	      for(StatementIdSet::const_iterator overwriteChainI=overwriteChain.begin();
		  overwriteChainI!=overwriteChain.end();
		  ++overwriteChainI) {
		DBG_MACRO(DbgGroup::DATA,
			  "ControlFlowGraph::definesUnderControlFlowGraphVertex: checking for " 
			  << (*overwriteChainI).c_str() 
			  << " under " 
			  << theControlFlowGraphVertex.debug().c_str());
		if (!(*overwriteChainI).empty()) { 
		  if (firstDominatedBySecond(getContainingVertex(*overwriteChainI),
					     theControlFlowGraphVertex,
					     false)) { 
		    defCount++;
		  }
		}
	      }
	    }
	  } 
	}
	else { 
	  DBG_MACRO(DbgGroup::DATA,
		    "ControlFlowGraph::definesUnderControlFlowGraphVertex: outside definition");
	}

      }
    }
    return defCount;
  }

  std::list<const ControlFlowGraphVertex*> ControlFlowGraph::getSOrtedVertexList() const { 
    return mySortedVertices_p_l;
  } 

} // end of namespace xaifBooster 
