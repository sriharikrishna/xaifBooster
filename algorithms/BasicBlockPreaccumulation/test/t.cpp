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
#include <utility>
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include "xaifBooster/utils/inc/CommandLineParser.hpp"
#include "xaifBooster/system/inc/XAIFBaseParser.hpp"
#include "xaifBooster/system/inc/InlinableIntrinsicsParser.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/algorithms/Linearization/inc/SubroutineCallAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ControlFlowGraphAlg.hpp"

using namespace xaifBooster;

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/test/buildStamp.hpp"

void Usage(char** argv) { 
  std::cout << "test driver: "
	    << argv[0]
	    << " -i <inputFile> -c <intrinsicsCatalogueFile> " << std::endl
	    << "             [-s <pathToSchema> ] defaults to ./" << std::endl
	    << "             [-o <outputFile> ] [-d <debugOutputFile>]" << std::endl
	    << "                 both default to cout" << std::endl
	    << "             [-g <debugGroup]" << std::endl
	    << "                 with debugGroup >=0 the sum of any of: " << DbgGroup::printAll().c_str() << std::endl
	    << "                 default to 0(ERROR)" << std::endl
	    << "             [-S <level>] force preaccumulation level (0: statement, 1: max. graph, 2: max. graph scarse), defaults to pick best" << std::endl
	    << "             [-n] allow n-ary sax operations" << std::endl
	    << "             [-w \"<list of subroutines with wrappers\" " << std::endl
            << "                 space separated list enclosed in double quotes" << std::endl
	    << "             [-r] force renaming of all non-external routines" << std::endl
            << "             [-a] dynamically choose graph elimination algorithm" << std::endl
	    << "             [-C] turn on runtime counters"  << std::endl
	    << " build info : " << buildStamp.c_str() << std::endl;
} 

int main(int argc,char** argv) { 
  DbgLoggerManager::instance()->setBinaryBuildInfo(buildStamp);
  DbgLoggerManager::instance()->setSelection(DbgGroup::ERROR 
					     //| DbgGroup::CALLSTACK | DbgGroup::TEMPORARY
					     );
  std::string inFileName, outFileName, intrinsicsFileName, schemaPath;
  // to contain the namespace url in case of -s having a schema location
  std::string aUrl;
  try { 
    CommandLineParser::instance()->initialize("aiocCdgsSnwr",argc,argv);
    inFileName=CommandLineParser::instance()->argAsString('i');
    intrinsicsFileName=CommandLineParser::instance()->argAsString('c');
    if (CommandLineParser::instance()->isSet('s')) 
      schemaPath=CommandLineParser::instance()->argAsString('s');
    if (CommandLineParser::instance()->isSet('o')) 
      outFileName=CommandLineParser::instance()->argAsString('o');
    if (CommandLineParser::instance()->isSet('d')) 
      DbgLoggerManager::instance()->setFile(CommandLineParser::instance()->argAsString('d'));
    if (CommandLineParser::instance()->isSet('g')) 
      DbgLoggerManager::instance()->setSelection(CommandLineParser::instance()->argAsInt('g'));
    if (CommandLineParser::instance()->isSet('S')) 
      xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::forcePreaccumulationMode(xaifBoosterBasicBlockPreaccumulation::PreaccumulationMode::PreaccumulationMode_E(CommandLineParser::instance()->argAsInt('S')));
    if (CommandLineParser::instance()->isSet('n')) 
      xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::permitNarySax();
    if (CommandLineParser::instance()->isSet('w')) 
      xaifBoosterLinearization::SubroutineCallAlg::addWrapperNames(CommandLineParser::instance()->argAsString('w'));
    if (CommandLineParser::instance()->isSet('r')) 
      xaifBoosterLinearization::ControlFlowGraphAlg::setForceNonExternalRenames();
    if (CommandLineParser::instance()->isSet('a'))
      xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::setAllAlgorithms();
    if (CommandLineParser::instance()->isSet('C')) 
     xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::setRuntimeCounters();
  } catch (BaseException& e) { 
    DBG_MACRO(DbgGroup::ERROR,
	      "caught exception: " << e.getReason());
    Usage(argv);
    return -1;
  } // end catch 
  try {   
    DBG_MACRO(DbgGroup::TIMING,"before XML parsing");
    xaifBoosterBasicBlockPreaccumulation::AlgFactoryManager::instance()->init();
    InlinableIntrinsicsParser ip(ConceptuallyStaticInstances::instance()->getInlinableIntrinsicsCatalogue());
    ip.initialize();
    if (schemaPath.size()) { 
      aUrl="http://www.mcs.anl.gov/XAIFInlinableIntrinsics ";
      ip.setExternalSchemaLocation(aUrl+schemaPath+"/xaif_inlinable_intrinsics.xsd");
    } 
    ip.parse(intrinsicsFileName);
    XAIFBaseParser p;
    p.initialize(true);
    if (schemaPath.size()) { 
      aUrl="http://www.mcs.anl.gov/XAIF ";
      p.setExternalSchemaLocation(aUrl+schemaPath+"/xaif.xsd");
    } 
    p.parse(inFileName);
    CallGraph& Cg(ConceptuallyStaticInstances::instance()->getCallGraph());
    DBG_MACRO(DbgGroup::TIMING,"before linearize");
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_1); // linearize
    DBG_MACRO(DbgGroup::TIMING,"before flatten");
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_2); // flatten
    DBG_MACRO(DbgGroup::TIMING,"before accumulation");
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_3); // accumulate Jacobian
    DBG_MACRO(DbgGroup::TIMING,"before unparse");
    const std::string& oldSchemaLocation(Cg.getSchemaLocation());
    std::string newLocation(oldSchemaLocation,0,oldSchemaLocation.find(' '));
    if (schemaPath.size())
      newLocation.append(" "+schemaPath+"/xaif_output.xsd");
    else 
      newLocation.append(" xaif_output.xsd");
    Cg.resetSchemaLocation(newLocation);
    if (CommandLineParser::instance()->isSet('o')) { 
      std::ofstream theOutFile(CommandLineParser::instance()->argAsString('o').c_str(),
			       std::ios::out);
      Cg.printXMLHierarchy(theOutFile);
      theOutFile.close();
    } 
    else 
      Cg.printXMLHierarchy(std::cout);
  } catch (BaseException& e) { 
    DBG_MACRO(DbgGroup::ERROR,
	      "caught exception: " << e.getReason());
    return -1;
  } // end catch 
  DBG_MACRO(DbgGroup::TIMING,"done");
  DBG_MACRO(DbgGroup::METRIC,"total number of assignments: "
	    << xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::SequenceHolder::getAssignmentCounter()
	    << " total number of Sequences: "
	    << xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::SequenceHolder::getSequenceCounter());
  return 0;
}
  
