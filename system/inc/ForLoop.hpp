#ifndef _FORLOOP_INCLUDE_
#define _FORLOOP_INCLUDE_

#include "system/inc/Initialization.hpp"
#include "system/inc/Condition.hpp"
#include "system/inc/Update.hpp"
#include "system/inc/ControlFlowGraphVertex.hpp"

namespace xaifBooster { 

  /**
   * this class describes 
   * a for loop
   */
  class ForLoop : public ControlFlowGraphVertex {
  public:

    ForLoop();

    ~ForLoop(){};

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

  private:
    
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

  };
 
} // end of namespace xaifBooster
                                                                     
#endif
