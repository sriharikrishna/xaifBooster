#ifndef _CONTROLFLOWGRAPHEDGE_INCLUDE_
#define _CONTROLFLOWGRAPHEDGE_INCLUDE_

#include "xaifBooster/utils/inc/ObjectWithId.hpp"
#include "xaifBooster/system/inc/EdgeTraversable.hpp"

namespace xaifBooster { 
  
  class ControlFlowGraphBase;

  class ControlFlowGraphEdge : public EdgeTraversable, 
			       public ObjectWithId {
  public:

    ControlFlowGraphEdge() : my_has_condition_value(false), my_condition_value(1) {};

    ~ControlFlowGraphEdge(){};
    
    void printXMLHierarchy(std::ostream& os,
			   const ControlFlowGraphBase& theGraph) const;

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

    /**
     * name for has_condition_value as represented in XAIF schema
     */
    static const std::string our_has_condition_value_XAIFName;

    /**
     * name for condition_value as represented in XAIF schema
     */
    static const std::string our_condition_value_XAIFName;



    bool has_condition_value() const;
    void set_has_condition_value(bool hcv);

    void set_condition_value(int cv);
    const int& get_condition_value() const;

  private:

    bool my_has_condition_value;
    int my_condition_value;  

  }; // end of class ControlFlowGraphEdge
 
} // end of namespace xaifBooster
                                                                     
#endif
