#ifndef _XAIFBOOSTERCONTROLFLOWREVERSAL_REVERSIBLECONTROLFLOWGRAPH_INCLUDE_
#define _XAIFBOOSTERCONTROLFLOWREVERSAL_REVERSIBLECONTROLFLOWGRAPH_INCLUDE_

#include <stack>
#include "xaifBooster/system/inc/GraphWrapperTraversable.hpp"
#include "xaifBooster/system/inc/ControlFlowGraph.hpp"
#include "xaifBooster/system/inc/Symbol.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/EndBranch.hpp"
#include "xaifBooster/system/inc/EndLoop.hpp"
#include "xaifBooster/system/inc/ForLoop.hpp"
#include "xaifBooster/system/inc/IfStatement.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/ReversibleControlFlowGraphVertex.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/ReversibleControlFlowGraphEdge.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal {  

  /** 
   * class to implement a reversible control flow graph
   */
  class ReversibleControlFlowGraph : public GraphWrapperTraversable<ReversibleControlFlowGraphVertex,ReversibleControlFlowGraphEdge> {

  public:
    
    ReversibleControlFlowGraph(const ControlFlowGraph&);

    std::string makeUniqueVertexId();
    std::string makeUniqueEdgeId();

    ReversibleControlFlowGraphVertex& getEntry(); 
    ReversibleControlFlowGraphVertex& getExit(); 

    void markLoopBodyEntryEdges();
    void topologicalNumbering();
    void topologicalSort();
    void topologicalSortReverse();
    void storeControlFlow();
    void reverseControlFlow();
 
    virtual void printXMLHierarchy(std::ostream& os) const;
                                                                                
    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

  private:

    /** 
     * no def
     */
    ReversibleControlFlowGraph();

    /** 
     * no def
     */
    ReversibleControlFlowGraph(const ReversibleControlFlowGraph&);

    /** 
     * no def
     */
    ReversibleControlFlowGraph operator=(const ReversibleControlFlowGraph&);

    /** 
     * set myVisitedFlag of all vertices to false
     */
    void initVisit(); 

    /** 
     * set all indeces to -1
     */
    void clearIndeces(); 

    /** 
     * check if theEdge_r lies on a path to theLoopVertex_r
     */
    bool isLoopBodyEntryEdge(const ReversibleControlFlowGraphVertex& theLoopVertex_r, const ReversibleControlFlowGraphEdge& theEdge_r);

    /** 
     * bottom-up augmentation of the cfg by statements that store
     * the flow of control
     */
    void storeControlFlowGraphRecursively(ReversibleControlFlowGraphVertex&,std::stack<const Symbol*>&);

    /** 
     * bottom-up generation of reversed cfg
     */
    void reverseControlFlowGraphRecursively(ReversibleControlFlowGraphVertex&);

    /** 
     * top-down topologically sorted numbering
     */
    void topologicalNumberingRecursively(ReversibleControlFlowGraphVertex&, int&); 

    /** 
     * top-down topologically sorted vertex list
     */
    void topologicalSortRecursively(ReversibleControlFlowGraphVertex&, int&,std::vector<const ReversibleControlFlowGraphVertex*>&);

    /** 
     * bottom-up topologically sorted vertex list
     */
    void topologicalSortReverseRecursively(ReversibleControlFlowGraphVertex&, int&,std::vector<const ReversibleControlFlowGraphVertex*>&);

    /** 
     * top down topological sort
     */
    const Symbol* makeAuxilliaryIntegerLHS(Assignment& theAssignment, BasicBlock& theBasicBlock); 

    /** 
     * insert a new basic block between after and before and return it
     */
    BasicBlock& insert_basic_block(const ReversibleControlFlowGraphVertex& after, const ReversibleControlFlowGraphVertex& before);

    /** 
     * insert a new if-statement, connect it with its single predecessor and 
     * with its successors, and return it
     */
    IfStatement* insert_if(const ReversibleControlFlowGraphVertex& pred_r, std::list<const ReversibleControlFlowGraphVertex*> succ_l);

    /** 
     * insert a new endbranch, connect it with its predecessors and 
     * with its single successor, and return it
     */
    EndBranch* insert_endbranch(std::list<const ReversibleControlFlowGraphVertex*> pred_l, const ReversibleControlFlowGraphVertex& succ_r);

    /** 
     * insert a new forloop, connect it with its predecessors and 
     * with its successors, and return it
     */
    ForLoop* insert_forloop(std::list<const ReversibleControlFlowGraphVertex*> pred_l, std::list<const ReversibleControlFlowGraphVertex*> succ_l);

    /** 
     * insert a new endloop, connect it with its single predecessor and 
     * with its single successor, and return it
     */
    EndLoop* insert_endloop(const ReversibleControlFlowGraphVertex& pred_r, const ReversibleControlFlowGraphVertex& succ_r);

    /** 
     * append "i=i+1" to theBasicBlock_r
     */
    void insert_increment_integer(const Symbol* theIntegerSymbol_p, BasicBlock& theBasicBlock_r);

    /** 
     * append "i=value" to theBasicBlock_r and return "i"
     */
    const Symbol* insert_init_integer(int value, BasicBlock& theBasicBlock_r);

    /** 
     * append "push_cfg(i)" to theBasicBlock_r
     */
    void insert_push_integer(const Symbol* theSymbol_p, BasicBlock& theBasicBlock_r);

    /** 
     * reference to original cfg
     */
    const ControlFlowGraph& myOriginalGraph_r;

    /** 
     * vertex list for generating various topological sorts
     */
    std::list<const ReversibleControlFlowGraphVertex*> mySortedVertices_cp_l;

    /** 
     * list of correspondences between original vertices
     * and new ones in the reversed cfg
     */
    std::list<std::pair<const ReversibleControlFlowGraphVertex*,const ReversibleControlFlowGraphVertex*> > myVertexMap;

    /** 
     * signature used in annotations of objects generated
     * by the algorithm
     */
    static std::string myAnnotationSignature;

    /** 
     * References to symbols for push and pop routines
     * all live in global scope
     */
    Symbol& myPushIntegerSymbol_r;
    Symbol& myPopIntegerSymbol_r;

  };  // end of class

} // end of namespace 
                                                                     
#endif
