#ifndef _XAIFBOOSTERCONTROLFLOWREVERSAL_IFSTATEMENTALG_INCLUDE_
#define _XAIFBOOSTERCONTROLFLOWREVERSAL_IFSTATEMENTALG_INCLUDE_

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ControlFlowGraphVertexAlg.hpp"
#include "xaifBooster/system/inc/IfStatementAlgBase.hpp"
#include "xaifBooster/system/inc/IfStatement.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal {  

  /** 
   * class to provide algorithm for IfStatement
   */
  class IfStatementAlg : public IfStatementAlgBase, public ControlFlowGraphVertexAlg {
  public:
    
    IfStatementAlg(IfStatement& theContaining);
                                                                                
    ~IfStatementAlg();

    std::string debug() const;

    ControlFlowGraphVertexAlg::ControlFlowGraphVertexKind_E getKind() {
      return ControlFlowGraphVertexAlg::IF;
    };


  private:
    
    /** 
     * no def
     */
    IfStatementAlg();

    /** 
     * no def
     */
    IfStatementAlg(const IfStatementAlg&);

    /** 
     * no def
     */
    IfStatementAlg operator=(const IfStatementAlg&);

  };  // end of class

} // end of namespace 
                                                                     
#endif
