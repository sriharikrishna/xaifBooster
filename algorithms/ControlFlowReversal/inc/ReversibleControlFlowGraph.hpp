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
    void topologicalSort();
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
     * top-down topologically sorted vertex list
     */
    bool topologicalSortRecursively(ReversibleControlFlowGraphVertex&, int&,std::vector<ReversibleControlFlowGraphVertex*>&);

    /** 
     * top down topological sort
     */
    const Symbol* makeAuxilliaryIntegerLHS(Assignment& theAssignment, BasicBlock& theBasicBlock); 

    /** 
     * insert a new basic block between after and before and return it
     */
    BasicBlock& insert_basic_block(const ReversibleControlFlowGraphVertex& after, const ReversibleControlFlowGraphVertex& before);

    /** 
     * make a new basic block
     */
    ReversibleControlFlowGraphVertex* new_basic_block();

    /** 
     * make a new if-statement
     */
    ReversibleControlFlowGraphVertex* new_if();

    /** 
     * make a new endbranch
     */
    ReversibleControlFlowGraphVertex* new_endbranch();

    /** 
     * make a new forloop
     */
    ReversibleControlFlowGraphVertex* new_forloop();

    /** 
     * make a new endloop
     */
    ReversibleControlFlowGraphVertex* new_endloop();

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
    std::list<ReversibleControlFlowGraphVertex*> mySortedVertices_p_l;

    /** 
     * list of correspondences between original vertices
     * and new ones in the reversed cfg
     */
    std::list<std::pair<const ReversibleControlFlowGraphVertex*,const ReversibleControlFlowGraphVertex*> > myVertexMap;

  };  // end of class

} // end of namespace 
                                                                     
#endif
