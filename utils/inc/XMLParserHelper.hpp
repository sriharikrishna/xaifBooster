#ifndef _XMLPARSERHELPER_INCLUDE_
#define _XMLPARSERHELPER_INCLUDE_

namespace xaifBooster { 
  
  /** 
   * macro for getter and setter methods
   */
#ifndef HELPER_DECLARATION
#define HELPER_DECLARATION(x)  \
     public: \
       void set##x(x& whatToSet); \
       x& get##x() const ; \
     private: \
       x* my##x##_p;
#else
#error macro name for HELPER_DECLARATION already in use
#endif

  // forward decls
  class AliasActivity;
  class AliasActivityMap;
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
  class Initialization;
  class PostLoop;
  class PreLoop;
  class Scope;
  class Scopes;
  class SubroutineCall;
  class SymbolTable;
  class Update;
  

  /** 
   * class for keeping class instances to 
   * be passed between parser method 
   * invocations
   * for each new type make a forward declaration 
   * above and the respective MACRO call below
   * keep alpabetical order.
   */
  class XMLParserHelper { 
  public: 
    XMLParserHelper();
    ~XMLParserHelper(){};

    HELPER_DECLARATION(AliasActivity)
    HELPER_DECLARATION(AliasActivityMap)
    HELPER_DECLARATION(ArrayAccess)
    HELPER_DECLARATION(Assignment)
    HELPER_DECLARATION(Variable)
    HELPER_DECLARATION(VariableEdge)
    HELPER_DECLARATION(BasicBlock)
    HELPER_DECLARATION(CallGraph)
    HELPER_DECLARATION(Condition)
    HELPER_DECLARATION(ControlFlowGraph)
    HELPER_DECLARATION(Expression)
    HELPER_DECLARATION(ExpressionEdge)
    HELPER_DECLARATION(ForLoop)
    HELPER_DECLARATION(IfStatement)
    HELPER_DECLARATION(Initialization)
    HELPER_DECLARATION(PostLoop)
    HELPER_DECLARATION(PreLoop)
    HELPER_DECLARATION(Scope)
    HELPER_DECLARATION(Scopes)
    HELPER_DECLARATION(SubroutineCall)
    HELPER_DECLARATION(SymbolTable)
    HELPER_DECLARATION(Update)

  }; // end of class XMLParserHelper

} // end of namespace

#endif
