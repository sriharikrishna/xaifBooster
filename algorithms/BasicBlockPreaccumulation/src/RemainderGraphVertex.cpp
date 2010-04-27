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

#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/Scope.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

#include "xaifBooster/algorithms/TypeChange/inc/TemporariesHelper.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/RemainderGraphVertex.hpp"

namespace xaifBoosterBasicBlockPreaccumulation {

  RemainderGraphVertex::RemainderGraphVertex() :
    myPropagationVariable_p (NULL) {
  }

  RemainderGraphVertex::~RemainderGraphVertex() {
    if (myPropagationVariable_p)
      delete myPropagationVariable_p;
  }

  std::string RemainderGraphVertex::debug() const { 
    std::ostringstream out;
    out << "RemainderGraphVertex[" << this 
	<< ",myPropagationVariable_p=" << myPropagationVariable_p
	<< "]" << std::ends;  
    return out.str();
  } 

  void RemainderGraphVertex::replacePropagationVariable() {
    if (!hasOriginalVariable())
      THROW_LOGICEXCEPTION_MACRO("RemainderGraphVertex::replacePropagationVariable: myOriginalVariable_p not set!");
    Scope& theCurrentCfgScope (ConceptuallyStaticInstances::instance()->getTraversalStack().getCurrentCallGraphVertexInstance().getControlFlowGraph().getScope());
    myPropagationVariable_p  = new Variable();
    xaifBoosterTypeChange::TemporariesHelper aHelper("RemainderGraphVertex::replacePropagationVariable",
						     getOriginalVariable());
    VariableSymbolReference* theVariableSymbolReference_p =
     new VariableSymbolReference(aHelper.makeTempSymbol(theCurrentCfgScope,
                         ConceptuallyStaticInstances::instance()->getPropagationVariableNameCreator(),
                         true),
        theCurrentCfgScope);
    if (aHelper.needsAllocation()){
      
    }
    theVariableSymbolReference_p->setId("1");
    theVariableSymbolReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulation::RemainderGraphVertex::replacePropagationVariable");
    myPropagationVariable_p->supplyAndAddVertexInstance(*theVariableSymbolReference_p);
    myPropagationVariable_p->getAliasMapKey().setTemporary();
    myPropagationVariable_p->getDuUdMapKey().setTemporary();
  } 

  void RemainderGraphVertex::createNewPropagationVariable(const Variable& variableToMatch) {
    Scope& theCurrentCfgScope (ConceptuallyStaticInstances::instance()->getTraversalStack().getCurrentCallGraphVertexInstance().getControlFlowGraph().getScope());
    myPropagationVariable_p  = new Variable();
    VariableSymbolReference* theVariableSymbolReference_p =
      new VariableSymbolReference(
        xaifBoosterTypeChange::TemporariesHelper("RemainderGraphVertex::createNewPropagationVariable",
                                                 variableToMatch
        ).makeTempSymbol(theCurrentCfgScope,
                         ConceptuallyStaticInstances::instance()->getPropagationVariableNameCreator(),
                         true),
        theCurrentCfgScope
    );
    theVariableSymbolReference_p->setId("1");
    theVariableSymbolReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulation::RemainderGraphVertex::createNewPropagationVariable");
    myPropagationVariable_p->supplyAndAddVertexInstance(*theVariableSymbolReference_p);
    myPropagationVariable_p->getAliasMapKey().setTemporary();
    myPropagationVariable_p->getDuUdMapKey().setTemporary();
  } 

  const Variable& RemainderGraphVertex::getPropagationVariable() const {
    if (myPropagationVariable_p)
      return *myPropagationVariable_p;
    else if (hasOriginalVariable())
      return getOriginalVariable();
    else
      THROW_LOGICEXCEPTION_MACRO("RemainderGraphVertex::getPropagationVariable: neither myPropagationVariable_p nor myOriginalVariable_p set");
  } 

} 

