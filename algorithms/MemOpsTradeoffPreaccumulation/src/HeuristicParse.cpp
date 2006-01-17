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
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/HeuristicParse.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

using namespace MemOpsTradeoffPreaccumulation;

namespace MemOpsTradeoffPreaccumulation {

  ConceptuallyStaticInstances::Heuristic HeuristicParse::stringToEnum(const std::string& theHeuristic) {

    if(theHeuristic == "VERTEX"){
      return ConceptuallyStaticInstances::VERTEX;
    }// end if VERTEX
    else if(theHeuristic == "EDGE"){
      return ConceptuallyStaticInstances::EDGE;
    }// end if EDGE
    else if(theHeuristic == "FACE"){
      return ConceptuallyStaticInstances::FACE;
    }// end if FACE
    else if(theHeuristic == "FORWARD"){
      return ConceptuallyStaticInstances::FORWARD;
    }// end if FORWARD
    else if(theHeuristic == "REVERSE"){
      return ConceptuallyStaticInstances::REVERSE;
    }// end if REVERSE
    else if(theHeuristic == "MARKOWITZ"){
      return ConceptuallyStaticInstances::MARKOWITZ;
    }// end if MARKOWITZ
    else if(theHeuristic == "SIBLING"){
      return ConceptuallyStaticInstances::SIBLING;
    }// end if SIBLING
    else if(theHeuristic == "SIBLING2"){
      return ConceptuallyStaticInstances::SIBLING2;
    }// end if SIBLING2
    else if(theHeuristic == "SUCCPRED"){
      return ConceptuallyStaticInstances::SUCCPRED;
    }// end if SUCCPRED
    else if(theHeuristic == "ABSORB"){
      return ConceptuallyStaticInstances::ABSORB;
    }// end if ABSORB
    else{
      THROW_LOGICEXCEPTION_MACRO("Error: Unknown Heuristic Passed");
    }// end else

  }// end FromString

  void HeuristicParse::fromString(const std::string& theHeuristicString){

    ConceptuallyStaticInstances::HeuristicList& theHeuristicList = ConceptuallyStaticInstances::instance()->getList();

    boost::tokenizer<> tok(theHeuristicString);
    
    for(boost::tokenizer<>::iterator beg = tok.begin(); beg!=tok.end(); ++beg){
      switch(HeuristicParse::stringToEnum(*beg)){
      case ConceptuallyStaticInstances::VERTEX:
	if(theHeuristicList.empty()){theHeuristicList.push_back(ConceptuallyStaticInstances::VERTEX);}
	else{
	  THROW_LOGICEXCEPTION_MACRO("Error: Heuristics out of order");
	}
	break;
      case ConceptuallyStaticInstances::EDGE:
	if(theHeuristicList.empty()){theHeuristicList.push_back(ConceptuallyStaticInstances::EDGE);}
	else{
	  THROW_LOGICEXCEPTION_MACRO("Error: Heuristics out of order");
	}
	break;
      case ConceptuallyStaticInstances::FACE:
	if(theHeuristicList.empty()){theHeuristicList.push_back(ConceptuallyStaticInstances::FACE);}
	else{
	  THROW_LOGICEXCEPTION_MACRO("Error: Heuristics out of order");
	}
	break;
      case ConceptuallyStaticInstances::FORWARD:
	if(theHeuristicList.empty()){
	  THROW_LOGICEXCEPTION_MACRO("Error: Heuristics out of order");
	}
	else{theHeuristicList.push_back(ConceptuallyStaticInstances::FORWARD);}
	break;
      case ConceptuallyStaticInstances::REVERSE:
	if(theHeuristicList.empty()){
	  THROW_LOGICEXCEPTION_MACRO("Error: Heuristics out of order");
	}
	else{theHeuristicList.push_back(ConceptuallyStaticInstances::REVERSE);}
	break;
      case ConceptuallyStaticInstances::MARKOWITZ:
	if(theHeuristicList.empty()){
	  THROW_LOGICEXCEPTION_MACRO("Error: Heuristics out of order");
	}
	else{theHeuristicList.push_back(ConceptuallyStaticInstances::MARKOWITZ);}
	break;
      case ConceptuallyStaticInstances::SIBLING:
	if(theHeuristicList.empty()){
	  THROW_LOGICEXCEPTION_MACRO("Error: Heuristics out of order");
	}
	else{theHeuristicList.push_back(ConceptuallyStaticInstances::SIBLING);}
	break;
      case ConceptuallyStaticInstances::SIBLING2:
	if(theHeuristicList.empty()){
	  THROW_LOGICEXCEPTION_MACRO("Error: Heuristics out of order");
	}
	else{theHeuristicList.push_back(ConceptuallyStaticInstances::SIBLING2);}
	break;
      case ConceptuallyStaticInstances::SUCCPRED:
	if(theHeuristicList.empty()){
	  THROW_LOGICEXCEPTION_MACRO("Error: Heuristics out of order");
	}
	else{theHeuristicList.push_back(ConceptuallyStaticInstances::SUCCPRED);}
	break;
      case ConceptuallyStaticInstances::ABSORB:
	if(theHeuristicList.empty()){
	  THROW_LOGICEXCEPTION_MACRO("Error: Heuristics out of order");
	}
	else{theHeuristicList.push_back(ConceptuallyStaticInstances::ABSORB);}
      }//end switch
   
    }// end for all tokens

  }// end fromString

}// end namespace MemOpsTradeoffPreaccumulation
