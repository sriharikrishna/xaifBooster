#ifndef _XAIFBOOSTERCONTROLFLOWREVERSAL_CONTROLFLOWGRAPHVERTEXALG_INCLUDE_
#define _XAIFBOOSTERCONTROLFLOWREVERSAL_CONTROLFLOWGRAPHVERTEXALG_INCLUDE_

#include "xaifBooster/system/inc/ControlFlowGraphVertexAlgBase.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphVertex.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal {  

  /** 
   * class to provide abstract virtual functions
   * to be implemented for whatever is derived from
   * ControlFlowGraphVertex
   */
  class ControlFlowGraphVertexAlg : public ControlFlowGraphVertexAlgBase {
  public:
    
    ControlFlowGraphVertexAlg(ControlFlowGraphVertex& theContaining);
                                                                                
    ~ControlFlowGraphVertexAlg();

    enum ControlFlowGraphVertexKind_E {UNDEF,ENTRY,EXIT,IF,FORLOOP,PRELOOP,BASICBLOCK,ENDLOOP,ENDBRANCH};

    virtual ControlFlowGraphVertexKind_E getKind() const { return UNDEF; };

    std::string kindToString() const;

  private:
    
    /** 
     * no def
     */
    ControlFlowGraphVertexAlg();

    /** 
     * no def
     */
    ControlFlowGraphVertexAlg(const ControlFlowGraphVertexAlg&);

    /** 
     * no def
     */
    ControlFlowGraphVertexAlg operator=(const ControlFlowGraphVertexAlg&);

  };  // end of class

} // end of namespace 
                                                                     
#endif
