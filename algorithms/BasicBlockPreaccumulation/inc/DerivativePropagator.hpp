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
