#ifndef _PRELOOP_INCLUDE_
#define _PRELOOP_INCLUDE_

#include "xaifBooster/system/inc/ControlFlowGraphVertex.hpp"
#include "xaifBooster/system/inc/Condition.hpp"
#include "xaifBooster/system/inc/PreLoopAlgBase.hpp"

namespace xaifBooster { 

  /**
   * this class describes 
   * a preloop
   */
  class PreLoop : public ControlFlowGraphVertex {
  public:

    PreLoop ();

    ~PreLoop();

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
    PreLoopAlgBase& getPreLoopAlgBase();
    const PreLoopAlgBase& getPreLoopAlgBase() const;


  private:
    
    /** 
     * the condition for the preloop
     */
    Condition myCondition;

    /**
     * this will be set to point a dynamically instance
     * during construction and deleted during
     * destruction
     */
    PreLoopAlgBase* myPreLoopAlgBase_p;


  };
 
} // end of namespace xaifBooster
                                                                     
#endif
