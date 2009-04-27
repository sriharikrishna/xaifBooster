#ifndef _XAIFBOOSTERPUSHPOP_BASICBLOCKALG_INCLUDE_
#define _XAIFBOOSTERPUSHPOP_BASICBLOCKALG_INCLUDE_

#include "xaifBooster/algorithms/AddressArithmetic/inc/BasicBlockAlg.hpp"

#include "xaifBooster/algorithms/RequiredValues/inc/RequiredValueSet.hpp"

using namespace xaifBooster;

namespace xaifBoosterPushPop {  

  /** 
   * class to implement determination of which values to push/pop,
   * along with the placement of the pushes and pops themselves
   */
  class BasicBlockAlg : public xaifBoosterAddressArithmetic::BasicBlockAlg {
  public:

    BasicBlockAlg(BasicBlock& theContaining);

    virtual ~BasicBlockAlg();

    virtual std::string debug() const;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

  private:

    const BasicBlock& getContaining() const;

    /// no def
    BasicBlockAlg();

    /// no def
    BasicBlockAlg(const BasicBlockAlg&);

    /// no def
    BasicBlockAlg& operator=(const BasicBlockAlg&);

  }; // end class xaifBoosterPushPop::BasicBlockAlg
 
} // end namespace xaifBoosterPushPop
                                                                     
#endif

