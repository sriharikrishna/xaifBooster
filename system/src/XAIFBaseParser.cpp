#include "xaifBooster/system/inc/XAIFBaseParser.hpp"
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
  
  bool XAIFBaseParser::ourStaticInitFlag;
  HashTable<XAIFBaseParser::ActionItem> XAIFBaseParser::ourActionCatalogue;

  void 
  XAIFBaseParser::initialize() {
    try {
      if (!ourStaticInitFlag) staticInitialize();
      XMLParser::initialize();
      myParser_p->setContentHandler(this);
      static XMLParserErrorHandler anErrorHandler;
      myParser_p->setErrorHandler(&anErrorHandler);
    } catch (const xercesc::XMLException& e) {
      THROW_LOGICEXCEPTION_MACRO("XAIFBaseParser::initialize: XMLException: "
                                 << XMLParserMessage(e.getMessage()));
    }

  }

  void 
  XAIFBaseParser::staticInitialize() { 
    if (ourStaticInitFlag)
      THROW_LOGICEXCEPTION_MACRO("XMLParser::staticInitialize: already initialized");
    ourStaticInitFlag=true;

#include "xaifBooster/tools/codegen/code/parse_method_stmt.inc"

  } // end of XAIFBaseParser::staticInitialize

  /*
   * UN: Implementation of startElement handler
   */

  void XAIFBaseParser::startElement(const XMLCh* const uri, const XMLCh* const localname, const XMLCh* const qname, const XERCES_CPP_NAMESPACE::Attributes& attributes) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParser::startElement" );
    XMLParser::ourAttributes_p=&attributes;
    actionInvocation(qname); 
  }

  /*
   * UN: Implementation of endElement handler
   */

  void XAIFBaseParser::endElement(const XMLCh* const uri, const XMLCh* const localname, const XMLCh* const qname) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParser::endElement" );
    XMLParserHelper* myDummyHelper=myXMLParserHelperStack.top();
    myXMLParserHelperStack.pop();
    delete myDummyHelper;
  }

  /*
   * UN: Implementation of startDocument handler
   */

  void XAIFBaseParser::startDocument() {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParser::startDocument" );
    XAIFBaseParserHelper* myDummyHelper=new XAIFBaseParserHelper;
    myXMLParserHelperStack.push(myDummyHelper);
  }

  /*
   * UN: Implementation of endDocument handler
   */

  void XAIFBaseParser::endDocument() {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParser::endDocument" );
    XMLParserHelper* myDummyHelper=myXMLParserHelperStack.top();
    myXMLParserHelperStack.pop();
    delete myDummyHelper;
  }

  /*
   * UN: takes only the name of the current element and
   * calls the appropriate handler routine
   */

  void XAIFBaseParser::actionInvocation(const XMLCh* const qname) {
    XAIFBaseParserHelper* passingFromParent=dynamic_cast<XAIFBaseParserHelper*>(myXMLParserHelperStack.top());
    XAIFBaseParserHelper* passingToChild=new XAIFBaseParserHelper;
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
  } // end of XAIFBaseParser::actionInvocation

} // end of namespace 
