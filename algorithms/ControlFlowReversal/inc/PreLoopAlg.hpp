#ifndef _XAIFBOOSTERCONTROLFLOWREVERSAL_PRELOOPALG_INCLUDE_
#define _XAIFBOOSTERCONTROLFLOWREVERSAL_PRELOOPALG_INCLUDE_
// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ControlFlowGraphVertexAlg.hpp"
#include "xaifBooster/system/inc/PreLoopAlgBase.hpp"
#include "xaifBooster/system/inc/PreLoop.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal {  

  /** 
   * class to provide algorithm for PreLoop
   */
  class PreLoopAlg : public PreLoopAlgBase, public ControlFlowGraphVertexAlg {
  public:
    
    PreLoopAlg(PreLoop& theContaining);
                                                                                
    ~PreLoopAlg();

    std::string debug() const;

    ControlFlowGraphVertexAlg::ControlFlowGraphVertexKind_E getKind() const {
      return ControlFlowGraphVertexAlg::PRELOOP;
    };


  private:
    
    /** 
     * no def
     */
    PreLoopAlg();

    /** 
     * no def
     */
    PreLoopAlg(const PreLoopAlg&);

    /** 
     * no def
     */
    PreLoopAlg& operator=(const PreLoopAlg&);

  };  // end of class

} // end of namespace 
                                                                     
#endif
