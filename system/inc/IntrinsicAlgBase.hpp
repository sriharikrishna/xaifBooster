#ifndef _INTRINSICALGBASE_INCLUDE_
#define _INTRINSICALGBASE_INCLUDE_

#include "xaifBooster/system/inc/ExpressionVertexAlgBase.hpp"

namespace xaifBooster {  
  
  class Intrinsic;

  class IntrinsicAlgBase: public ExpressionVertexAlgBase { 

  public: 

    IntrinsicAlgBase(const Intrinsic& theContaining);

    virtual ~IntrinsicAlgBase();

  private: 

    /** 
     * not defined
     */
    IntrinsicAlgBase();

    /** 
     * not defined
     */
    IntrinsicAlgBase(const IntrinsicAlgBase&);

    /** 
     * not defined
     */
    IntrinsicAlgBase& operator=(const IntrinsicAlgBase&);

  }; 

} // end of namespace 

#endif
