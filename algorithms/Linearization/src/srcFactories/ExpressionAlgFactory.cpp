#include "xaifBooster/system/inc/ExpressionAlgFactory.hpp"
#include "xaifBooster/system/inc/Expression.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ExpressionAlg.hpp"

namespace xaifBooster {  

  ALG_FACTORY_DEF_MACRO(Expression,ExpressionAlgBase,xaifBoosterLinearization::ExpressionAlg);

} // end of namespace 
