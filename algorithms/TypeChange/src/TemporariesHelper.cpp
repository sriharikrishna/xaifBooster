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
#include <cctype>
#include <algorithm>

#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/system/inc/DimensionBounds.hpp"
#include "xaifBooster/system/inc/Scope.hpp"
#include "xaifBooster/system/inc/Constant.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

#include "xaifBooster/algorithms/TypeChange/inc/TemporariesHelper.hpp"

namespace xaifBoosterTypeChange{

  TemporariesHelper::TemporariesHelper(const std::string& contextAnnotation,
				       const Expression& theExpression,
				       const ExpressionVertex& theTopVertex):
  myContextAnnnotation(contextAnnotation),
  myExpression(theExpression),
  myTopVertex(theTopVertex),
  myShape(SymbolShape::SCALAR),
  myType(SymbolType::INTEGER_STYPE),
  myTypeInfo(false){
  }

  TemporariesHelper::~TemporariesHelper(){
    for(DimensionBoundsPVector::iterator it=myDimensionBoundsPVector.begin();
	it!=myDimensionBoundsPVector.end();
	++it) {
      if(*it)
	delete (*it);
    }
  }

  Symbol& TemporariesHelper::makeTempSymbol(Scope& aScope){
    typeInfo(myTopVertex);
    if(!myTypeInfo) {
      if(DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)&&DbgLoggerManager::instance()->wantTag("expr"))
	myExpression.show("ExpressionForMakeTempSymbol");
      THROW_LOGICEXCEPTION_MACRO("TemporariesHelper::makeTempSymbol: no type info found");
    }
    Symbol&theNewVariableSymbol(aScope.getSymbolTable().
				addUniqueAuxSymbol(SymbolKind::VARIABLE,
						myType,
						myShape,
						false));
    theNewVariableSymbol.setFrontEndType(myFrontEndType);
    if(myShape!=SymbolShape::SCALAR) {
      setDimensionBounds(theNewVariableSymbol);
    }
    return theNewVariableSymbol;
  }

  void TemporariesHelper::setDimensionBounds(Symbol& aNewSymbol){
    unsigned short found=0;
    for(DimensionBoundsPVector::iterator it=myDimensionBoundsPVector.begin();
	it!=myDimensionBoundsPVector.end();
	++it) {
      if(*it)
	++found;
    }
    if(found==myShape&&found==myDimensionBoundsPVector.size()) {
      for(DimensionBoundsPVector::iterator it=myDimensionBoundsPVector.begin();
	  it!=myDimensionBoundsPVector.end();
	  ++it) {
	if(*it)
	  aNewSymbol.addDimensionBounds((*it)->getLower(), (*it)->getUpper());
      }
    }
  }

  void TemporariesHelper::typeInfo(const ExpressionVertex & theTopVertex){
    if(theTopVertex.isArgument()) {
      const Variable&argumentVariable(dynamic_cast<const Argument&>(theTopVertex).getVariable());
      myTypeInfo=true;
      myType=SymbolType::genericPromotion(myType, argumentVariable.getVariableSymbolReference().getSymbol().getSymbolType());
      if(myType==argumentVariable.getVariableSymbolReference().getSymbol().getSymbolType())
	myFrontEndType=argumentVariable.getVariableSymbolReference().getSymbol().getFrontEndType();
      SymbolShape::SymbolShape_E argShape=argumentVariable.getEffectiveShape();
      if (myShape!=SymbolShape::SCALAR && argShape!=SymbolShape::SCALAR && myShape!=argShape)
	THROW_LOGICEXCEPTION_MACRO("TemporariesHelper::typeInfo: effective shape change between " 
		<< SymbolShape::toString(myShape)
		<< " and "
		<< SymbolShape::toString(argShape));
      myShape=(myShape>argShape)?myShape:argShape;
      if(myShape==argShape) {
	if (!myDimensionBoundsPVector.size())
	  myDimensionBoundsPVector.resize(myShape,NULL);
	populateDimensionBounds(argumentVariable);
      }
    }
    else {
      Expression::ConstInEdgeIteratorPair theInEdgesP=myExpression.getInEdgesOf(theTopVertex);
      Expression::ConstInEdgeIterator inEdgeIt=theInEdgesP.first, inEdgeEndIt=theInEdgesP.second;
      for(; inEdgeIt!=inEdgeEndIt; ++inEdgeIt)
	typeInfo(myExpression.getSourceOf(*inEdgeIt));
    }
  }

  void TemporariesHelper::populateDimensionBounds(const Variable & aVariable){
    const Symbol::DimensionBoundsPList *symbolDimensionBoundsP=NULL;
    if(aVariable.getVariableSymbolReference().getSymbol().hasDimensionBounds()) {
      symbolDimensionBoundsP= &(aVariable.getVariableSymbolReference().getSymbol().getDimensionBoundsPList());
    }
    if(aVariable.hasArrayAccess()) {
      unsigned short theDimension=0;
      const ArrayAccess::IndexTripletListType&theIndexTripletList(aVariable.getArrayAccess().getIndexTripletList());
      Symbol::DimensionBoundsPList::const_iterator symbolDBIt;
      if(symbolDimensionBoundsP)
	symbolDBIt=symbolDimensionBoundsP->begin();
      for(ArrayAccess::IndexTripletListType::const_iterator it=theIndexTripletList.begin();
	  it!=theIndexTripletList.end();
	  ++it) {
	if(!((*it)->isScalarDeref())) {
	  ++theDimension; // 1-based counting
	  const Expression *indexExprP=NULL, *boundExprP=NULL, *strideExprP=NULL;
	  Expression indexExpr, boundExpr;
	  // determine size if possible
	  if((*it)->hasExpression(IndexTriplet::IT_INDEX)) {
	    const Expression& theExpr=(*it)->getExpression(IndexTriplet::IT_INDEX);
	    if(theExpr.isConstant()) {
	      indexExprP= &theExpr;
	    }
	  }
	  else {
	    if(symbolDimensionBoundsP) {
	      indexExpr.supplyAndAddVertexInstance(*(new Constant((*symbolDBIt)->getLower())));
	      indexExprP= &indexExpr;
	    }
	  }

	  if((*it)->hasExpression(IndexTriplet::IT_BOUND)) {
	    const Expression& theExpr=(*it)->getExpression(IndexTriplet::IT_BOUND);
	    if(theExpr.isConstant()) {
	      boundExprP= &theExpr;
	    }
	  }
	  else {
	    if(symbolDimensionBoundsP)
	      boundExpr.supplyAndAddVertexInstance(*(new Constant((*symbolDBIt)->getUpper())));

	    boundExprP= &boundExpr;
	  }
	  if((*it)->hasExpression(IndexTriplet::IT_STRIDE)) {
	    const Expression& theExpr=(*it)->getExpression(IndexTriplet::IT_STRIDE);
	    if(theExpr.isConstant()) {
	      strideExprP= &theExpr;
	    }
	  }
	  if(indexExprP&&boundExprP) {
	    Expression effectiveBoundExpression;
	    // make the actual expression
	    Constant* theOne_p=new Constant(1);
	    effectiveBoundExpression.supplyAndAddVertexInstance(*theOne_p);
	    ExpressionVertex& theNewIndex=indexExprP->copyMyselfInto(effectiveBoundExpression, true, false);
	    ExpressionVertex& theNewBound=boundExprP->copyMyselfInto(effectiveBoundExpression, true, false);
	    ExpressionVertex& theNewMinus=effectiveBoundExpression.addBinaryOpByName("minus_scal_scal", theNewBound, theNewIndex);
	    ExpressionVertex& theNewPlus=effectiveBoundExpression.addBinaryOpByName("plus_scal_scal", theNewMinus, *theOne_p);
	    if(strideExprP) {
	      if(strideExprP->constIntEval()!=1) {
		ExpressionVertex& theNewStride=strideExprP->copyMyselfInto(effectiveBoundExpression, true, false);
		effectiveBoundExpression.addBinaryOpByName("div_scal_scal", theNewPlus, theNewStride);
	      }

	    }
	    int theBoundVal=effectiveBoundExpression.constIntEval();
	    if(myDimensionBoundsPVector[theDimension-1]
	    &&
	    myDimensionBoundsPVector[theDimension-1]->getUpper()!=theBoundVal) {
	      THROW_LOGICEXCEPTION_MACRO("TemporariesHelper::populateEffectiveDimensionBounds: conflicting bounds ("
				      <<myDimensionBoundsPVector[theDimension]
				      <<" vs. "
				      <<theBoundVal
				      <<" for dimension "
				      <<theDimension);
	    }
	    myDimensionBoundsPVector[theDimension-1]=new DimensionBounds(1, theBoundVal);
	  }
	}
	if(symbolDimensionBoundsP)
	  ++symbolDBIt;
      }
    }
  }

} // end of namespace 
