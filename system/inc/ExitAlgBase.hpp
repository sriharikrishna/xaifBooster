#ifndef _EXITALGBASE_INCLUDE_
#define _EXITALGBASE_INCLUDE_

#include "xaifBooster/system/inc/ControlFlowGraphVertexAlgBase.hpp"

namespace xaifBooster {  
  
  class Exit;

  class ExitAlgBase: public ControlFlowGraphVertexAlgBase { 

  public: 

    ExitAlgBase(const Exit& theContaining);

    virtual ~ExitAlgBase();

  private: 

    /** 
     * not defined
     */
    ExitAlgBase();

    /** 
     * not defined
     */
    ExitAlgBase(const ExitAlgBase&);

    /** 
     * not defined
     */
    ExitAlgBase& operator=(const ExitAlgBase&);

  }; 

} // end of namespace 

#endif
