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

} // end of namespace xaifBooster 
