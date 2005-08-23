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
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/Expression.hpp"
#include "xaifBooster/system/inc/ExpressionEdge.hpp"
#include "xaifBooster/system/inc/ExpressionEdgeAlgFactory.hpp"

namespace xaifBooster { 

  const std::string ExpressionEdge::ourXAIFName("xaif:ExpressionEdge");
  const std::string ExpressionEdge::our_myId_XAIFName("edge_id");
  const std::string ExpressionEdge::our_source_XAIFName("source");
  const std::string ExpressionEdge::our_target_XAIFName("target");
  const std::string ExpressionEdge::our_myPosition_XAIFName("position");

  ExpressionEdge::ExpressionEdge(bool makeAlgorithm): 
    myPosition(0) {
    myExpressionEdgeAlgBase_p=0;
    if (makeAlgorithm)
      myExpressionEdgeAlgBase_p=ExpressionEdgeAlgFactory::instance()->makeNewAlg(*this);
  } 

  ExpressionEdge::~ExpressionEdge(){
    if (myExpressionEdgeAlgBase_p) delete myExpressionEdgeAlgBase_p;
  }

  /*
   * if there is an algorithm, then let it decide what to print;
   * otherwise call the local implementation
   */
  void
  ExpressionEdge::printXMLHierarchy(std::ostream& os,
				    const Expression& theExpression) const { 
    if (myExpressionEdgeAlgBase_p
	&& 
	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY)
      myExpressionEdgeAlgBase_p->printXMLHierarchy(os,theExpression);
    else
      printXMLHierarchyImpl(os,theExpression);
  } // end of printXMLHierarchy

  void 
  ExpressionEdge::printXMLHierarchyImpl(std::ostream& os, 
					const Expression& theExpression) const { 
    PrintManager& pm=PrintManager::getInstance(); 
    os << pm.indent() 
       << "<" 
       << ourXAIFName 
       << " " 
       << our_myId_XAIFName 
       << "=\"" 
       << getId().c_str() 
       << "\" " 
       << our_source_XAIFName 
       << "=\"" 
       << theExpression.getSourceOf(*this).getId().c_str() 
       << "\" " 
       << our_target_XAIFName 
       << "=\"" 
       << theExpression.getTargetOf(*this).getId().c_str() 
       << "\" " 
       << our_myPosition_XAIFName 
       << "=\"" 
       << myPosition 
       << "\"/>" 
       << std::endl; 
    pm.releaseInstance();
  } // end printXMLHierarchyImpl

  std::string ExpressionEdge::debug () const { 
    std::ostringstream out;
    out << "ExpressionEdge[" << this << "]" << std::ends;  
    return out.str();
  } // end debug

  void 
  ExpressionEdge::setPosition(const std::string& i) {
    if (myPosition)                              
      THROW_LOGICEXCEPTION_MACRO("ExpressionEdge::setPosition: already set");
    myPosition=atoi(i.c_str());
  } 

  void 
  ExpressionEdge::setPosition(unsigned int i) { 
    if (myPosition)
      THROW_LOGICEXCEPTION_MACRO("ExpressionEdge::setPosition: already set");
    myPosition=i;
  } 

  unsigned int 
  ExpressionEdge::getPosition() const { 
    if (!myPosition)
      THROW_LOGICEXCEPTION_MACRO("ExpressionEdge::getPosition: not set");
    return myPosition;
  }     

  void ExpressionEdge::copyMyselfInto(ExpressionEdge& theCopy) const {
    theCopy.myPosition=myPosition;
    theCopy.setId(getId());
  } // end copyMyselfInto

  ExpressionEdge& ExpressionEdge::createCopyOfMyself(bool withAlgorithm) const {
    ExpressionEdge* theCopy;
    theCopy=new ExpressionEdge(withAlgorithm);
    theCopy->myPosition=myPosition;
    theCopy->setId(getId());
    return *theCopy;
  } // end createCopyOfMyself

  ExpressionEdgeAlgBase&
  ExpressionEdge::getExpressionEdgeAlgBase() const {
    if (!myExpressionEdgeAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionEdge::getExpressionEdgeAlgBase: not set");
    return *myExpressionEdgeAlgBase_p;
  } // end getExpressionEdgeAlgBase

  void ExpressionEdge::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {        
    getExpressionEdgeAlgBase().genericTraversal(anAction_c);
  } // end traversalToChildren 

} // end of namespace xaifBooster 
