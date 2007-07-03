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
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/SubroutineNotFoundException.hpp"


#include "xaifBooster/algorithms/TypeChange/inc/SymbolAlg.hpp"
#include "xaifBooster/algorithms/TypeChange/inc/ConcreteArgumentAlg.hpp"


namespace xaifBoosterTypeChange {  

  SymbolAlg::SymbolAlg(const Symbol& theContainingSymbol) : 
    SymbolAlgBase(theContainingSymbol),
    myIsExternalFlag(false),
    myHasHandCodedWrapperFlag(false),
    myHandCodeWrapperSymbolReference_p(0) { 
  }

  SymbolAlg::~SymbolAlg() { 
    if (myHandCodeWrapperSymbolReference_p)
      delete myHandCodeWrapperSymbolReference_p;
  } 

  void SymbolAlg::printXMLHierarchy(std::ostream& os) const { 
    getContaining().printXMLHierarchyImpl(os);
  }

  std::string 
  SymbolAlg::debug() const { 
    std::ostringstream out;
    out << "xaifBoosterTypeChange::SymbolAlg["
	<< this 
	<< ","
 	<< SymbolAlgBase::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  }

  void SymbolAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  bool SymbolAlg::isExternal() const { 
    return myIsExternalFlag;
  }

  void SymbolAlg::setExternal() { 
    if (myIsExternalFlag)
      THROW_LOGICEXCEPTION_MACRO("SymbolAlg::setExternal: already set");
    myIsExternalFlag=true;
  }

  void SymbolAlg::internalRename(const SymbolReference& theOriginalSymbolReference) { 
    if (myIsExternalFlag)
      THROW_LOGICEXCEPTION_MACRO("SymbolAlg::internalRename: set to external");
    if (myHandCodeWrapperSymbolReference_p)
      THROW_LOGICEXCEPTION_MACRO("SymbolAlg::internalRename: already renamed");
    makeReplacementSymbol(theOriginalSymbolReference);
  }

  bool SymbolAlg::hasHandCodedWrapper() const { 
    if (!myIsExternalFlag)
      THROW_LOGICEXCEPTION_MACRO("SymbolAlg::hasHandCodedWrapper: is not external");
    return myHasHandCodedWrapperFlag;
  } 

  void SymbolAlg::makeReplacementSymbol(const SymbolReference& theOriginalSymbolReference) { 
    // make the replacement symbol:
    const std::string theNewName(ConceptuallyStaticInstances::instance()->getCallGraph().getPrefix()+
			   theOriginalSymbolReference.getSymbol().getId());
    Symbol& theNewSymbol(ConceptuallyStaticInstances::instance()->
			 getCallGraph().getScopeTree().getScopeById(theOriginalSymbolReference.getScope().getId()).
			 getSymbolTable().
			 addSymbol(theNewName,
				   theOriginalSymbolReference.getSymbol().getSymbolKind(),
				   theOriginalSymbolReference.getSymbol().getSymbolType(),
				   theOriginalSymbolReference.getSymbol().getSymbolShape(),
				   true,
				   true));
    theNewSymbol.setAnnotation("SymbolAlg::makeReplacementSymbol");
    myHandCodeWrapperSymbolReference_p=new SymbolReference(theNewSymbol,theOriginalSymbolReference.getScope());
  } 

  void SymbolAlg::setHandCodedWrapper(const SymbolReference& theOriginalSymbolReference) { 
    if (!myIsExternalFlag)
      THROW_LOGICEXCEPTION_MACRO("SymbolAlg::setHandCodedWrapper: is not external");
    if (myHasHandCodedWrapperFlag)
      THROW_LOGICEXCEPTION_MACRO("SymbolAlg::setHandCodedWrapper: already set");
    myHasHandCodedWrapperFlag=true;
    makeReplacementSymbol(theOriginalSymbolReference);
  }
    
  const ActivityPattern& SymbolAlg::getActivityPattern() const { 
    if (!myHasHandCodedWrapperFlag)
      THROW_LOGICEXCEPTION_MACRO("SymbolAlg::getActivityPattern: has no hand coded wrapper");
    return myActivityPattern;
  } 

  ActivityPattern& SymbolAlg::getActivityPattern() { 
    if (!myHasHandCodedWrapperFlag)
      THROW_LOGICEXCEPTION_MACRO("SymbolAlg::getActivityPattern: has no hand coded wrapper");
    return myActivityPattern;
  } 

  const SymbolReference& SymbolAlg::getReplacementSymbolReference() const { 
    if (!myHandCodeWrapperSymbolReference_p)
      THROW_LOGICEXCEPTION_MACRO("SymbolAlg::getReplacementSymbolReference: has no replacement");
    return *myHandCodeWrapperSymbolReference_p;
  }

  bool SymbolAlg::hasReplacementSymbolReference() const { 
    return (myHandCodeWrapperSymbolReference_p)?true:false;
  }
    
} // end of namespace 
