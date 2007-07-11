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

#include "xaifBooster/system/inc/AlgConfig.hpp"

namespace xaifBooster { 

  AlgConfig::AlgConfig(int argc, 
		       char** argv,
		       const std::string& buildStamp) :
    CommandLineParser(argc,argv),
    myBuildStamp(buildStamp) {
  } 

  std::string AlgConfig::getSwitches() { 
    return std::string("iocdgs");
  } 

  void AlgConfig::config() { 
    parse(getSwitches());
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
  } 

  void AlgConfig::usage() { 
    std::cout << "driver (" << myBuildStamp.c_str() << ") usage:" << std::endl
	      << myArgv[0]
	      << " -i <inputFile> -c <intrinsicsCatalogueFile> " << std::endl
	      << " common options: " << std::endl
	      << "             [-s <pathToSchema> ] defaults to ./" << std::endl
	      << "             [-o <outputFile> ] [-d <debugOutputFile> ]" << std::endl
	      << "                 both default to cout" << std::endl
	      << "             [-g <debugGroup> ]" << std::endl
	      << "                 with debugGroup >=0 the sum of any of: " << DbgGroup::printAll().c_str() << std::endl
	      << "                 default to 0(ERROR)" << std::endl;
  } 

  const std::string& AlgConfig::getInputFileName() const { 
    return myInputFileName; 
  } 

  const std::string& AlgConfig::getIntrinsicsFileName() const { 
    return myIntrinsicsFileName; 
  } 

  const std::string& AlgConfig::getSchemaPath() const { 
    return mySchemaPath; 
  } 

  const std::string& AlgConfig::getOutFileName() const { 
    return myOutFileName; 
  } 

} // end of namespace xaifBooster
                                                                     


