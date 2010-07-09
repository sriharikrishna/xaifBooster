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
#include <iostream>

#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/FrontEndDecorations.hpp"

#include "xaifBooster/system/inc/AlgConfig.hpp"
#include "xaifBooster/system/inc/CallGraphVertex.hpp"
#include "xaifBooster/system/inc/Symbol.hpp"
#include "xaifBooster/system/inc/SubroutineCall.hpp"

namespace xaifBooster { 

  AlgConfig::AlgConfig(int argc, 
		       char** argv,
		       const std::string& buildStamp) :
    CommandLineParser(argc,argv),
    myBuildStamp(buildStamp),
    myConfiguredFlag(false),
    myInputValidationFlag(false) {
  } 

  std::string AlgConfig::getSwitches() { 
    return std::string("iocdgGNsTvpbVDFh");
  } 

  void AlgConfig::config() { 
    if (!myConfiguredFlag) { 
      // avoid doing this twice
      parse(getSwitches());
      if (isSet('h')){ 
	usage();
      }
      myInputFileName=argAsString('i');
      myIntrinsicsFileName=argAsString('c');
      if (isSet('s')) 
	mySchemaPath=argAsString('s');
      if (isSet('o')) 
	myOutFileName=argAsString('o');
      if (isSet('d')) 
	DbgLoggerManager::instance()->setFile(argAsString('d'));
      if (isSet('g')) 
	DbgLoggerManager::instance()->setSelection(argAsInt('g'));
      if (isSet('G')) 
	DbgLoggerManager::instance()->setGraphicsFormat(argAsString('G'));
      if (isSet('N')) 
	myNIIntrinsicsFileName=argAsString('N');
      if (isSet('p'))
	Symbol::addSymbolNamesToPassivate(argAsString('p'));
      if (isSet('b'))
	SubroutineCall::noBlackBoxOptimism();
      if (isSet('V'))
	PrintManager::setVerbose();
      if (isSet('D'))
	CallGraphVertex::setInitializeDerivativeComponentsFlag();
      if (isSet('T'))
	DbgLoggerManager::instance()->addTags(argAsString('T'));
      myInputValidationFlag=isSet('v');
      if (isSet('F'))
	Symbol::setFrontEndDecorations(FrontEndDecorations::fromString(argAsString('F')));
      myConfiguredFlag=true;
    } 
  } 

  void AlgConfig::usage() { 
    std::cout << "driver (" << myBuildStamp.c_str() << ") usage:" << std::endl
	      << myArgv[0]
	      << " -i <inputFile> -c <intrinsicsCatalogueFile> " << std::endl
	      << " common options: " << std::endl
	      << "             [-s <pathToSchema> ] " << std::endl
	      << "                 XAIF schema path, defaults to directory that contains the input file" << std::endl
	      << "             [-o <outputFile> ] [-d <debugOutputFile> ]" << std::endl
	      << "                 both default to std::cout" << std::endl
	      << "             [-N <nonInlinableIntrinsicsCatalogueFile> ]" << std::endl
	      << "             [-g <debugGroup> ]" << std::endl
	      << "                 with debugGroup >=0 the sum of any of: " << std::endl
	      << "                 "<< DbgGroup::printAll().c_str() << std::endl
	      << "                 defaults to 0(ERROR)" << std::endl
              << "             [-G <format>] debugging graphics format, where <format > is one of:" << std::endl
              << "                 ps - postscript format displayed with ghostview (default)" << std::endl 
              << "                 svg - scalable vector graphics format displayed in firefox" << std::endl 
              << "             [-T \"<list of tags to narrow debug output>\" ]" << std::endl 
              << "                 space separated list enclosed in double quotes" << std::endl
              << "             [-p \"<list of symbols to forcibly passivate>\" ]" << std::endl 
              << "                 space separated list enclosed in double quotes" << std::endl
              << "             [-b] pessimistic assumptions for black box routines" << std::endl 
	      << "             [-v] validate the input against the schema" << std::endl
	      << "             [-V] verbose xaif output" << std::endl
	      << "             [-D] initialize derivative components of active variables" << std::endl
	      << "             [-F <style> ]" << std::endl
	      << "                 front-end decoration style, where <style> is one of: " << std::endl
	      << "                 "<< FrontEndDecorations::printAll().c_str() << std::endl
	      << "                 defaults to OPEN64_STYLE" << std::endl
	      << "             [-h] print this help message" << std::endl
      ;
  } 

  const std::string& AlgConfig::getInputFileName() const { 
    if (!myConfiguredFlag)
      THROW_LOGICEXCEPTION_MACRO("AlgConfig::config() has not been called"); 
    return myInputFileName; 
  } 

  bool AlgConfig::getInputValidationFlag() const { 
    if (!myConfiguredFlag)
      THROW_LOGICEXCEPTION_MACRO("AlgConfig::config() has not been called"); 
    return myInputValidationFlag; 
  } 

  const std::string& AlgConfig::getIntrinsicsFileName() const { 
    if (!myConfiguredFlag)
      THROW_LOGICEXCEPTION_MACRO("AlgConfig::config() has not been called"); 
    return myIntrinsicsFileName; 
  } 

  const std::string& AlgConfig::getNIIntrinsicsFileName() const { 
    if (!myConfiguredFlag)
      THROW_LOGICEXCEPTION_MACRO("AlgConfig::config() has not been called"); 
    return myNIIntrinsicsFileName; 
  } 

  const std::string& AlgConfig::getSchemaPath() const { 
    if (!myConfiguredFlag)
      THROW_LOGICEXCEPTION_MACRO("AlgConfig::config() has not been called"); 
    return mySchemaPath; 
  } 

  const std::string& AlgConfig::getOutFileName() const { 
    if (!myConfiguredFlag)
      THROW_LOGICEXCEPTION_MACRO("AlgConfig::config() has not been called"); 
    return myOutFileName; 
  } 

} // end of namespace xaifBooster
                                                                     


