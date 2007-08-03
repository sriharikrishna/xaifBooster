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
#include "xaifBooster/system/inc/InlinableIntrinsicsParser.hpp"
#include <xercesc/util/PlatformUtils.hpp>
#include <xercesc/util/TransService.hpp>
#include <xercesc/sax2/SAX2XMLReader.hpp>
#include <xercesc/sax2/XMLReaderFactory.hpp>
#include "xaifBooster/utils/inc/XMLParserErrorHandler.hpp"
#include "xaifBooster/utils/inc/XMLParserMessage.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include <sstream>

namespace xaifBooster {
  
  HashTable<InlinableIntrinsicsParser::ActionItem> InlinableIntrinsicsParser::ourActionCatalogue;
  bool InlinableIntrinsicsParser::ourStaticInitFlag;

  InlinableIntrinsicsParser::InlinableIntrinsicsParser(InlinableIntrinsicsCatalogue& theInlinableIntrinsicsCatalogue_r) : 
    myInlinableIntrinsicsCatalogue(theInlinableIntrinsicsCatalogue_r){
  }
  
  void InlinableIntrinsicsParser::setExternalSchemaLocation(const std::string& theSchemaLocation) { 
    if (theSchemaLocation.size()) { 
      std::string aUrl("http://www.mcs.anl.gov/XAIFInlinableIntrinsics ");
      XMLParser::setExternalSchemaLocation(aUrl+theSchemaLocation+"/xaif_inlinable_intrinsics.xsd");
    } 
  } 
  
  void InlinableIntrinsicsParser::initialize() { 
    try { 

      if (!ourStaticInitFlag)
	staticInitialize();
      XMLParser::initialize(true);
      myParser_p->setContentHandler(this);
      static XMLParserErrorHandler anErrorHandler;
      myParser_p->setErrorHandler(&anErrorHandler);

    } catch (const xercesc::XMLException& e) {
      THROW_LOGICEXCEPTION_MACRO("InlinableIntrinsicsParser::initialize: XMLException: "
				 << XMLParserMessage(e.getMessage()));
    }
  } // end of InlinableIntrinsicsParser::initialize

  void 
  InlinableIntrinsicsParser::staticInitialize() { 
    if (ourStaticInitFlag)
      THROW_LOGICEXCEPTION_MACRO("InlinableIntrinsicsParser::staticInitialize: already initialized");
    ourStaticInitFlag=true;
    ourActionCatalogue.addElement(InlinableIntrinsicsCatalogue::ourXAIFName,
				  ActionItem(&InlinableIntrinsicsParser::onInlinableIntrinsicsCatalogue));
    ourActionCatalogue.addElement(InlinableIntrinsicsCatalogueItem::ourXAIFName,
				  ActionItem(&InlinableIntrinsicsParser::onInlinableIntrinsicsCatalogueItem));
    ourActionCatalogue.addElement(InlinableIntrinsicsCatalogueItem::ourFunctionXAIFName,
				  ActionItem(&InlinableIntrinsicsParser::onInlinableIntrinsicsFunction));
    ourActionCatalogue.addElement(InlinableIntrinsicsCatalogueItem::ourPartialXAIFName,
				  ActionItem(&InlinableIntrinsicsParser::onInlinableIntrinsicsPartial));
    ourActionCatalogue.addElement(InlinableIntrinsicsArgumentReference::ourXAIFName,
				  ActionItem(&InlinableIntrinsicsParser::onInlinableIntrinsicsArgumentReference));
    ourActionCatalogue.addElement(InlinableIntrinsicsConstant::ourXAIFName,
				  ActionItem(&InlinableIntrinsicsParser::onInlinableIntrinsicsConstant));
    ourActionCatalogue.addElement(InlinableIntrinsicsIntrinsic::ourXAIFName,
				  ActionItem(&InlinableIntrinsicsParser::onInlinableIntrinsicsIntrinsic));
    ourActionCatalogue.addElement(InlinableIntrinsicsExpressionEdge::ourXAIFName,
				  ActionItem(&InlinableIntrinsicsParser::onInlinableIntrinsicsExpressionEdge));
    ourActionCatalogue.addElement("#comment",
				  ActionItem(&InlinableIntrinsicsParser::onDummy));
    ourActionCatalogue.addElement("#document",
				  ActionItem(&InlinableIntrinsicsParser::onDummy));
    ourActionCatalogue.addElement("#text",
				  ActionItem(&InlinableIntrinsicsParser::onDummy));
  } // end of InlinableIntrinsicsParser::staticInitialize

  /*
   * UN: Implementation of startElement handler
   */

  void InlinableIntrinsicsParser::startElement(const XMLCh* const uri, const XMLCh* const localname, const XMLCh* const qname, const XERCES_CPP_NAMESPACE::Attributes& attributes) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in InlinableIntrinsicsParser::startElement" );
    XMLParser::ourAttributes_p=&attributes;
    actionInvocation(qname); 
  }

  /*
   * UN: Implementation of endElement handler
   */

  void InlinableIntrinsicsParser::endElement(const XMLCh* const uri, const XMLCh* const localname, const XMLCh* const qname) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in InlinableIntrinsicsParser::endElement" );
    XMLParserHelper* myDummyHelper=myXMLParserHelperStack.top();
    myXMLParserHelperStack.pop();
    delete myDummyHelper;
  }

  /*
   * UN: Implementation of startDocument handler
   */

  void InlinableIntrinsicsParser::startDocument() {
    DBG_MACRO(DbgGroup::CALLSTACK, "in InlinableIntrinsicsParser::startDocument" );
    InlinableIntrinsicsParserHelper* myDummyHelper=new InlinableIntrinsicsParserHelper;
    myXMLParserHelperStack.push(myDummyHelper);
  }

  /*
   * UN: Implementation of endDocument handler
   */

  void InlinableIntrinsicsParser::endDocument() {
    DBG_MACRO(DbgGroup::CALLSTACK, "in InlinableIntrinsicsParser::endDocument" );
    XMLParserHelper* myDummyHelper=myXMLParserHelperStack.top();
    myXMLParserHelperStack.pop();
    delete myDummyHelper;
  }

    /*
   * UN: takes only the name of the current element and
   * calls the appropriate handler routine
   */
                                                           
  void InlinableIntrinsicsParser::actionInvocation(const XMLCh* const
qname) {
    InlinableIntrinsicsParserHelper* passingFromParent=dynamic_cast<InlinableIntrinsicsParserHelper*>(myXMLParserHelperStack.top());
    InlinableIntrinsicsParserHelper* passingToChild=new InlinableIntrinsicsParserHelper;
    myXMLParserHelperStack.push(passingToChild);
    try {
      ActionItem& theAction=ourActionCatalogue.getElement(XMLParserMessage(qname).toString());
      (this->*(theAction.myAction))(*passingFromParent,
                                    *passingToChild) ;
    }
    catch (LogicException& e) {
      DBG_MACRO(DbgGroup::ERROR,
                "XMLParser::actionInvocation: caught: "
                << e.getReason().c_str());
      throw e;
    }
  } // end of InlinableIntrinsicsParser::actionInvocation

} // end of namespace 

