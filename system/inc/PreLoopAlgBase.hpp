#ifndef _PRELOOPALGBASE_INCLUDE_
#define _PRELOOPALGBASE_INCLUDE_

#include "xaifBooster/system/inc/ControlFlowGraphVertexAlgBase.hpp"

namespace xaifBooster {  
  
  class PreLoop;

  class PreLoopAlgBase: public ControlFlowGraphVertexAlgBase { 

  public: 

    PreLoopAlgBase(const PreLoop& theContaining);

    virtual ~PreLoopAlgBase();

  private: 

    /** 
     * not defined
     */
    PreLoopAlgBase();

    /** 
     * not defined
     */
    PreLoopAlgBase(const PreLoopAlgBase&);

    /** 
     * not defined
     */
    PreLoopAlgBase& operator=(const PreLoopAlgBase&);

  }; 

} // end of namespace 

#endif
