#ifndef _XAIFBOOSTERCONTROLFLOWREVERSAL_CALLGRAPHALG_INCLUDE_
#define _XAIFBOOSTERCONTROLFLOWREVERSAL_CALLGRAPHALG_INCLUDE_

#include "xaifBooster/system/inc/CallGraphAlgBase.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal {  

  /** 
   * class to implement algorithms relevant for the 
   * reversal of the control flow
   */
  class CallGraphAlg : public CallGraphAlgBase {
  public:
    
    CallGraphAlg(CallGraph& theContaining);
                                                                                
    ~CallGraphAlg();

    /**
     * control flow reversal
     */
    virtual void algorithm_action_4();
                                                                                
    virtual void printXMLHierarchy(std::ostream& os) const;
                                                                                
    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    const std::string& getAlgorithmSignature() const;
    const Symbol& getPushIntegerSymbol() const;
    const Symbol& getPopIntegerSymbol() const;

  private:
    
    /** 
     * no def
     */
    CallGraphAlg();

    /** 
     * no def
     */
    CallGraphAlg(const CallGraphAlg&);

    /** 
     * no def
     */
    CallGraphAlg operator=(const CallGraphAlg&);

        /**
     * signature used in annotations of objects generated
     * by the algorithm
     */
    static std::string myAlgorithmSignature;
                                                                                
    /**
     * Pointers to symbols for push and pop routines
     * all live in global scope
     */
    Symbol* myPushIntegerSymbol_p;
    Symbol* myPopIntegerSymbol_p;

  };  // end of class

} // end of namespace 
                                                                     
#endif
