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

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ReversibleControlFlowGraph.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/ReversibleControlFlowGraphEdge.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/ReversibleControlFlowGraphVertex.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

  ReversibleControlFlowGraphEdge::ReversibleControlFlowGraphEdge() :
    myConditionValueFlag(false),
    myConditionValue(0),
    myRevConditionValueFlag(false),
    myRevConditionValue(0),
    myOriginalEdge_p(0) {
  }

  ReversibleControlFlowGraphEdge::ReversibleControlFlowGraphEdge(const ControlFlowGraphEdge* theOriginal) : 
    myConditionValueFlag(false),
    myConditionValue(0),
    myRevConditionValueFlag(false),
    myRevConditionValue(0),
    myOriginalEdge_p(theOriginal) {
    if (theOriginal->hasConditionValue())
      setConditionValue(theOriginal->getConditionValue());
  }

  ReversibleControlFlowGraphEdge::~ReversibleControlFlowGraphEdge() {}

  bool ReversibleControlFlowGraphEdge::leadsToLoopBody() const {
    return (myConditionValueFlag && myConditionValue==1);
  }

  bool ReversibleControlFlowGraphEdge::isOriginal() const {
    return (myOriginalEdge_p!=0);
  }

  const ControlFlowGraphEdge& ReversibleControlFlowGraphEdge::getOriginalEdge() const {
    if (!myOriginalEdge_p)
      THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraphEdge::getOriginalEdge: not set");
    return *myOriginalEdge_p;
  }

  bool ReversibleControlFlowGraphEdge::hasConditionValue() const {
    return myConditionValueFlag;
  }

  void ReversibleControlFlowGraphEdge::setConditionValue(int cv) {
    if (myConditionValueFlag)
      THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraphEdge::setConditionValue: already set");
    myConditionValue=cv;
    myConditionValueFlag=true;
  }

  int ReversibleControlFlowGraphEdge::getConditionValue() const {
    if (!myConditionValueFlag)
      THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraphEdge::getConditionValue: not set");
    return myConditionValue;
  }

  bool ReversibleControlFlowGraphEdge::hasRevConditionValue() const {
    return myRevConditionValueFlag;
  }

  void ReversibleControlFlowGraphEdge::setRevConditionValue(int cv) {
    if (myRevConditionValueFlag)
      THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraphEdge::setRevConditionValue: already set");
    myRevConditionValue=cv;
    myRevConditionValueFlag=true;
  }

  int ReversibleControlFlowGraphEdge::getRevConditionValue() const {
    if (!myRevConditionValueFlag)
      THROW_LOGICEXCEPTION_MACRO("ReversibleControlFlowGraphEdge::getRevConditionValue: not set");
    return myRevConditionValue;
  }

  void ReversibleControlFlowGraphEdge::printXMLHierarchy(std::ostream& os, 
							 const ReversibleControlFlowGraph& theGraph) const {
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
    const ReversibleControlFlowGraphVertex& src=theGraph.getSourceOf(*this);
    if (src.isOriginal())
      os << src.getOriginalVertex().getId().c_str();
    else
      os << src.getNewVertex().getId().c_str();
    os << "\" " 
       << ControlFlowGraphEdge::our_target_XAIFName.c_str() 
       << "=\"";
    const ReversibleControlFlowGraphVertex& tgt = theGraph.getTargetOf(*this);
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
  } // end of ReversibleControlFlowGraphEdge::printXMLHierarchy


  std::string
  ReversibleControlFlowGraphEdge::debug() const {
    std::ostringstream out;
    out << "xaifBoosterControlFlowReversal::ReversibleControlFlowGraphEdge["
        << this
        << "]" << std::ends;
    return out.str();
  }

  void ReversibleControlFlowGraphEdge::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
  }

} // end of namespace

