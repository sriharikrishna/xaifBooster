#include <sstream>
#include "system/inc/ExpressionVertex.hpp"

namespace xaifBooster { 

  ExpressionVertex::ExpressionVertex(){}; 

  ExpressionVertex::~ExpressionVertex(){};
  
  std::string ExpressionVertex::debug () const { 
    std::ostringstream out;
    out << "ExpressionVertex[" << this << "]" << std::ends;  
    return out.str();
  } // end debug

} // end of namespace xaifBooster 
