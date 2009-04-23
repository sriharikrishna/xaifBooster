#include "xaifBooster/system/inc/ExpressionAlgBase.hpp"
#include "xaifBooster/system/inc/Expression.hpp"

namespace xaifBooster {

  ExpressionAlgBase::ExpressionAlgBase(const Expression& theContaining) :
    AlgBase<Expression>(theContaining) {
  } // end ExpressionAlgBase::ExpressionAlgBase()

  ExpressionAlgBase::~ExpressionAlgBase() {
  } // end ExpressionAlgBase::~ExpressionAlgBase()

  bool
  ExpressionAlgBase::hasExpression(const Expression& anExpression) const {
    return false;
  } // end ExpressionAlgBase::hasExpression()

} // end namespace xaifBooster

