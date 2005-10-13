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
#include <xercesc/util/PlatformUtils.hpp>
#include <xercesc/util/TransService.hpp>
#include <xercesc/sax2/SAX2XMLReader.hpp>
#include <xercesc/sax2/XMLReaderFactory.hpp>
#include "xaifBooster/system/inc/XMLParser.hpp"
#include "xaifBooster/utils/inc/XMLParserMessage.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include <sstream>

namespace xaifBooster {

  const XERCES_CPP_NAMESPACE::Attributes* XMLParser::ourAttributes_p=0;
  
  /*
   * UN: performs basis initializations related to
   * configuration of the XMLReader
   */

  void XMLParser::initialize(bool validateAgainstSchema) { 
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::initialize" );
    try { 

      // per process parser init
      XERCES_CPP_NAMESPACE::XMLPlatformUtils::Initialize();
      
      myParser_p = XERCES_CPP_NAMESPACE::XMLReaderFactory::createXMLReader();
      myParser_p->setFeature(XERCES_CPP_NAMESPACE::XMLUni::fgSAX2CoreValidation,validateAgainstSchema);
      myParser_p->setFeature(XERCES_CPP_NAMESPACE::XMLUni::fgXercesDynamic,validateAgainstSchema);
      myParser_p->setFeature(XERCES_CPP_NAMESPACE::XMLUni::fgSAX2CoreNameSpaces,validateAgainstSchema);
      myParser_p->setFeature(XERCES_CPP_NAMESPACE::XMLUni::fgXercesSchema,validateAgainstSchema);
      myParser_p->setFeature(XERCES_CPP_NAMESPACE::XMLUni::fgXercesSchemaFullChecking,validateAgainstSchema);
      myParser_p->setFeature(XERCES_CPP_NAMESPACE::XMLUni::fgSAX2CoreNameSpacePrefixes,validateAgainstSchema); 

    } catch (const XERCES_CPP_NAMESPACE::XMLException& e) {
      THROW_LOGICEXCEPTION_MACRO("XMLParser::initialize: XMLException: "
				 << XMLParserMessage(e.getMessage()));
    }
  } // end of XMLParser::initialize

   void XMLParser::parse(std::string theXMLFileName) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::parse" );
    try {
      myParser_p->parse(theXMLFileName.c_str());
    }
    catch (const xercesc::XMLException& e) {
      THROW_LOGICEXCEPTION_MACRO("XMLParser::parse: XMLException:"
                                 << XMLParserMessage(e.getMessage()));
    }
    catch (BaseException& e) {
      throw e;
    }
    catch (...) {
      THROW_LOGICEXCEPTION_MACRO("XMLParser::parse: caught an unspecified exception");
    }
  } // end of parse

  void XMLParser::setExternalSchemaLocation(std::string theSchemaLocation) { 
    DBG_MACRO(DbgGroup::CALLSTACK, 
	      "in XMLParser::setExternalSchemaLocation for " 
	      << theSchemaLocation.c_str());
    try {
      myParser_p->setProperty(XERCES_CPP_NAMESPACE::XMLUni::fgXercesSchemaExternalSchemaLocation,
			      (void*)XERCES_CPP_NAMESPACE::XMLString::transcode(theSchemaLocation.c_str()));
    }
    catch (const xercesc::XMLException& e) {
      THROW_LOGICEXCEPTION_MACRO("XMLParser::setExternalSchemaLocation: XMLException:"
                                 << XMLParserMessage(e.getMessage()));
    }
    catch (BaseException& e) {
      throw e;
    }
    catch (...) {
      THROW_LOGICEXCEPTION_MACRO("XMLParser::setExternalSchemaLocation: caught an unspecified exception");
    }
  } // end of setExternalSchemaLocation


  bool
  XMLParser::convertToBoolean(const std::string& aValueString) { 
    bool returnWhat;
    if (aValueString=="true" || aValueString=="1")
      returnWhat=true;
    else if (aValueString=="false" || aValueString=="0")
      returnWhat=false;
    else 
      THROW_LOGICEXCEPTION_MACRO("XMLParser::convertToBoolean: invalid input >"
				 << aValueString.c_str()
				 << "<");
    return returnWhat;
  } // end of XMLParser::convertToBoolean

  std::string XMLParser::getAttributeValueByName(const std::string& theName) {
    unsigned int len = ourAttributes_p->getLength();
    for (unsigned int index = 0; index < len; index++) {
      if (XMLParserMessage(ourAttributes_p->getQName(index)).toString()==theName)
	return XMLParserMessage(ourAttributes_p->getValue(index)).toString();
    }
    THROW_LOGICEXCEPTION_MACRO("XMLParser::getAttributeValueByName didn't get attribute for >" << theName.c_str() << "<");
  } // end of XMLParser::getAttributeValueByName

} // end of namespace 
