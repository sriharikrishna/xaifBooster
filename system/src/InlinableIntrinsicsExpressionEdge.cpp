#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/InlinableIntrinsicsExpressionEdge.hpp"

namespace xaifBooster { 

  const std::string InlinableIntrinsicsExpressionEdge::ourXAIFName("xaif:ExpressionEdge");
  const std::string InlinableIntrinsicsExpressionEdge::our_myId_XAIFName("edge_id");
  const std::string InlinableIntrinsicsExpressionEdge::our_source_XAIFName("source");
  const std::string InlinableIntrinsicsExpressionEdge::our_target_XAIFName("target");
  const std::string InlinableIntrinsicsExpressionEdge::our_myPosition_XAIFName("position");


  void
  InlinableIntrinsicsExpressionEdge::setPosition(const std::string& i) {
    if (myPosition) THROW_LOGICEXCEPTION_MACRO("InlinableIntrinsicsExpressionEdge::setPosition: already set");
    myPosition=atoi(i.c_str());
  }

  unsigned int
  InlinableIntrinsicsExpressionEdge::getPosition() const {
    if (!myPosition) THROW_LOGICEXCEPTION_MACRO("InlinableIntrinsicsExpressionEdge::getPosition: not set");
    return myPosition;
  }

  std::string
  InlinableIntrinsicsExpressionEdge::debug() const {
    return ObjectWithId::debug();
  }

}

