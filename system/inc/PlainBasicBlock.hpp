#ifndef _PLAINBASICBLOCK_INCLUDE_
#define _PLAINBASICBLOCK_INCLUDE_

#include "xaifBooster/system/inc/ControlFlowGraphVertex.hpp"
#include <list>

namespace xaifBooster { 

  class BasicBlockElement;
  class Scope;

  /**
   * class PlainBasicBlock describes a block of statements.
   * I.e. think of statements within {}
   */
  class PlainBasicBlock : public ControlFlowGraphVertex {
  public:
    
    PlainBasicBlock (Scope& theScope);

    ~PlainBasicBlock(){};

    void printXMLHierarchyImpl(std::ostream& os) const;

    std::string debug() const;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for inherited member myId as represented in XAIF schema
     */
    static const std::string our_myId_XAIFName;

    /**
     * name for member myScopeId as represented in XAIF schema
     */
    static const std::string our_myScopeId_XAIFName;

    /**
     * adds an element  to the basic block,
     * however the element instance has to 
     * be DYNAMICALLY ALLOCATED and the 
     * OWNERSHIP IS RELINQUISHED to the basic block.
     */
    void supplyAndAddBasicBlockElementInstance(BasicBlockElement& theBasicBlockElement);
    void supplyAndAddBasicBlockElementInstanceAtBeginning(BasicBlockElement& theBasicBlockElement);
    
    typedef std::list<BasicBlockElement*> BasicBlockElementList;
    
    const BasicBlockElementList& getBasicBlockElementList() const;

    BasicBlockElementList& getBasicBlockElementList();

    /**
     * get the scope, here not constant yet
     * because right now we don't have 
     * a derive ScopeAlg object but rather add 
     * new symbols right away in the original scope
     * which is contrary to the rest of the design 
     * where we keep the original constant... 
     * \todo JU: revisit the const Scope issue
     */
    Scope& getScope() const;

  protected:
    
    /**
     * the (ordered) list of basic block elements
     * which are instances of the derived classes 
     * assignment, subroutine call etc..
     */
    BasicBlockElementList myElementList;

    /**
     * the scope as specified by the scope id
     */
    Scope& myScope_r;

  }; // end of class PlainBasicBlock
 
} // end of namespace xaifBooster
                                                                     
#endif
