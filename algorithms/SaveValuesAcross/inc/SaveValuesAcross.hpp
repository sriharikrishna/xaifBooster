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

    void populateReplacementPairsList(Expression::VariablePVariableSRPPairList& aListToBePopulated) const;

    //void populatePriorToCallAssignmentsList(PlainBasicBlock::BasicBlockElementList& aListToBePopulated) const;

    struct SavedValue {

      const Argument* myArgument_p;

      VariableSymbolReference* myTempVarVSR_p;

      const Assignment* myAssignment_p;

      SavedValue(const Argument& anArgument,
                 VariableSymbolReference& aVSR,
                 const Assignment& anAssignment) :
        myArgument_p (&anArgument),
        myTempVarVSR_p (&aVSR),
        myAssignment_p (&anAssignment) {
      };

    private:
       /// no def 
      SavedValue();
      
       /// no def 
      SavedValue(const SavedValue&);
      
       /// no def 
      SavedValue operator=(const SavedValue&);

    }; // end struct SavedValue

    typedef std::list<SavedValue*> SavedValueList;

    const SavedValueList& getSavedValueList() const;

  private: 
    
    SavedValueList mySavedValueList;

    /// no def 
    SaveValuesAcross(const SaveValuesAcross&);

    /// no def 
    SaveValuesAcross operator=(const SaveValuesAcross&);

  }; // end class SaveValuesAcross

} // end namespace xaifBoosterSaveValuesAcross
                                                                     
#endif

