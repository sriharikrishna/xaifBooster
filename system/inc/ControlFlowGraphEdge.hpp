#ifndef _CONTROLFLOWGRAPHEDGE_INCLUDE_
#define _CONTROLFLOWGRAPHEDGE_INCLUDE_

#include "xaifBooster/utils/inc/ObjectWithId.hpp"
#include "xaifBooster/system/inc/EdgeTraversable.hpp"

namespace xaifBooster { 
  
  class ControlFlowGraph;

  class ControlFlowGraphEdge : public EdgeTraversable, 
			       public ObjectWithId {
  public:

    ControlFlowGraphEdge(){};

    ~ControlFlowGraphEdge(){};
    
    void printXMLHierarchy(std::ostream& os,
			   const ControlFlowGraph& theGraph) const;

    std::string debug() const ;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for inherited member myId as represented in XAIF schema
     */
    static const std::string our_myId_XAIFName;

    /**
     * name for source as represented in XAIF schema
     */
    static const std::string our_source_XAIFName;

    /**
     * name for target as represented in XAIF schema
     */
    static const std::string our_target_XAIFName;

  }; // end of class ControlFlowGraphEdge
 
} // end of namespace xaifBooster
                                                                     
#endif
