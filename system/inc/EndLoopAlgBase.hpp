#ifndef _ENDLOOPALGBASE_INCLUDE_
#define _ENDLOOPALGBASE_INCLUDE_

#include "xaifBooster/system/inc/ControlFlowGraphVertexAlgBase.hpp"

namespace xaifBooster {  
  
  class EndLoop;

  class EndLoopAlgBase: public ControlFlowGraphVertexAlgBase { 

  public: 

    EndLoopAlgBase(const EndLoop& theContaining);

    virtual ~EndLoopAlgBase();

  private: 

    /** 
     * not defined
     */
    EndLoopAlgBase();

    /** 
     * not defined
     */
    EndLoopAlgBase(const EndLoopAlgBase&);

    /** 
     * not defined
     */
    EndLoopAlgBase& operator=(const EndLoopAlgBase&);

  }; 

} // end of namespace 

#endif
