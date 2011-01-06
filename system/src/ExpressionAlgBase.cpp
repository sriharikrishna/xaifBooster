// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

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

