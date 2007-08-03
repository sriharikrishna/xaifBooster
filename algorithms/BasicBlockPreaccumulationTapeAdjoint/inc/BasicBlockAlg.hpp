#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPEADJOINT_BASICBLOCKALG_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPEADJOINT_BASICBLOCKALG_INCLUDE_
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

#include "xaifBooster/system/inc/PlainBasicBlock.hpp"
#include "xaifBooster/system/inc/ForLoopReversalType.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorEntry.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"

using namespace xaifBooster;

namespace xaifBooster { 
  class Assignment;
  class BaseConstant;
  class SubroutineCall;
  class Symbol;
}

namespace xaifBoosterInlinableXMLRepresentation { 
  class InlinableSubroutineCall;
}

namespace xaifBoosterBasicBlockPreaccumulationTapeAdjoint {  

  /** 
   * class to implement a reinterpretation of 
   * the DerivativePropagator instances as 
   * taping operations
   */
  class BasicBlockAlg : virtual public xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg {
  public:
    
    BasicBlockAlg(BasicBlock& theContaining);

    virtual ~BasicBlockAlg();

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);
    
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& addInlinableSubroutineCall(const std::string& aSubroutineName,
											       const ForLoopReversalType::ForLoopReversalType_E& aReversalType);

    SubroutineCall& addSubroutineCall(const Symbol& aSubroutineNameSymbol,
				      const Scope& aSubroutineNameScope,
				      ActiveUseType::ActiveUseType_E anActiveUse,
				      const ForLoopReversalType::ForLoopReversalType_E& aReversalType);

    virtual void algorithm_action_5();

    const PlainBasicBlock::BasicBlockElementList& getBasicBlockElementList(const ForLoopReversalType::ForLoopReversalType_E& aReversalType) const; 
    
  private:

    /** 
     * no def
     */
    BasicBlockAlg();

    /** 
     * no def
     */
    BasicBlockAlg(const BasicBlockAlg&);

    /** 
     * no def
     */
    BasicBlockAlg operator=(const BasicBlockAlg&);

    /** 
     * the elements that make up the adjoint code
     * which assumes an anonymous reversal (no knowledge about the original 
     * loop variables)
     */
    PlainBasicBlock::BasicBlockElementList myBasicBlockElementListAnonymousReversal;

    /** 
     * the elements that make up the adjoint code
     * under an explicit reversal (loop constructs are reversed explicitly
     * and we assume all index expressions can be recalculated explcitly 
     * at reversal time from explicitly reversed loops)
     */
    PlainBasicBlock::BasicBlockElementList myBasicBlockElementListExplicitReversal;
    
    /** 
     * popping array index values if we pushed any
     * based on the reversal type (see also ControlFlowReversal)
     */
    void reinterpretArrayAccess(const Variable& theOriginalVariable,
				Variable& theActualVariable,
				const ForLoopReversalType::ForLoopReversalType_E& aReversalType);

    /** 
     * based on the reversal type (see also ControlFlowReversal)
     */
    void reinterpretDerivativePropagatorEntry(const xaifBoosterDerivativePropagator::DerivativePropagatorEntry& aDerivativePropagatorEntry);

    PlainBasicBlock::BasicBlockElementList& getBasicBlockElementList(const ForLoopReversalType::ForLoopReversalType_E& aReversalType); 

    /** 
     * add the call to the proper BasicBlockElementList based on aReversalType
     */
    void addZeroDeriv(Variable& theTarget,
		      const ForLoopReversalType::ForLoopReversalType_E& aReversalType);

    /** 
     * add the call to the proper BasicBlockElementList based on aReversalType
     */
    void addUnitFactor(Variable& theSource,
		       Variable& theTarget,
		       const ForLoopReversalType::ForLoopReversalType_E& aReversalType);

    /** 
     * add the call to the proper BasicBlockElementList based on aReversalType
     */
    const Variable& addFactorPop(const Symbol& aTemporarySymbol,
				 const Scope& theScopeOfTheTemporarySymbol,
				 const ForLoopReversalType::ForLoopReversalType_E& aReversalType);

    /** 
     * add the call to the proper BasicBlockElementList based on aReversalType
     */
    void addSaxpy(const Variable& theSource,
		  const Variable& theTarget,
		  const Variable& theFactor,
		  const xaifBoosterDerivativePropagator::DerivativePropagatorEntry& aDerivativePropagatorEntry,
		  const ForLoopReversalType::ForLoopReversalType_E& aReversalType);

    /** 
     * add the assignment to the proper BasicBlockElementList based on aReversalType
     */
    const Assignment& addConstantAssignment(const BaseConstant& theConstant,
					    const Symbol& aTemporarySymbol,
					    const Scope& theScopeOfTheTemporarySymbol,
					    const ForLoopReversalType::ForLoopReversalType_E& aReversalType);


  };
 
} // end of namespace 
                                                                     
#endif
