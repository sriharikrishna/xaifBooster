#ifndef _XAIFBASEPARSERHELPER_INCLUDE_
#define _XAIFBASEPARSERHELPER_INCLUDE_

#include "xaifBooster/utils/inc/XMLParserHelper.hpp"

namespace xaifBooster { 

  class AliasMap;
  class AliasMapEntry;
  class ArgumentList;
  class ArrayAccess;
  class Assignment;
  class BasicBlock;
  class Branch;
  class CallGraph;
  class Condition;
  class ControlFlowGraph;
  class DuUdMap;
  class DuUdMapEntry;
  class Expression;
  class ExpressionEdge;
  class ForLoop;
  class Goto;
  class IfStatement;
  class Initialization;
  class Label;
  class PostLoop;
  class PreLoop;
  class Scope;
  class Scopes;
  class SideEffectList;
  class SubroutineCall;
  class Symbol;
  class SymbolTable;
  class Update;
  class Variable;
  class VariableEdge;
  
  class XAIFBaseParserHelper : public XMLParserHelper { 
  public: 
    XAIFBaseParserHelper();
    ~XAIFBaseParserHelper(){};

#include "xaifBooster/tools/codegen/code/helper_declaration.inc"

  }; // end of class XAIFBaseParserHelper

} // end of namespace

#endif
