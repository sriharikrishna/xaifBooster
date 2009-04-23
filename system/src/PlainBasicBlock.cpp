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
#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/PlainBasicBlock.hpp"
#include "xaifBooster/system/inc/BasicBlockElement.hpp"
#include "xaifBooster/system/inc/Scope.hpp"


namespace xaifBooster { 

  const std::string PlainBasicBlock::ourXAIFName("xaif:BasicBlock");
  const std::string PlainBasicBlock::our_myId_XAIFName("vertex_id");
  const std::string PlainBasicBlock::our_myScopeId_XAIFName("scope_id");

  PlainBasicBlock::PlainBasicBlock(Scope& theScope) : 
    myScope_r(theScope) { 
  } 

  PlainBasicBlock::~PlainBasicBlock() {
    for (BasicBlockElementList::const_iterator li=myElementList.begin();
         li!=myElementList.end();
         li++) { 
      if (*li)
	delete *li;
    } 
  }

  void
  PlainBasicBlock::supplyAndAddBasicBlockElementInstance(BasicBlockElement& theBasicBlockElement) { 
    myElementList.push_back(&theBasicBlockElement);
  } // end of PlainBasicBlock::supplyAndAddBasicBlockElementInstance

  void
  PlainBasicBlock::supplyAndAddBasicBlockElementInstanceAtBeginning(BasicBlockElement& theBasicBlockElement) { 
    myElementList.push_front(&theBasicBlockElement);
  } // end of PlainBasicBlock::supplyAndAddBasicBlockElementInstanceAtBeginning

  std::string PlainBasicBlock::debug () const { 
    std::ostringstream out;
    out << "PlainBasicBlock[" << this 
	<< ",myElementList[#items=" << myElementList.size() << "]"
	<< "]" << std::ends;  
    return out.str();
  } // end of PlainBasicBlock::debug

  const PlainBasicBlock::BasicBlockElementList& PlainBasicBlock::getBasicBlockElementList() const { 
    return myElementList;
  } 

  PlainBasicBlock::BasicBlockElementList& PlainBasicBlock::getBasicBlockElementList() { 
    return myElementList;
  } 

  Scope& PlainBasicBlock::getScope() const { 
    return myScope_r;
  } 

  bool
  PlainBasicBlock::hasExpression(const Expression& anExpression) const {
    for (PlainBasicBlock::BasicBlockElementList::const_iterator li = myElementList.begin();
         li != myElementList.end(); ++li)
      if ((*li)->hasExpression(anExpression))
        return true;
    return false;
  } // end PlainBasicBlock::hasExpression()
 
} // end of namespace xaifBooster 
