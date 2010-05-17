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

#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/SideEffectListType.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/CallGraphVertexAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {

  std::string CallGraphVertexAlg::myAlgorithmSignature(std::string("_bbp_"));
  bool CallGraphVertexAlg::ourInitializeDerivativeComponentsFlag=false;

  CallGraphVertexAlg::CallGraphVertexAlg(const CallGraphVertex& theContaining) :
    CallGraphVertexAlgBase(theContaining),
    myBasicControlFlowGraph_p(NULL) {
  }

  CallGraphVertexAlg::~CallGraphVertexAlg() {
  }

  const std::string&
  CallGraphVertexAlg::getAlgorithmSignature() const {
    return myAlgorithmSignature;
  }

  void
  CallGraphVertexAlg::printXMLHierarchy(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent()
       << "<"
       << getContaining().getControlFlowGraph().ourXAIFName.c_str()
       << " ";
    getContaining().getControlFlowGraph().printAttributes(os,getContaining().
							  getControlFlowGraph().
							  getSymbolReference());
    os << " "
       << getContaining().getControlFlowGraph().our_myActiveFlag_XAIFName.c_str()
       << "=\""
       << getContaining().getControlFlowGraph().getActiveFlag()
       << "\">"
       << std::endl;
    getContaining().getControlFlowGraph().getArgumentList().printXMLHierarchy(os);

    SideEffectList modList = getContaining().getControlFlowGraph().getSideEffectList(SideEffectListType::MOD_LIST);
    modList.printXMLHierarchy(SideEffectListType::our_Mod_XAIFName,os);
    SideEffectList readList = getContaining().getControlFlowGraph().getSideEffectList(SideEffectListType::READ_LIST);
    readList.printXMLHierarchy(SideEffectListType::our_Read_XAIFName,os);

    myBasicControlFlowGraph_p->printXMLHierarchy(os);

    os << pm.indent()
       << "</"
       << getContaining().getControlFlowGraph().ourXAIFName
       << ">"
       << std::endl;
    pm.releaseInstance();
  }

  void 
  CallGraphVertexAlg::algorithm_action_1() { 
    // add inert basic block
    myBasicControlFlowGraph_p = new BasicControlFlowGraph(getContaining().getControlFlowGraph());
    myBasicControlFlowGraph_p->makeThisACopyOfOriginalControlFlowGraph();
    if (ourInitializeDerivativeComponentsFlag)
      myBasicControlFlowGraph_p->insertBasicBlock();
  }

  void
  CallGraphVertexAlg::initializeDerivativeComponents() { 
    ourInitializeDerivativeComponentsFlag=true;
  }

  std::string
  CallGraphVertexAlg::debug() const {
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulation::CallGraphVertexAlg["
        << this
	<< ", containing="
	<< getContaining().debug().c_str()
        << "]" << std::ends;
    return out.str();
  }

  void CallGraphVertexAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
  }
  
} // end namespace xaifBoosterBasicBlockPreaccumulation
