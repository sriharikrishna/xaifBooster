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
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicControlFlowGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicControlFlowGraphEdge.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicControlFlowGraphVertex.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  BasicControlFlowGraphEdge::BasicControlFlowGraphEdge() :
    myConditionValueFlag(false),
    myConditionValue(0),
    myOriginalEdge_p(0) {
  }

  BasicControlFlowGraphEdge::BasicControlFlowGraphEdge(const ControlFlowGraphEdge* theOriginal) : 
    myConditionValueFlag(false),
    myConditionValue(0),
    myOriginalEdge_p(theOriginal) {
    if (theOriginal->hasConditionValue())
      setConditionValue(theOriginal->getConditionValue());
  }

  BasicControlFlowGraphEdge::~BasicControlFlowGraphEdge() {}

  bool BasicControlFlowGraphEdge::isOriginal() const {
    return (myOriginalEdge_p!=0);
  }

  const ControlFlowGraphEdge& BasicControlFlowGraphEdge::getOriginalEdge() const {
    if (!myOriginalEdge_p)
      THROW_LOGICEXCEPTION_MACRO("BasicControlFlowGraphEdge::getOriginalEdge: not set");
    return *myOriginalEdge_p;
  }

  bool BasicControlFlowGraphEdge::hasConditionValue() const {
    return myConditionValueFlag;
  }

  void BasicControlFlowGraphEdge::setConditionValue(int cv) {
    if (myConditionValueFlag)
      THROW_LOGICEXCEPTION_MACRO("BasicControlFlowGraphEdge::setConditionValue: already set");
    myConditionValue=cv;
    myConditionValueFlag=true;
  }

  int BasicControlFlowGraphEdge::getConditionValue() const {
    if (!myConditionValueFlag)
      THROW_LOGICEXCEPTION_MACRO("BasicControlFlowGraphEdge::getConditionValue: not set");
    return myConditionValue;
  }

  void BasicControlFlowGraphEdge::printXMLHierarchy(std::ostream& os, 
						    const BasicControlFlowGraph& theGraph) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent()
       << "<"
       << ControlFlowGraphEdge::ourXAIFName.c_str()
       << " "
       << ControlFlowGraphEdge::our_myId_XAIFName.c_str()
       << "=\""
       << getId().c_str()
       << "\" "
       << ControlFlowGraphEdge::our_source_XAIFName.c_str()
       << "=\"";
    const BasicControlFlowGraphVertex& src=theGraph.getSourceOf(*this);
    if (src.isOriginal())
      os << src.getOriginalVertex().getId().c_str();
    else
      os << src.getNewVertex().getId().c_str();
    os << "\" " 
       << ControlFlowGraphEdge::our_target_XAIFName.c_str() 
       << "=\"";
    const BasicControlFlowGraphVertex& tgt = theGraph.getTargetOf(*this);
    if (tgt.isOriginal())
      os << tgt.getOriginalVertex().getId().c_str();
    else
      os << tgt.getNewVertex().getId().c_str();
    os << "\" "
       << ControlFlowGraphEdge::our_myConditionValueFlag_XAIFName.c_str()
       << "=\""
       << myConditionValueFlag
       << "\"";
    if (myConditionValueFlag) { 
      os << " "
	 << ControlFlowGraphEdge::our_myConditionValue_XAIFName.c_str()
	 << "=\""
	 << myConditionValue
	 << "\"";
    }
    os << "/>" << std::endl;
    pm.releaseInstance();
  } // end of BasicControlFlowGraphEdge::printXMLHierarchy


  std::string
  BasicControlFlowGraphEdge::debug() const {
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulation::BasicControlFlowGraphEdge["
        << this
        << "]" << std::ends;
    return out.str();
  }

  void BasicControlFlowGraphEdge::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
  }

} // end of namespace

