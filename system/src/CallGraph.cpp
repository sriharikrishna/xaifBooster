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
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/CallGraphAlgFactory.hpp"
#include "xaifBooster/system/inc/SubroutineNotFoundException.hpp"

namespace xaifBooster { 

  const std::string CallGraph::ourXAIFName("xaif:CallGraph");
  const std::string CallGraph::our_mySchemaInstance_XAIFName("xmlns:xsi");
  const std::string CallGraph::our_myXAIFInstance_XAIFName("xmlns:xaif");
  const std::string CallGraph::our_mySchemaLocation_XAIFName("xsi:schemaLocation");
  const std::string CallGraph::our_myProgramName_XAIFName("program_name");
  const std::string CallGraph::our_myPrefix_XAIFName("prefix");

  CallGraph::CallGraph(const std::string& aSchemaInstance,
		       const std::string& anXAIFInstance,
		       const std::string& aSchemaLocation,
		       const std::string& aPrefix) : 
    mySchemaInstance(aSchemaInstance),
    myXAIFInstance(anXAIFInstance),
    mySchemaLocation(aSchemaLocation),
    myPrefix(aPrefix) {
    myCallGraphAlgBase_p=CallGraphAlgFactory::instance()->makeNewAlg(*this);
  }
                                                                                
  CallGraph::~CallGraph() {
    if (myCallGraphAlgBase_p) delete myCallGraphAlgBase_p;
  }

  void
  CallGraph::printXMLHierarchy(std::ostream& os) const {
    if (myCallGraphAlgBase_p
	&& 
	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY)
      getCallGraphAlgBase().printXMLHierarchy(os);
    else
      printXMLHierarchyImpl(os);
  } // end of CallGraph::printXMLHierarchy


  void
  CallGraph::printXMLHierarchyImpl(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str() 
       << " " 
       << our_mySchemaInstance_XAIFName.c_str() 
       << "=\"" 
       << mySchemaInstance.c_str()
       << "\" " 
       << our_myXAIFInstance_XAIFName.c_str() 
       << "=\""
       << myXAIFInstance.c_str()
       << "\" " 
       << our_mySchemaLocation_XAIFName.c_str() 
       << "=\""
       << mySchemaLocation.c_str()
       << "\" " 
       << our_myProgramName_XAIFName.c_str() 
       << "=\""
       << myProgramName.c_str()
       << "\" " 
       << our_myPrefix_XAIFName.c_str() 
       << "=\""
       << myPrefix.c_str()
       << "\">" 
       << std::endl; 
    myScopeTree.printXMLHierarchy(os);
    myAliasMap.printXMLHierarchy(os);
    myDuUdMap.printXMLHierarchy(os);
    CallGraph::ConstVertexIteratorPair p(vertices());
    CallGraph::ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt)
      (*beginIt).printXMLHierarchy(os);
    CallGraph::ConstEdgeIteratorPair pe=edges();
    CallGraph::ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte) 
      (*beginIte).printXMLHierarchy(os,
				    *this);
    os << pm.indent()
       << "</"
       << ourXAIFName
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of CallGraph::printXMLHierarchy

  std::string CallGraph::debug () const { 
    std::ostringstream out;
    out << "CallGraph[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of CallGraph::debug

  Scopes& CallGraph::getScopeTree() { 
    return myScopeTree;
  }

  AliasMap& CallGraph::getAliasMap() { 
    return myAliasMap;
  }

  const AliasMap& CallGraph::getAliasMap() const { 
    return myAliasMap;
  }
  
  DuUdMap& CallGraph::getDuUdMap() { 
    return myDuUdMap;
  }

  const DuUdMap& CallGraph::getDuUdMap() const { 
    return myDuUdMap;
  }
  
  void CallGraph::setProgramName(const std::string& aProgramName) { 
    myProgramName=aProgramName;
  } 

  const std::string& CallGraph::getSchemaLocation() const { 
    return mySchemaLocation;
  } 

  void CallGraph::resetSchemaLocation(const std::string& aNewLocation) { 
    mySchemaLocation=aNewLocation;
  } 

  const std::string& CallGraph::getPrefix() const { 
    return myPrefix;
  }

  CallGraphAlgBase&
  CallGraph::getCallGraphAlgBase() {
    if (!myCallGraphAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("CallGraph::getCallGraphAlgBase: not set");
    return *myCallGraphAlgBase_p;
  }
                                                                                
  const CallGraphAlgBase&
  CallGraph::getCallGraphAlgBase() const {
    if (!myCallGraphAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("CallGraph::getCallGraphAlgBase: not set");
    return *myCallGraphAlgBase_p;
  }
                                                                                
  void CallGraph::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
    getCallGraphAlgBase().genericTraversal(anAction_c);
    GraphWrapperTraversable<CallGraphVertex,CallGraphEdge>::traverseToChildren(anAction_c);
  }
  
  const ControlFlowGraph& CallGraph::getSubroutineBySymbolReference(const SymbolReference& aSymbolReference) const { 
    CallGraph::ConstVertexIteratorPair p(vertices());
    CallGraph::ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt)
      if(myScopeTree.isSameSymbol((*beginIt).getControlFlowGraph().getSymbolReference(),
				  aSymbolReference)) 
	return (*beginIt).getControlFlowGraph();
    throw SubroutineNotFoundException(aSymbolReference);
    // to appease the compiler
    return (*beginIt).getControlFlowGraph();
  }

} // end of namespace xaifBooster 
