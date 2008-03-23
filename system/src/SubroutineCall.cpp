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
#include "xaifBooster/system/inc/SubroutineCall.hpp"
#include "xaifBooster/system/inc/SubroutineCallAlgBase.hpp"
#include "xaifBooster/system/inc/SubroutineCallAlgFactory.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/ControlFlowGraph.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"
#include "xaifBooster/system/inc/SubroutineNotFoundException.hpp"

namespace xaifBooster { 

  const std::string SubroutineCall::ourXAIFName("xaif:SubroutineCall");
  const std::string SubroutineCall::our_myId_XAIFName("statement_id");
  const std::string SubroutineCall::our_symbolId_XAIFName("symbol_id");
  const std::string SubroutineCall::our_scopeId_XAIFName("scope_id");
  bool SubroutineCall::ourBlackBoxOptimism(true);

  SubroutineCall::SubroutineCall (const Symbol& theSymbol,
				  const Scope& theScope,
				  const ActiveUseType::ActiveUseType_E activeUse,
				  bool makeAlgorithm) :
    mySymbolReference(theSymbol,theScope),
    myActiveUse(activeUse),
    myActiveUseSetFlag(false){ 
    if (makeAlgorithm)
      myBasicBlockElementAlgBase_p=SubroutineCallAlgFactory::instance()->makeNewAlg(*this); 
  } 

  SubroutineCall::~SubroutineCall() { 
    for (ConcreteArgumentPList::iterator i=myConcreteArgumentPList.begin();
	 i!=myConcreteArgumentPList.end();
	 ++i) { 
      if (*i)
	delete *i;
    }
  } 

  SubroutineCallAlgBase& 
  SubroutineCall::getSubroutineCallAlgBase() const { 
    if (!myBasicBlockElementAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("SubroutineCall::getSubroutineCallAlgBase: not set");
    return dynamic_cast<SubroutineCallAlgBase&>(*myBasicBlockElementAlgBase_p);
  }

  void
  SubroutineCall::printXMLHierarchy(std::ostream& os) const { 
    if (myBasicBlockElementAlgBase_p
// 	&& 
// 	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY
	)
      getSubroutineCallAlgBase().printXMLHierarchy(os);
    else 
      printXMLHierarchyImpl(os);
  }

  void
  SubroutineCall::printXMLHierarchyImpl(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str() 
       << " " 
       << our_myId_XAIFName.c_str() 
       << "=\"" 
       << getId().c_str()
       << "\" " 
       << our_symbolId_XAIFName.c_str() 
       << "=\"" 
       << mySymbolReference.getSymbol().getId().c_str()
       << "\" " 
       << our_scopeId_XAIFName.c_str() 
       << "=\"" 
       << mySymbolReference.getScope().getId().c_str()
       << "\" " 
       << ActiveUseType::our_attribute_XAIFName.c_str() 
       << "=\"" 
       << ActiveUseType::toString(myActiveUse).c_str()
       << "\">" 
       << std::endl;
    for (ConcreteArgumentPList::const_iterator i=myConcreteArgumentPList.begin();
	 i!=myConcreteArgumentPList.end();
	 ++i)
      (*i)->printXMLHierarchy(os);
    os << pm.indent() 
       << "</"
       << ourXAIFName.c_str() 
       << ">" 
       << std::endl;
    pm.releaseInstance();
  } 

  std::string SubroutineCall::debug () const { 
    std::ostringstream out;
    out << "SubroutineCall[" 
	<< this 
	<< BasicBlockElement::debug().c_str()
	<< "myActiveUse"
	<< "="
	<< ActiveUseType::toString(myActiveUse).c_str()
	<< "]" << std::ends;  
    return out.str();
  } // end of SubroutineCall::debug

  void SubroutineCall::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
    getSubroutineCallAlgBase().genericTraversal(anAction_c);
  } 

  SubroutineCall::ConcreteArgumentPList& 
  SubroutineCall::getConcreteArgumentPList() { 
    return myConcreteArgumentPList;
  } 
  
