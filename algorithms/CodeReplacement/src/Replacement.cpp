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

#include "xaifBooster/algorithms/CodeReplacement/inc/Replacement.hpp"
#include "xaifBooster/algorithms/CodeReplacement/inc/ConceptuallyStaticInstances.hpp"

namespace xaifBoosterCodeReplacement { 

  const std::string Replacement::ourXAIFName("xaif:Replacement");
  const std::string Replacement::our_myPlaceHolder_XAIFName("placeholder");

  Replacement::Replacement (unsigned aPlaceHolder) : 
    myPlaceHolder(aPlaceHolder),
    myControlFlowGraphBase_p(0),
    myReversibleControlFlowGraph_p(0),
    myPrintVersion(PrintVersion::ORIGINAL) { 
  } 

  Replacement::~Replacement(){
  }

  void Replacement::setControlFlowGraphBase(const ControlFlowGraphBase& theOtherControlFlowGraphBase) { 
    if (myControlFlowGraphBase_p || myReversibleControlFlowGraph_p)
      THROW_LOGICEXCEPTION_MACRO("Replacement::setControlFlowGraphBase: already got one");
    myControlFlowGraphBase_p=&theOtherControlFlowGraphBase;
  } 

  const ControlFlowGraphBase& Replacement::getControlFlowGraphBase() const { 
    if (!myControlFlowGraphBase_p)
      THROW_LOGICEXCEPTION_MACRO("Replacement::setControlFlowGraphBase: don't have one");
    return *myControlFlowGraphBase_p;
  } 

  void Replacement::setReversibleControlFlowGraph(const xaifBoosterControlFlowReversal::ReversibleControlFlowGraph& theOtherReversibleControlFlowGraph) { 
    if (myControlFlowGraphBase_p || myReversibleControlFlowGraph_p)
      THROW_LOGICEXCEPTION_MACRO("Replacement::setReversibleControlFlowGraph: already got one");
    myReversibleControlFlowGraph_p=&theOtherReversibleControlFlowGraph;
  } 

  const xaifBoosterControlFlowReversal::ReversibleControlFlowGraph& Replacement::getReversibleControlFlowGraph() const { 
    if (!myReversibleControlFlowGraph_p)
      THROW_LOGICEXCEPTION_MACRO("Replacement::setReversibleControlFlowGraph: don't have one");
    return *myReversibleControlFlowGraph_p;
  } 

  void
  Replacement::printXMLHierarchy(std::ostream& os) const { 
    ConceptuallyStaticInstances::instance()->setPrintVersion(getPrintVersion());
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str()
       << " "
       << our_myPlaceHolder_XAIFName.c_str() 
       << "=\"" 
       << myPlaceHolder
       << "\""
       << ">" 
       << std::endl;
    if (myControlFlowGraphBase_p) { 
      ControlFlowGraphBase::ConstVertexIteratorPair p(getControlFlowGraphBase().vertices());
      ControlFlowGraphBase::ConstVertexIterator beginIt(p.first),endIt(p.second);
      for (;beginIt!=endIt ;++beginIt)
	(*beginIt).printXMLHierarchy(os);
      ControlFlowGraphBase::ConstEdgeIteratorPair pe(getControlFlowGraphBase().edges());
      ControlFlowGraphBase::ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
      for (;beginIte!=endIte ;++beginIte)
	(*beginIte).printXMLHierarchy(os,
				      getControlFlowGraphBase());
    }
    else if (myReversibleControlFlowGraph_p) 
      myReversibleControlFlowGraph_p->printXMLHierarchy(os);
    else { 
//      THROW_LOGICEXCEPTION_MACRO("Replacement::printXMLHierarchy: no CFG set");
    } 
    os << pm.indent()
       << "</"
       << ourXAIFName.c_str()
       << ">"
       << std::endl;
    pm.releaseInstance();
    ConceptuallyStaticInstances::instance()->setPrintVersion(PrintVersion::ORIGINAL);
  } // end of Replacement::printXMLHierarchy

  std::string Replacement::debug () const { 
    std::ostringstream out;
    out << "Replacement[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of Replacement::debug

  const unsigned int Replacement::getPlaceHolder() const {
    return myPlaceHolder; 
  }

  void Replacement::setPrintVersion(PrintVersion::PrintVersion_E aPrintVersion) { 
    myPrintVersion=aPrintVersion;
  } 

  PrintVersion::PrintVersion_E Replacement::getPrintVersion() const { 
    return myPrintVersion;
  }

} 
