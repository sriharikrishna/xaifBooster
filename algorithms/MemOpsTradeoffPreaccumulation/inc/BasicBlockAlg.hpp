#ifndef _XAIFBOOSTERMEMOPSTRADEOFFPREACCUMULATION_BASICBLOCKALG_INCLUDE_
#define _XAIFBOOSTERMEMOPSTRADEOFFPREACCUMULATION_BASICBLOCKALG_INCLUDE_

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"
using namespace xaifBooster;

namespace xaifBoosterMemOpsTradeoffPreaccumulation {  

  /** 
   * class to implement algorithms relevant for the 
   * elimination methods for memory-operations-tradeoffs
   */
  class BasicBlockAlg : public xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg {
  public:
    
    BasicBlockAlg(BasicBlock& theContaining);
                                                                                
    virtual ~BasicBlockAlg() {};

    /**
     * calls algorithm_action_2() from 
     * xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg 
     */
    virtual void algorithm_action_2();
                                                                                
    /**
     * calls algorithm_action_3() from 
     * xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg 
     */

    virtual void algorithm_action_3();

    virtual void printXMLHierarchy(std::ostream& os) const;
                                                                                
    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    static void compute_elimination_sequence(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph&,int,xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList&);

  private:
    
    /** 
     * no def
     */
    BasicBlockAlg();

    /** 
     * no def
     */
    BasicBlockAlg(const BasicBlockAlg&);

    /** 
     * no def
     */
    BasicBlockAlg operator=(const BasicBlockAlg&);

  };  // end of class

} // end of namespace 
                                                                     
#endif
