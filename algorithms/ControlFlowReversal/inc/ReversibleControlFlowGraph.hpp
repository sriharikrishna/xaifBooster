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
#include "xaifBooster/system/inc/Branch.hpp"
#include "xaifBooster/system/inc/Entry.hpp"
#include "xaifBooster/system/inc/Exit.hpp"
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
    void makeThisACopyOfOriginalControlFlowGraph();

    std::string makeUniqueVertexId();
    std::string makeUniqueEdgeId();

    ReversibleControlFlowGraphVertex& getEntry(); 
    ReversibleControlFlowGraphVertex& getExit(); 

    void markBranchEntryEdges();
    void topologicalSort();
    void storeControlFlow();
    void buildAdjointControlFlowGraph(ReversibleControlFlowGraph&);
 
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
    * Insert edge from theAdjointSource_cr to theAdjointTarget_cr.
    * Return reference to the newly created ReversibleControlFlowGraphEdge.
    */
    ReversibleControlFlowGraphEdge&
    insertAdjointControlFlowGraphEdge(ReversibleControlFlowGraph&, const ReversibleControlFlowGraphVertex& theAdjointSource_cr, const ReversibleControlFlowGraphVertex& theAdjointTarget_cr);

   /**
    * For a given edge in the original control flow, build its adjoint.
    * The correspondence between original and adjoint vertices is recorded in
    * theVertexCorrespondence_ppl where the first entry of each pair is the
    * original vertex and the second entry is the adjoint vertex.
    *
    * Add edge from the adjoint of the target to the adjoint of the source
    * if the source it is not a LOOP node and the target is not the first node
    * of the loop body, that is, its inedge.
    * Otherwise, find the matching original ENDLOOP node and add edge
    * from theSource_p to the ENDLOOP node's adjoint (a FORLOOP) node.
   */

    ReversibleControlFlowGraphEdge&
    addAdjointControlFlowGraphEdge(ReversibleControlFlowGraph&, const ReversibleControlFlowGraphEdge& theOriginalEdge_cr, const std::list<std::pair<ReversibleControlFlowGraphVertex*,ReversibleControlFlowGraphVertex*> >& theVertexCorrespondence_ppl);

    /** 
     * find branch exit edge that corresponds to theCurrentEdge_r
     */
    const ReversibleControlFlowGraphEdge&
    find_corresponding_branch_exit_edge_rec(const ReversibleControlFlowGraphEdge& theCurrentEdge_r, int& nesting_depth) const;

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
    BasicBlock& insert_basic_block(const ReversibleControlFlowGraphVertex& after, const ReversibleControlFlowGraphVertex& before, const ReversibleControlFlowGraphEdge& replacedEdge_r);

    /** 
     * make a new entry node
     */
    ReversibleControlFlowGraphVertex* new_entry();

    /** 
     * make a new exit node
     */
    ReversibleControlFlowGraphVertex* new_exit();

    /** 
     * make a new basic block
     */
    ReversibleControlFlowGraphVertex* new_basic_block();

    /** 
     * make a new branch
     */
    ReversibleControlFlowGraphVertex* new_branch();

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
