#ifndef _DERIVATIVEPROPAGATORSETDERIV_INCLUDE_
#define _DERIVATIVEPROPAGATORSETDERIV_INCLUDE_

#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/DerivativePropagatorEntry.hpp"

namespace xaifBooster { 

  class DerivativePropagatorSetDeriv : public DerivativePropagatorEntry {
  public:

    DerivativePropagatorSetDeriv(const Variable& theTarget,
				 const Variable& theSource);

    ~DerivativePropagatorSetDeriv(){};

    void printXMLHierarchy(std::ostream& os) const;

    void printMemberXMLHierarchy(const Variable& theVariable,
				 const std::string& aName,
				 std::ostream& os) const;

    std::string debug() const ;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    static const std::string our_myTarget_XAIFName;

    static const std::string our_mySource_XAIFName;

    const Variable& getTarget() const;

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

    Variable myTarget;
    Variable mySource;

  }; // end of class DerivativePropagatorSetDeriv
 
} // end of namespace xaifBooster
                                                                     
#endif
