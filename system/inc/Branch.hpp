#ifndef _BRANCH_INCLUDE_
#define _BRANCH_INCLUDE_

#include "xaifBooster/system/inc/ControlFlowGraphVertex.hpp"
#include "xaifBooster/system/inc/Condition.hpp"
#include "xaifBooster/system/inc/BranchAlgBase.hpp"

namespace xaifBooster { 

  /**
   * this class describes 
   * a preloop
   */
  class Branch : public ControlFlowGraphVertex {
  public:

    Branch ();

    ~Branch();

    /**
     * print XML hierarchy
     */
    void printXMLHierarchy(std::ostream& os) const;

    /**
     * print debug information
     */
    std::string debug() const ;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    static const std::string our_myId_XAIFName;
    
    Condition& getCondition();

    const Condition& getCondition() const;

    /**
     * get algorithm
     */
    BranchAlgBase& getBranchAlgBase() const;

  private:
    
    /** 
     * the condition for the if statement
     */
    Condition myCondition;

  };
 
} // end of namespace xaifBooster
                                                                     
#endif
