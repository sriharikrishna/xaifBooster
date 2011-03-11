#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPE_ASSIGNMENTALG_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPE_ASSIGNMENTALG_INCLUDE_
// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================
#include "xaifBooster/system/inc/Assignment.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/AssignmentAlg.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/BasicBlockElementAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationTape {  

  /** 
   * class to implement taping array access in arguments
   */
  class AssignmentAlg : virtual public xaifBoosterBasicBlockPreaccumulation::AssignmentAlg,
			public BasicBlockElementAlg {

  public:
    
    AssignmentAlg(Assignment& theContainingAssignment);

    virtual ~AssignmentAlg();

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    /**
     * \todo : distinction between constant and non-constant index expressions is simplified
     * or we have this fixed by a proper TBR analysis
     */
    virtual void algorithm_action_4();

    const Expression::VariablePVariableSRPPairList& getIndexVariablesPushed() const; 

    void checkAndPush(const Variable& theVariable);  

    /**
     * check myIndexPushes for \p anExpression
     */
    virtual bool hasExpression(const Expression& theExpression) const;

  private: 

    /** 
     * no def
     */
    AssignmentAlg();

    /** 
     * no def
     */
    AssignmentAlg(const AssignmentAlg&);

    /** 
     * no def
     */
    AssignmentAlg& operator=(const AssignmentAlg&);

    /** 
     * for anonymous reversals we need to store 
     * any array indices occuring in formal arguments,
     * we had first assigned them and now after the call 
     * is made we tape them so we can restore them 
     * prior to the call in reverse mode.
     */
    PlainBasicBlock::BasicBlockElementList myIndexPushes;

    /** 
     * inserts inlined stores for index values
     */
    void handleArrayAccessIndices(const Variable& theVariable);
    
    typedef std::list<Variable*> VariablePList; 
    
    /** 
     * list of all index variables pushed
     * where the second of the pair 
     * is non-null pointer if the value was saved 
     * in a temporary, pointing to that temporary.
     */
    Expression::VariablePVariableSRPPairList myIndexVariablesPushed; 

  }; 
 
} 
                                                                     
#endif
