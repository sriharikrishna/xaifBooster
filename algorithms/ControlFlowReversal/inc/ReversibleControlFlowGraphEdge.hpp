#ifndef _XAIFBOOSTERCONTROLFLOWREVERSAL_REVERSIBLECONTROLFLOWGRAPHEDGE_INCLUDE_
#define _XAIFBOOSTERCONTROLFLOWREVERSAL_REVERSIBLECONTROLFLOWGRAPHEDGE_INCLUDE_

#include "xaifBooster/system/inc/EdgeTraversable.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphEdge.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal {  

  class ReversibleControlFlowGraph;

  /** 
   * class to implement edges that are used in
   * ControlFlowGraphAlg::myTransformedControlFlowGraph
   */
  class ReversibleControlFlowGraphEdge : public EdgeTraversable {

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
    const ControlFlowGraphEdge& getNewEdge() const;
    ControlFlowGraphEdge& getNewEdge();

    bool has_condition_value() const;
    void set_has_condition_value(bool hcv);
                                                                                
    void set_condition_value(int cv);
    const int& get_condition_value() const;

  private:

    friend class ReversibleControlFlowGraph;
    
    /** 
     * no def
     */
    ReversibleControlFlowGraphEdge(const ReversibleControlFlowGraphEdge&);

    /** 
     * no def
     */
    ReversibleControlFlowGraphEdge operator=(const ReversibleControlFlowGraphEdge&);

    /**
     * indicates if edges has condition value
     */
    // bool my_has_condition_value;

    
    /**
     * condition value
     */
    // int my_condition_value;
                                                                                

    /** 
     * indicates if as an outedge of a loop vertex
     * this edges leads into the loop body
     */
    bool toLoopBody;

    /** 
     * indicates if this is a reference to an original ControlFlowGraphEdge
     * or if it got created as a new ControlFlowGraphEdge
     */
    bool original;

    /** 
     * pointer to original ControlFlowGraphEdge
     */
    const ControlFlowGraphEdge* myOriginalEdge_p;

    /** 
     * pointer to new ControlFlowGraphEdge
     */
    ControlFlowGraphEdge* myNewEdge_p;

  };  // end of class

} // end of namespace 
                                                                     
#endif
