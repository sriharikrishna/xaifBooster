#ifndef _XAIFBOOSTERCONTROLFLOWREVERSAL_ENTRYALG_INCLUDE_
#define _XAIFBOOSTERCONTROLFLOWREVERSAL_ENTRYALG_INCLUDE_

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ControlFlowGraphVertexAlg.hpp"
#include "xaifBooster/system/inc/EntryAlgBase.hpp"
#include "xaifBooster/system/inc/Entry.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal {  

  /** 
   * class to provide algorithm for Entry
   */
  class EntryAlg : public EntryAlgBase, public ControlFlowGraphVertexAlg {
  public:
    
    EntryAlg(Entry& theContaining);
                                                                                
    ~EntryAlg();

    std::string debug() const;

    ControlFlowGraphVertexAlg::ControlFlowGraphVertexKind_E getKind() const {
      return ControlFlowGraphVertexAlg::ENTRY;
    };


  private:
    
    /** 
     * no def
     */
    EntryAlg();

    /** 
     * no def
     */
    EntryAlg(const EntryAlg&);

    /** 
     * no def
     */
    EntryAlg operator=(const EntryAlg&);

  };  // end of class

} // end of namespace 
                                                                     
#endif
