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
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/BasicBlockAlgBase.hpp"
#include "xaifBooster/system/inc/BasicBlockAlgFactory.hpp"
#include "xaifBooster/system/inc/BasicBlockElement.hpp"
#include "xaifBooster/system/inc/Scope.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"

namespace xaifBooster { 

  BasicBlock::BasicBlock(Scope& theScope,
			 bool makeAlgorithm) : 
    PlainBasicBlock(theScope) { 
    if (makeAlgorithm)
      myControlFlowGraphVertexAlgBase_p=BasicBlockAlgFactory::instance()->makeNewAlg(*this);
  }

  BasicBlock::~BasicBlock() {
    if (myControlFlowGraphVertexAlgBase_p) delete myControlFlowGraphVertexAlgBase_p;
  }

  BasicBlockAlgBase&
  BasicBlock::getBasicBlockAlgBase() const {
    if (!myControlFlowGraphVertexAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("BasicBlock::getControlFlowGraphVertexAlgBase: not set");
    return dynamic_cast<BasicBlockAlgBase&>(*myControlFlowGraphVertexAlgBase_p);
  }

  void
  BasicBlock::printXMLHierarchy(std::ostream& os) const { 
    if (myControlFlowGraphVertexAlgBase_p
	&& 
	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY)
      getBasicBlockAlgBase().printXMLHierarchy(os);
    else
      printXMLHierarchyImpl(os);
  } // end of BasicBlock::printXMLHierarchy

  void
  BasicBlock::printXMLHierarchyImpl(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent()
       << "<"
       << ourXAIFName.c_str()
       << " "
       << our_myId_XAIFName.c_str()
       << "=\""
       << getId().c_str()
       << "\" "
       << ObjectWithAnnotation::our_myAnnotation_XAIFName.c_str()
       << "=\""
       << getAnnotation().c_str()
       << "\" "
       << PlainBasicBlock::our_myScopeId_XAIFName.c_str()
       << "=\""
       << PlainBasicBlock::myScope_r.getId().c_str()
       << "\">"
       << std::endl;
    for (PlainBasicBlock::BasicBlockElementList::const_iterator li=myElementList.begin();
         li!=myElementList.end();
         li++)
      (*(li))->printXMLHierarchy(os);
    os << pm.indent()
       << "</"
       << ourXAIFName
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of BasicBlock::printXMLHierarchyImpl

  std::string BasicBlock::debug () const { 
    std::ostringstream out;
    out << "BasicBlock[" << this 
	<< PlainBasicBlock::debug().c_str()
	<< ControlFlowGraphVertex::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  } // end of BasicBlock::debug

  void BasicBlock::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
    getBasicBlockAlgBase().genericTraversal(anAction_c);
    std::list<BasicBlockElement*>::iterator li=myElementList.begin();
    for (;li!=myElementList.end();li++)
      (*(li))->genericTraversal(anAction_c);
  } 

  bool BasicBlock::hasStatement(const ObjectWithId::Id& aStatementId) const { 
    for (PlainBasicBlock::BasicBlockElementList::const_iterator li=myElementList.begin();
         li!=myElementList.end();
         li++) { 
      if ((*li)->getId()==aStatementId)
	return true; 
    }
    return false; 
  } 
  
  ControlFlowGraphVertex::FindAssignmentResult BasicBlock::findAssignment(const ObjectWithId::Id& aStatementId) const { 
    for (PlainBasicBlock::BasicBlockElementList::const_iterator li=myElementList.begin();
         li!=myElementList.end();
         ++li) {
      if ((*li)->getId()==aStatementId) { 
	const Assignment* anAssignment_p=dynamic_cast<const Assignment*>(*li);
	if (anAssignment_p)
	  return ControlFlowGraphVertex::FindAssignmentResult(true,anAssignment_p);
	const Marker* aMarker_p=dynamic_cast<const Marker*>(*li);
	if (aMarker_p)
	  return ControlFlowGraphVertex::FindAssignmentResult(true,anAssignment_p);
      }
    }
    return ControlFlowGraphVertex::FindAssignmentResult(false,0); 
  } 
  
} // end of namespace xaifBooster 
