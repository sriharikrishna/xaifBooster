#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPEADJOINT_SUBROUTINECALLALG_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPEADJOINT_SUBROUTINECALLALG_INCLUDE_

#include "xaifBooster/system/inc/SubroutineCallAlgBase.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/BasicBlockElementAlg.hpp"

using namespace xaifBooster;

namespace xaifBooster { 
  class SubroutineCall;
}

namespace xaifBoosterBasicBlockPreaccumulationTapeAdjoint {  

  /** 
   * class to implement reversal of BasicBlockElements
   */
  class SubroutineCallAlg : public SubroutineCallAlgBase,
			    public BasicBlockElementAlg {

  public:
    
    SubroutineCallAlg(const SubroutineCall& theContainingSubroutineCall);

    virtual ~SubroutineCallAlg(){};

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    virtual void insertYourself(const BasicBlock& theBasicBlock);

  private: 

    /** 
     * no def
     */
    SubroutineCallAlg();

    /** 
     * no def
     */
    SubroutineCallAlg(const SubroutineCallAlg&);

    /** 
     * no def
     */
    SubroutineCallAlg operator=(const SubroutineCallAlg&);

  }; // end of class SubroutineCallAlg
 
} 
                                                                     
#endif
