#ifndef _BRANCHALGBASE_INCLUDE_
#define _BRANCHALGBASE_INCLUDE_

#include "xaifBooster/system/inc/ControlFlowGraphVertexAlgBase.hpp"

namespace xaifBooster {  
  
  class Branch;

  class BranchAlgBase: public ControlFlowGraphVertexAlgBase { 

  public: 

    BranchAlgBase(const Branch& theContaining);

    virtual ~BranchAlgBase();

  private: 

    /** 
     * not defined
     */
    BranchAlgBase();

    /** 
     * not defined
     */
    BranchAlgBase(const BranchAlgBase&);

    /** 
     * not defined
     */
    BranchAlgBase& operator=(const BranchAlgBase&);

  }; 

} // end of namespace 

#endif
