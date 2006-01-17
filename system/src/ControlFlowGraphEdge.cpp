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
#include "xaifBooster/system/inc/ControlFlowGraphEdge.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphBase.hpp"

namespace xaifBooster { 

  const std::string ControlFlowGraphEdge::ourXAIFName("xaif:ControlFlowEdge");
  const std::string ControlFlowGraphEdge::our_myId_XAIFName("edge_id");
  const std::string ControlFlowGraphEdge::our_source_XAIFName("source");
  const std::string ControlFlowGraphEdge::our_target_XAIFName("target");
  const std::string ControlFlowGraphEdge::our_myConditionValueFlag_XAIFName("has_condition_value");
  const std::string ControlFlowGraphEdge::our_myConditionValue_XAIFName("condition_value");

  bool ControlFlowGraphEdge::hasConditionValue() const {
    return myConditionValueFlag;
  }
                                                                                
  void ControlFlowGraphEdge::setConditionValue(int cv) {
    if (myConditionValueFlag)
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraphEdge::setConditionValue: already set");
    myConditionValue=cv;
    myConditionValueFlag=true;
  }

  int ControlFlowGraphEdge::getConditionValue() const {
    if (!myConditionValueFlag)
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraphEdge::getConditionValue: not set");
    return myConditionValue;
  }

  void
  ControlFlowGraphEdge::printXMLHierarchy(std::ostream& os,
					  const ControlFlowGraphBase& theGraph) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent()
       << "<"
       << ourXAIFName.c_str() 
       << " " 
       << our_myId_XAIFName.c_str()
       << "=\"" 
       << getId().c_str()
       << "\" " 
       << our_source_XAIFName.c_str()
       << "=\"" 
       << theGraph.getSourceOf(*this).getId().c_str()
       << "\" " 
       << our_target_XAIFName.c_str() 
       << "=\"" 
       << theGraph.getTargetOf(*this).getId().c_str()
       << "\" " 
       << our_myConditionValueFlag_XAIFName.c_str() 
       << "=\"" 
       << hasConditionValue()
       << "\"";
    if (hasConditionValue()) {
      os << " "
	 << our_myConditionValue_XAIFName.c_str() 
	 << "=\"" 
	 << getConditionValue()
	 << "\"";
    }
    os << "/>" 
       << std::endl; 
    pm.releaseInstance();
  } // end of ControlFlowGraphEdge::printXMLHierarchy

  std::string ControlFlowGraphEdge::debug () const { 
    std::ostringstream out;
    out << "ControlFlowGraphEdge[" << this 
	<< Edge::debug()
	<< "]" << std::ends;  
    return out.str();
  } // end of ControlFlowGraphEdge::debug

} // end of namespace xaifBooster 
