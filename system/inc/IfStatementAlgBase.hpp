#ifndef _IFSTATEMENTALGBASE_INCLUDE_
#define _IFSTATEMENTALGBASE_INCLUDE_

#include "xaifBooster/system/inc/ControlFlowGraphVertexAlgBase.hpp"

namespace xaifBooster {  
  
  class IfStatement;

  class IfStatementAlgBase: public ControlFlowGraphVertexAlgBase { 

  public: 

    IfStatementAlgBase(const IfStatement& theContaining);

    virtual ~IfStatementAlgBase();

  private: 

    /** 
     * not defined
     */
    IfStatementAlgBase();

    /** 
     * not defined
     */
    IfStatementAlgBase(const IfStatementAlgBase&);

    /** 
     * not defined
     */
    IfStatementAlgBase& operator=(const IfStatementAlgBase&);

  }; 

} // end of namespace 

#endif
