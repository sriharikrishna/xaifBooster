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
#include "xaifBooster/system/inc/InlinableIntrinsicsParserHandlers.hpp"
#include "xaifBooster/system/inc/XMLParser.hpp"
#include "xaifBooster/utils/inc/XMLParserMessage.hpp"
#include <sstream>

namespace xaifBooster {
  
  void 
  InlinableIntrinsicsParserHandlers::onInlinableIntrinsicsCatalogue(
							    const InlinableIntrinsicsParserHelper& passingIn,
							    InlinableIntrinsicsParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in InlinableIntrinsicsParserHandlers::onInlinableIntrinsicDefinitions");
    InlinableIntrinsicsCatalogue& theInlinableIntrinsicsCatalogue_r(ConceptuallyStaticInstances::instance()->getInlinableIntrinsicsCatalogue());
    passingOut.setInlinableIntrinsicsCatalogue(theInlinableIntrinsicsCatalogue_r);
  }

  void 
  InlinableIntrinsicsParserHandlers::onInlinableIntrinsicsCatalogueItem(
								const InlinableIntrinsicsParserHelper& passingIn,
								InlinableIntrinsicsParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in InlinableIntrinsicsParserHandlers::onInlinableIntrinsic");
    InlinableIntrinsicsCatalogue& theInlinableIntrinsicsCatalogue_r(passingIn.getInlinableIntrinsicsCatalogue());
    InlinableIntrinsicsCatalogueItem& theItem_r(theInlinableIntrinsicsCatalogue_r.addCatalogueItem(XMLParser::getAttributeValueByName(InlinableIntrinsicsCatalogueItem::our_myName_XAIFName), XMLParser::getAttributeValueByName(InlinableIntrinsicsCatalogueItem::our_myNrArgs_XAIFName)));
    passingOut.setInlinableIntrinsicsCatalogueItem(theItem_r);
  }

  void 
  InlinableIntrinsicsParserHandlers::onInlinableIntrinsicsFunction(
							   const InlinableIntrinsicsParserHelper& passingIn,
							   InlinableIntrinsicsParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in InlinableIntrinsicsParserHandlers::onInlinableIntrinsicsFunction");
    InlinableIntrinsicsCatalogueItem& theItem_r(passingIn.getInlinableIntrinsicsCatalogueItem());
    InlinableIntrinsicsExpression& theFunction_r(theItem_r.getFunction());
    if (XMLParser::getAttributeValueByName(InlinableIntrinsicsCatalogueItem::our_myFunctionType_XAIFName)=="builtin") {
      theFunction_r.setBuiltinFunction();
      theFunction_r.setBuiltinFunctionName(XMLParser::getAttributeValueByName(InlinableIntrinsicsCatalogueItem::our_myFunctionBuiltinName_XAIFName) );
    }
    passingOut.setInlinableIntrinsicsExpression(theFunction_r);
  }

  void 
  InlinableIntrinsicsParserHandlers::onInlinableIntrinsicsPartial(
							  const InlinableIntrinsicsParserHelper& passingIn,
							  InlinableIntrinsicsParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in InlinableIntrinsicsParserHandlers::onInlinableIntrinsicsPartial" ); 
    InlinableIntrinsicsCatalogueItem& theItem_r(passingIn.getInlinableIntrinsicsCatalogueItem());
    int id=atoi(XMLParser::getAttributeValueByName(InlinableIntrinsicsCatalogueItem::our_myPartialId_XAIFName).c_str());
    PartialDerivativeKind::PartialDerivativeKind_E pdk_e(PartialDerivativeKind::fromString(XMLParser::getAttributeValueByName(InlinableIntrinsicsCatalogueItem::our_myPartialType_XAIFName)));
    InlinableIntrinsicsExpression& thePartial_r(theItem_r.addPartial(id,pdk_e));
    passingOut.setInlinableIntrinsicsExpression(thePartial_r);
  }

  void 
  InlinableIntrinsicsParserHandlers::onInlinableIntrinsicsArgumentReference(
								    const InlinableIntrinsicsParserHelper& passingIn,
								    InlinableIntrinsicsParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in InlinableIntrinsicsParserHandlers::onArgumentReference" ); 
    InlinableIntrinsicsExpression& theExpression_r(passingIn.getInlinableIntrinsicsExpression());
    int argref=atoi(XMLParser::getAttributeValueByName(InlinableIntrinsicsArgumentReference::our_myArgRef_XAIFName).c_str());
    InlinableIntrinsicsArgumentReference* aReference_p=new InlinableIntrinsicsArgumentReference(argref);
    aReference_p->setId(XMLParser::getAttributeValueByName(InlinableIntrinsicsArgumentReference::our_myId_XAIFName));
    theExpression_r.supplyAndAddVertexInstance(*aReference_p);
    theExpression_r.setPartialArgument(*aReference_p,argref);
  }

