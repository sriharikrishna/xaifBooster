#ifndef _GOTOALGBASE_INCLUDE_
#define _GOTOALGBASE_INCLUDE_

#include "xaifBooster/system/inc/ControlFlowGraphVertexAlgBase.hpp"

namespace xaifBooster {  
  
  class Goto;

  class GotoAlgBase: public ControlFlowGraphVertexAlgBase { 

  public: 

    GotoAlgBase(const Goto& theContaining);

    virtual ~GotoAlgBase();

  private: 

    /** 
     * not defined
     */
    GotoAlgBase();

    /** 
     * not defined
     */
    GotoAlgBase(const GotoAlgBase&);

    /** 
     * not defined
     */
    GotoAlgBase& operator=(const GotoAlgBase&);

  }; 

} // end of namespace 

#endif
