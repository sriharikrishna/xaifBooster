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

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/AlgConfig.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"

namespace xaifBoosterBasicBlockPreaccumulation { 

  AlgConfig::AlgConfig(int argc, 
		       char** argv,
		       const std::string& buildStamp) :
    xaifBooster::AlgConfig(argc,argv,buildStamp),
    xaifBoosterLinearization::AlgConfig(argc,argv,buildStamp) {
  } 

  std::string AlgConfig::getSwitches() { 
    return std::string(xaifBoosterLinearization::AlgConfig::getSwitches()+"SnaCAm");
  } 

  void AlgConfig::config() { 
    xaifBoosterLinearization::AlgConfig::config();
    if (isSet('S')) 
      xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::forcePreaccumulationMode(xaifBoosterBasicBlockPreaccumulation::PreaccumulationMode::PreaccumulationMode_E(argAsInt('S')));
    if (isSet('n')) 
      xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::permitNarySax();
    if (isSet('a'))
      xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::setAllAlgorithms();
    if (isSet('C'))
      xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::setRuntimeCounters();
    if (isSet('A'))
      xaifBoosterCrossCountryInterface::Elimination::setAwarenessLevel(xaifBoosterCrossCountryInterface::Elimination::AwarenessLevel_E(argAsInt('A')));
    if (isSet('m'))
      xaifBoosterCrossCountryInterface::Elimination::setAllowMaintainingFlag();
  }

  void AlgConfig::usage() { 
    xaifBoosterLinearization::AlgConfig::usage();
    std::cout << " BasicBlockPreaccumulation options: " << std::endl
	      << "             [-S <level>] force statement level preaccumulation (0: statement, 1: max. graph, 2: max. graph scarce, 3: max. graph scarce with rerouting mix (experimental!)), defaults to max. graph" << std::endl
	      << "             [-n] allow n-ary sax operations" << std::endl
              << "             [-a] also run LSA graph eliminations and pick the best result" << std::endl
              << "             [-C] turn on runtime counters"  << std::endl
	      << "             [-A <level>] set heuristic awareness of unit/constant edges (0: no awareness, 1: unit awareness, 2: constant awareness), defaults to no awareness" << std::endl
              << "             [-m] allow scarcity-preserving operations that maintain the nontrivial edge count (default is strict reduction)"  << std::endl;
  } 

} // end of namespace xaifBooster
                                                                     


