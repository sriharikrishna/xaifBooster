#ifndef _BASEVARIABLEREFERENCEEDGE_INCLUDE_
#define _BASEVARIABLEREFERENCEEDGE_INCLUDE_

#include "xaifBooster/system/inc/EdgeTraversable.hpp"
#include "xaifBooster/utils/inc/ObjectWithId.hpp"
#include <sstream>

namespace xaifBooster { 

  class BaseVariableReference;

  class BaseVariableReferenceEdge : public EdgeTraversable, 
				    public ObjectWithId {
  public:
    BaseVariableReferenceEdge (){};
    ~BaseVariableReferenceEdge(){};

    static const std::string ourXAIFName;
    static const std::string our_myId_XAIFName;
    static const std::string our_source_XAIFName;
    static const std::string our_target_XAIFName;

    /**
     * \todo JU implement this
     */
    void printXMLHierarchy(std::ostream& os,
			   const BaseVariableReference& theBaseVariableReference) const;

    std::string debug() const;

  };
 
} // end of namespace xaifBooster

#endif
