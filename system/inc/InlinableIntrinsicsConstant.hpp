#ifndef _INLINABLEINTRINSICSCONSTANT_INCLUDE_
#define _INLINABLEINTRINSICSCONSTANT_INCLUDE_

#include "xaifBooster/system/inc/InlinableIntrinsicsExpressionVertex.hpp"
#include "xaifBooster/system/inc/BaseConstant.hpp"

namespace xaifBooster { 

  /**
   * a class for a vertex representing an argument in an 
   * intrinsic
   */
  class InlinableIntrinsicsConstant : public InlinableIntrinsicsExpressionVertex,
  public BaseConstant { 
  
  public:
    
    InlinableIntrinsicsConstant(const SymbolType::SymbolType_E aType) : 
      BaseConstant(aType) {};

    ~InlinableIntrinsicsConstant(){};

    virtual ExpressionVertex& createCopyOfMyself() const;

    static const std::string ourXAIFName;
    static const std::string our_myType_XAIFName;
    static const std::string our_myValue_XAIFName;
    static const std::string our_myId_XAIFName;


  private: 

    InlinableIntrinsicsConstant();

  }; // end of class InlinableIntrinsicsConstant
 
} // end of namespace xaifBooster
                                                                     
#endif
