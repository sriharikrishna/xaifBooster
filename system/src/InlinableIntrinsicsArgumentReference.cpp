#include "utils/inc/LogicException.hpp"
#include "system/inc/InlinableIntrinsicsArgumentReference.hpp"
#include "system/inc/Variable.hpp"

namespace xaifBooster { 

  const std::string InlinableIntrinsicsArgumentReference::ourXAIFName("xaifii:ArgumentReference");
  const std::string InlinableIntrinsicsArgumentReference::our_myArgRef_XAIFName("argument");
  const std::string InlinableIntrinsicsArgumentReference::our_myId_XAIFName("vertex_id");

  ExpressionVertex& 
  InlinableIntrinsicsArgumentReference::createCopyOfMyself() const {
    THROW_LOGICEXCEPTION_MACRO("InlinableIntrinsicsArgumentReference::createCopyOfMyself: prohibited invocation for position "
			       << myPosition);
    // not reachable but we should match return type...
    // somebody will always complain
    return *(new Variable());
  } 

} 
