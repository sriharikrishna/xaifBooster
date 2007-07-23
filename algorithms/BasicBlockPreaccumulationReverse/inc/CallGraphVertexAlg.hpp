#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONREVERSE_CALLGRAPHVERTEXALG_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONREVERSE_CALLGRAPHVERTEXALG_INCLUDE_
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

#include <list>

#include "xaifBooster/algorithms/AddressArithmetic/inc/CallGraphVertexAlg.hpp"

#include "xaifBooster/algorithms/CodeReplacement/inc/ReplacementList.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/ReplacementId.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationReverse {  

  /** 
   * class to implement algorithms relevant for the 
   * angel interface
   */
  class CallGraphVertexAlg : public xaifBoosterAddressArithmetic::CallGraphVertexAlg {
  public:
    
    CallGraphVertexAlg(CallGraphVertex& theContaining);

    virtual ~CallGraphVertexAlg();

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    virtual void algorithm_action_4();

    static void checkPointToFiles();
 
  private:
    
    /** 
     * no def
     */
    CallGraphVertexAlg();

    /** 
     * no def
     */
    CallGraphVertexAlg(const CallGraphVertexAlg&);

    /** 
     * no def
     */
    CallGraphVertexAlg operator=(const CallGraphVertexAlg&);

    xaifBoosterCodeReplacement::ReplacementList* myReplacementList_p;

    /** 
     * we own this
     */
    ControlFlowGraph* myCFGStoreArguments_p;

    /** 
     * we own this
     */
    ControlFlowGraph* myCFGStoreResults_p;

    /** 
     * we own this
     */
    ControlFlowGraph* myCFGRestoreArguments_p;

    /** 
     * we own this
     */
    ControlFlowGraph* myCFGRestoreResults_p;

    /** 
     * we own this
     */
    ControlFlowGraph* myCFGTimeStepStoreArguments_p;
    
    /** 
     * we own this
     */
    ControlFlowGraph* myCFGTimeStepRestoreArguments_p;

    /**
     * make entry, exit and a basic block which is returned
     */
    BasicBlock& initCheckPointCFG(ControlFlowGraph& aCheckPointCFG); 
    
    /** 
     * append type and shape strings to aSubroutineNameBase 
     * add the checkpointing calls to theBasicBlock
     */
    void handleCheckPointing(const std::string& aSubroutineNameBase,
			     SideEffectListType::SideEffectListType_E theSideEffectListType,
			     BasicBlock& theBasicBlock,
			     bool reverse);

    /** 
     * called by handleCheckPointing to deal with one argument
     */
    void handleCheckPoint(const std::string& aSubroutineNameBase,
			  BasicBlock& theBasicBlock,
			  const Variable& theVariable); 
    /** 
     * add the InlinableSubroutineCall with name  aSubroutineName
     * to theBasicBlock which pushes or pops to/from a Variable 
     * with name as specified by theSymbol and theScope
     */
    void addCheckPointingInlinableSubroutineCall(const std::string& aSubroutineName,
						 BasicBlock& theBasicBlock,
						 const Symbol& theSymbol,
						 const Scope& theScope);

    /** 
     * used to control the read order for 
     * checkpoints written to individual files, 
     * in which case it is easiest to read in the same
     * sequence as the data was written, as opposed 
     * to the stack model
     */
    static bool ourCheckPointToFilesFlag;
    
  };
 
} // end of namespace xaifBoosterAngelInterfaceAlgorithms
                                                                     
#endif
