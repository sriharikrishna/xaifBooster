#ifndef _INLINABLEINTRINSICSEXPRESSIONEDGE_INCLUDE_
#define _INLINABLEINTRINSICSEXPRESSIONEDGE_INCLUDE_

#include "system/inc/Edge.hpp"
#include "utils/inc/ObjectWithId.hpp"

namespace xaifBooster { 

  

  class InlinableIntrinsicsExpressionEdge : public Edge, 
					    public ObjectWithId { 
  public:

    InlinableIntrinsicsExpressionEdge () : myPosition(0) {};
    ~InlinableIntrinsicsExpressionEdge(){};

    void setPosition(const std::string&);
    unsigned int getPosition() const;

    virtual std::string debug() const;

    static const std::string ourXAIFName;
    static const std::string our_myId_XAIFName;
    static const std::string our_source_XAIFName;
    static const std::string our_target_XAIFName;
    static const std::string our_myPosition_XAIFName;

  private:

    unsigned int myPosition;

  }; // end of class InlinableIntrinsicsExpressionEdge
 
} // end of namespace xaifBooster
                                                                     
#endif
