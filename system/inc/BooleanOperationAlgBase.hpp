#ifndef _BOOLEANOPERATIONALGBASE_INCLUDE_
#define _BOOLEANOPERATIONALGBASE_INCLUDE_

#include "xaifBooster/system/inc/ExpressionVertexAlgBase.hpp"

namespace xaifBooster {  
  
  class BooleanOperation;

  class BooleanOperationAlgBase: public ExpressionVertexAlgBase { 

  public: 

    BooleanOperationAlgBase(const BooleanOperation& theContaining);

    virtual ~BooleanOperationAlgBase();

  private: 

    /** 
     * not defined
     */
    BooleanOperationAlgBase();

    /** 
     * not defined
     */
    BooleanOperationAlgBase(const BooleanOperationAlgBase&);

    /** 
     * not defined
     */
    BooleanOperationAlgBase& operator=(const BooleanOperationAlgBase&);

  }; 

} // end of namespace 

#endif
