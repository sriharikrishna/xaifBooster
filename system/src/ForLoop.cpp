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
#include "xaifBooster/system/inc/ForLoop.hpp"
#include "xaifBooster/system/inc/ForLoopAlgFactory.hpp"

namespace xaifBooster { 

  const std::string ForLoop::ourXAIFName("xaif:ForLoop");

  const std::string ForLoop::our_myId_XAIFName("vertex_id");

  ForLoop::ForLoop(const ForLoopReversalType::ForLoopReversalType_E theUserReversalType) : 
    myInitialization(true),
    myUpdate(true) { 
    myReversalType=theUserReversalType;
    myControlFlowGraphVertexAlgBase_p=ForLoopAlgFactory::instance()->makeNewAlg(*this);
  }
                                                                                
  ForLoop::~ForLoop() {
    if (myControlFlowGraphVertexAlgBase_p) delete myControlFlowGraphVertexAlgBase_p;
  }

  void
  ForLoop::printXMLHierarchy(std::ostream& os) const { 
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
       << ForLoopReversalType::our_attribute_XAIFName.c_str() 
       << "=\""
       << ForLoopReversalType::toString(myReversalType).c_str()
       << "\">" 
       << std::endl;
    myInitialization.printXMLHierarchy(os);
    myCondition.printXMLHierarchy(os);
    myUpdate.printXMLHierarchy(os);
    os << pm.indent() 
       << "</"
       << ourXAIFName.c_str() 
       << ">" 
       << std::endl;
    pm.releaseInstance();
  } // end of ForLoop::printXMLHierarchy

  std::string ForLoop::debug () const { 
    std::ostringstream out;
    out << "ForLoop[" << this 
	<< ControlFlowGraphVertex::debug().c_str()
	<< ObjectWithLineNumber::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  } // end of ForLoop::debug

  Initialization& ForLoop::getInitialization() { 
    return myInitialization;
  } 

  const Initialization& ForLoop::getInitialization() const { 
    return myInitialization;
  } 

  Condition& ForLoop::getCondition() { 
    return myCondition;
  } 

  const Condition& ForLoop::getCondition() const { 
    return myCondition;
  } 

  Update& ForLoop::getUpdate() { 
    return myUpdate;
  } 

  const Update& ForLoop::getUpdate() const { 
    return myUpdate;
  } 

  ForLoopAlgBase&
  ForLoop::getForLoopAlgBase() const {
    if (!myControlFlowGraphVertexAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("ForLoop::getControlFlowGraphVertexAlgBase: not set");
    return dynamic_cast<ForLoopAlgBase&>(*myControlFlowGraphVertexAlgBase_p);
  }

  bool 
  ForLoop::hasStatement(const ObjectWithId::Id& aStatementId) const { 
    bool found=false;
    if (getInitialization().getAssignment().getId()==aStatementId)
      found=true;
    if (getUpdate().getAssignment().getId()==aStatementId) { 
      if (found)
	THROW_LOGICEXCEPTION_MACRO("ForLoop::hasStatement: duplicate id " << aStatementId.c_str() << " in loop with id " << getId().c_str());
      found=true;
    }
    return found; 
  } 

  void 
  ForLoop::addLoopVariable() { 
    myKnownLoopVariables.push_back(&(getInitialization().
				     getAssignment().
				     getLHS()));
  }

  ControlFlowGraphVertex::FindAssignmentResult ForLoop::findAssignment(const ObjectWithId::Id& aStatementId) const { 
    if (aStatementId==getInitialization().getAssignment().getId())
      return FindAssignmentResult(false,&(getInitialization().getAssignment()));
    if (aStatementId==getUpdate().getAssignment().getId())
      return FindAssignmentResult(false,&(getUpdate().getAssignment()));
    return FindAssignmentResult(false,0);
  }

} // end of namespace xaifBooster 