  const SubroutineCall::ConcreteArgumentPList& 
  SubroutineCall::getConcreteArgumentPList() const { 
    return myConcreteArgumentPList;
  } 

  const ConcreteArgument& SubroutineCall::getConcreteArgument(unsigned int aPosition) const { 
    for(ConcreteArgumentPList::const_iterator i = myConcreteArgumentPList.begin();
	i!=myConcreteArgumentPList.end();
	++i) { 
      if ((*i)->getPosition()==aPosition)
	return **i;
    }
    THROW_LOGICEXCEPTION_MACRO("SubroutineCall::getConcreteArgument: invalid position" << aPosition);
  } 
  
  const SymbolReference& 
  SubroutineCall::getSymbolReference() const { 
    return mySymbolReference;
  } 

  bool SubroutineCall::getActiveType() const { 
    return mySymbolReference.getSymbol().getActiveTypeFlag();
  }

  bool SubroutineCall::getActiveFlag() const { 
    bool theAnswer(true);
    switch (myActiveUse) {
    case ActiveUseType::ACTIVEUSE: 
      theAnswer=true;
      break;
    case ActiveUseType::PASSIVEUSE:
      theAnswer=false;
      break;
    case ActiveUseType::UNDEFINEDUSE:
      { 
	if (theAnswer=getActiveType())
	  myActiveUse=ActiveUseType::ACTIVEUSE;
	else 
	  myActiveUse=ActiveUseType::PASSIVEUSE;
	myActiveUseSetFlag=true;
	break;
      }
    default: 
      THROW_LOGICEXCEPTION_MACRO("SubroutineCall::getActiveFlag: unknown value of myActiveUse:"
				 << myActiveUse);
      break;
    }
    return theAnswer;
  } 

  void SubroutineCall::setActiveUse(ActiveUseType::ActiveUseType_E anActiveUse) { 
    if (myActiveUseSetFlag)
      THROW_LOGICEXCEPTION_MACRO("SubroutineCall::setActiveUseType: already set, cannot reset");
    myActiveUse=anActiveUse;
    myActiveUseSetFlag=true;
  } 

  ActiveUseType::ActiveUseType_E SubroutineCall::getActiveUse() const { 
    return myActiveUse;
  } 

  bool SubroutineCall::overwrites(const Variable& aVariable) const { 
    // this is a hack until we have better analysis
    // see if it matches anything in the subroutine's mod list: 
    try { 
      const ControlFlowGraph& theSubroutine(ConceptuallyStaticInstances::instance()->getCallGraph().
 					  getSubroutineBySymbolReference(getSymbolReference()).getControlFlowGraph());
      if (theSubroutine.overwrites(aVariable.getVariableSymbolReference()))
	return true;
      // check if it is in the argument list: 
      for (ConcreteArgumentPList::const_iterator i=myConcreteArgumentPList.begin();
	   i!=myConcreteArgumentPList.end();
	   ++i) { 
	if((*i)->isArgument() 
	   && 
	   (*i)->getArgument().getVariable().equivalentTo(aVariable)) { 
	  // is an argument, check the mod-list for the corresponding formal 
	  // find the corresponding formal: 
	  const ArgumentList::ArgumentSymbolReferencePList& theFormalList(theSubroutine.getArgumentList().getArgumentSymbolReferencePList());
	  for (ArgumentList::ArgumentSymbolReferencePList::const_iterator formalIt=theFormalList.begin();
	       formalIt!=theFormalList.end();
	       ++formalIt) { 
	    if ((*formalIt)->getPosition()==(*i)->getPosition()
		&& 
		theSubroutine.overwrites(**formalIt)) { 
	      return true;
	    }
	  }
	}
      }
      return false;
    }
    catch (SubroutineNotFoundException e) { 
      if (ourBlackBoxOptimism)
	return false; 
      else
	return true; 
    } 
  } 

  bool SubroutineCall::getBlackBoxOptimism() { 
    return ourBlackBoxOptimism; 
  } 
  
  void SubroutineCall::noBlackBoxOptimism() { 
    ourBlackBoxOptimism=false;
  } 

} // end of namespace xaifBooster 
