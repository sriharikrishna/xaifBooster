#ifndef _FORLOOP_INCLUDE_
#define _FORLOOP_INCLUDE_

#include "xaifBooster/system/inc/Initialization.hpp"
#include "xaifBooster/system/inc/Condition.hpp"
#include "xaifBooster/system/inc/Update.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphVertex.hpp"
#include "xaifBooster/system/inc/ForLoopAlgBase.hpp"
#include "xaifBooster/system/inc/ForLoopReversalType.hpp"

namespace xaifBooster { 

  /**
   * this class describes 
   * a for loop
   */
  class ForLoop : public ControlFlowGraphVertex {
  public:

    ForLoop(const ForLoopReversalType::ForLoopReversalType_E theReversalType);

    ~ForLoop();

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

    /**
     * name for inherited member myId as represented in XAIF schema
     */
    static const std::string our_myId_XAIFName;

    Initialization& getInitialization();

    const Initialization& getInitialization() const;

    Condition& getCondition();

    const Condition& getCondition() const;

    Update& getUpdate();

    const Update& getUpdate() const;

    /**
     * get algorithm
     */
    ForLoopAlgBase& getForLoopAlgBase() const;

    ForLoopReversalType::ForLoopReversalType_E getReversalType() const; 

  private:

    /** 
     * no def
     */
    ForLoop();
    
    /** 
     * the initialization 
     * in the ctor set to active
     * may be passivated in the parser
     */
    Initialization myInitialization;

    /** 
     * the condition 
     */
    Condition myCondition;

    /** 
     * the update 
     * in the ctor set to active
     * may be passivated in the parser
     */
    Update myUpdate;

    /** 
     * the attribute indicating  
     * the reversal option as specified by 
     * a user directive
     */
    const ForLoopReversalType::ForLoopReversalType_E myReversalType;

  };
 
} // end of namespace xaifBooster
                                                                     
#endif