  void 
  InlinableIntrinsicsParserHandlers::onInlinableIntrinsicsConstant(
							   const InlinableIntrinsicsParserHelper& passingIn,
							   InlinableIntrinsicsParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in InlinableIntrinsicsParserHandlers::onInlinableIntrinsicsConstant" ); 
    InlinableIntrinsicsExpression& theExpression_r(passingIn.getInlinableIntrinsicsExpression());
    InlinableIntrinsicsConstant* aConstant_p=new InlinableIntrinsicsConstant(
									     SymbolType::fromString(XMLParser::getAttributeValueByName(InlinableIntrinsicsConstant::our_myType_XAIFName)));
    aConstant_p->setId(XMLParser::getAttributeValueByName(InlinableIntrinsicsConstant::our_myId_XAIFName));
    aConstant_p->setFromString(
			       XMLParser::getAttributeValueByName(InlinableIntrinsicsConstant::our_myValue_XAIFName));
    theExpression_r.supplyAndAddVertexInstance(*aConstant_p);
  }

  void 
  InlinableIntrinsicsParserHandlers::onInlinableIntrinsicsIntrinsic(
							    const InlinableIntrinsicsParserHelper& passingIn,
							    InlinableIntrinsicsParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in InlinableIntrinsicsParserHandlers::onInlinableIntrinsicsIntrinsic" ); 
    InlinableIntrinsicsExpression& theExpression_r(passingIn.getInlinableIntrinsicsExpression());
    InlinableIntrinsicsIntrinsic* aIntrinsic_p=new InlinableIntrinsicsIntrinsic(
										XMLParser::getAttributeValueByName(InlinableIntrinsicsIntrinsic::our_myName_XAIFName));
    aIntrinsic_p->setId(XMLParser::getAttributeValueByName(InlinableIntrinsicsConstant::our_myId_XAIFName));
    theExpression_r.supplyAndAddVertexInstance(*aIntrinsic_p);
  }

  void 
  InlinableIntrinsicsParserHandlers::onInlinableIntrinsicsExpressionEdge(
								 const InlinableIntrinsicsParserHelper& passingIn,
								 InlinableIntrinsicsParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in InlinableIntrinsicsParserHandlers::onInlinableIntrinsicsExpressionEdge" ); 
    InlinableIntrinsicsExpression& theExpression_r(passingIn.getInlinableIntrinsicsExpression());
    std::string sourceId=XMLParser::getAttributeValueByName(
						 InlinableIntrinsicsExpressionEdge::our_source_XAIFName);
    std::string targetId=XMLParser::getAttributeValueByName(
						 InlinableIntrinsicsExpressionEdge::our_target_XAIFName);
    InlinableIntrinsicsExpression::VertexIteratorPair p=theExpression_r.vertices();
    InlinableIntrinsicsExpression::VertexIterator beginIt(p.first),endIt(p.second);
    InlinableIntrinsicsExpressionVertex *theSource_p(0), *theTarget_p(0);
    for (; (beginIt!=endIt)
	   && !(theSource_p && theTarget_p)
	   ;++beginIt) { 
      if (!theSource_p && sourceId==(*beginIt).getId())
	theSource_p=&(*beginIt);
      if (!theTarget_p && targetId==(*beginIt).getId())
	theTarget_p=&(*beginIt);
    }
    if (!theTarget_p || 
 	!theSource_p)
      THROW_LOGICEXCEPTION_MACRO("XAIFInlinableIntrinsicsParser::onInlinableIntrinsicsExpressionEdge: can't find source  " 
				 << sourceId.c_str()
				 << " or target "
				 << targetId.c_str());
    InlinableIntrinsicsExpressionEdge& theInlinableIntrinsicsExpressionEdge(theExpression_r.addEdge(*theSource_p, *theTarget_p));
    theInlinableIntrinsicsExpressionEdge.setId(XMLParser::getAttributeValueByName(InlinableIntrinsicsExpressionEdge::our_myId_XAIFName));
    theInlinableIntrinsicsExpressionEdge.setPosition(XMLParser::getAttributeValueByName(InlinableIntrinsicsExpressionEdge::our_myPosition_XAIFName));
  }

  void 
  InlinableIntrinsicsParserHandlers::onDummy(
				     const InlinableIntrinsicsParserHelper& passingIn,
				     InlinableIntrinsicsParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK,
	      "InlinableIntrinsicsParserHandlers::onDummy");
    // pass all set elements through
    passingOut=passingIn;
    return;
  }

} // end of namespace 

