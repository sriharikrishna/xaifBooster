#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPE_BASICBLOCKALG_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPE_BASICBLOCKALG_INCLUDE_

#include "xaifBooster/system/inc/PlainBasicBlock.hpp"
#include "xaifBooster/system/inc/ForLoopReversalType.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationTape {  

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

    /**
     * \todo : distinction between constant and non-constant index expressions is simplified
     * or we have this fixed by a proper TBR analysis
     */
    virtual void algorithm_action_4();

    /** 
     * this implementation always returns ANONYMOUS. 
     * EXPLICIT reversal only makes sense after we ran the 
     * ControlFlowReversal 
     * BasicBlockPreaccumulationReverse which inherits from ControlFlowReversal
     * overwrites this implementation
     */
    virtual ForLoopReversalType::ForLoopReversalType_E getReversalType() const;

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

    private: 

      /** 
       * no def
       */
      ReinterpretedDerivativePropagator();

      /** 
       * no def
       */
      ReinterpretedDerivativePropagator(const ReinterpretedDerivativePropagator&);

      /** 
       * no def
       */
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

    /** 
     * some helper that deals with pushing computed indices
     */
    void reinterpretArrayAccess(ReinterpretedDerivativePropagator& aReinterpretedDerivativePropagator,
				const ArrayAccess& theArrayAccess);

    typedef std::list<ReinterpretedDerivativePropagator*> ReinterpretedDerivativePropagatorPList;

    ReinterpretedDerivativePropagatorPList myReinterpretedDerivativePropagatorPList;

  };
 
} // end of namespace xaifBoosterAngelInterfaceAlgorithms
                                                                     
#endif
