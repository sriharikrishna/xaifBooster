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

#include "xaifBooster/system/inc/Constant.hpp"
#include "xaifBooster/system/inc/ExpressionEdge.hpp"
#include "xaifBooster/system/inc/ExpressionEdgeAlgBase.hpp"
#include "xaifBooster/system/inc/Intrinsic.hpp"
#include "xaifBooster/system/inc/PartialDerivativeKind.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/AccumulationGraphVertex.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/JacobianAccumulationExpressionVertex.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraphEdge.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {

  // Constructor for leaves that correspond to direct copy edges in the LCG
  AccumulationGraphVertex::AccumulationGraphVertex() :
	myRemainderGraphEdge_p (NULL),
	myPartialDerivativeKind (PartialDerivativeKind::LINEAR_ONE),
	myValue (0),
	ValueHasBeenSet (false),
	myLHSVariable_p (NULL) {
  } // end AccumulationGraphVertex::AccumulationGraphVertex()

  // Constructor for leaves (those that don't correspond to direct copy edges in the LCG).
  AccumulationGraphVertex::AccumulationGraphVertex(const ExpressionEdge& theExpressionEdge) :
	myRemainderGraphEdge_p (NULL) {
    const xaifBoosterLinearization::ExpressionEdgeAlg& theLinearizedExpressionEdgeAlg =
     dynamic_cast<const xaifBoosterLinearization::ExpressionEdgeAlg&>(theExpressionEdge.getExpressionEdgeAlgBase());

    // we must be sure to set (myPartialDerivativeKind, myValue, ValueHasBeenSet, myLHSVariable_p) in each case
    switch (theLinearizedExpressionEdgeAlg.getPartialDerivativeKind()) {
      case PartialDerivativeKind::LINEAR_ONE: {
	myPartialDerivativeKind = PartialDerivativeKind::LINEAR_ONE;
	myValue = 0;
	ValueHasBeenSet = false;
	myLHSVariable_p = NULL;
	break;
      } // end case LINEAR_ONE
      case PartialDerivativeKind::LINEAR_MINUS_ONE: {
	myPartialDerivativeKind = PartialDerivativeKind::LINEAR_MINUS_ONE;
	myValue = 0;
	ValueHasBeenSet = false;
	myLHSVariable_p = NULL;
	break;
      } // end case LINEAR_MINUS_ONE
      case PartialDerivativeKind::LINEAR: {
        // (FIXME) HACK: set PDK to nonlinear if PDK is linear but not an isolated constant so that no attempt is made to fold in the value
        if (theLinearizedExpressionEdgeAlg.hasConcretePartialAssignment()) {
	  myPartialDerivativeKind = PartialDerivativeKind::NONLINEAR;
	  myValue = 0;
	  ValueHasBeenSet = false;
	  myLHSVariable_p = &theLinearizedExpressionEdgeAlg.getConcretePartialAssignment().getLHS();
        } // end if there's a concrete partial assignment
        else { // no partial assignment has been created, so there must be a constant set
	  myPartialDerivativeKind = PartialDerivativeKind::LINEAR;
          myValue = theLinearizedExpressionEdgeAlg.getConcreteConstant().getdouble();
	  ValueHasBeenSet = true;
	  myLHSVariable_p = NULL;
	} // end RHS has 1 vertex (Constant)
	break;
      } // end case LINEAR
      case PartialDerivativeKind::NONLINEAR: {
	  myPartialDerivativeKind = PartialDerivativeKind::NONLINEAR;
	  myValue = 0;
	  ValueHasBeenSet = false;
	  myLHSVariable_p = &theLinearizedExpressionEdgeAlg.getConcretePartialAssignment().getLHS();
	break;
      } // end case NONLINEAR
      default:
	THROW_LOGICEXCEPTION_MACRO("AccumulationGraphVertex::AccumulationGraphVertex: Invalid PDK ("
				   << PartialDerivativeKind::toString(theLinearizedExpressionEdgeAlg.getPartialDerivativeKind())
				   << ") for ExpressionEdgeAlg of ExpressionEdge passed to constructor");
	break;
    } // end switch (PDK)
  } // end AccumulationGraphVertex::AccumulationGraphVertex(const ExpressionEdge& theExpressionEdge)

  AccumulationGraphVertex::AccumulationGraphVertex(const xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::Operation_E& anOpType) :
	myRemainderGraphEdge_p (NULL),
	myOperationType (anOpType),
	myPartialDerivativeKind (PartialDerivativeKind::NOT_SET),
	myValue (0),
	ValueHasBeenSet (false),
	myLHSVariable_p (NULL) {
  } // end AccumulationGraphVertex::AccumulationGraphVertex(const std::string anOpName)

  void AccumulationGraphVertex::setRemainderGraphEdge(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge& anLCGEdge) {
    if (myRemainderGraphEdge_p)
      THROW_LOGICEXCEPTION_MACRO("AccumulationGraphVertex::setRemainderGraphEdge: already set")
    myRemainderGraphEdge_p = &anLCGEdge;
  } // end AccumulationGraphVertex::setRemainderGraphEdge()

  const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge& AccumulationGraphVertex::getRemainderGraphEdge() const {
    if (!myRemainderGraphEdge_p)
      THROW_LOGICEXCEPTION_MACRO("AccumulationGraphVertex::getRemainderGraphEdge: not set")
    return *myRemainderGraphEdge_p;
  } // end AccumulationGraphVertex::getRemainderGraphEdge()

  const bool AccumulationGraphVertex::hasRemainderGraphEdge() const {
    return (myRemainderGraphEdge_p != NULL);
  } // end AccumulationGraphVertex::hasRemainderGraphEdge()

  xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::Operation_E AccumulationGraphVertex::getOperation() const {
    return myOperationType;
  } // end AccumulationGraphVertex::getOperation()

  void AccumulationGraphVertex::setPartialDerivativeKind(const PartialDerivativeKind::PartialDerivativeKind_E aPartialDerivativeKind) {
    myPartialDerivativeKind = aPartialDerivativeKind;
  } // end AccumulationGraphVertex::setPartialDerivativeKind()

  const PartialDerivativeKind::PartialDerivativeKind_E AccumulationGraphVertex::getPartialDerivativeKind() const {
    return myPartialDerivativeKind;
  } // end AccumulationGraphVertex::getPartialDerivativeKind()

  void AccumulationGraphVertex::setValue(double aValue) {
    if (ValueHasBeenSet)
      THROW_LOGICEXCEPTION_MACRO("AccumulationGraphVertex::setValue: already set")
    ValueHasBeenSet = true;
    myValue = aValue;
  } // end AccumulationGraphVertex::setValue()

  double AccumulationGraphVertex::getValue() const {
    if (!ValueHasBeenSet)
      THROW_LOGICEXCEPTION_MACRO("AccumulationGraphVertex::getValue: not set")
    return myValue;
  } // end AccumulationGraphVertex::getValue()

  const bool AccumulationGraphVertex::hasValue() const {
    return ValueHasBeenSet;
  } // end AccumulationGraphVertex::hasValue()

  void AccumulationGraphVertex::setLHSVariable(const Variable& aVariable) {
    if (myLHSVariable_p)
      THROW_LOGICEXCEPTION_MACRO("AccumulationGraphVertex::getLHSVariable: already set")
    myLHSVariable_p = &aVariable;
  } // end AccumulationGraphVertex::setLHSVariable()

  const Variable& AccumulationGraphVertex::getLHSVariable() const {
    if (!myLHSVariable_p)
      THROW_LOGICEXCEPTION_MACRO("AccumulationGraphVertex::getLHSVariable: not set")
    return *myLHSVariable_p;
  } // end AccumulationGraphVertex::getLHSVariable()

  const bool AccumulationGraphVertex::hasLHSVariable() const {
    return (myLHSVariable_p != NULL);
  } // end AccumulationGraphVertex::hasLHSVariable()

  std::string AccumulationGraphVertex::debug() const {
    std::ostringstream out;
    out << "AccumulationGraphVertex[" << this
	<< ",myRemainderGraphEdge_p=" << myRemainderGraphEdge_p
	<< ",myOperationType=" << myOperationType
	<< ",myPartialDerivativeKind=" << PartialDerivativeKind::toString(myPartialDerivativeKind)
	<< ",myValue=" << myValue
	<< ",ValueHasBeenSet=" << ValueHasBeenSet
	<< ",myLHSVariable_p=" << myLHSVariable_p
	<< "]" << std::ends;
    return out.str();
  } // end AccumulationGraphVertex::debug()

} // end namespace xaifBoosterBasicBlockPreaccumulation

