#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPE_BASICBLOCKALG_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPE_BASICBLOCKALG_INCLUDE_
// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================
#include <list>

#include "xaifBooster/system/inc/ForLoopReversalType.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/Sequence.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/ReinterpretedDerivativePropagator.hpp"

#include "xaifBooster/algorithms/RequiredValues/inc/RequiredValue.hpp"

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
    BasicBlockAlg& operator=(const BasicBlockAlg&);

    /**
     * need to have something to take a function pointer from
     */
    static void printDerivativePropagatorAsTape(std::ostream& os,
						const BasicBlockAlgBase& aBasicBlockAlg, 
 						const xaifBoosterDerivativePropagator::DerivativePropagator& aPropagator);
    
  protected:

    typedef std::list<const Variable*> VariablePList;

    /// This struct allows us to traverse the list of sequences along with the associated propagators and lists of pushed variables.
    struct PerSequenceData {
      const xaifBoosterBasicBlockPreaccumulation::Sequence* mySequence_p;
      ReinterpretedDerivativePropagator* myReinterpretedDerivativePropagator_p;
      VariablePList myPushedAddressVariablesPList;
      VariablePList myPushedFactorVariablesPList;
    }; // end struct PerSequenceData

    typedef std::list<PerSequenceData*> PerSequenceDataPList;

    PerSequenceDataPList myPerSequenceDataPList;

    const PerSequenceDataPList& getPerSequenceDataPList() const;

    void assignAndPushRequiredValueAfterSequence(const xaifBoosterRequiredValues::RequiredValue& aRequiredValue,
                                                 const xaifBoosterBasicBlockPreaccumulation::Sequence& aSequence);

    void pushRequiredValueAfterSequence(const xaifBoosterRequiredValues::RequiredValue& aRequiredValue,
                                        const xaifBoosterBasicBlockPreaccumulation::Sequence& aSequence);

    typedef std::list<const BasicBlockElement*> CBasicBlockElementPList;

    // \todo FIXME: do the lists need to be pointers?  or can they just be lists?
    typedef std::map<const xaifBoosterBasicBlockPreaccumulation::Sequence*,
                     CBasicBlockElementPList*> CSequenceP2CBasicBlockElementPListMap;

    CSequenceP2CBasicBlockElementPListMap myCSequenceP2CBasicBlockElementPListMap;

  private:

    /// we assume ownership of \p aBasicBlockElement
    void addElementToSequencePushBlock(const BasicBlockElement& aBasicBlockElement,
                                       const xaifBoosterBasicBlockPreaccumulation::Sequence& aSequence);

    /** 
     * some helper that deals with pushing computed indices
     */
    void reinterpretArrayAccess(const ArrayAccess& theArrayAccess,
                                PerSequenceData& aPerSequenceData);

    void pushDimensionsOf(const Variable& theFactorVariable,
			  ReinterpretedDerivativePropagator& theReinterpretedDerivativePropagator,
			  ForLoopReversalType::ForLoopReversalType_E aReversalType);

  }; // end class xaifBoosterBasicBlockPreaccumulationTape::BasicBlockAlg
 
} // end namespace xaifBoosterBasicBlockPreaccumulationTape

#endif

