#ifndef _XAIFBOOSTERLINEARIZATION_CONCRETEARGUMENTALG_INCLUDE_
#define _XAIFBOOSTERLINEARIZATION_CONCRETEARGUMENTALG_INCLUDE_

#include "xaifBooster/system/inc/ConcreteArgumentAlgBase.hpp"

using namespace xaifBooster;

namespace xaifBooster { 
  class ConcreteArgument;
}

namespace xaifBoosterLinearization {  

  /** 
   * class to implement reversal of BasicBlockElements
   */
  class ConcreteArgumentAlg : public ConcreteArgumentAlgBase {

  public:
    
    ConcreteArgumentAlg(const ConcreteArgument& theContainingConcreteArgument);

    virtual ~ConcreteArgumentAlg();

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    void makeReplacement(const Variable& aVariable);

  private: 

    /** 
     * no def
     */
    ConcreteArgumentAlg();

    /** 
     * no def
     */
    ConcreteArgumentAlg(const ConcreteArgumentAlg&);

    /** 
     * no def
     */
    ConcreteArgumentAlg operator=(const ConcreteArgumentAlg&);

    /** 
     * my replacement
     */
    ConcreteArgument* myReplacement_p;

  }; // end of class ConcreteArgumentAlg
 
} 
                                                                     
#endif
