#ifndef _XAIFBOOSTERLINEARIZATION_SUBROUTINECALLALG_INCLUDE_
#define _XAIFBOOSTERLINEARIZATION_SUBROUTINECALLALG_INCLUDE_
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

#include "xaifBooster/system/inc/SubroutineCallAlgBase.hpp"
#include "xaifBooster/system/inc/PlainBasicBlock.hpp"


using namespace xaifBooster;

namespace xaifBooster { 
  class SubroutineCall;
  class ArgumentSymbolReference;
}

namespace xaifBoosterLinearization {  

  /** 
   * class to implement reversal of BasicBlockElements
   */
  class SubroutineCallAlg : public SubroutineCallAlgBase{

  public:
    
    SubroutineCallAlg(const SubroutineCall& theContainingSubroutineCall);

    virtual ~SubroutineCallAlg(){};

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    /** 
     * adjust for active/passive type mismatches 
     * \todo fix handling for external calls which should all be passive!
     */
    virtual void algorithm_action_1();

  private: 

    /** 
     * no def
     */
    SubroutineCallAlg();

    /** 
     * no def
     */
    SubroutineCallAlg(const SubroutineCallAlg&);

    /** 
     * no def
     */
    SubroutineCallAlg operator=(const SubroutineCallAlg&);

    /** 
     * prior call argument adjustments
     */
    PlainBasicBlock::BasicBlockElementList myPriorAdjustmentsList;

    /** 
     * post call argument adjustments
     */
    PlainBasicBlock::BasicBlockElementList myPostAdjustmentsList;

    /** 
     * makes a temporary variable for a given formal argument symbol
     */
    const Variable& makeTempVariable(const Symbol& formalArgument);

    /** 
     * the bit that creates the inlinable calls
     */
    void addConversion(const ConcreteArgument& theConcreteArgument,
		       const ArgumentSymbolReference& aFormalArgumentSymbolReference);

    std::string giveCallName(bool concreteArgumentActive,
			     const SymbolReference &aTempSymbolReference,
			     bool prior) const ;

    void makeTempSymbol(const ConcreteArgument& theConcreteArgument,
			const Symbol& formalArgumentSymbol,
			const Scope& formalArgumentScope,
			Variable& aVariable); 
     
  }; // end of class SubroutineCallAlg
 
} 
                                                                     
#endif
