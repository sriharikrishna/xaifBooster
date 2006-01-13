#ifndef _XAIFBASEPARSERHANDLERS_INCLUDE_
#define _XAIFBASEPARSERHANDLERS_INCLUDE_
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

#include "xaifBooster/utils/inc/XAIFBaseParserHelper.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/AliasMapEntry.hpp"
#include "xaifBooster/system/inc/AliasRange.hpp"
#include "xaifBooster/system/inc/AliasSet.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/ArgumentList.hpp"
#include "xaifBooster/system/inc/ArrayAccess.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/BooleanOperation.hpp"
#include "xaifBooster/system/inc/Branch.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/ConcreteArgument.hpp"
#include "xaifBooster/system/inc/Constant.hpp"
#include "xaifBooster/system/inc/ControlFlowGraph.hpp"
#include "xaifBooster/system/inc/EndBranch.hpp"
#include "xaifBooster/system/inc/EndLoop.hpp"
#include "xaifBooster/system/inc/Entry.hpp"
#include "xaifBooster/system/inc/Exit.hpp"
#include "xaifBooster/system/inc/ExpressionEdge.hpp"
#include "xaifBooster/system/inc/ForLoop.hpp"
#include "xaifBooster/system/inc/Goto.hpp"
#include "xaifBooster/system/inc/IfStatement.hpp"
#include "xaifBooster/system/inc/Intrinsic.hpp"
#include "xaifBooster/system/inc/Label.hpp"
#include "xaifBooster/system/inc/Marker.hpp"
#include "xaifBooster/system/inc/PostLoop.hpp"
#include "xaifBooster/system/inc/PreLoop.hpp"
#include "xaifBooster/system/inc/ScopeContainment.hpp"
#include "xaifBooster/system/inc/SideEffectList.hpp"
#include "xaifBooster/system/inc/SubroutineCall.hpp"
#include "xaifBooster/system/inc/Symbol.hpp"
#include "xaifBooster/system/inc/SymbolReferenceProperty.hpp"
#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

namespace xaifBooster {

  class XAIFBaseParserHandlers {
  public: 

    // Here are all the parsing methods: 

#include "xaifBooster/tools/codegen/code/parse_method_decl.inc"

  protected:
    XAIFBaseParserHandlers(){};
    ~XAIFBaseParserHandlers(){};

  }; // end of class XMLParser

} // end of namespace 

#endif
