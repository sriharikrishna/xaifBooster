#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPE_BASICBLOCKELEMENTALG_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPE_BASICBLOCKELEMENTALG_INCLUDE_

#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/BasicBlockElementAlgBase.hpp"

#include "xaifBooster/algorithms/RequiredValues/inc/RequiredValueSet.hpp"

using namespace xaifBooster;
namespace xaifBoosterBasicBlockPreaccumulationTape {

  /**
   * class to implement the association of basic block elements with
   * additional statements used to coordinate taping,
   * such as push calls and assignments to temporaries
   */
  class BasicBlockElementAlg : public BasicBlockElementAlgBase {

  public:

    BasicBlockElementAlg(const BasicBlockElement& theContainingBasicBlockElement);

    virtual ~BasicBlockElementAlg();

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    /**
     * first creates an assignment to a temporary for the expression
     * specified by \p aRequiredValue and adds it to myAssignmentsforPush
     * and then adds a call in myPushBlock that pushes the temporary
     */
    void assignAndPushRequiredValue(const xaifBoosterRequiredValues::RequiredValueSet::RequiredValue& aRequiredValue,
                                    Scope& aScope);

    /**
     * create a new subroutine call in the push block for \p aVariable
     * \todo FIXME: this method always creates a call named push_i,
     * but we need to somehow) determine the type of push to make
     */
    void pushVariable(const Variable& aVariable);

  protected:

    /**
     * a list for storing assignments that are used for assigning
     * expressions to temporaries in order to facilitate taping.
     * These assignments are printed before this statement.
     * We own the contents of this list and delete them in the dtor.
     */
    std::list<const BasicBlockElement*> myAssignmentsforPush;

    /**
     * a list for storing inlinable push subroutine calls.
     * The content is printed after this statement.
     * We own the contents of this list and delete them in the dtor.
     */
    std::list<const BasicBlockElement*> myPushBlock;

  private:

    /// no def
    BasicBlockElementAlg();

    /// no def
    BasicBlockElementAlg(const BasicBlockElementAlg&);

    /// no def
    BasicBlockElementAlg& operator=(const BasicBlockElementAlg&);

  }; // end class BasicBlockElementAlg
 
} // end namespace xaifBoosterBasicBlockPreaccumulationTape

#endif
