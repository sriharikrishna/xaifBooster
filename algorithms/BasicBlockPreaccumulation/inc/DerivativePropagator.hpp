#ifndef _DERIVATIVEPROPAGATOR_INCLUDE_
#define _DERIVATIVEPROPAGATOR_INCLUDE_

#include <list>
#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/DerivativePropagatorEntry.hpp"

namespace xaifBooster { 

  class Variable;
  class Constant;
  class DerivativePropagatorSaxpy;
  class DerivativePropagatorSetDeriv;

  class DerivativePropagator : public XMLPrintable {
  public:

    DerivativePropagator (){};

    ~DerivativePropagator ();

    void printXMLHierarchy(std::ostream& os) const;

    std::string debug() const ;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;
    
    typedef std::list<DerivativePropagatorEntry*> EntryList;

    /**
     * we add entries to the DerivativePropagator as
     * addZeroDerivToEntryList in AssignmentAlg::algorithm_action_2
     * and as Saxpy/SetDeriv in 
     * BasicBlockAlg::algorihm_action_3
     * For SetDeriv we either add as a temporary for variables that are 
     * both input and output 
     * OR 
     * for simple assignments, i.e. FlattenedSequences with exactly 1 vertex. 
     * The question is now where the respective SetDeriv operation should be located.
     * For FlattenedSequences with one vertex it doesn't matter since there is nothing 
     * else. 
     * For setting temporaries they always come before the saxpy ops but 
     * we have to look at their position relative to the ZeroDeriv entries. 
     * All ZeroDerivEntries are pushed in algorith_action_2.
     * If all SetDeriv entries go before the ZeroDeriv entries we just need to be 
     * sure that none of those should have been zeroed out, meaning that 
     * e.g. a constant assignment is not preceeding any 'active' use of a variable.
     * The basic block level activity analysis takes care of this by removing 
     * vertices identified as passive, so no contribution comes from that 
     * passivated vertex. If we cannot identify, then the flattening stops at this 
     * point and the ZeroDeriv remains with the previous flatten in the correct order.
     * Therefore we can always do a push_front for SetDeriv.
     */
    const DerivativePropagatorSetDeriv& addSetDerivToEntryList(const Variable& theTarget,
							       const Variable& theSource);

    DerivativePropagatorSaxpy& addSaxpyToEntryList(const Constant& thePartial,
						   const Variable& theDependent,
						   const Variable& theIndependent);

    DerivativePropagatorSaxpy& addSaxpyToEntryList(const Variable& thePartial,
						   const Variable& theDependent,
						   const Variable& theIndependent);

    void addZeroDerivToEntryList(const Variable& theTarget);

    const EntryList& getEntryList() const;

  private:

    /**
     * this class owns the DerivativePropagatorEntry
     * instances pointed to in myEntryList
     */
    EntryList myEntryList;

  }; // end of class DerivativePropagator
 
} // end of namespace xaifBooster
                                                                     
#endif
