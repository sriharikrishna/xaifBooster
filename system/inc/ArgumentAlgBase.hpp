#ifndef _ARGUMENTALGBASE_INCLUDE_
#define _ARGUMENTALGBASE_INCLUDE_

#include "xaifBooster/system/inc/ExpressionVertexAlgBase.hpp"

namespace xaifBooster {  
  
  class Argument;

  class ArgumentAlgBase: public ExpressionVertexAlgBase { 

  public: 

    ArgumentAlgBase(const Argument& theContaining);

    virtual ~ArgumentAlgBase();

  private: 

    /** 
     * not defined
     */
    ArgumentAlgBase();

    /** 
     * not defined
     */
    ArgumentAlgBase(const ArgumentAlgBase&);

    /** 
     * not defined
     */
    ArgumentAlgBase& operator=(const ArgumentAlgBase&);

  }; 

} // end of namespace 

#endif
