#ifndef _PRELOOP_INCLUDE_
#define _PRELOOP_INCLUDE_

#include "system/inc/ControlFlowGraphVertex.hpp"
#include "system/inc/Condition.hpp"

namespace xaifBooster { 

  /**
   * this class describes 
   * a preloop
   */
  class PreLoop : public ControlFlowGraphVertex {
  public:

    PreLoop (){};

    ~PreLoop(){};

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

  private:
    
    /** 
     * the condition for the preloop
     */
    Condition myCondition;

  };
 
} // end of namespace xaifBooster
                                                                     
#endif
