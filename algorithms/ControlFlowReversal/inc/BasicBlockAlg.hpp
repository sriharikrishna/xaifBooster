#ifndef _XAIFBOOSTERCONTROLFLOWREVERSAL_BASICBLOCKALG_INCLUDE_
#define _XAIFBOOSTERCONTROLFLOWREVERSAL_BASICBLOCKALG_INCLUDE_

#include "xaifBooster/system/inc/BasicBlockAlgBase.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/ForLoopReversalType.hpp"

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ControlFlowGraphVertexAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal {  

  /** 
   * class to provide algorithm for BasicBlock
   */
  class BasicBlockAlg : virtual public BasicBlockAlgBase,
			public ControlFlowGraphVertexAlg {
  public:
    
    BasicBlockAlg(BasicBlock& theContaining);
                                                                                
    ~BasicBlockAlg();

    std::string debug() const;

    ControlFlowGraphVertexAlg::ControlFlowGraphVertexKind_E getKind() const {
      return ControlFlowGraphVertexAlg::BASICBLOCK;
    };

    virtual ForLoopReversalType::ForLoopReversalType_E getReversalType() const;

    void setReversalType(ForLoopReversalType::ForLoopReversalType_E aReversalType); 

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

    /** 
     * reversal type 
     */
    ForLoopReversalType::ForLoopReversalType_E myReversalType;

  };  // end of class

} // end of namespace 
                                                                     
#endif
