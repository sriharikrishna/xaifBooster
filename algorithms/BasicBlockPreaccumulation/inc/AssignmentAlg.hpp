#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATION_ASSIGNMENTALG_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATION_ASSIGNMENTALG_INCLUDE_

#include "xaifBooster/algorithms/Linearization/inc/AssignmentAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraph.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  /** 
   * class to implement algorithms relevant for the 
   * angel interface
   */
  class AssignmentAlg : public xaifBoosterLinearization::AssignmentAlg {
  public:
    
    AssignmentAlg(Assignment& theContainingAssignment);

    virtual ~AssignmentAlg(){};

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
    AssignmentAlg operator=(const AssignmentAlg&);

  }; // end of class AssignmentAlg
 
} 
                                                                     
#endif
