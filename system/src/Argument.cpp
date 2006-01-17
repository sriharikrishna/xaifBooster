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
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/ArgumentAlgFactory.hpp"

namespace xaifBooster { 

  const std::string Argument::ourXAIFName("xaif:VariableReference");
  const std::string Argument::our_myId_XAIFName("vertex_id");

  Argument::Argument(bool makeAlgorithm) { 
    myExpressionVertexAlgBase_p=0;
    if (makeAlgorithm)
      myExpressionVertexAlgBase_p=ArgumentAlgFactory::instance()->makeNewAlg(*this);
  } 

  ExpressionVertex& Argument::createCopyOfMyself(bool withAlgorithm) const { 
    Argument* aNewArgument_p=new Argument(withAlgorithm);
    myVariable.copyMyselfInto(aNewArgument_p->myVariable);
    aNewArgument_p->setId(getId());
    return *aNewArgument_p;
  }
 
  void
  Argument::printXMLHierarchy(std::ostream& os) const {
    if (myExpressionVertexAlgBase_p
	&& 
	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY)
      getArgumentAlgBase().printXMLHierarchy(os);
    else
      printXMLHierarchyImpl(os);
  } // end of printXMLHierarchy

  void
  Argument::printXMLHierarchyImpl(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str()
       << " " 
       << our_myId_XAIFName.c_str() 
       << "=\"" 
       << getId().c_str()
       << "\""
       << " ";
    myVariable.printVariableReferenceXMLAttributes(os);
    os << ">" 
       << std::endl;
    myVariable.printXMLHierarchy(os);
    os << pm.indent()
       << "</"
       << ourXAIFName
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of Argument::printXMLHierarchy

  std::string Argument::debug () const { 
    std::ostringstream out;
    out << "Argument[" << this << ","
	<< ExpressionVertex::debug().c_str()
	<< ",myVariable=" << myVariable.debug()
	<< "]" << std::ends;  
    return out.str();
  } // end of Argument::debug

  Variable& 
  Argument::getVariable() { 
    return myVariable;
  }

  const Variable& 
  Argument::getVariable() const { 
    return myVariable;
  }

  std::string Argument::equivalenceSignature() const { 
    return myVariable.equivalenceSignature();
  }

  ArgumentAlgBase&
  Argument::getArgumentAlgBase() const {
    if (!myExpressionVertexAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("Argument::getArgumentAlgBase: not set");
    return dynamic_cast<ArgumentAlgBase&>(*myExpressionVertexAlgBase_p);
  } // end getArgumentAlgBase

  void Argument::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
    getArgumentAlgBase().genericTraversal(anAction_c);
  } // end traversalToChildren 

  bool Argument::isArgument() const { 
    return true;
  } // end Argument::isArgument 

} // end of namespace xaifBooster 
