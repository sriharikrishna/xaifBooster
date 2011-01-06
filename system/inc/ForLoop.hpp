#ifndef _FORLOOP_INCLUDE_
#define _FORLOOP_INCLUDE_
// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

#include "xaifBooster/system/inc/Initialization.hpp"
#include "xaifBooster/system/inc/Condition.hpp"
#include "xaifBooster/system/inc/Update.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphVertex.hpp"
#include "xaifBooster/system/inc/ForLoopAlgBase.hpp"
#include "xaifBooster/system/inc/ForLoopReversalType.hpp"
#include "xaifBooster/system/inc/ObjectWithLineNumber.hpp"
#include "xaifBooster/system/inc/FindDefinitionResult.hpp"

namespace xaifBooster { 

  /**
   * this class describes 
   * a for loop
   */
  class ForLoop : public ControlFlowGraphVertex,
		  public ObjectWithLineNumber {
  public:

    ForLoop(const ForLoopReversalType::ForLoopReversalType_E theUserReversalType);

    ~ForLoop();

    /**
     * print XML hierarchy
     */
    void printXMLHierarchy(std::ostream& os) const;

    /**
     * print debug information
     */
    std::string debug() const ;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for inherited member myId as represented in XAIF schema
     */
    static const std::string our_myId_XAIFName;

    Initialization& getInitialization();

    const Initialization& getInitialization() const;

    Condition& getCondition();

    const Condition& getCondition() const;

    Update& getUpdate();

    const Update& getUpdate() const;

    /**
     * get algorithm
     */
    ForLoopAlgBase& getForLoopAlgBase() const;

    virtual bool hasStatement(const ObjectWithId::Id& aStatementId) const; 

    virtual ControlFlowGraphVertexKind::ControlFlowGraphVertexKind_E getKind() const { return ControlFlowGraphVertexKind::FORLOOP_VKIND;}

    virtual void addLoopVariable();

    /**
     * for aStatementId get the Assignment if it exists
     */
    virtual FindDefinitionResult findDefinition(const ObjectWithId::Id& aStatementId) const;

  private:

    /** 
     * no def
     */
    ForLoop();
    
    /** 
     * the initialization 
     * in the ctor set to active
     * may be passivated in the parser
     */
    Initialization myInitialization;

    /** 
     * the condition 
     */
    Condition myCondition;

    /** 
     * the update 
     * in the ctor set to active
     * may be passivated in the parser
     */
    Update myUpdate;

  };
 
} // end of namespace xaifBooster
                                                                     
#endif
