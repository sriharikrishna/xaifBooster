#ifndef _XAIFBOOSTERCONTROLFLOWREVERSAL_BASICBLOCKALG_INCLUDE_
#define _XAIFBOOSTERCONTROLFLOWREVERSAL_BASICBLOCKALG_INCLUDE_

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ControlFlowGraphVertexAlg.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/BasicBlockAlg.hpp"
#include "xaifBooster/system/inc/BasicBlockAlgBase.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal {  

  /** 
   * class to provide algorithm for BasicBlock
   */
  class BasicBlockAlg : public xaifBoosterMemOpsTradeoffPreaccumulation::BasicBlockAlg, public ControlFlowGraphVertexAlg {
  public:
    
    BasicBlockAlg(BasicBlock& theContaining);
                                                                                
    ~BasicBlockAlg();

    std::string debug() const;

    ControlFlowGraphVertexAlg::ControlFlowGraphVertexKind_E getKind() const {
      return ControlFlowGraphVertexAlg::BASICBLOCK;
    };


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
