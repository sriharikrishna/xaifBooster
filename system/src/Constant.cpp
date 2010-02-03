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
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/Constant.hpp"
#include "xaifBooster/system/inc/ConstantAlgFactory.hpp"

namespace xaifBooster { 

  const std::string Constant::ourXAIFName("xaif:Constant");
  const std::string Constant::our_myValue_XAIFName("value");
  const std::string Constant::our_myId_XAIFName("vertex_id");

  Constant::Constant(const SymbolType::SymbolType_E aType, 
		     bool makeAlgorithm) : 
    BaseConstant(aType) {
    if (makeAlgorithm)
      myExpressionVertexAlgBase_p=ConstantAlgFactory::instance()->makeNewAlg(*this); 
  }

  Constant::Constant(int anIntVal,
		     bool makeAlgorithm) :
    BaseConstant(SymbolType::INTEGER_STYPE) {
    setint(anIntVal);
    if (makeAlgorithm)
      myExpressionVertexAlgBase_p=ConstantAlgFactory::instance()->makeNewAlg(*this);
  }

  std::string Constant::debug () const { 
    std::ostringstream out;
    out << "Constant[" << this 
	<< ExpressionVertex::debug()
	<< ","
	<< BaseConstant::debug()
	<< "]" << std::ends;  
    return out.str();
  } // end of ExpressionVertex::debug

  ExpressionVertex& Constant::createCopyOfMyself(bool withAlgorithm) const { 
    Constant* aNewConstant_p=new Constant(myType);
    switch(myType) { 
    case SymbolType::INTEGER_STYPE : 
	aNewConstant_p->setint(getint());
	break;
    case SymbolType::REAL_STYPE : 
	aNewConstant_p->setdouble(getdouble());
	break;
    case SymbolType::BOOL_STYPE : 
	aNewConstant_p->setbool(getbool());
	break;
    case SymbolType::STRING_STYPE : 
	aNewConstant_p->setFromString(toString());
	break;
    case SymbolType::CHAR_STYPE : 
	aNewConstant_p->setchar(getchar());
	break;
    default: 
      THROW_LOGICEXCEPTION_MACRO("Constant::createCopyOfMyself: cannot handle " <<
				 SymbolType::toString(myType).c_str());
      break;
    } // end switch
    aNewConstant_p->setId(getId());
    //    aNewConstant_p->passivate();
    aNewConstant_p->setFrontEndType(getFrontEndType());
    return *aNewConstant_p;
  } 
  
  std::string Constant::equivalenceSignature() const { 
    std::ostringstream oss;
    oss << "Constant::" <<  SymbolType::toString(myType) << ",";
    oss << toString().c_str();
    return std::string(oss.str());
  } 

  void
  Constant::printXMLHierarchy(std::ostream& os) const {
    if (myExpressionVertexAlgBase_p
	&& 
	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY)
      getConstantAlgBase().printXMLHierarchy(os);
    else
      printXMLHierarchyImpl(os);
  } // end of printXMLHierarchy

  void Constant::printXMLHierarchyImpl(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str() 
       << " " 
       << our_myId_XAIFName.c_str() 
       << "=\"" 
       << getId().c_str()
       << "\" " 
       << SymbolType::our_attribute_XAIFName.c_str()
       << "=\""
       << SymbolType::toString(myType).c_str()
       << "\" " 
       << FrontEndType::our_attribute_XAIFName.c_str()
       << "=\""
       << myFrontEndType.c_str()
       << "\" " 
       << our_myValue_XAIFName.c_str()
       << "=\""
       << toString().c_str()
       << "\"/>" 
       << std::endl; 
    pm.releaseInstance();
  } 

  ConstantAlgBase&
  Constant::getConstantAlgBase() const {
    if (!myExpressionVertexAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("Constant::getConstantAlgBase: not set");
    return dynamic_cast<ConstantAlgBase&>(*myExpressionVertexAlgBase_p);
  } 

  void Constant::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
    getConstantAlgBase().genericTraversal(anAction_c);
  } 


} // end of namespace 
