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
#include "xaifBooster/system/inc/ArgumentList.hpp"

namespace xaifBooster { 

  const std::string ArgumentList::our_scopeId_XAIFName("scope_id");
  const std::string ArgumentList::ourXAIFName("xaif:ArgumentList");

  ArgumentList::ArgumentList () :
    myScope_p(0) { 
  } 

  ArgumentList::~ArgumentList() { 
    for (ArgumentSymbolReferencePList::iterator i=myArgumentSymbolReferencePList.begin();
	 i!=myArgumentSymbolReferencePList.end();
	 ++i) { 
      if (*i)
	delete *i;
    }
  } 

  void
  ArgumentList::printXMLHierarchy(std::ostream& os) const { 
    if (myArgumentSymbolReferencePList.empty()) // nothing to print
      return;
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str()
       << ">" 
       << std::endl;
    for(ArgumentSymbolReferencePList::const_iterator i=myArgumentSymbolReferencePList.begin();
	i!=myArgumentSymbolReferencePList.end();
	++i) { 
      (*i)->printXMLHierarchy(os);
    } // end for 
    os << pm.indent()
       << "</"
       << ourXAIFName.c_str()
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of ArgumentList::printXMLHierarchy

  std::string ArgumentList::debug () const { 
    std::ostringstream out;
    out << "ArgumentList[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of ArgumentList::debug

  ArgumentList::ArgumentSymbolReferencePList& 
  ArgumentList::getArgumentSymbolReferencePList() { 
    return myArgumentSymbolReferencePList;
  } 
  
  const ArgumentList::ArgumentSymbolReferencePList& 
  ArgumentList::getArgumentSymbolReferencePList() const { 
    return myArgumentSymbolReferencePList;
  } 

  Scope& ArgumentList::getScope() const { 
    if (!myScope_p) 
      // trying to set it: 
      if (!myArgumentSymbolReferencePList.empty()) 
	// this const_cast is a hack to be removed once we have a scope algorithm object
	myScope_p=&(const_cast<Scope&>((*(myArgumentSymbolReferencePList.begin()))->getScope()));
    if (!myScope_p) 
      THROW_LOGICEXCEPTION_MACRO("ArgumentList::getScope: not set");
    // this const_cast is a hack to be removed once we have a scope algorithm object
    return const_cast<Scope&>(*myScope_p);
  }

  void ArgumentList::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
    for (ArgumentSymbolReferencePList::iterator i=myArgumentSymbolReferencePList.begin();
	 i!=myArgumentSymbolReferencePList.end();
	 ++i) { 
       (*i)->genericTraversal(anAction_c);
    }
  } 

  void ArgumentList::copyMyselfInto(ArgumentList& theArgumentList,
				    bool makeAlgorithm) const { 
    for (ArgumentSymbolReferencePList::const_iterator anArgumentSymbolReferencePListI=myArgumentSymbolReferencePList.begin();
	 anArgumentSymbolReferencePListI!=myArgumentSymbolReferencePList.end();
	 ++anArgumentSymbolReferencePListI) { 
      ArgumentSymbolReference* theNewArgumentSymbolReference_p(new ArgumentSymbolReference((*anArgumentSymbolReferencePListI)->getSymbol(),
											   (*anArgumentSymbolReferencePListI)->getScope(),
											   (*anArgumentSymbolReferencePListI)->getPosition(),
											   (*anArgumentSymbolReferencePListI)->getIntent(),
											   makeAlgorithm));
      theArgumentList.myArgumentSymbolReferencePList.push_back(theNewArgumentSymbolReference_p);
    }
  } 

} // end of namespace xaifBooster 
