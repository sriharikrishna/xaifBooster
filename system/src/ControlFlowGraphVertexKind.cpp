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
#include "xaifBooster/system/inc/ControlFlowGraphVertexKind.hpp"

namespace xaifBooster { 

  std::string 
  ControlFlowGraphVertexKind::toString(const ControlFlowGraphVertexKind_E& aKind)
    throw (PrintingIntException) { 
    std::string returnString;
    switch(aKind) {
    case ENTRY_VKIND:
      returnString="entry";
      break;
    case EXIT_VKIND:
      returnString="exit";
      break;
    case BASICBLOCK_VKIND:
      returnString="basicblock";
      break;
    case ENDBRANCH_VKIND:
      returnString="endbranch";
      break;
    case ENDLOOP_VKIND:
      returnString="endloop";
      break;
    case IF_VKIND:
      returnString="if";
      break;
    case PRELOOP_VKIND:
      returnString="preloop";
      break;
    case POSTLOOP_VKIND:
      returnString="postloop";
      break;
    case FORLOOP_VKIND:
      returnString="forloop";
      break;
    case BRANCH_VKIND:
      returnString="branch";
      break;
    case LABEL_VKIND:
      returnString="label";
      break;
    case GOTO_VKIND:
      returnString="goto";
      break;
    default: 
      throw PrintingIntException("ControlFlowGraphVertexKind::toString: unknown value",aKind);
      break;
    } // end switch
    return returnString;
  } // end of std::string ControlFlowGraphVertexKind::toString

  const ControlFlowGraphVertexKind::ControlFlowGraphVertexKind_E
  ControlFlowGraphVertexKind::fromString(const std::string& aName) { 
    ControlFlowGraphVertexKind_E returnValue;
    if (aName=="entry")
      returnValue=ENTRY_VKIND;
    else if (aName=="exit")
      returnValue=EXIT_VKIND;
    else if (aName=="basicblock")
      returnValue=BASICBLOCK_VKIND;
    else if (aName=="endbranch")
      returnValue=ENDBRANCH_VKIND;
    else if (aName=="endloop")
      returnValue=ENDLOOP_VKIND;
    else if (aName=="if")
      returnValue=IF_VKIND;
    else if (aName=="preloop")
      returnValue=PRELOOP_VKIND;
    else if (aName=="postloop")
      returnValue=POSTLOOP_VKIND;
    else if (aName=="forloop")
      returnValue=FORLOOP_VKIND;
    else if (aName=="branch")
      returnValue=BRANCH_VKIND;
    else if (aName=="label")
      returnValue=LABEL_VKIND;
    else if (aName=="goto")
      returnValue=GOTO_VKIND;
    else  
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraphVertexKind::fromString: unknown value >"
			   << aName.c_str() << "<");
    return returnValue;
  } // end of std::string ControlFlowGraphVertexKind::fromString
  
} // end of namespace xaifBooster
