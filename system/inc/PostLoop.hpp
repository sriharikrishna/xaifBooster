#ifndef _POSTLOOP_INCLUDE_
#define _POSTLOOP_INCLUDE_

#include "system/inc/Condition.hpp"
#include "system/inc/ControlFlowGraphVertex.hpp"

namespace xaifBooster { 

  /**
   * this class describes 
   * a loop with a post condition 
   */
  class PostLoop : public ControlFlowGraphVertex {
  public:

    PostLoop (){};

    ~PostLoop(){};

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
    
    Condition& getCondition();

    const Condition& getCondition() const;

  private:
    
    /** 
     * the condition for the postloop
     */
    Condition myCondition;

  };
 
} // end of namespace xaifBooster
                                                                     
#endif
