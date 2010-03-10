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
#include "xaifBooster/system/inc/BooleanOperation.hpp"

#include "xaifBooster/algorithms/AdjointUtils/inc/BasicBlockPrintVersion.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicControlFlowGraphVertex.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  BasicControlFlowGraphVertex::BasicControlFlowGraphVertex() :
    original(false), 
    myOriginalVertex_p(0), 
    myNewVertex_p(0),
    myIndex(0) {
  }

  BasicControlFlowGraphVertex::BasicControlFlowGraphVertex(const ControlFlowGraphVertex* theOriginal) : 
    original(true),
    myOriginalVertex_p(theOriginal),
    myNewVertex_p(0),
    myIndex(0) {
  }

  BasicControlFlowGraphVertex::~BasicControlFlowGraphVertex() {
    if (myNewVertex_p)
      delete myNewVertex_p;
  }

  const ControlFlowGraphVertexAlgBase&
  BasicControlFlowGraphVertex::getOriginalControlFlowGraphVertexAlg() const {
    return dynamic_cast<const ControlFlowGraphVertexAlgBase&>(myOriginalVertex_p->getControlFlowGraphVertexAlgBase());
  }

  ControlFlowGraphVertexAlgBase&
  BasicControlFlowGraphVertex::getOriginalControlFlowGraphVertexAlg() {
    return dynamic_cast<ControlFlowGraphVertexAlgBase&>(myOriginalVertex_p->getControlFlowGraphVertexAlgBase());
  }

  const ControlFlowGraphVertexAlgBase&
  BasicControlFlowGraphVertex::getNewControlFlowGraphVertexAlg() const {
    if (!myNewVertex_p)
      THROW_LOGICEXCEPTION_MACRO("BasicControlFlowGraphVertex::getNewControlFlowGraphVertexAlg: not set");
    return dynamic_cast<const ControlFlowGraphVertexAlgBase&>(myNewVertex_p->getControlFlowGraphVertexAlgBase());
  }

  void 
  BasicControlFlowGraphVertex::supplyAndAddNewVertex(ControlFlowGraphVertex& theNewVertex) { 
    if (myNewVertex_p)
      THROW_LOGICEXCEPTION_MACRO("BasicControlFlowGraphVertex::supplyAndAddNewVertex: already set");
    myNewVertex_p=&theNewVertex; 
  }

  void
  BasicControlFlowGraphVertex::printXMLHierarchy(std::ostream& os) const {
    if (!original) { 
      xaifBooster::PrintVersion::PrintVersion_E aPrintVersion(xaifBooster::ConceptuallyStaticInstances::instance()->
							      getPrintVersion());
      xaifBooster::ConceptuallyStaticInstances::instance()->setPrintVersion(xaifBooster::PrintVersion::SYSTEM_ONLY);
      myNewVertex_p->printXMLHierarchy(os);
      xaifBooster::ConceptuallyStaticInstances::instance()->setPrintVersion(aPrintVersion);
    }
    else {
      myOriginalVertex_p->printXMLHierarchy(os);
    }
  }

  std::string
  BasicControlFlowGraphVertex::debug() const {
    std::ostringstream out;
    out << "xaifBoosterControlFlowReversal::BasicControlFlowGraphVertex["
	<< this
	<< ",original="
	<< original
	<< ",myIndex="
	<< myIndex
	<< ",getKind():"
	<< BasicControlFlowGraphVertex::getKind()
	<< "]"
	<< "]" << std::ends;
    return out.str();
  }

  void BasicControlFlowGraphVertex::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
  }

  void BasicControlFlowGraphVertex::setIndex(int i) {
    myIndex=i;
  } 

  int BasicControlFlowGraphVertex::getIndex() const {
    return myIndex;
  }
                                                                    
  ControlFlowGraphVertexKind::ControlFlowGraphVertexKind_E 
  BasicControlFlowGraphVertex::getKind() const {
    if (original)
      return myOriginalVertex_p->getKind();
    else
      return myNewVertex_p->getKind();
  }

} // end of namespace

