#ifndef _XAIFBASEPARSERHANDLERS_INCLUDE_
#define _XAIFBASEPARSERHANDLERS_INCLUDE_

#include "xaifBooster/utils/inc/XAIFBaseParserHelper.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/ArrayAccess.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/Entry.hpp"
#include "xaifBooster/system/inc/Exit.hpp"
#include "xaifBooster/system/inc/IfStatement.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/Marker.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"
#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/system/inc/Constant.hpp"
#include "xaifBooster/system/inc/Intrinsic.hpp"
#include "xaifBooster/system/inc/ExpressionEdge.hpp"
#include "xaifBooster/system/inc/AliasMapEntry.hpp"
#include "xaifBooster/system/inc/AliasSet.hpp"
#include "xaifBooster/system/inc/AliasSingle.hpp"
#include "xaifBooster/system/inc/AliasRange.hpp"
#include "xaifBooster/system/inc/SubroutineCall.hpp"
#include "xaifBooster/system/inc/ForLoop.hpp"
#include "xaifBooster/system/inc/PreLoop.hpp"
#include "xaifBooster/system/inc/PostLoop.hpp"
#include "xaifBooster/system/inc/BooleanOperation.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/ScopeContainment.hpp"
#include "xaifBooster/system/inc/ControlFlowGraph.hpp"
#include "xaifBooster/system/inc/InOutList.hpp"
#include "xaifBooster/system/inc/ArgumentList.hpp"

namespace xaifBooster {

  class XAIFBaseParserHandlers {
  protected:
    XAIFBaseParserHandlers(){};
    ~XAIFBaseParserHandlers(){};

    // Here are all the parsing methods: 

#include "xaifBooster/tools/codegen/code/parse_method_decl.inc"

  }; // end of class XMLParser

} // end of namespace 

#endif
