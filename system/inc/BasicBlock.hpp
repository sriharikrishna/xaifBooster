#ifndef _BASICBLOCK_INCLUDE_
#define _BASICBLOCK_INCLUDE_

#include "xaifBooster/system/inc/PlainBasicBlock.hpp"
#include "xaifBooster/system/inc/BasicBlockAlgBase.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphVertex.hpp"

namespace xaifBooster { 

  /**
   * representation for basic block with pointer to 
   * BasicBlockAlgBase
   */
  class BasicBlock : public PlainBasicBlock, public ControlFlowGraphVertex {
  public:
    
    BasicBlock (Scope& theScope);

    ~BasicBlock();

    /**
     * calls virtual routine in BasicBlockAlgBase
     * that gets resolved to either printing the
     * actual expression using PlainBasicBlock::printXMLHierarchy
     * or to printing the transformed copy depending
     * on the algorithm used.
     */
    virtual void printXMLHierarchy(std::ostream& os) const;
    void printXMLHierarchyImpl(std::ostream& os) const;

    std::string debug() const ;

    /** 
     * get algorithm
     */
    BasicBlockAlgBase& getBasicBlockAlgBase() const;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c); 

  }; // end of class BasicBlock
 
} // end of namespace xaifBooster
                                                                     
#endif
