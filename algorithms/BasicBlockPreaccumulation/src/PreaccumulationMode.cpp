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
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PreaccumulationMode.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  unsigned short PreaccumulationMode::ourModeCount=4;
  
  std::string PreaccumulationMode::toString(const PreaccumulationMode_E& aPreaccumulationMode)
    throw (PrintingIntException) { 
    std::string returnString;
    switch(aPreaccumulationMode) {
    case PICK_BEST:
      returnString="pick_best";
      break;
    case STATEMENT:
      returnString="statement";
      break;
    case MAX_GRAPH:
      returnString="max_graph";
      break;
    case MAX_GRAPH_SCARSE:
      returnString="max_graph_scarse";
      break;
    case MAX_GRAPH_SCARSE_REROUTING_MIX:
      returnString="max_graph_scarse_rerouting_mix";
      break;
    default: 
      throw PrintingIntException("PreaccumulationMode::toString: unknown value",aPreaccumulationMode);
      break;
    } 
    return returnString;
  } 

  void PreaccumulationMode::checkValid(const PreaccumulationMode_E& aPreaccumulationMode) { 
    switch(aPreaccumulationMode) {
    case PICK_BEST:
    case STATEMENT:
    case MAX_GRAPH:
    case MAX_GRAPH_SCARSE:
    case MAX_GRAPH_SCARSE_REROUTING_MIX:
      break;
    default: 
      THROW_LOGICEXCEPTION_MACRO("PreaccumulationMode::fromString: unknown value " 
				 << aPreaccumulationMode);
      break;
    } 
  } 

} // end of namespace 
