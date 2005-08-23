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
#include "xaifBooster/system/inc/Scopes.hpp"
#include "xaifBooster/system/inc/SymbolReference.hpp"

namespace xaifBooster { 

  const std::string Scopes::ourXAIFName("xaif:ScopeHierarchy");

  Scopes::Scopes() : myGlobalScope_p(0) {
  } 

  void
  Scopes::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName
       << ">"
       << std::endl;
    Scopes::ConstVertexIteratorPair p(vertices());
    Scopes::ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt)
      (*beginIt).printXMLHierarchy(os);
    Scopes::ConstEdgeIteratorPair pe=edges();
    Scopes::ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte) 
      (*beginIte).printXMLHierarchy(os,*this);
    os << pm.indent()
       << "</"
       << ourXAIFName
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of Scopes::printXMLHierarchy

  std::string Scopes::debug () const { 
    std::ostringstream out;
    out << "Scopes[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of Scopes::debug

  Scope& 
  Scopes::getGlobalScope() { 
    if (!myGlobalScope_p) 
      findGlobalScope();
    return *myGlobalScope_p;
  } 

  const Scope& 
  Scopes::getGlobalScope() const { 
    if (!myGlobalScope_p) 
      const_cast<Scopes*>(this)->findGlobalScope();
    return *myGlobalScope_p;
  } 

  void
  Scopes::findGlobalScope() { 
    if (myGlobalScope_p) 
      THROW_LOGICEXCEPTION_MACRO("Scopes::findGlobalScope: already found");
    VertexIteratorPair p=vertices();
    VertexIterator beginIt(p.first),endIt(p.second);
    for (; beginIt!=endIt ;++beginIt) { 
      if (!numOutEdgesOf(*beginIt)) { 
	myGlobalScope_p=&(*beginIt);
	  break;
      }
    } // end for 
    if (beginIt==endIt)
      THROW_LOGICEXCEPTION_MACRO("Scopes::findGlobalScope: cannot find the root of the scope tree");
  } 

  Scope& 
  Scopes::getScopeById(const std::string& theScopeId) { 
    VertexIteratorPair p=vertices();
    VertexIterator beginIt(p.first),endIt(p.second);
    for (; beginIt!=endIt ;++beginIt) { 
      if ((*(beginIt)).getId()==theScopeId)
	break;
    } // end for 
    if (beginIt==endIt)
      THROW_LOGICEXCEPTION_MACRO("Scopes::getScopeById: scope id >" 
				 << theScopeId.c_str()
				 << "< not found");
    return *(beginIt);
  } 

  const Scope& 
  Scopes::getScopeById(const std::string& theScopeId) const { 
    ConstVertexIteratorPair p=vertices();
    ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (; beginIt!=endIt ;++beginIt) { 
      if ((*(beginIt)).getId()==theScopeId)
	break;
    } // end for 
    if (beginIt==endIt)
      THROW_LOGICEXCEPTION_MACRO("Scopes::getScopeById: scope id >" 
				 << theScopeId.c_str()
				 << "< not found");
    return *(beginIt);
  } 

  bool Scopes::isSameSymbol(const SymbolReference& first,
			    const SymbolReference& second) const { 
    return (( &(first.getScope())==&(second.getScope()) && &(first.getSymbol())==&(second.getSymbol())) ? true : false );
  } 
  
} // end of namespace xaifBooster 
