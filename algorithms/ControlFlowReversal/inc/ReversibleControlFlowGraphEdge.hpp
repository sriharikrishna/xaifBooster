#ifndef _XAIFBOOSTERCONTROLFLOWREVERSAL_REVERSIBLECONTROLFLOWGRAPHEDGE_INCLUDE_
#define _XAIFBOOSTERCONTROLFLOWREVERSAL_REVERSIBLECONTROLFLOWGRAPHEDGE_INCLUDE_

#include "xaifBooster/system/inc/EdgeTraversable.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphEdge.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal {  

  class ReversibleControlFlowGraph;

  class ReversibleControlFlowGraphEdge : public EdgeTraversable, 
					 public ObjectWithId {

  public:
    
    ReversibleControlFlowGraphEdge(const ControlFlowGraphEdge*);
    ReversibleControlFlowGraphEdge();
    ~ReversibleControlFlowGraphEdge();

    bool isBackEdge(const ReversibleControlFlowGraph&) const;

    void printXMLHierarchy(std::ostream& os, const ReversibleControlFlowGraph&) const;
                                                                                
    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    bool isOriginal() const;

    const ControlFlowGraphEdge& getOriginalEdge() const;

    bool hasConditionValue() const;

    void setConditionValue(int);

    int getConditionValue() const;
    
    /** 
     * if the edge has a condition 
     * value of '1'
     */ 
    bool leadsToLoopBody() const;

  private:

    /** 
     * no def
     */
    ReversibleControlFlowGraphEdge(const ReversibleControlFlowGraphEdge&);

    /** 
     * no def
     */
    ReversibleControlFlowGraphEdge operator=(const ReversibleControlFlowGraphEdge&);

    /**
     * if myOriginalFlag is false this can be set
     * otherwise it has the value of the original edge
     * indicates if edge has a condition value
     */
    bool myConditionValueFlag;
    
    /**
     * if myOriginalFlag is false this can be set
     * otherwise it has the value of the original edge
     * holds the condition value
     */
    int myConditionValue;

    /** 
     * pointer to original ControlFlowGraphEdge
     * the edge is owned by the original ControlFlowGraph
     */
    const ControlFlowGraphEdge* myOriginalEdge_p;

  };  // end of class

} // end of namespace 
                                                                     
#endif
