#ifndef _ENDBRANCHALGBASE_INCLUDE_
#define _ENDBRANCHALGBASE_INCLUDE_

#include "xaifBooster/system/inc/ControlFlowGraphVertexAlgBase.hpp"

namespace xaifBooster {  
  
  class EndBranch;

  class EndBranchAlgBase: public ControlFlowGraphVertexAlgBase { 

  public: 

    EndBranchAlgBase(const EndBranch& theContaining);

    virtual ~EndBranchAlgBase();

  private: 

    /** 
     * not defined
     */
    EndBranchAlgBase();

    /** 
     * not defined
     */
    EndBranchAlgBase(const EndBranchAlgBase&);

    /** 
     * not defined
     */
    EndBranchAlgBase& operator=(const EndBranchAlgBase&);

  }; 

} // end of namespace 

#endif
