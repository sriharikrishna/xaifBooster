#ifndef _XAIFBOOSTERCONTROLFLOWREVERSAL_LABELALG_INCLUDE_
#define _XAIFBOOSTERCONTROLFLOWREVERSAL_LABELALG_INCLUDE_

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ControlFlowGraphVertexAlg.hpp"
#include "xaifBooster/system/inc/LabelAlgBase.hpp"
#include "xaifBooster/system/inc/Label.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal {  

  /** 
   * class to provide algorithm for Label
   */
  class LabelAlg : public LabelAlgBase, public ControlFlowGraphVertexAlg {
  public:
    
    LabelAlg(Label& theContaining);
                                                                                
    ~LabelAlg();

    std::string debug() const;

    ControlFlowGraphVertexAlg::ControlFlowGraphVertexKind_E getKind() const {
      return ControlFlowGraphVertexAlg::LABEL;
    };


  private:
    
    /** 
     * no def
     */
    LabelAlg();

    /** 
     * no def
     */
    LabelAlg(const LabelAlg&);

    /** 
     * no def
     */
    LabelAlg operator=(const LabelAlg&);

  };  // end of class

} // end of namespace 
                                                                     
#endif
