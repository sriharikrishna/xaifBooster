#ifndef _SUBROUTINECALLALGBASE_INCLUDE_
#define _SUBROUTINECALLALGBASE_INCLUDE_

#include "xaifBooster/system/inc/BasicBlockElementAlgBase.hpp"

namespace xaifBooster {  
  
  class SubroutineCall;

  class SubroutineCallAlgBase: public BasicBlockElementAlgBase { 

  public: 

    SubroutineCallAlgBase(const SubroutineCall& theContaining);

    virtual ~SubroutineCallAlgBase();

  private: 

    /** 
     * not defined
     */
    SubroutineCallAlgBase();

    /** 
     * not defined
     */
    SubroutineCallAlgBase(const SubroutineCallAlgBase&);

    /** 
     * not defined
     */
    SubroutineCallAlgBase& operator=(const SubroutineCallAlgBase&);

  }; 

} // end of namespace 

#endif
