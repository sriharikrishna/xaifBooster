#ifndef _LABEL_INCLUDE_
#define _LABEL_INCLUDE_

#include "xaifBooster/system/inc/ControlFlowGraphVertex.hpp"

namespace xaifBooster { 

  /**
   * class Label 
   */
  class Label : public ControlFlowGraphVertex {
  public:
    
    Label();

    ~Label();

    void printXMLHierarchy(std::ostream& os) const;

    std::string debug() const ;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for inherited member myId as represented in XAIF schema
     */
    static const std::string our_myId_XAIFName;

  };
 
} // end of namespace xaifBooster
                                                                     
#endif
