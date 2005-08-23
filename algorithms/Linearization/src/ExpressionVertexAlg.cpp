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

#include "xaifBooster/system/inc/ExpressionVertex.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

#include "xaifBooster/algorithms/Linearization/inc/ExpressionVertexAlg.hpp"

namespace xaifBoosterLinearization { 

  ExpressionVertexAlg::ExpressionVertexAlg(ExpressionVertex& theContainingExpressionVertex) : 
    ExpressionVertexAlgBase(theContainingExpressionVertex),
    myAuxilliaryVariable_p(0),
    myReplacementAssignment_p(0), 
    myActiveFlag(true) { 
  }

  ExpressionVertexAlg::~ExpressionVertexAlg() { 
    if (myAuxilliaryVariable_p)
      delete myAuxilliaryVariable_p;
    if (myReplacementAssignment_p)
      delete myReplacementAssignment_p;
  }

  std::string 
  ExpressionVertexAlg::debug() const { 
    std::ostringstream out;
    out << "xaifBoosterLinearization::ExpressionVertexAlg["
	<< this 
	<< ","
	<< "myAuxilliaryVariable_p="
	<< "="
	<< myAuxilliaryVariable_p
	<< ","
	<< "myReplacementAssignment_p="
	<< "="
	<< myReplacementAssignment_p
	<< ","
	<< "myActiveFlag="
	<< "="
	<< myActiveFlag
	<< "]" << std::ends;  
    return out.str();
  }

  void
  ExpressionVertexAlg::printXMLHierarchy(std::ostream& os) const { 
    getContaining().printXMLHierarchyImpl(os);
  }

  void ExpressionVertexAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  void ExpressionVertexAlg::makeAuxilliaryVariable(const Symbol& aSymbol,
						   const Scope& aScope) { 
    if (myAuxilliaryVariable_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionVertexAlg::makeAuxilliaryVariable: already set");
    Variable* theVariable_p=new Variable();
    VariableSymbolReference* theVariableSymbolReference_p=new VariableSymbolReference(aSymbol,
										      aScope);
    // JU: this assignment of the vertex Id might have to change 
    // if we create vector assignments as auxilliary variables...
    theVariableSymbolReference_p->setId("1");
    theVariableSymbolReference_p->setAnnotation("xaifBoosterLinearization::ExpressionVertexAlg::makeAuxilliaryVariable");
    theVariable_p->supplyAndAddVertexInstance(*theVariableSymbolReference_p);
    theVariable_p->getAliasMapKey().setTemporary();
    theVariable_p->getDuUdMapKey().setTemporary();
    myAuxilliaryVariable_p=theVariable_p;
  }
  
  bool ExpressionVertexAlg::hasAuxilliaryVariable() const { 
    return (myAuxilliaryVariable_p!=0);
  } 

  const Variable& 
  ExpressionVertexAlg::getAuxilliaryVariable() const { 
    if (!myAuxilliaryVariable_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionVertexAlg::getAuxilliaryVariable: not set");
    return *myAuxilliaryVariable_p;
  } 

  bool ExpressionVertexAlg::hasReplacement() const { 
    return (myReplacementAssignment_p!=0);
  }

  Assignment&
  ExpressionVertexAlg::makeReplacementAssignment() { 
    if (myReplacementAssignment_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionVertexAlg::makeReplacementAssignment : has already a replacement");
    myReplacementAssignment_p=new Assignment(false);
    return *myReplacementAssignment_p;
  }

  Assignment&
  ExpressionVertexAlg::getReplacementAssignment() { 
    if (!myReplacementAssignment_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionVertexAlg::makeReplacementAssignment : has no replacement");
    return *myReplacementAssignment_p;
  }

  const Assignment&
  ExpressionVertexAlg::getReplacementAssignment() const { 
    if (!myReplacementAssignment_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionVertexAlg::makeReplacementAssignment : has no replacement");
    return *myReplacementAssignment_p;
  }

  bool ExpressionVertexAlg::isActive() const { 
    return myActiveFlag;
  } // end of ExpressionVertexAlg::isActive

  void ExpressionVertexAlg::passivate() { 
    myActiveFlag=false;
  } // end of ExpressionVertexAlg::passivate

}
