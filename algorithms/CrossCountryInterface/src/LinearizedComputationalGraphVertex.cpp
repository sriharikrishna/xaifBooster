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

#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraphVertex.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/Scope.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

namespace xaifBoosterCrossCountryInterface {

  LinearizedComputationalGraphVertex::LinearizedComputationalGraphVertex() :
    myOriginalVariable_p (NULL),
    myPropagationVariable_p (NULL) {
  }

  LinearizedComputationalGraphVertex::~LinearizedComputationalGraphVertex() {
    if (myPropagationVariable_p)
      delete myPropagationVariable_p;
  }

  std::string LinearizedComputationalGraphVertex::debug() const { 
    std::ostringstream out;
    out << "LinearizedComputationalGraphVertex[" << this 
	<< ",myOriginalVariable_p=" << myOriginalVariable_p
	<< ",myPropagationVariable_p=" << myPropagationVariable_p
	<< ",myStatementId=" << myStatementId
	<< "]" << std::ends;  
    return out.str();
  } // end LinearizedComputationalGraphVertex::debug()

  bool LinearizedComputationalGraphVertex::hasOriginalVariable() const {
   return (myOriginalVariable_p) ? true : false;
  } // end LinearizedComputationalGraphVertex::hasOriginalVariable() 

  void LinearizedComputationalGraphVertex::setOriginalVariable(const Variable& aVariable,
							       const ObjectWithId::Id& aStatementId) {
    if (myOriginalVariable_p)
      THROW_LOGICEXCEPTION_MACRO("LinearizedComputationalGraphVertex::setOriginalVariable: already set to " << myOriginalVariable_p->debug().c_str()
                                 << " while trying to set to " << aVariable.debug().c_str());
    myOriginalVariable_p = &aVariable;
    myStatementId = aStatementId;
  } // end LinearizedComputationalGraphVertex::setOriginalVariable()

  const Variable& LinearizedComputationalGraphVertex::getOriginalVariable() const {
    if (!myOriginalVariable_p)
      THROW_LOGICEXCEPTION_MACRO("LinearizedComputationalGraphVertex::getOriginalVariable: not set");
    return *myOriginalVariable_p;
  } // end LinearizedComputationalGraphVertex::getOriginalVariable()

  const ObjectWithId::Id& LinearizedComputationalGraphVertex::getStatementId() const {
    if (!myStatementId.size())
      THROW_LOGICEXCEPTION_MACRO("LinearizedComputationalGraphVertex::getStatementId: not set");
    return myStatementId;
  } // end LinearizedComputationalGraphVertex::getStatementId()

  void LinearizedComputationalGraphVertex::createNewPropagationVariable() {
    Scope& theGlobalScope(ConceptuallyStaticInstances::instance()->getCallGraph().getScopeTree().getGlobalScope());
    myPropagationVariable_p  = new Variable();
    VariableSymbolReference* theVariableSymbolReference_p = new VariableSymbolReference(theGlobalScope.getSymbolTable().addUniqueAuxSymbol(SymbolKind::VARIABLE,
                                                                                                                                           SymbolType::REAL_STYPE,
                                                                                                                                           SymbolShape::SCALAR,
                                                                                                                                           true),
                                                                                        theGlobalScope);
    theVariableSymbolReference_p->setId("1");
    theVariableSymbolReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulation::LinearizedComputationalGraphVertex::createNewPropagationVariable");
    myPropagationVariable_p->supplyAndAddVertexInstance(*theVariableSymbolReference_p);
    myPropagationVariable_p->getAliasMapKey().setTemporary();
    myPropagationVariable_p->getDuUdMapKey().setTemporary();
  } // end LinearizedComputationalGraphVertex::createNewPropagationVariable()

  const Variable& LinearizedComputationalGraphVertex::getPropagationVariable() const {
    if (myPropagationVariable_p)
      return *myPropagationVariable_p;
    else if (myOriginalVariable_p)
      return *myOriginalVariable_p;
    else
      THROW_LOGICEXCEPTION_MACRO("LinearizedComputationalGraphVertex::getPropagationVariable: neither myPropagationVariable_p nor myOriginalVariable_p set");
  } // end LinearizedComputationalGraphVertex::getPropagationVariable()

} // end namespace xaifBoosterCrossCountryInterface

