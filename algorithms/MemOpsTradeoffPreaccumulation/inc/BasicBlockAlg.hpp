/********************************************************************************************************
 * Andrew Lyons, MCS Division, Argonne National Laboratory
 * Under the supervision of Paul Hovland and Uwe Naumann
 * BasicBlockAlg.hpp          Last Updated: 03/11/04 12:49
 * program to perform eliminations on xaif graphs in order to compare ops minimizing and
 * data locality heuristics.
 */


#ifndef _XAIFBOOSTERMEMOPSTRADEOFFPREACCUMULATION_BASICBLOCKALG_INCLUDE_
#define _XAIFBOOSTERMEMOPSTRADEOFFPREACCUMULATION_BASICBLOCKALG_INCLUDE_

#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/LinearizedComputationalGraphCopyEdge.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/LinearizedComputationalGraphCopy.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/JacobianAccumulationExpressionCopy.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/DualGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"

using namespace xaifBoosterCrossCountryInterface;

namespace xaifBoosterMemOpsTradeoffPreaccumulation {  

  /**
   * class to implement algorithms relevant for the 
   * elimination methods for memory-operations-tradeoffs
   */
  class BasicBlockAlg : public xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg {
  public:
    
    BasicBlockAlg(BasicBlock& theContaining);
                                                                                
    virtual ~BasicBlockAlg() {};

    /**
     * calls algorithm_action_2() from 
     * xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg 
     */
    virtual void algorithm_action_2();
                                                                                
    /**
     * calls algorithm_action_3() from 
     * xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg 
     */

    virtual void algorithm_action_3();

    virtual void printXMLHierarchy(std::ostream& os) const;
                                                                                
    virtual std::string debug() const;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    /**
     * compute elimination sequence receives a flattened linearized computational graph and a 
     * JAE list, the mode parameter is a dummy for now.  First, a copy of the graph is made, so that
     * the original can remain unmodified.  A text file is then parsed, the contents ofd the file first
     * stipulate whether vertex or edge elimination is to be used on the graph.  At the moment, vertex
     * elimination can only be used on graphs where the independent vertices are those vertices with no
     * inedges, and the dependent vertices are the ones with no outedges, rather than the distinctions
     * specified by the independent and dependent lists that come as a part of the original graph.
     * Next, the order of heuristics to be used is read in from the file.  the first heuristic is run
     * on the set of possible eliminations, if it can't decide on a sungle element, the second heuristic
     * is run on the remaining elements, and so on, until either forward mode or reverse mode is called.
     * These two heuristics always decide on a single element.  the JAE list is updated as eliminations
     * are made.  After execution, theOriginal remains the same, and the JAE list is full of the
     * eliminations required to reduce the original to a bipartite graph
     */
    static void compute_elimination_sequence(
      const LinearizedComputationalGraph& theOriginal,
      int mode,
      JacobianAccumulationExpressionList& theJacobianAccumulationExpressionList);

  private:

    /** 
     * no def
     */
    BasicBlockAlg();

    /** 
     * no def
     */
    BasicBlockAlg(const BasicBlockAlg&);

    /** 
     * no def
     */
    BasicBlockAlg operator=(const BasicBlockAlg&);

  };  // end of class

} // end of namespace 
                                                                     
#endif
