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
#include "xaifBooster/system/inc/BooleanOperation.hpp"
#include "xaifBooster/system/inc/BooleanOperationAlgFactory.hpp"

namespace xaifBooster { 

  const std::string BooleanOperation::ourXAIFName("xaif:BooleanOperation");
  const std::string BooleanOperation::our_myType_XAIFName("name");
  const std::string BooleanOperation::our_myId_XAIFName("vertex_id");

  BooleanOperation::BooleanOperation(BooleanOperationType::BooleanOperationType_E theType,
				     bool makeAlgorithm) :
    myType(theType) {
    if (makeAlgorithm)
      myExpressionVertexAlgBase_p=BooleanOperationAlgFactory::instance()->makeNewAlg(*this); 
  }

  ExpressionVertex& BooleanOperation::createCopyOfMyself(bool withAlgorithm) const { 
    BooleanOperation* aNewBooleanOperation_p=new BooleanOperation(myType);
    aNewBooleanOperation_p->setId(getId());
    //     aNewBooleanOperation_p->setId(getId());
    //     if (!isActive())
    //       aNewBooleanOperation_p->passivate();
    return *aNewBooleanOperation_p;
  } 

  std::string BooleanOperation::equivalenceSignature() const { 
    std::ostringstream oss;
    oss << "BooleanOperation::" 
	<< BooleanOperationType::toString(myType).c_str() 
	<< std::ends;
    return std::string(oss.str());
  }

  std::string BooleanOperation::debug() const { 
    std::ostringstream oss;
    oss << "BooleanOperation[" << this << "," 
	<< ExpressionVertex::debug().c_str()
	<< "myType=" << BooleanOperationType::toString(myType).c_str()
	<< "]" << std::ends;
    return std::string(oss.str());
  }

  void
  BooleanOperation::printXMLHierarchy(std::ostream& os) const {
    if (myExpressionVertexAlgBase_p
	&& 
	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY)
      getBooleanOperationAlgBase().printXMLHierarchy(os);
    else
      printXMLHierarchyImpl(os);
  } // end of printXMLHierarchy

  void BooleanOperation::printXMLHierarchyImpl(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName 
       << " " 
       << our_myId_XAIFName 
       << "=\"" 
       << getId().c_str()
       << "\" " 
       << our_myType_XAIFName
       << "=\""
       << BooleanOperationType::toString(myType).c_str()
       << "\"/>" 
       << std::endl; 
    pm.releaseInstance();
  } 

  BooleanOperationAlgBase&
  BooleanOperation::getBooleanOperationAlgBase() const {
    if (!myExpressionVertexAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("BooleanOperation::getBooleanOperationAlgBase: not set");
    return dynamic_cast<BooleanOperationAlgBase&>(*myExpressionVertexAlgBase_p);
  } 

  void BooleanOperation::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
    getBooleanOperationAlgBase().genericTraversal(anAction_c);
  } 

  BooleanOperationType::BooleanOperationType_E BooleanOperation::getType() const { 
    return myType;
  } 

} // end of namespace 
