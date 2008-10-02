#ifndef _XAIFBOOSTERTYPECHANGE_SUBROUTINECALLALG_INCLUDE_
#define _XAIFBOOSTERTYPECHANGE_SUBROUTINECALLALG_INCLUDE_
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

#include <string> 
#include <list> 

#include "xaifBooster/system/inc/SubroutineCallAlgBase.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/Expression.hpp"
#include "xaifBooster/algorithms/TypeChange/inc/SymbolAlg.hpp"


using namespace xaifBooster;

namespace xaifBooster { 
  class SubroutineCall;
  class ArgumentSymbolReference;
  class Variable;
  class ConcreteArgument;
  class ArrayAccess;
}

namespace xaifBoosterTypeChange {  

  /** 
   * class to implement conversion to avoid 
   * type mismatches and potential renames 
   * if indicated by wrappernames or 
   * by the forced renames
   */
  class SubroutineCallAlg : public SubroutineCallAlgBase{

  public:
    
    SubroutineCallAlg(const SubroutineCall& theContainingSubroutineCall);

    virtual ~SubroutineCallAlg();

    virtual void printXMLHierarchy(std::ostream& os) const;

    void printXMLHierarchyImpl(std::ostream& os) const;

    void printXMLHierarchyImplWithAdjustments(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    /** 
     * see replaceArguments
     */
    virtual void algorithm_action_1();

    /** 
     * adjust for active/passive type mismatches 
     * \todo fix handling for external calls which should all be passive!
     * rename calls for all subroutines that are external and have 
     * wrappers or all internally defined subroutines if this is 
     * enforced, see CallGraphVertexAlg
     */
    void replaceArguments(bool withCopy); 

    static void addWrapperNames(const std::string& theSpaceSeparatedNames);

    const Expression::VariablePVariableSRPPairList& getReplacementPairs()const; 

  private:
    
    /** 
     * for conversions we need to first assign 
     * any array indices occuring in formal arguments
     * to temporaries in case they get overwritten during 
     * the call
     */
    PlainBasicBlock::BasicBlockElementList myPriorToCallAssignments;
    
    Expression::VariablePVariableSRPPairList myReplacementPairs; 

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
     * the bit that replaces the argument 
     * and creates the inlinable calls
     * if withCopy is true
     */
    void addConversion(const ConcreteArgument& theConcreteArgument,
		       const ArgumentSymbolReference& aFormalArgumentSymbolReference,
		       const BasicBlock& theBasicBlock,
		       bool withCopy);

    std::string giveCallName(bool concreteArgumentActive,
			     const SymbolReference &aTempSymbolReference,
			     unsigned int missingDimensions,
			     bool prior) const ;
    /**
     * if forcePassive then we create a passive type, 
     * otherwise we create the type specified in the formalArgumentSymbol
     */
    void makeTempSymbol(const ConcreteArgument& theConcreteArgument,
			const Symbol& formalArgumentSymbol,
			const Scope& formalArgumentScope,
			Variable& aVariable,
			int formalMinusConcreteDims,
			bool forcePassive); 

    /** 
     * the bit that creates the inlinable calls for such 
     * external calls that don't have hand written adjoints
     * i.e. we don't have a formal parameter list for these calls
     */
    void addExternalConversion(const ConcreteArgument& theConcreteArgument,
			       const BasicBlock& theBasicBlock);

    /** 
     * the list of external subroutines that have hand
     * written adjoints 
     */
    static std::list<std::string> ourWrapperSubRoutineNameList;

    void initExternalCall(SymbolAlg& aSymbolAlg);

    void handleExternalCall(const BasicBlock& theBasicBlock);

    /** 
     * inserts assignments for index values
     */
    void handleArrayAccessIndices(const ConcreteArgument& theConcreteArgument,
				  const BasicBlock& theBasicBlock);

    /** 
     * for F77 style pseudo pointer arithmetic
     * pass in the proper F90 slice
     * e.g. for a(2,3) passed to foo(fa)
     * where the formal fa is a vector of length 2
     * we call in F77 foo(a(1,2))  but in F90 
     * this has to become a proper slice foo(a(1:2,2))
     */
    void adjustF77ToF90Indices(Variable& aVariable,
			       int formalMinusConcreteDims); 

  }; // end of class SubroutineCallAlg
 
} 
                                                                     
#endif
