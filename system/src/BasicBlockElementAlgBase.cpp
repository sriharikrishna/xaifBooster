#include "xaifBooster/system/inc/BasicBlockElementAlgBase.hpp"
#include "xaifBooster/system/inc/BasicBlockElement.hpp"

namespace xaifBooster {

  BasicBlockElementAlgBase::BasicBlockElementAlgBase(const BasicBlockElement& theContaining) :
    AlgBase<BasicBlockElement>(theContaining) {
  } // end BasicBlockElementAlgBase::BasicBlockElementAlgBase()

  BasicBlockElementAlgBase::~BasicBlockElementAlgBase() {
  } // end BasicBlockElementAlgBase::~BasicBlockElementAlgBase()

  bool
  BasicBlockElementAlgBase::hasExpression(const Expression& anExpression) const {
    return false;
  } // end BasicBlockElementAlgBase::hasExpression()

} // end namespace xaifBooster
