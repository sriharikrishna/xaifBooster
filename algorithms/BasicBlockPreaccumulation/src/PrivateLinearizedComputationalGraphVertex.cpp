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
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertex.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  PrivateLinearizedComputationalGraphVertex::PrivateLinearizedComputationalGraphVertex() :
    myOriginalVariable_p (0),
    myPropagationVariable_p (0),
    mySAX_p (0) {
  }

  PrivateLinearizedComputationalGraphVertex::~PrivateLinearizedComputationalGraphVertex() {
    if (myPropagationVariable_p)
      delete myPropagationVariable_p;
  }

  bool PrivateLinearizedComputationalGraphVertex::hasOriginalVariable() const {
   return (myOriginalVariable_p) ? true : false;
  } // end PrivateLinearizedComputationalGraphVertex::hasOriginalVariable() 

  const Variable& PrivateLinearizedComputationalGraphVertex::getOriginalVariable() const {
    if (!myOriginalVariable_p)
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphVertex::getOriginalVariable: not set");
    return *myOriginalVariable_p;
  } // end PrivateLinearizedComputationalGraphVertex::getOriginalVariable()

  void PrivateLinearizedComputationalGraphVertex::zeroOriginalVariable() {
    myOriginalVariable_p = 0;
  } // end PrivateLinearizedComputationalGraphVertex::zeroOriginalVariable()

  void PrivateLinearizedComputationalGraphVertex::setOriginalVariable(const Variable& aVariable,
								      const ObjectWithId::Id& aStatementId) {
    if (myOriginalVariable_p)
//      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphVertex::setOriginalVariable: already set to " << myOriginalVariable_p << " while trying to set to " << &aVariable);
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphVertex::setOriginalVariable: already set to " << myOriginalVariable_p->debug().c_str()
                                 << " while trying to set to " << aVariable.debug().c_str());
    myOriginalVariable_p = &aVariable;
    myStatementId = aStatementId;
  } // end PrivateLinearizedComputationalGraphVertex::setOriginalVariable()

  const Variable& PrivateLinearizedComputationalGraphVertex::getPropagationVariable() const {
    if (myPropagationVariable_p)
      return *myPropagationVariable_p;

    if (myOriginalVariable_p)
      return *myOriginalVariable_p;

    // if we havent already created a propagation variable, and there is no LHS variable, then make a new one
    createOrReplacePropagationVariable();
    return *myPropagationVariable_p;
  } // end PrivateLinearizedComputationalGraphVertex::getPropagationVariable()

  void PrivateLinearizedComputationalGraphVertex::createOrReplacePropagationVariable() const {
    Scope& theGlobalScope(ConceptuallyStaticInstances::instance()->getCallGraph().getScopeTree().getGlobalScope());
    myPropagationVariable_p  = new Variable();
    VariableSymbolReference* theVariableSymbolReference_p = new VariableSymbolReference(theGlobalScope.getSymbolTable().addUniqueAuxSymbol(SymbolKind::VARIABLE,
                                                                                                                                           SymbolType::REAL_STYPE,
                                                                                                                                           SymbolShape::SCALAR,
                                                                                                                                           true),
                                                                                        theGlobalScope);
    theVariableSymbolReference_p->setId("1");
    theVariableSymbolReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulation::ExpressionVertexAlg::getPropagationVariable");
    myPropagationVariable_p->supplyAndAddVertexInstance(*theVariableSymbolReference_p);
    myPropagationVariable_p->getAliasMapKey().setTemporary();
    myPropagationVariable_p->getDuUdMapKey().setTemporary();
  } // end PrivateLinearizedComputationalGraphVertex::createOrReplacePropagationVariable()

  const ObjectWithId::Id& PrivateLinearizedComputationalGraphVertex::getStatementId() const {
    if (!myStatementId.size())
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphVertex::getStatementId: not set");
    return myStatementId;
  } // end PrivateLinearizedComputationalGraphVertex::getStatementId()

  bool PrivateLinearizedComputationalGraphVertex::hasSAX() const {
    return (mySAX_p) ? true : false;
  } // end PrivateLinearizedComputationalGraphVertex::hasSAX()

  xaifBoosterDerivativePropagator::DerivativePropagatorSaxpy& PrivateLinearizedComputationalGraphVertex::getSAX() const {
    if (!mySAX_p)
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphVertex::getSAX: not set");
    return *mySAX_p;
  } // end PrivateLinearizedComputationalGraphVertex::getSAX()

  void PrivateLinearizedComputationalGraphVertex::setSAX(xaifBoosterDerivativePropagator::DerivativePropagatorSaxpy& aSAX) const {
    if (mySAX_p)
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphVertex::setSAX: already set");
    mySAX_p = &aSAX;
  } // end PrivateLinearizedComputationalGraphVertex::setSAX()

  std::string PrivateLinearizedComputationalGraphVertex::debug() const { 
    std::ostringstream out;
    out << "PrivateLinearizedComputationalGraphVertex[" << this 
	<< ",myOriginalVariable_p=" << myOriginalVariable_p
	<< ",myPropagationVariable_p=" << myPropagationVariable_p
	<< "]" << std::ends;  
    return out.str();
  } // end PrivateLinearizedComputationalGraphVertex::debug()

} // end namespace xaifBoosterBasicBlockPreaccumulation

