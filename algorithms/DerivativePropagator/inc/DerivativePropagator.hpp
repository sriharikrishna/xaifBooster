#ifndef _XAIFBOOSTERDERIVATIVEPROPAGATOR_INCLUDE_
#define _XAIFBOOSTERDERIVATIVEPROPAGATOR_INCLUDE_

#include <list>
#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorEntry.hpp"

namespace xaifBooster{ 
  class Variable;
  class Constant;
}

using namespace xaifBooster;

namespace xaifBoosterDerivativePropagator { 

  class DerivativePropagatorSaxpy;
  class DerivativePropagatorSetDeriv;

  class DerivativePropagator : public XMLPrintable {
  public:

    DerivativePropagator (){};

    ~DerivativePropagator ();

    void printXMLHierarchy(std::ostream& os) const;

    /**
     * the actual printing is in here 
     * so we can take a function pointer and 
     * replace this 
     */
    static void printXMLHierarchyImpl(std::ostream& os,
				      const DerivativePropagator& aDerivativePropagator);

    std::string debug() const ;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;
    
    typedef std::list<DerivativePropagatorEntry*> EntryPList;

    /**
     * we add entries to the DerivativePropagator as
     * addZeroDerivToEntryPList in AssignmentAlg::algorithm_action_2
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
    const DerivativePropagatorSetDeriv& addSetDerivToEntryPList(const Variable& theTarget,
								const Variable& theSource);

    /** 
     * orderring this list becomes more complicated
     * we need to determine the insertion point
     * via supplying an iterator
     */
    const DerivativePropagatorSetDeriv& addSetDerivToEntryPList(const Variable& theTarget,
								const Variable& theSource,
								EntryPList::iterator& insertBefore);

    DerivativePropagatorSaxpy& addSaxpyToEntryPList(const Constant& thePartial,
						    const Variable& theDependent,
						    const Variable& theIndependent);

    DerivativePropagatorSaxpy& addSaxpyToEntryPList(const Variable& thePartial,
						    const Variable& theDependent,
						    const Variable& theIndependent);

    void addZeroDerivToEntryPList(const Variable& theTarget);

    const EntryPList& getEntryPList() const;

    /** 
     * now that we want to have control over the insertion point
     * we need to supply a non-const list
     */
    EntryPList& getEntryPList();

  private:

    /**
     * this class owns the DerivativePropagatorEntry
     * instances pointed to in myEntryPList
     */
    EntryPList myEntryPList;

  }; // end of class DerivativePropagator
 
} // end of namespace
                                                                     
#endif
