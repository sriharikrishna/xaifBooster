#ifndef _XAIFBOOSTERCONSTANTFOLDING_BASICBLOCKALG_INCLUDE_
#define _XAIFBOOSTERCONSTANTFOLDING_BASICBLOCKALG_INCLUDE_

#include <list>
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/ConstantFolding/inc/EnhancedPrivateLinearizedComputationalGraph.hpp"

using namespace xaifBooster;

namespace xaifBoosterConstantFolding {  

  /** 
   * class to implement algorithms relevant for the 
   * angel interface
   */
  class BasicBlockAlg : public xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg {
  public:
    BasicBlockAlg( BasicBlock& theContaining ) ;

//  Used for the Constant Folding
    virtual void algorithm_action_3();

/* function that creates the EnhancedPrivateLinearizedComputational factories*/
    static void init();
    
  };
} // end of namespace xaifBoosterAngelInterfaceAlgorithms
                                                                     
#endif
