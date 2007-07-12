#ifndef _XAIFBASEPARSER_INCLUDE_
#define _XAIFBASEPARSER_INCLUDE_
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

#include  <xercesc/sax2/DefaultHandler.hpp>

#include "xaifBooster/utils/inc/XAIFBaseParserHelper.hpp"
#include "xaifBooster/system/inc/XMLParser.hpp"
#include "xaifBooster/system/inc/XAIFBaseParserHandlers.hpp"

namespace xaifBooster {

  class XAIFBaseParser :  public XERCES_CPP_NAMESPACE::DefaultHandler, public XMLParser, public XAIFBaseParserHandlers {
  public:
    void initialize(bool validateAgainstSchema);

    /**
     * UN: main handler routines for SAX2 parsing
     */
    void startDocument();
    void endDocument();
    void startElement(const XMLCh*, const XMLCh*, const XMLCh*, const XERCES_CPP_NAMESPACE::Attributes&);
    void endElement(const XMLCh*, const XMLCh*, const XMLCh*);

    virtual void setExternalSchemaLocation(const std::string& theSchemaLocation);

  private:

    const XERCES_CPP_NAMESPACE::Locator * myLocator_p;
    void setDocumentLocator(const XERCES_CPP_NAMESPACE::Locator* const locator); 
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
     * the action catalogue for start elements 
     */
    static HashTable<ActionItem> ourStartActionCatalogue;
    
    /**
     * the action catalogue for end elements
     */
    static HashTable<ActionItem> ourEndActionCatalogue;
    
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
     * method used by startElement.
     * selects action method appropriate for node name
     * from ourStartActionCatalogue
     */
    void startActionInvocation(const XMLCh* const);

    /**
     * method used by endElement.
     * selects action method appropriate for node name
     * from ourEndActionCatalogue
     */
    void endActionInvocation(const XMLCh* const);

  }; // end of class XAIFBaseParser

} // end of namespace 

#endif
