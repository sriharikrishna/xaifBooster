#ifndef _XAIFBASEPARSERHELPER_INCLUDE_
#define _XAIFBASEPARSERHELPER_INCLUDE_

#include "xaifBooster/utils/inc/XMLParserHelper.hpp"

namespace xaifBooster { 

  class AliasMapEntry;
  class AliasMap;
  class ArrayAccess;
  class Assignment;
  class Variable;
  class VariableEdge;
  class BasicBlock;
  class CallGraph;
  class Condition;
  class ControlFlowGraph;
  class Expression;
  class ExpressionEdge;
  class ForLoop;
  class IfStatement;
  class Branch;
  class Initialization;
  class PostLoop;
  class PreLoop;
  class Scope;
  class Scopes;
  class SideEffectList;
  class SubroutineCall;
  class SymbolTable;
  class Update;
  class ArgumentList;
  class Label;
  class Goto;
  class DuUdMapEntry;
  class DuUdMap;
  
  class XAIFBaseParserHelper : public XMLParserHelper { 
  public: 
    XAIFBaseParserHelper();
    ~XAIFBaseParserHelper(){};

#include "xaifBooster/tools/codegen/code/helper_declaration.inc"

  }; // end of class XAIFBaseParserHelper

} // end of namespace

#endif
