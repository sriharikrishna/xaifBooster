#ifndef _ASSIGNMENTALG_INCLUDE_
#define _ASSIGNMENTALG_INCLUDE_

#include "xaifBooster/system/inc/AssignmentAlgBase.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraph.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  /** 
   * class to implement algorithms relevant for the 
   * angel interface
   */
  class AssignmentAlg : public AssignmentAlgBase {
  public:
    
    AssignmentAlg(Assignment& theContainingAssignment);

    virtual ~AssignmentAlg(){};

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    /** 
     * flatten
     */
    virtual void algorithm_action_1();

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
