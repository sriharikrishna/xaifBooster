#ifndef _INLINABLEINTRINSICSEXPRESSIONVERTEX_INCLUDE_
#define _INLINABLEINTRINSICSEXPRESSIONVERTEX_INCLUDE_

#include "system/inc/Vertex.hpp"
#include "utils/inc/ObjectWithId.hpp"

namespace xaifBooster { 

  class ExpressionVertex;

  /**
   * \todo: inherit from ID once it is factored out of 
   * XMLPrintableWIthId
   */
  class InlinableIntrinsicsExpressionVertex : public Vertex, 
					      public ObjectWithId { 

  public:

    InlinableIntrinsicsExpressionVertex (){};
    ~InlinableIntrinsicsExpressionVertex(){};

    virtual std::string debug() const;
    
    /**
     * \todo switch to using ID rather than descriptor
     */
    virtual ExpressionVertex& createCopyOfMyself() const =0;

    }; // end of class InlinableIntrinsicsExpressionVertex
 
} // end of namespace xaifBooster
                                                                     
#endif
