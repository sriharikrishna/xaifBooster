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

//#include "xaifBooster/system/inc/ExpressionVertex.hpp"
//#include "xaifBooster/system/inc/VariableSymbolReference.hpp"
//#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
//#include "xaifBooster/system/inc/CallGraph.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/ExpressionVertexAlg.hpp"

namespace xaifBoosterBasicBlockPreaccumulation {

  ExpressionVertexAlg::ExpressionVertexAlg(ExpressionVertex& theContainingExpressionVertex) : 
    ExpressionVertexAlgBase(theContainingExpressionVertex),
    xaifBoosterLinearization::ExpressionVertexAlg(theContainingExpressionVertex),
    myLHSVariable_p(0),
    myRHSVariable_p(0) {
//    myTempPropagationVariable_p(0) {
  }

  ExpressionVertexAlg::~ExpressionVertexAlg() {
    //if (myTempPropagationVariable_p)
    //  delete myTempPropagationVariable_p;
  }

  void ExpressionVertexAlg::setRHSVariable(const Variable& aRHSVariable,
					   const ObjectWithId::Id& statementId) {
    if (myRHSVariable_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionVertexAlg::setRHSVariable: already set to " << myRHSVariable_p->debug().c_str()
				 << " while trying to set for " << aRHSVariable.debug().c_str());
    myRHSVariable_p=&aRHSVariable;
    myStatementId=statementId;
  }

  const Variable& ExpressionVertexAlg::getRHSVariable() const {
    //if (myLHSVariable_p && myRHSVariable_p) THROW_LOGICEXCEPTION_MACRO("BOTH LHSVARIABLE AND RHSVARIABLE ARE SET");
    if (!myRHSVariable_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionVertexAlg::getRHSVariable: not set");
    return *myRHSVariable_p;
  }

  void ExpressionVertexAlg::setLHSVariable(const Variable& aLHSVariable,
					   const ObjectWithId::Id& statementId) {
    if (myLHSVariable_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionVertexAlg::setLHSVariable: already set to " << myLHSVariable_p->debug().c_str()
				 << " while trying to set for " << aLHSVariable.debug().c_str());
    myLHSVariable_p=&aLHSVariable;
    myStatementId=statementId;
  }

  const Variable& ExpressionVertexAlg::getLHSVariable() const {
    //if (myLHSVariable_p && myRHSVariable_p) THROW_LOGICEXCEPTION_MACRO("BOTH LHSVARIABLE AND RHSVARIABLE ARE SET");
    if (!myLHSVariable_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionVertexAlg::getLHSVariable: not set");
    return *myLHSVariable_p;
  }

  bool ExpressionVertexAlg::hasLHSVariable() const {
    return (myLHSVariable_p)?true:false;
  }

  const ObjectWithId::Id& ExpressionVertexAlg::getStatementId() const {
    if (!myStatementId.size())
      THROW_LOGICEXCEPTION_MACRO("ExpressionVertexAlg::getStatementId: not set");
    return myStatementId;
  }

  void ExpressionVertexAlg::printXMLHierarchy(std::ostream& os) const {
    getContaining().printXMLHierarchyImpl(os);
  }

  void ExpressionVertexAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
  }

  std::string ExpressionVertexAlg::debug() const {
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulation::ExpressionVertexAlg["
	<< this
	<< "," << xaifBoosterLinearization::ExpressionVertexAlg::debug().c_str()
//	<< ",myPropagationVariable_p="
//	<< "="
//	<< myTempPropagationVariable_p
	<< "]" << std::ends;  
    return out.str();
  }

} // end namespace xaifBoosterBasicBlockPreaccumulation

