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

#include "xaifBooster/algorithms/CodeReplacement/inc/ReplacementList.hpp"
#include "xaifBooster/algorithms/CodeReplacement/inc/Replacement.hpp"

namespace xaifBoosterCodeReplacement { 

  const std::string ReplacementList::ourXAIFName("xaif:ReplacementList");
  const std::string ReplacementList::our_myTemplateName_XAIFName("template_name");

  ReplacementList::ReplacementList (const Symbol& theSymbol,
				    const Scope& theScope,
				    const Scope& theCFGScope,
				    const std::string& aTemplateName,
				    const ArgumentList& anArgumentList) : 
    ControlFlowGraphCommonAttributes(theSymbol, theScope, theCFGScope),
    myTemplateName(aTemplateName),
    myArgumentList(anArgumentList) { 
  } 

  ReplacementList::~ReplacementList(){
    for (ReplacementPList::iterator i=myReplacementPList.begin();
	 i!=myReplacementPList.end();
	 ++i) 
      if (*i)
	delete (*i);
  }

  void
  ReplacementList::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str()
       << " ";
    printAttributes(os,mySymbolReference);
    os << " "
       << our_myTemplateName_XAIFName.c_str() 
       << "=\"" 
       << myTemplateName.c_str()
       << "\""
       << ">"
       << std::endl; 
    myArgumentList.printXMLHierarchy(os);
    for (ReplacementPList::const_iterator i=myReplacementPList.begin();
	 i!=myReplacementPList.end();
	 ++i) 
      (*i)->printXMLHierarchy(os);
    os << pm.indent()
       << "</"
       << ourXAIFName.c_str()
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of ReplacementList::printXMLHierarchy

  std::string ReplacementList::debug () const { 
    std::ostringstream out;
    out << "ReplacementList[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of ReplacementList::debug

  const std::string& ReplacementList::getTemplateName() const {
    return myTemplateName; 
  }

  Replacement& ReplacementList::addReplacement(unsigned int aPlaceHolder) { 
    for (ReplacementPList::iterator i=myReplacementPList.begin();
	 i!=myReplacementPList.end();
	 ++i) 
      if (aPlaceHolder==(*i)->getPlaceHolder())
	THROW_LOGICEXCEPTION_MACRO("ReplacementList::addReplacement: place holder "
				   << aPlaceHolder
				   << " already in use");
    Replacement* aReplacement_p=new Replacement(aPlaceHolder);
    myReplacementPList.push_back(aReplacement_p);
    return *aReplacement_p;
  } 

  const ArgumentList& ReplacementList::getArgumentList() const { 
    return myArgumentList;
  } 

} 
