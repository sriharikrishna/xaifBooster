#ifndef _XAIFBOOSTERCONTROLFLOWREVERSAL_GOTOALG_INCLUDE_
#define _XAIFBOOSTERCONTROLFLOWREVERSAL_GOTOALG_INCLUDE_

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ControlFlowGraphVertexAlg.hpp"
#include "xaifBooster/system/inc/GotoAlgBase.hpp"
#include "xaifBooster/system/inc/Goto.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal {  

  /** 
   * class to provide algorithm for Goto
   */
  class GotoAlg : public GotoAlgBase, public ControlFlowGraphVertexAlg {
  public:
    
    GotoAlg(Goto& theContaining);
                                                                                
    ~GotoAlg();

    std::string debug() const;

    ControlFlowGraphVertexAlg::ControlFlowGraphVertexKind_E getKind() const {
      return ControlFlowGraphVertexAlg::GOTO;
    };


  private:
    
    /** 
     * no def
     */
    GotoAlg();

    /** 
     * no def
     */
    GotoAlg(const GotoAlg&);

    /** 
     * no def
     */
    GotoAlg operator=(const GotoAlg&);

  };  // end of class

} // end of namespace 
                                                                     
#endif
