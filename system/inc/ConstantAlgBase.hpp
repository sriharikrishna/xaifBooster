#ifndef _CONSTANTALGBASE_INCLUDE_
#define _CONSTANTALGBASE_INCLUDE_

#include "xaifBooster/system/inc/ExpressionVertexAlgBase.hpp"

namespace xaifBooster {  
  
  class Constant;

  class ConstantAlgBase: public ExpressionVertexAlgBase { 

  public: 

    ConstantAlgBase(const Constant& theContaining);

    virtual ~ConstantAlgBase();

  private: 

    /** 
     * not defined
     */
    ConstantAlgBase();

    /** 
     * not defined
     */
    ConstantAlgBase(const ConstantAlgBase&);

    /** 
     * not defined
     */
    ConstantAlgBase& operator=(const ConstantAlgBase&);

  }; 

} // end of namespace 

#endif
