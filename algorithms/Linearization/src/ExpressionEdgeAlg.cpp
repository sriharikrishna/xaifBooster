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

#include "xaifBooster/system/inc/ExpressionEdge.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"

#include "xaifBooster/algorithms/Linearization/inc/ExpressionEdgeAlg.hpp"

namespace xaifBoosterLinearization { 

  ExpressionEdgeAlg::ExpressionEdgeAlg(ExpressionEdge& theContainingExpressionEdge) : 
    ExpressionEdgeAlgBase(theContainingExpressionEdge),
    myPartialDerivative_p(0),
    myConcretePartialAssignment_p(0),
    myConcretePartialDerivativeKind(PartialDerivativeKind::NONLINEAR) { 
  }

  std::string ExpressionEdgeAlg::debug () const { 
    std::ostringstream out;
    out << "xaifBoosterLinearization::ExpressionEdgeAlg[" << this
	<< ",myConcretePartialDerivativeKind" << PartialDerivativeKind::toString(myConcretePartialDerivativeKind)
 	<< "]" << std::ends;
    return out.str();
  } // end of ExpressionEdgeAlg::debug

  void
  ExpressionEdgeAlg::printXMLHierarchy(std::ostream& os) const { 
    getContaining().printXMLHierarchyImpl(os);
  }

  void ExpressionEdgeAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  bool ExpressionEdgeAlg::hasPartial() const { 
    return (myPartialDerivative_p!=0);
  }

  const InlinableIntrinsicsExpression&  
  ExpressionEdgeAlg::getPartial() const { 
    if (!myPartialDerivative_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionEdgeAlg::getPartial: not set");
    return *myPartialDerivative_p;
  } 

  void 
  ExpressionEdgeAlg::setPartial(const InlinableIntrinsicsExpression& thePartial) { 
    if (myPartialDerivative_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionEdgeAlg::setPartial: already set");
    myPartialDerivative_p=&thePartial;
    myConcretePartialDerivativeKind=PartialDerivativeKind::leastDependent(myConcretePartialDerivativeKind, 
									  thePartial.getPartialDerivativeKind());
  } 

  void 
  ExpressionEdgeAlg::addArgumentsConcretizationPair(const ExpressionVertex& aConcreteArgument,
						    const InlinableIntrinsicsExpressionVertex& anAbstractArgument) { 
    // for safety check uniqueness
    for (VertexPairList::iterator it=myConcreteArgumentInstancesList.begin();
	 it!=myConcreteArgumentInstancesList.end();
	 ++it) { 
      if (((*it).first==&aConcreteArgument 
	   &&
	   (*it).second==&anAbstractArgument))
	// both are the same, i.e. an allowed parallel 
	// edge that has already been added
	return;
      if (((*it).first==&aConcreteArgument 
	   ||
	   (*it).second==&anAbstractArgument))
	// if they are not both the same but just one of them matches, 
	THROW_LOGICEXCEPTION_MACRO("ExpressionEdgeAlg::addArgumentsConcretizationPair: ambiguous pairs");
    } // end for
    myConcreteArgumentInstancesList.push_back(VertexPair(&aConcreteArgument,&anAbstractArgument));
  }

  void ExpressionEdgeAlg::makeConcretePartialAssignment() { 
    if (myConcretePartialAssignment_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionEdgeAlg::makeConcretePartialAssignment: already set");
    myConcretePartialAssignment_p=new Assignment(false);
  } 

  Assignment& ExpressionEdgeAlg::getConcretePartialAssignment() { 
    if (!myConcretePartialAssignment_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionEdgeAlg::getConcretePartialAssignment: not set");
    return *myConcretePartialAssignment_p;
  } 

  const Assignment& ExpressionEdgeAlg::getConcretePartialAssignment() const { 
    if (!myConcretePartialAssignment_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionEdgeAlg::getConcretePartialAssignment: not set");
    return *myConcretePartialAssignment_p;
  } 

  bool ExpressionEdgeAlg::hasConcretePartialAssignment() const { 
    return (myConcretePartialAssignment_p!=0);
  } 

  void ExpressionEdgeAlg::passivate() { 
    myConcretePartialDerivativeKind=PartialDerivativeKind::PASSIVE;
  } 
  
  void ExpressionEdgeAlg::linearate() { 
    myConcretePartialDerivativeKind = PartialDerivativeKind::LINEAR;
  } 
  
  const ExpressionEdgeAlg::VertexPairList& ExpressionEdgeAlg::getConcreteArgumentInstancesList() const { 
    return myConcreteArgumentInstancesList;
  }

  PartialDerivativeKind::PartialDerivativeKind_E ExpressionEdgeAlg::getPartialDerivativeKind() const { 
    return myConcretePartialDerivativeKind;
  } 

}
