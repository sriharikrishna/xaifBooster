#ifndef _LABELALGBASE_INCLUDE_
#define _LABELALGBASE_INCLUDE_

#include "xaifBooster/system/inc/ControlFlowGraphVertexAlgBase.hpp"

namespace xaifBooster {  
  
  class Label;

  class LabelAlgBase: public ControlFlowGraphVertexAlgBase { 

  public: 

    LabelAlgBase(const Label& theContaining);

    virtual ~LabelAlgBase();

  private: 

    /** 
     * not defined
     */
    LabelAlgBase();

    /** 
     * not defined
     */
    LabelAlgBase(const LabelAlgBase&);

    /** 
     * not defined
     */
    LabelAlgBase& operator=(const LabelAlgBase&);

  }; 

} // end of namespace 

#endif
