#ifndef _XAIFBOOSTERSAVEVALUEACROSS_SAVEACROSS_INCLUDE_
#define _XAIFBOOSTERSAVEVALUEACROSS_SAVEACROSS_INCLUDE_

#include "xaifBooster/utils/inc/XMLPrintable.hpp"

#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/Expression.hpp"
#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

using namespace xaifBooster;

namespace xaifBoosterSaveValuesAcross {

  /**
   * Class that implements the storing values across statements,
   * as might be required when the statement has a side effect.
   * This is accomplished by creating an assignment to a temporary variable.
   * Current uses include saving the value of array indices for arguments at their value
   * before a subroutine call in cases where the index may be overwritten in the subroutine.
   * This arises in TypeChange (needed for type conversion back), and in adjoints.
   */
  class SaveValuesAcross : public XMLPrintable {
  public:

    SaveValuesAcross();

    ~SaveValuesAcross();

    /**
     * Prints the assignments the temporaries (these assignments are owned by this class).
     */
    void printXMLHierarchy(std::ostream& os) const;

    std::string debug() const;

    /**
     * Determines whether \p anArgument has already been saved.
     */
    bool isSavedAcross(const Argument& anArgument) const;

    /**
     * Saves the ExpressionVertex \p anArgument by creating an assignment
     * that stores the value in a temporary before the statement in question.
     */
    void saveValue(const Argument& anArgument,
		   const BasicBlock& theBasicBlock);

    /**
     * Returns the list that correlates the replaced Variables with their replacement VariableSymbolReferences.
     */
    const Expression::VariablePVariableSRPPairList& getReplacementPairsList() const;

  private: 
    
    /**
     * no def 
     */
    SaveValuesAcross(const SaveValuesAcross&);

    /**
     * no def 
     */
    SaveValuesAcross operator=(const SaveValuesAcross&);

    /**
     * The list of pairs that maps a variable to its replacement VariableSymbolReference.
     */
    Expression::VariablePVariableSRPPairList mySavedVarsAndReplacementVSRsList;

    /**
     * The list of created assignments.  We own this.
     */
    PlainBasicBlock::BasicBlockElementList myPriorToCallAssignments;

  }; // end class SaveValuesAcross

} // end namespace xaifBoosterSaveValuesAcross
                                                                     
#endif

