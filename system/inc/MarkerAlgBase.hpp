#ifndef _MARKERALGBASE_INCLUDE_
#define _MARKERALGBASE_INCLUDE_

#include "xaifBooster/system/inc/BasicBlockElementAlgBase.hpp"

namespace xaifBooster {  
  
  class Marker;

  class MarkerAlgBase: public BasicBlockElementAlgBase { 

  public: 

    MarkerAlgBase(const Marker& theContaining);

    virtual ~MarkerAlgBase();

  private: 

    /** 
     * not defined
     */
    MarkerAlgBase();

    /** 
     * not defined
     */
    MarkerAlgBase(const MarkerAlgBase&);

    /** 
     * not defined
     */
    MarkerAlgBase& operator=(const MarkerAlgBase&);

  }; 

} // end of namespace 

#endif
