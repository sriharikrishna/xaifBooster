#ifndef _DERIVATIVEPROPAGATORSETDERIV_INCLUDE_
#define _DERIVATIVEPROPAGATORSETDERIV_INCLUDE_

#include "system/inc/DerivativePropagatorEntry.hpp"
#include "system/inc/BaseVariableReference.hpp"

namespace xaifBooster { 

  class DerivativePropagatorSetDeriv : public DerivativePropagatorEntry {
  public:

    DerivativePropagatorSetDeriv(const BaseVariableReference& theTarget,
				 const BaseVariableReference& theSource);

    ~DerivativePropagatorSetDeriv(){};

    void printXMLHierarchy(std::ostream& os) const;

    void printMemberXMLHierarchy(const BaseVariableReference& theBaseVariableReference,
				 const std::string& aName,
				 std::ostream& os) const;

    std::string debug() const ;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    static const std::string our_myTarget_XAIFName;

    static const std::string our_mySource_XAIFName;

    const BaseVariableReference& getTarget() const;

  private:

    /**
     * no def
     */
    DerivativePropagatorSetDeriv ();

    /**
     * no def
     */
    DerivativePropagatorSetDeriv (const DerivativePropagatorSetDeriv&);

    /**
     * no def
     */
    DerivativePropagatorSetDeriv operator=(const DerivativePropagatorSetDeriv&);

    BaseVariableReference myTarget;
    BaseVariableReference mySource;

  }; // end of class DerivativePropagatorSetDeriv
 
} // end of namespace xaifBooster
                                                                     
#endif
