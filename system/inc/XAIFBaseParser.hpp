#ifndef _XAIFBASEPARSER_INCLUDE_
#define _XAIFBASEPARSER_INCLUDE_

#include  <xercesc/sax2/DefaultHandler.hpp>

#include "xaifBooster/utils/inc/XAIFBaseParserHelper.hpp"
#include "xaifBooster/system/inc/XMLParser.hpp"
#include "xaifBooster/system/inc/XAIFBaseParserHandlers.hpp"

namespace xaifBooster {

  class XAIFBaseParser :  public XERCES_CPP_NAMESPACE::DefaultHandler, public XMLParser, public XAIFBaseParserHandlers {
  public:

    void initialize();

    /**
     * UN: main handler routines for SAX2 parsing
     */
    void startDocument();
    void endDocument();
    void startElement(const XMLCh*, const XMLCh*, const XMLCh*, const XERCES_CPP_NAMESPACE::Attributes&);
    void endElement(const XMLCh*, const XMLCh*, const XMLCh*);

  private:

    /**
     * action held in ourActionCatalogue
     * keyed by node specs
     */
    struct ActionItem { 
      typedef 
      void (XAIFBaseParserHandlers::* ActionFPType)(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut);
      /** 
       * the actions are function pointers to XAIFBaseParserHandlers member 
       * functions with a signature as specified above
       */
      ActionFPType myAction;
      ActionItem(const ActionFPType& anAction): myAction(anAction){};
    }; 

    /**
     * the action catalogue 
     */
    static HashTable<ActionItem> ourActionCatalogue;
    
    /**
     * flag guarding the onetime initialization of
     * ourActionCatalogue
     */
    static bool ourStaticInitFlag;

    /**
     * method that contains calls which 
     * add individual actions to 
     * ourActionCatalogue
     */
    static void staticInitialize();

    /**
     * method used by * startElement.
     * selects action method appropriate for node name
     * from XAIFBaseParser::ourActionCatalogue
     */
    void actionInvocation(const XMLCh* const);

  }; // end of class XAIFBaseParser

} // end of namespace 

#endif
