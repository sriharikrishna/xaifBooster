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
#include "xaifBooster/system/inc/ControlFlowGraphVertex.hpp"
#include "xaifBooster/system/inc/ForLoopReversalType.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphVertexAlgFactory.hpp"

namespace xaifBooster { 

  ControlFlowGraphVertex::ControlFlowGraphVertex() : 
    myControlFlowGraphVertexAlgBase_p(0), 
    myReversalType(ForLoopReversalType::ANONYMOUS),
    myIndex(0),
    myCounterPart_p(0),
    myTopExplicitLoop_p(0),
    myEnclosingControlFlow_p(0) {
  }

  ControlFlowGraphVertex::~ControlFlowGraphVertex() {
    if (myControlFlowGraphVertexAlgBase_p) delete myControlFlowGraphVertexAlgBase_p;
  }


  void
  ControlFlowGraphVertex::printXMLHierarchy(std::ostream& os) const { 
  } // end of ControlFlowGraphVertex::printXMLHierarchy

  void
  ControlFlowGraphVertex::printXMLHierarchyImpl(std::ostream& os) const { 
  } // end of ControlFlowGraphVertex::printXMLHierarchyImpl

  std::string ControlFlowGraphVertex::debug () const { 
    std::ostringstream out;
    out << "ControlFlowGraphVertex[" << this 
	<< Vertex::debug().c_str()
	<< ObjectWithId::debug().c_str()
	<< ObjectWithAnnotation::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  } // end of ControlFlowGraphVertex::debug

  ControlFlowGraphVertexAlgBase&
  ControlFlowGraphVertex::getControlFlowGraphVertexAlgBase() const {
    if (!myControlFlowGraphVertexAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraphVertex::getControlFlowGraphVertexAlgBase: not set");
    return *myControlFlowGraphVertexAlgBase_p;
  }

  bool ControlFlowGraphVertex::hasStatement(const ObjectWithId::Id& aStatementId) const { 
    return false;
  }

  ControlFlowGraphVertex::FindAssignmentResult ControlFlowGraphVertex::findAssignment(const ObjectWithId::Id& aStatementId) const { 
    return FindAssignmentResult(false,0);
  }

  void ControlFlowGraphVertex::setIndex(int i) {
    myIndex=i;
  } 

  int ControlFlowGraphVertex::getIndex() const {
    return myIndex;
  }
  
  void ControlFlowGraphVertex::setReversalType(ForLoopReversalType::ForLoopReversalType_E aReversalType) { 
    myReversalType=aReversalType;
  }

  void ControlFlowGraphVertex::setCounterPart(ControlFlowGraphVertex& theCounterPart) { 
    if(myCounterPart_p)
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraphVertexAlg::setCounterPart: already set");
    myCounterPart_p=&theCounterPart;
  }
      
  ControlFlowGraphVertex& ControlFlowGraphVertex::getCounterPart() { 
    if (!myCounterPart_p)
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraphVertexAlg::getCounterPart: not set");
    return *myCounterPart_p;
  }

  ControlFlowGraphVertex& ControlFlowGraphVertex::getCounterPart() const { 
    if (!myCounterPart_p)
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraphVertexAlg::getCounterPart: not set");
    return *myCounterPart_p;
  }

  const ControlFlowGraphVertex::VariablePList& 
  ControlFlowGraphVertex::getKnownLoopVariables()const { 
    return myKnownLoopVariables;
  } 
    
  void 
  ControlFlowGraphVertex::inheritLoopVariables(const ControlFlowGraphVertex& aParent) {
    const ControlFlowGraphVertex::VariablePList& aParentList(aParent.getKnownLoopVariables());
    if (myKnownLoopVariables.size())
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraphVertex::inheritLoopVariables: already inherited once");
    for(VariablePList::const_iterator i=aParentList.begin();
	i!=aParentList.end();
	++i) { 
      myKnownLoopVariables.push_back(*i);
    }
  } 

  bool
  ControlFlowGraphVertex::hasTopExplicitLoop() const { 
    return (myTopExplicitLoop_p!=0);
  } 

  ControlFlowGraphVertex& 
  ControlFlowGraphVertex::getTopExplicitLoop() { 
    if (!myTopExplicitLoop_p)
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraphVertex::getTopExplicitLoop: not set for "
				 << debug().c_str());
    return *myTopExplicitLoop_p;
  } 

  const ControlFlowGraphVertex& 
  ControlFlowGraphVertex::getTopExplicitLoop() const { 
    if (!myTopExplicitLoop_p)
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraphVertex::getTopExplicitLoop: not set for "
				 << debug().c_str());
    return *myTopExplicitLoop_p;
  } 

  void 
  ControlFlowGraphVertex::setTopExplicitLoop(ControlFlowGraphVertex& theTopExplicitLoop) { 
    if (!(myTopExplicitLoop_p && myTopExplicitLoop_p!=&theTopExplicitLoop) )
      myTopExplicitLoop_p=&theTopExplicitLoop;	
  } 

  bool
  ControlFlowGraphVertex::hasEnclosingControlFlow() const { 
    return (myEnclosingControlFlow_p!=0);
  } 

  ControlFlowGraphVertex& 
  ControlFlowGraphVertex::getEnclosingControlFlow() { 
    if (!myEnclosingControlFlow_p)
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraphVertex::getEnclosingControlFlow: not set for "
				 << debug().c_str());
    return *myEnclosingControlFlow_p;
  } 

  const ControlFlowGraphVertex& 
  ControlFlowGraphVertex::getEnclosingControlFlow() const { 
    if (!myEnclosingControlFlow_p)
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraphVertex::getEnclosingControlFlow: not set for "
				 << debug().c_str());
    return *myEnclosingControlFlow_p;
  } 

  void 
  ControlFlowGraphVertex::setEnclosingControlFlow(ControlFlowGraphVertex& theEnclosingControlFlow) { 
    if (myEnclosingControlFlow_p)
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraphVertex::setEnclosingControlFlow: already set")
    if (!(myEnclosingControlFlow_p && myEnclosingControlFlow_p!=&theEnclosingControlFlow) )
      myEnclosingControlFlow_p=&theEnclosingControlFlow;	
  } 

  ForLoopReversalType::ForLoopReversalType_E ControlFlowGraphVertex::getReversalType() const { 
    return myReversalType;
  }

} // end of namespace xaifBooster 
