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
#include "xaifBooster/system/inc/CallGraphVertex.hpp"
#include "xaifBooster/system/inc/CallGraphVertexAlgFactory.hpp"

namespace xaifBooster { 

  CallGraphVertex::CallGraphVertex(const Symbol& theSymbol,
				   const Scope& theScope,
				   const Scope& theCFGScope,
				   const bool activeFlag,
				   bool makeAlgorithm) : 
    myControlFlowGraph(theSymbol, theScope, theCFGScope, activeFlag),
    myCallGraphVertexAlgBase_p(0) { 
    if (makeAlgorithm)
      myCallGraphVertexAlgBase_p=CallGraphVertexAlgFactory::instance()->makeNewAlg(*this); 
  }

  CallGraphVertex::~CallGraphVertex() {
    if (myCallGraphVertexAlgBase_p)
      delete myCallGraphVertexAlgBase_p;
  } 

  const std::string&
  CallGraphVertex::getSubroutineName() const { 
    return myControlFlowGraph.getSymbolReference().getSymbol().getId(); 
  }

  CallGraphVertexAlgBase& 
  CallGraphVertex::getCallGraphVertexAlgBase() const { 
    if (!myCallGraphVertexAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("CallGraphVertex::getCallGraphVertexAlgBase: not set");
    return *myCallGraphVertexAlgBase_p;
  }

  void
  CallGraphVertex::printXMLHierarchy(std::ostream& os) const { 
    if (myCallGraphVertexAlgBase_p
	&& 
	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY)
      getCallGraphVertexAlgBase().printXMLHierarchy(os);
    else 
      myControlFlowGraph.printXMLHierarchy(os);
  } // end of CallGraphVertex::printXMLHierarchy

  void
  CallGraphVertex::printXMLHierarchyImpl(std::ostream& os) const { 
    myControlFlowGraph.printXMLHierarchy(os);
  } // end of CallGraphVertex::printXMLHierarchyImpl

  std::string CallGraphVertex::debug () const { 
    std::ostringstream out;
    out << "CallGraphVertex[" << this 
	<< Vertex::debug().c_str()
	<< ",myControlFlowGraph=" 
	<< myControlFlowGraph.debug().c_str()
	<< ","
	<< "myCallGraphVertexAlgBase_p"
	<< "="
	<< myCallGraphVertexAlgBase_p
	<< "]" << std::ends;  
    return out.str();
  } // end of CallGraphVertex::debug

  ControlFlowGraph&
  CallGraphVertex::getControlFlowGraph() { 
    return myControlFlowGraph;
  } // end of CallGraphVertex::getControlFlowGraph

  const ControlFlowGraph&
  CallGraphVertex::getControlFlowGraph() const { 
    return myControlFlowGraph;
  } // end of CallGraphVertex::getControlFlowGraph

  void CallGraphVertex::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
    getCallGraphVertexAlgBase().genericTraversal(anAction_c);
    myControlFlowGraph.genericTraversal(anAction_c);
  } 

} // end of namespace xaifBooster 
