#ifndef _FORLOOPALGBASE_INCLUDE_
#define _FORLOOPALGBASE_INCLUDE_

#include "xaifBooster/system/inc/ControlFlowGraphVertexAlgBase.hpp"

namespace xaifBooster {  
  
  class ForLoop;

  class ForLoopAlgBase: public ControlFlowGraphVertexAlgBase { 

  public: 

    ForLoopAlgBase(const ForLoop& theContaining);

    virtual ~ForLoopAlgBase();

  private: 

    /** 
     * not defined
     */
    ForLoopAlgBase();

    /** 
     * not defined
     */
    ForLoopAlgBase(const ForLoopAlgBase&);

    /** 
     * not defined
     */
    ForLoopAlgBase& operator=(const ForLoopAlgBase&);

  }; 

} // end of namespace 

#endif
