#ifndef _DERIVATIVEPROPAGATOR_INCLUDE_
#define _DERIVATIVEPROPAGATOR_INCLUDE_

#include "utils/inc/XMLPrintable.hpp"
#include "DerivativePropagatorEntry.hpp"
#include <list>

namespace xaifBooster { 

  class BaseVariableReference;
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

    const DerivativePropagatorSetDeriv& addSetDerivToEntryList(const BaseVariableReference& theTarget,
							       const BaseVariableReference& theSource);

    DerivativePropagatorSaxpy& addSaxpyToEntryList(const Constant& thePartial,
						   const BaseVariableReference& theDependent,
						   const BaseVariableReference& theIndependent);

    DerivativePropagatorSaxpy& addSaxpyToEntryList(const BaseVariableReference& thePartial,
						   const BaseVariableReference& theDependent,
						   const BaseVariableReference& theIndependent);

    void addZeroDerivToEntryList(const BaseVariableReference& theTarget);

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
