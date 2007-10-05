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

#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/AssignmentAlgBase.hpp"
#include "xaifBooster/system/inc/AssignmentAlgFactory.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/GraphVizDisplay.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

namespace xaifBooster { 

  const std::string Assignment::our_myLHS_XAIFName("xaif:AssignmentLHS");
  const std::string Assignment::our_myRHS_XAIFName("xaif:AssignmentRHS");
  const std::string Assignment::ourXAIFName("xaif:Assignment");
  const std::string Assignment::our_myId_XAIFName("statement_id");
  const std::string Assignment::our_myDoMapKey_XAIFName("do_chain");

  Assignment::Assignment(bool makeAlgorithm) : 
    myRHS(makeAlgorithm) {
    if (makeAlgorithm)
      myBasicBlockElementAlgBase_p=AssignmentAlgFactory::instance()->makeNewAlg(*this); 
  } 

  Assignment::~Assignment() {
  } 

  AssignmentAlgBase& 
  Assignment::getAssignmentAlgBase() const { 
    if (!myBasicBlockElementAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("Assignment::getAssignmentAlgBase: not set");
    return dynamic_cast<AssignmentAlgBase&>(*myBasicBlockElementAlgBase_p);
  }

  void
  Assignment::printXMLHierarchy(std::ostream& os) const { 
    if (myBasicBlockElementAlgBase_p
	&& 
	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY)
      getAssignmentAlgBase().printXMLHierarchy(os);
    else 
      printXMLHierarchyImpl(os);
  }

  void
  Assignment::printXMLHierarchyImpl(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str()
       << " " 
       << our_myId_XAIFName.c_str() 
       << "=\"" 
       << getId().c_str()
       << "\""
       << ">" 
       << std::endl;
    printXMLHierarchyLHS(os);
    printXMLHierarchyRHS(os);
    os << pm.indent()
       << "</"
       << ourXAIFName.c_str()
       << ">"
       << std::endl;
    pm.releaseInstance();
  }

  void 
  Assignment::printXMLHierarchyLHS(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << our_myLHS_XAIFName.c_str()
       << " ";
    myLHS.printVariableReferenceXMLAttributes(os);
    os << ">" 
       << std::endl;
    myLHS.printXMLHierarchy(os);
    os << pm.indent()
       << "</"
       << our_myLHS_XAIFName.c_str()
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of Assignment::printXMLHierarchyLHS

  void 
  Assignment::printXMLHierarchyRHS(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << our_myRHS_XAIFName.c_str()
       << ">"
       << std::endl;
    myRHS.printXMLHierarchy(os);
    os << pm.indent()
       << "</"
       << our_myRHS_XAIFName.c_str()
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of Assignment::printXMLHierarchyRHS

  Variable& 
  Assignment::getLHS() { 
    return myLHS;
  }

  Expression& 
  Assignment::getRHS() {
    return myRHS;
  }

  const Variable& 
  Assignment::getLHS() const { 
    return myLHS;
  }

  const Expression& 
  Assignment::getRHS() const { 
    return myRHS;
  }

  std::string Assignment::debug () const { 
    std::ostringstream out;
    out << "Assignment[" 
	<< this 
	<< BasicBlockElement::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  } // end of Assignment::debug

  void Assignment::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
    getAssignmentAlgBase().genericTraversal(anAction_c);
    myRHS.genericTraversal(anAction_c);
    myLHS.genericTraversal(anAction_c);
  } 

  StatementIdSetMapKey& Assignment::getDoMapKey() { 
    return myDoMapKey;
  } 

  const StatementIdSetMapKey& Assignment::getDoMapKey() const { 
    return myDoMapKey;
  }


} // end of namespace xaifBooster 
