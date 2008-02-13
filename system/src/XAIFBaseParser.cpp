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

#include "xercesc/util/PlatformUtils.hpp"
#include "xercesc/util/TransService.hpp"
#include "xercesc/sax/Locator.hpp"
#include "xercesc/sax2/SAX2XMLReader.hpp"
#include "xercesc/sax2/XMLReaderFactory.hpp"

#include "xaifBooster/utils/inc/XMLParserErrorHandler.hpp"
#include "xaifBooster/utils/inc/XMLParserMessage.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/XAIFBaseParser.hpp"

namespace xaifBooster {
  
  bool XAIFBaseParser::ourStaticInitFlag;
  HashTable<XAIFBaseParser::ActionItem> XAIFBaseParser::ourStartActionCatalogue;
  HashTable<XAIFBaseParser::ActionItem> XAIFBaseParser::ourEndActionCatalogue;

  void 
  XAIFBaseParser::initialize(bool validateAgainstSchema) {
    try {
      if (!ourStaticInitFlag) staticInitialize();
      XMLParser::initialize(validateAgainstSchema);
      myParser_p->setContentHandler(this);
      static XMLParserErrorHandler anErrorHandler;
      myParser_p->setErrorHandler(&anErrorHandler);
    } catch (const xercesc::XMLException& e) {
      THROW_LOGICEXCEPTION_MACRO("XAIFBaseParser::initialize: XMLException: "
                                 << XMLParserMessage(e.getMessage()));
    }

  }

  void XAIFBaseParser::setExternalSchemaLocation(const std::string& theSchemaLocation) { 
    if (theSchemaLocation.size()) { 
      std::string aUrl("http://www.mcs.anl.gov/XAIF ");
      XMLParser::setExternalSchemaLocation(aUrl+theSchemaLocation+"/xaif.xsd");
    } 
  } 

  void 
  XAIFBaseParser::staticInitialize() { 
    if (ourStaticInitFlag)
      THROW_LOGICEXCEPTION_MACRO("XMLParser::staticInitialize: already initialized");
    ourStaticInitFlag=true;

#include "xaifBooster/tools/codegen/code/parse_method_stmt.inc"

ourEndActionCatalogue.addElement(ControlFlowGraph::ourXAIFName, ActionItem(&XAIFBaseParserHandlers::onControlFlowGraphEnd));
ourEndActionCatalogue.addElement("#comment", ActionItem(&XAIFBaseParserHandlers::onDummy));
ourEndActionCatalogue.addElement("#document", ActionItem(&XAIFBaseParserHandlers::onDummy));
ourEndActionCatalogue.addElement("#text", ActionItem(&XAIFBaseParserHandlers::onDummy));

  } // end of XAIFBaseParser::staticInitialize

    void XAIFBaseParser::setDocumentLocator(const XERCES_CPP_NAMESPACE::Locator* const locator)
    {
      myLocator_p=locator;
    }

  void XAIFBaseParser::startElement(const XMLCh* const uri, const XMLCh* const localname, const XMLCh* const qname, const XERCES_CPP_NAMESPACE::Attributes& attributes) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParser::startElement" );
    XMLParser::ourAttributes_p=&attributes;
    startActionInvocation(qname); 
  }

  void XAIFBaseParser::endElement(const XMLCh* const uri, const XMLCh* const localname, const XMLCh* const qname) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParser::endElement" );
    endActionInvocation(qname); 
  }

  void XAIFBaseParser::startDocument() {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParser::startDocument" );
    XAIFBaseParserHelper* aDummyHelper_p=new XAIFBaseParserHelper;
    myXMLParserHelperStack.push(aDummyHelper_p);
  }

  void XAIFBaseParser::endDocument() {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParser::endDocument" );
    XMLParserHelper* aDummyHelper_p=myXMLParserHelperStack.top();
    myXMLParserHelperStack.pop();
    delete aDummyHelper_p;
  }

  void XAIFBaseParser::startActionInvocation(const XMLCh* const qname) {
    XAIFBaseParserHelper* passingFromParent=dynamic_cast<XAIFBaseParserHelper*>(myXMLParserHelperStack.top());
    XAIFBaseParserHelper* passingToChild=new XAIFBaseParserHelper;
    myXMLParserHelperStack.push(passingToChild);
    try {
      ActionItem& theAction=ourStartActionCatalogue.getElement(XMLParserMessage(qname).toString());
      (this->*(theAction.myAction))(*passingFromParent,
				    *passingToChild) ;
    } 
    catch (LogicException& e) { 
      DBG_MACRO(DbgGroup::ERROR,
		"XMLParser::startActionInvocation: caught: " 
		<< e.getReason().c_str() << " at line " << myLocator_p->getLineNumber() << " in the input XML file"); 
      throw e;
    } 
  } 

  void XAIFBaseParser::endActionInvocation(const XMLCh* const qname) {
    XAIFBaseParserHelper* thisElementsHelper_p(dynamic_cast<XAIFBaseParserHelper*>(myXMLParserHelperStack.top()));
    myXMLParserHelperStack.pop();
    XAIFBaseParserHelper* parentElementHelper_p(dynamic_cast<XAIFBaseParserHelper*>(myXMLParserHelperStack.top()));
    try { 
      if (ourEndActionCatalogue.hasElement(XMLParserMessage(qname).toString())) { 
	// we start out with only one element in the catalogue...
	ActionItem& theAction=ourEndActionCatalogue.getElement(XMLParserMessage(qname).toString());
	(this->*(theAction.myAction))(*thisElementsHelper_p,
				      *parentElementHelper_p);
      }
    } 
    catch (LogicException& e) { 
      delete thisElementsHelper_p;
      DBG_MACRO(DbgGroup::ERROR,
		"XMLParser::endActionInvocation: caught: " 
		<< e.getReason().c_str() << " at line " << myLocator_p->getLineNumber() << " in the input XML file"); 
      throw e;
    } 
    delete thisElementsHelper_p;
  }

} // end of namespace 
