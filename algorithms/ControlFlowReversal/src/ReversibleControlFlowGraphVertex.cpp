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
#include "xaifBooster/system/inc/ForLoop.hpp"

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ReversibleControlFlowGraphVertex.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

  ReversibleControlFlowGraphVertex::ReversibleControlFlowGraphVertex() :
    original(false), 
    adjoint(false), 
    myOriginalVertex_p(0), 
    myNewVertex_p(0),
    myVisitedFlag(false), 
    myIndex(0), 
    myReversalType(ForLoopReversalType::ANONYMOUS), 
    myCounterPart_p(0) {
  }

  ReversibleControlFlowGraphVertex::ReversibleControlFlowGraphVertex(const ControlFlowGraphVertex* theOriginal) : 
    original(true),
    adjoint(false),
    myOriginalVertex_p(theOriginal),
    myNewVertex_p(0),
    myVisitedFlag(false),
    myIndex(0),
    myReversalType(ForLoopReversalType::ANONYMOUS), 
    myCounterPart_p(0) {
    ControlFlowGraphVertexAlg::ControlFlowGraphVertexKind_E theKind=dynamic_cast<const ControlFlowGraphVertexAlg&>(theOriginal->getControlFlowGraphVertexAlgBase()).getKind();
    if (theKind==ControlFlowGraphVertexAlg::FORLOOP)
      myReversalType=dynamic_cast<const ForLoop*>(theOriginal)->getReversalType();
  }

  ReversibleControlFlowGraphVertex::~ReversibleControlFlowGraphVertex() {
    if (myNewVertex_p)
      delete myNewVertex_p;
  }

  const ControlFlowGraphVertexAlg&
  ReversibleControlFlowGraphVertex::getOriginalControlFlowGraphVertexAlg() const {
    return dynamic_cast<const ControlFlowGraphVertexAlg&>(myOriginalVertex_p->getControlFlowGraphVertexAlgBase());
  }

  ControlFlowGraphVertexAlg&
  ReversibleControlFlowGraphVertex::getOriginalControlFlowGraphVertexAlg() {
    return dynamic_cast<ControlFlowGraphVertexAlg&>(myOriginalVertex_p->getControlFlowGraphVertexAlgBase());
  }

  const ControlFlowGraphVertexAlg&
  ReversibleControlFlowGraphVertex::getNewControlFlowGraphVertexAlg() const {
    if (!myNewVertex_p)
      THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraphVertex::getNewControlFlowGraphVertexAlg: not set");
    return dynamic_cast<const ControlFlowGraphVertexAlg&>(myNewVertex_p->getControlFlowGraphVertexAlgBase());
  }

  void 
  ReversibleControlFlowGraphVertex::supplyAndAddNewVertex(ControlFlowGraphVertex& theNewVertex) { 
    if (myNewVertex_p)
      THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraphVertex::supplyAndAddNewVertex: already set");
    myNewVertex_p=&theNewVertex; 
  }

  void
  ReversibleControlFlowGraphVertex::printXMLHierarchy(std::ostream& os) const {
    if (!original) { 
      // JU: this is not nice! These things have Alg objects which  when 
      // inherited in a different algorithm override printing which shouldn't 
      // happen here. So we have to forcibly override it. 
      xaifBooster::PrintVersion::PrintVersion_E aPrintVersion(xaifBooster::ConceptuallyStaticInstances::instance()->
							      getPrintVersion());
      xaifBooster::ConceptuallyStaticInstances::instance()->setPrintVersion(xaifBooster::PrintVersion::SYSTEM_ONLY);
      myNewVertex_p->printXMLHierarchy(os);
      xaifBooster::ConceptuallyStaticInstances::instance()->setPrintVersion(aPrintVersion);
    }
    else {
      if (adjoint)
        myOriginalVertex_p->printXMLHierarchy(os);
      else
        myOriginalVertex_p->printXMLHierarchy(os);
    }
  }

  std::string
  ReversibleControlFlowGraphVertex::debug() const {
    std::ostringstream out;
    out << "xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex["
	 << this
	 << ",original="
	 << original
	 << ",adjoint="
	 << adjoint
	 << ",myIndex="
	 << myIndex
	 << ",getKind():"
	 << getKind()
        << "]" << std::ends;
    return out.str();
  }

  void ReversibleControlFlowGraphVertex::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
  }

  void ReversibleControlFlowGraphVertex::setVisited(bool b) {
    myVisitedFlag=b;
  } 

  bool ReversibleControlFlowGraphVertex::getVisited() const {
    return myVisitedFlag;
  }

  void ReversibleControlFlowGraphVertex::setIndex(int i) {
    myIndex=i;
  } 

  void ReversibleControlFlowGraphVertex::setAdjointIndex(int i) {
    myIndex=-i;
  } 

  int ReversibleControlFlowGraphVertex::getIndex() const {
    return myIndex;
  }
                                                                    
  ControlFlowGraphVertexAlg::ControlFlowGraphVertexKind_E 
  ReversibleControlFlowGraphVertex::getKind() const {
    if (original)
      return getOriginalControlFlowGraphVertexAlg().getKind();
    else
      return getNewControlFlowGraphVertexAlg().getKind();
  }

  void ReversibleControlFlowGraphVertex::setReversalType(ForLoopReversalType::ForLoopReversalType_E aReversalType) { 
    myReversalType=aReversalType;
  }

  ForLoopReversalType::ForLoopReversalType_E ReversibleControlFlowGraphVertex::getReversalType() const { 
    return myReversalType;
  }

  void ReversibleControlFlowGraphVertex::setCounterPart(ReversibleControlFlowGraphVertex& theCounterPart) { 
    if(myCounterPart_p)
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraphVertexAlg::setCounterPart: already set");
    myCounterPart_p=&theCounterPart;
  }
      
  ReversibleControlFlowGraphVertex& ReversibleControlFlowGraphVertex::getCounterPart() { 
    if (!myCounterPart_p)
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraphVertexAlg::setCounterPart: not set");
    return *myCounterPart_p;
  }

} // end of namespace

