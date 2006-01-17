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
#include "xaifBooster/utils/inc/GenericTraverseInvoke.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"

namespace xaifBooster { 

  void
  GenericTraverseInvoke::genericTraversal(const GenericAction::GenericAction_E anAction_c) {
    genericInvocation(anAction_c); 
    traverseToChildren(anAction_c);
  } // end of GenericTraverseInvoke::genericTraversal

  void
  GenericTraverseInvoke::genericInvocation(const GenericAction::GenericAction_E anAction_c) { 
    switch(anAction_c) { 
    case GenericAction::ALGORITHM_INIT :
      algorithm_init();
      break; 
    case GenericAction::ALGORITHM_ACTION_1 :
      algorithm_action_1();
      break; 
    case GenericAction::ALGORITHM_ACTION_2 :
      algorithm_action_2();
      break; 
    case GenericAction::ALGORITHM_ACTION_3 :
      algorithm_action_3();
      break; 
    case GenericAction::ALGORITHM_ACTION_4 :
      algorithm_action_4();
      break; 
    case GenericAction::ALGORITHM_ACTION_5 :
      algorithm_action_5();
      break; 
    case GenericAction::ALGORITHM_ACTION_6 :
      algorithm_action_6();
      break; 
    case GenericAction::ALGORITHM_ACTION_7 :
      algorithm_action_7();
      break; 
    case GenericAction::ALGORITHM_ACTION_8 :
      algorithm_action_8();
      break; 
    default:
      THROW_LOGICEXCEPTION_MACRO("GenericTraverseInvoke::genericInvocation: unknown action");
      break; 
    } // end switch 
  } // end of GenericTraverseInvoke::genericInvocation

}

