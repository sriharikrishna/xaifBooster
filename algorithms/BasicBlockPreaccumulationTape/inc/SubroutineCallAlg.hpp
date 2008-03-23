#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPE_SUBROUTINECALLALG_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPE_SUBROUTINECALLALG_INCLUDE_
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

#include "xaifBooster/algorithms/TypeChange/inc/SubroutineCallAlg.hpp"

using namespace xaifBooster;

namespace xaifBooster { 
  class SubroutineCall;
}

namespace xaifBoosterBasicBlockPreaccumulationTape {  

  /** 
   * class to implement taping array access in arguments
   */
  class SubroutineCallAlg : virtual public xaifBoosterTypeChange::SubroutineCallAlg {

  public:
    
    SubroutineCallAlg(const SubroutineCall& theContainingSubroutineCall);

    virtual ~SubroutineCallAlg();

    //    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    /**
     * \todo : distinction between constant and non-constant index expressions is simplified
     * or we have this fixed by a proper TBR analysis
     */
    virtual void algorithm_action_4();

    void printXMLHierarchy(std::ostream& os) const;

    const Expression::VariablePVariableSRPPairList& getIndexVariablesPushed() const; 

    void checkAndPush(const Variable& theVariable);  

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
     * for anonymous reversals we need to store 
     * any array indices occuring in formal arguments,
     * we had first assigned them and now after the call 
     * is made we tape them so we can restore them 
     * prior to the call in reverse mode.
     */
    PlainBasicBlock::BasicBlockElementList myAfterCallIndexPushes;

    /** 
     * inserts inlined stores for index values
     */
    void handleArrayAccessIndices(ConcreteArgument& theConcreteArgument);
    
    typedef std::list<Variable*> VariablePList; 
    
    /** 
     * list of all index variables pushed
     * where the second of the pair 
     * is non-null pointer if the value was saved 
     * in a temporary, pointing to that temporary.
     */
    Expression::VariablePVariableSRPPairList myIndexVariablesPushed; 

  }; // end of class SubroutineCallAlg
 
} 
                                                                     
#endif
