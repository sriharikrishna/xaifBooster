#ifndef _XAIFBOOSTERCONTROLFLOWREVERSAL_CONTROLFLOWGRAPHALG_INCLUDE_
#define _XAIFBOOSTERCONTROLFLOWREVERSAL_CONTROLFLOWGRAPHALG_INCLUDE_

#include "xaifBooster/system/inc/ControlFlowGraphAlgBase.hpp"
#include "xaifBooster/system/inc/ControlFlowGraph.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal {  

  /** 
   * class to implement algorithms relevant for the 
   * reversal of the control flow
   */
  class ControlFlowGraphAlg : public ControlFlowGraphAlgBase {
  public:
    
    ControlFlowGraphAlg(const ControlFlowGraph& theContaining);
                                                                                
    ~ControlFlowGraphAlg();

    virtual void printXMLHierarchy(std::ostream& os) const;
                                                                                
    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

  private:
    
    /** 
     * no def
     */
    ControlFlowGraphAlg();

    /** 
     * no def
     */
    ControlFlowGraphAlg(const ControlFlowGraphAlg&);

    /** 
     * no def
     */
    ControlFlowGraphAlg operator=(const ControlFlowGraphAlg&);

  };  // end of class

} // end of namespace 
                                                                     
#endif
