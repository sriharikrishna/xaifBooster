#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATION_ASSIGNMENTALG_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATION_ASSIGNMENTALG_INCLUDE_
// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

#include "xaifBooster/algorithms/Linearization/inc/AssignmentAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  /** 
   * class to implement algorithms relevant for the 
   * angel interface and the flattening
   */
  class AssignmentAlg : public xaifBoosterLinearization::AssignmentAlg {
  public:
    
    AssignmentAlg(Assignment& theContainingAssignment);

    virtual ~AssignmentAlg(){};

    static void permitAliasedLHSs();

    static bool doesPermitAliasedLHSs();

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    /** 
     * linearize
     */
    virtual void algorithm_action_1();

    /** 
     * flatten
     */
    virtual void algorithm_action_2();

  private: 

    /** 
     * no def
     */
    AssignmentAlg();

    /** 
     * no def
     */
    AssignmentAlg(const AssignmentAlg&);

    /** 
     * no def
     */
    AssignmentAlg& operator=(const AssignmentAlg&);

    typedef std::pair<const ExpressionVertex*, 
		      const PrivateLinearizedComputationalGraphVertex*> VertexPPair;
    typedef std::list<VertexPPair> VertexPPairList;

    /**
     * method for vertex identification
     * returning false in case of ambiguous identification
     * and true otherwise
     */
    bool vertexIdentification(PrivateLinearizedComputationalGraph& theFlattenedSequence);
    
    static bool ourPermitAliasedLHSsFlag;

  }; // end of class AssignmentAlg
 
} 
                                                                     
#endif
