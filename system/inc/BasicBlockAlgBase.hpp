#ifndef _BASICBLOCKALGBASE_INCLUDE_
#define _BASICBLOCKALGBASE_INCLUDE_

#include "xaifBooster/system/inc/ControlFlowGraphVertexAlgBase.hpp"

namespace xaifBooster {  
  
  class BasicBlock;

  class BasicBlockAlgBase: public ControlFlowGraphVertexAlgBase { 

  public: 

    BasicBlockAlgBase(const BasicBlock& theContaining);

    virtual ~BasicBlockAlgBase();

  private: 

    /** 
     * not defined
     */
    BasicBlockAlgBase();

    /** 
     * not defined
     */
    BasicBlockAlgBase(const BasicBlockAlgBase&);

    /** 
     * not defined
     */
    BasicBlockAlgBase& operator=(const BasicBlockAlgBase&);

  }; 

} // end of namespace 

#endif
