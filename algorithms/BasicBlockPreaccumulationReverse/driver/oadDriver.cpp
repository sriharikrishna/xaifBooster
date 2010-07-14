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

#include "xaifBooster/system/inc/XAIFBaseParser.hpp"
#include "xaifBooster/system/inc/InlinableIntrinsicsParser.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/AlgConfig.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/BasicBlockAlg.hpp"

using namespace xaifBooster;

#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/driver/buildStamp.hpp"


int main(int argc,char** argv) { 
  DbgLoggerManager::instance()->setBinaryBuildInfo(buildStamp);
  DbgLoggerManager::instance()->setSelection(DbgGroup::ERROR 
					     //| DbgGroup::CALLSTACK | DbgGroup::TEMPORARY
					     );
  xaifBoosterBasicBlockPreaccumulationReverse::AlgFactoryManager* theFManager_p=
    dynamic_cast<xaifBoosterBasicBlockPreaccumulationReverse::AlgFactoryManager*>(xaifBoosterBasicBlockPreaccumulationReverse::AlgFactoryManager::instance());
  theFManager_p->init();
  xaifBoosterBasicBlockPreaccumulationReverse::AlgConfig* algConfig_p=theFManager_p->makeAlgConfig(argc,argv,buildStamp);
  try { 
    algConfig_p->config();
  } catch (BaseException& e) { 
    DBG_MACRO(DbgGroup::ERROR,
	      "caught exception: " << e.getReason());
    algConfig_p->usage();
    return -1;
  } // end catch 
  try {   
    InlinableIntrinsicsParser ip(ConceptuallyStaticInstances::instance()->getInlinableIntrinsicsCatalogue());
    ip.initialize();
    ip.setExternalSchemaLocation(algConfig_p->getSchemaPath());
    ip.parse(algConfig_p->getIntrinsicsFileName());
    XAIFBaseParser p;
    p.initialize(algConfig_p->getInputValidationFlag());
    p.setExternalSchemaLocation(algConfig_p->getSchemaPath());
    p.parse(algConfig_p->getInputFileName());
    CallGraph& Cg(ConceptuallyStaticInstances::instance()->getCallGraph());
    Cg.getScopeTree().forcedPassivation();
    DBG_MACRO(DbgGroup::TIMING,"before linearize");
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_1); // linearize
    DBG_MACRO(DbgGroup::TIMING,"before flatten");
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_2); // flatten
    DBG_MACRO(DbgGroup::TIMING,"before Jacobian accumulation");
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_3); // accumulate Jacobian
    DBG_MACRO(DbgGroup::TIMING,"before reversal");
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_4); // use linearized version in 1st replacement
    DBG_MACRO(DbgGroup::TIMING,"before unparse");
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_5); // fix up the addresses in simple loops
    //Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_6); // place pushes and pops for required values
    const std::string& oldSchemaLocation(Cg.getSchemaLocation());
    std::string newLocation(oldSchemaLocation,0,oldSchemaLocation.find(' '));
    if (algConfig_p->getSchemaPath().size())
      newLocation.append(" "+algConfig_p->getSchemaPath()+"/xaif_output.xsd");
    else 
      newLocation.append(" xaif_output.xsd");
    Cg.resetSchemaLocation(newLocation);
    if (algConfig_p->isSet('o')) { 
      std::ofstream theOutFile(algConfig_p->getOutFileName().c_str(),
			       std::ios::out);
      Cg.printXMLHierarchy(theOutFile);
      theOutFile.close();
    } 
    else 
      Cg.printXMLHierarchy(std::cout);
  } 
  catch (BaseException& e) { 
    DBG_MACRO(DbgGroup::ERROR,
	      "caught exception: " << e.getReason());
    return -1;
  } // end catch 
  catch (std::exception& e) { 
    DBG_MACRO(DbgGroup::ERROR,
	      "caught std::exception: " << e.what());
    return -1;
  } // end catch 
  catch (...) { 
    DBG_MACRO(DbgGroup::ERROR,
	      "caught something");
    return -1;
  } // end catch 
  DBG_MACRO(DbgGroup::METRIC,"total number of assignments: " << xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::getAssignmentCounter() << std::endl << "                           "
	    << "total number of sequences: " << xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::getSequenceCounter() << std::endl << "                           "
	    << "totals for preaccumulation metrics: " << xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::getGlobalPreaccumulationCounter().debug().c_str());
  return 0;
}
