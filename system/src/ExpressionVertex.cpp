#include <sstream>
#include "xaifBooster/system/inc/ExpressionVertex.hpp"

namespace xaifBooster { 

  ExpressionVertex::ExpressionVertex() : 
    myExpressionVertexAlgBase_p(0)  {
  } 

  ExpressionVertex::~ExpressionVertex(){
    if (myExpressionVertexAlgBase_p) delete myExpressionVertexAlgBase_p;
  }
  
  ExpressionVertexAlgBase&
  ExpressionVertex::getExpressionVertexAlgBase() const {
    if (!myExpressionVertexAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionVertex::getExpressionVertexAlgBase: not set");
    return *myExpressionVertexAlgBase_p;
  } // end getExpressionVertexAlgBase

  std::string ExpressionVertex::debug () const { 
    std::ostringstream out;
    out << "ExpressionVertex[" << this << "]" << std::ends;  
    return out.str();
  } // end debug

  const InlinableIntrinsicsCatalogueItem& 
  ExpressionVertex::getInlinableIntrinsicsCatalogueItem() const { 
    THROW_LOGICEXCEPTION_MACRO("ExpressionVertex::getInlinableIntrinsicsCatalogueItem: is not valid for this instance");
    // make up a dummy to satisfy the compiler
    // we never reach this, so...
    return *(new InlinableIntrinsicsCatalogueItem(1));
  } 

  bool ExpressionVertex::isArgument() const { 
    return false;
  } // end ExpressionVertex::isArgument

} // end of namespace xaifBooster 
