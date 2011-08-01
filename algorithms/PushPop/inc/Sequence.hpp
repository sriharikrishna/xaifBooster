#ifndef _XAIFBOOSTERPUSHPOP_SEQUENCE_INCLUDE_
#define _XAIFBOOSTERPUSHPOP_SEQUENCE_INCLUDE_
// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

#include <list>

#include "xaifBooster/system/inc/Expression.hpp"

#include "xaifBooster/algorithms/RequiredValues/inc/RequiredValue.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/Sequence.hpp"

using namespace xaifBooster;

namespace xaifBoosterPushPop {

  /**
   * Derived Sequence class for ...
   */
  class Sequence : public xaifBoosterBasicBlockPreaccumulationTape::Sequence {

  public:

    Sequence();

    virtual ~Sequence();

    virtual std::string debug() const;

    /**
     * check ... for \p anExpression
     */
    virtual bool hasExpression(const Expression& anExpression) const;

    void assignAndPushRequiredValueAfter(const xaifBoosterRequiredValues::RequiredValue& aRequiredValue);

    void pushRequiredValueAfter(const xaifBoosterRequiredValues::RequiredValue& aRequiredValue);

  private:

    typedef std::list<const BasicBlockElement*> CBasicBlockElementPList;

    /// a list of pushes (owned by us) that occur after this sequence
    CBasicBlockElementPList myPushBlock;

    /// no def
    Sequence(const Sequence&);

    /// no def
    Sequence& operator= (const Sequence&);

  };

}

#endif
