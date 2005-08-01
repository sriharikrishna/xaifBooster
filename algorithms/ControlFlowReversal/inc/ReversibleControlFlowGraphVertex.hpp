#ifndef _XAIFBOOSTERCONTROLFLOWREVERSAL_REVERSIBLECONTROLFLOWGRAPHVERTEX_INCLUDE_
#define _XAIFBOOSTERCONTROLFLOWREVERSAL_REVERSIBLECONTROLFLOWGRAPHVERTEX_INCLUDE_

#include "xaifBooster/utils/inc/XMLPrintable.hpp"

#include "xaifBooster/system/inc/VertexTraversable.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphVertex.hpp"
#include "xaifBooster/system/inc/ForLoopReversalType.hpp"

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ControlFlowGraphVertexAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal {  

  /** 
   * class to implement vertices that are used in
   * ControlFlowGraphAlg::myTransformedControlFlowGraph
   */
  class ReversibleControlFlowGraphVertex : public VertexTraversable, public XMLPrintable {

  public:
    
    ReversibleControlFlowGraphVertex(const ControlFlowGraphVertex*);
    ReversibleControlFlowGraphVertex();
    ~ReversibleControlFlowGraphVertex();

    const ControlFlowGraphVertexAlg&
    getOriginalControlFlowGraphVertexAlg() const;

    ControlFlowGraphVertexAlg&
    getOriginalControlFlowGraphVertexAlg();

    const ControlFlowGraphVertexAlg&
    getNewControlFlowGraphVertexAlg() const;

    virtual void printXMLHierarchy(std::ostream& os) const;
                                                                                
    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    bool getVisited() const;
    void setVisited(bool);

    int getIndex() const;
    void setIndex(int);
    void setAdjointIndex(int);

    ControlFlowGraphVertexAlg::ControlFlowGraphVertexKind_E getKind() const;

    bool isOriginal() const { return original; }

    

    const ControlFlowGraphVertex& getOriginalVertex() const { 
      return *myOriginalVertex_p; 
    }

    ControlFlowGraphVertex& getNewVertex() { 
      return *myNewVertex_p; 
    }

    const ControlFlowGraphVertex& getNewVertex() const { 
      return *myNewVertex_p; 
    }

    void supplyAndAddNewVertex(ControlFlowGraphVertex& theNewVertex);

    void setReversalType(ForLoopReversalType::ForLoopReversalType_E aReversalType); 

    ForLoopReversalType::ForLoopReversalType_E getReversalType() const; 

    void setCounterPart(ReversibleControlFlowGraphVertex& theCounterPart);

    ReversibleControlFlowGraphVertex& getCounterPart();

    typedef std::list<const Variable*> VariablePList;

    const VariablePList& getKnownLoopVariables()const;
    
    void inheritLoopVariables(const ReversibleControlFlowGraphVertex& aParent);

    void addLoopVariable(const Variable& aLoopVariable);

    ReversibleControlFlowGraphVertex& getTopExplicitLoop();

    void setTopExplicitLoop(ReversibleControlFlowGraphVertex& theTopExplicitLoop);

    ReversibleControlFlowGraphVertex& getTopExplicitLoopAddressArithmetic();

    void setTopExplicitLoopAddressArithmetic(ReversibleControlFlowGraphVertex& theTopExplicitLoop);

  private:

    /** 
     * no def
     */
    ReversibleControlFlowGraphVertex(const ReversibleControlFlowGraphVertex&);

    /** 
     * no def
     */
    ReversibleControlFlowGraphVertex operator=(const ReversibleControlFlowGraphVertex&);

    /** 
     * indicates if this is a reference to an original ControlFlowGraphVertex
     * or if it got created as a new ControlFlowGraphVertex
     */
    bool original;

    /** 
     * indicates if a reference to an original ControlFlowGraphVertex
     * references the augmented forward code or the adjoint code
     */
    bool adjoint;

    /** 
     * pointer to original ControlFlowGraphVertex
     */
    const ControlFlowGraphVertex* myOriginalVertex_p;

    /** 
     * pointer to new ControlFlowGraphVertex
     * these vertices are never added to any graph 
     * themselves, we own them so we need to delete them
     */
    ControlFlowGraphVertex* myNewVertex_p;

    /** 
     * flag for marking as visited during recursive traversal
     */
    bool myVisitedFlag;

    /** 
     * index for topological sort
     */
    int myIndex;

    /** 
     * reversal type that applies to all 
     * nodes under a top forloop which 
     * is designated for explicit reversal
     */
    ForLoopReversalType::ForLoopReversalType_E myReversalType;

    /** 
     * pointer to corresponding vertex for 
     * LOOP-ENDLOOP and BRANCH-ENDBRANCH pairs
     * is initialized during the topological sort
     */
    ReversibleControlFlowGraphVertex* myCounterPart_p;

    /** 
     * list of variable known to be loop variables
     * in loops for explicit reversal collected from 
     * the respective top loop down
     * we don't own the Variables we are pointing to
     */ 
    VariablePList myKnownLoopVariables; 

    /** 
     * pointer to the top level 
     * explicit loop for explicit reversals
     * this is just a reference not to be deleted by 
     * the dtor
     */
    ReversibleControlFlowGraphVertex* myTopExplicitLoop_p;

    /** 
     * pointer to the top level 
     * explicit loop's basic block that holds pushes/pops of
     * variables needed to fix address computations in simple 
     * loop constructs
     * this is just a reference not to be deleted by 
     * the dtor
     */
    ReversibleControlFlowGraphVertex* myTopExplicitLoopAddressArithmetic_p;

  };  // end of class

} // end of namespace 
                                                                     
#endif
