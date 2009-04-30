#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPE_BASICBLOCKALG_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPE_BASICBLOCKALG_INCLUDE_
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

#include "xaifBooster/system/inc/PlainBasicBlock.hpp"
#include "xaifBooster/system/inc/ForLoopReversalType.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"

#include "xaifBooster/algorithms/RequiredValues/inc/RequiredValueSet.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationTape {  

  /** 
   * class to implement a reinterpretation of 
   * the DerivativePropagator instances as 
   * taping operations
   */
  class BasicBlockAlg : public xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg {
  public:
    
    BasicBlockAlg(BasicBlock& theContaining);

    virtual ~BasicBlockAlg();

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    /**
     * check each of the ReinterpretedDerivativePropagators for \p anExpression
     */
    virtual bool hasExpression(const Expression& anExpression) const;

    /**
     * \todo : distinction between constant and non-constant index expressions is simplified
     * or we have this fixed by a proper TBR analysis
     */
    virtual void algorithm_action_4();

  private:

    /// no def
    BasicBlockAlg();

    /// no def
    BasicBlockAlg(const BasicBlockAlg&);

    /// no def
    BasicBlockAlg operator=(const BasicBlockAlg&);

    /**
     * need to have something to take a function pointer from
     */
    static void printDerivativePropagatorAsTape(std::ostream& os,
						const BasicBlockAlgBase& aBasicBlockAlg, 
 						const xaifBoosterDerivativePropagator::DerivativePropagator& aPropagator);
    
    /** 
     * here we keep the reinterpreted statements
     * along with a reference to associate things 
     * with the respective DerivativePropagator
     */
    class ReinterpretedDerivativePropagator { 

    public: 

      /** 
       * sets myOriginalPropagator
       */
      ReinterpretedDerivativePropagator(const xaifBoosterDerivativePropagator::DerivativePropagator& aPropagator);

      ~ReinterpretedDerivativePropagator();

      /** 
       * returns myOriginalPropagator
       */
      const xaifBoosterDerivativePropagator::DerivativePropagator& getOriginalDerivativePropagator() const; 

      /** 
       * adding a reinterpretation element to our list
       */ 
      void supplyAndAddBasicBlockElementInstance(BasicBlockElement& theBasicBlockElement,
						 const ForLoopReversalType::ForLoopReversalType_E& aReversalType);

      const PlainBasicBlock::BasicBlockElementList& getBasicBlockElementList(const ForLoopReversalType::ForLoopReversalType_E& aReversalType) const; 

      /**
       * check myBasicBlockElementListAnonymousReversal and myBasicBlockElementListExplicitReversal for \p anExpression
       */
      bool hasExpression(const Expression& anExpression) const;

    private: 

      /// no def
      ReinterpretedDerivativePropagator();

      /// no def
      ReinterpretedDerivativePropagator(const ReinterpretedDerivativePropagator&);

      /// no def
      ReinterpretedDerivativePropagator operator=(const ReinterpretedDerivativePropagator&);

      /** 
       * the elements that the reinterpretation consists of
       * which assumes an anonymous reversal (no knowledge about the original 
       * loop variables)
       */
      PlainBasicBlock::BasicBlockElementList myBasicBlockElementListAnonymousReversal;

      /** 
       * the elements that the reinterpretation consists of
       * under an explicit reversal (loop constructs are reversed explicitly
       * and we assume all index expressions can be recalculated explcitly 
       * at reversal time from explicitly reversed loops)
       */
      PlainBasicBlock::BasicBlockElementList myBasicBlockElementListExplicitReversal;

      /** 
       * the xaifBoosterDerivativePropagator::DerivativePropagator
       * we are reinterpreting
       */
      const xaifBoosterDerivativePropagator::DerivativePropagator& myOriginalPropagator;

    }; // end of class ReinterpretedDerivativePropagator

  protected:

    typedef std::list<const Variable*> VariablePList;

    /// This struct allows us to traverse the list of sequences along with the associated propagators and lists of pushed variables.
    struct PerSequenceData {
      const Sequence* mySequence_p;
      ReinterpretedDerivativePropagator* myReinterpretedDerivativePropagator_p;
      VariablePList myPushedAddressVariablesPList;
      VariablePList myPushedFactorVariablesPList;
    }; // end struct PerSequenceData

    typedef std::list<PerSequenceData*> PerSequenceDataPList;

    PerSequenceDataPList myPerSequenceDataPList;

    const PerSequenceDataPList& getPerSequenceDataPList() const;

    void assignAndPushRequiredValueAfterSequence(const xaifBoosterRequiredValues::RequiredValueSet::RequiredValue& aRequiredValue,
                                                 const Sequence& aSequence);

    void pushRequiredValueAfterSequence(const xaifBoosterRequiredValues::RequiredValueSet::RequiredValue& aRequiredValue,
                                        const Sequence& aSequence);

    typedef std::list<const BasicBlockElement*> CBasicBlockElementPList;

    // \todo FIXME: do the lists need to be pointers?  or can they just be lists?
    typedef std::map<const Sequence*,
                     CBasicBlockElementPList*> CSequenceP2CBasicBlockElementPListMap;

    CSequenceP2CBasicBlockElementPListMap myCSequenceP2CBasicBlockElementPListMap;

  private:

    /// we assume ownership of \p aBasicBlockElement
    void addElementToSequencePushBlock(const BasicBlockElement& aBasicBlockElement,
                                       const Sequence& aSequence);

    /** 
     * some helper that deals with pushing computed indices
     */
    void reinterpretArrayAccess(const ArrayAccess& theArrayAccess,
                                PerSequenceData& aPerSequenceData);

  }; // end class xaifBoosterBasicBlockPreaccumulationTape::BasicBlockAlg
 
} // end namespace xaifBoosterBasicBlockPreaccumulationTape

#endif

