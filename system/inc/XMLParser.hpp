#ifndef _XMLPARSER_INCLUDE_
#define _XMLPARSER_INCLUDE_

#include <string>
#include "xercesc/parsers/XercesDOMParser.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/utils/inc/XMLParserHelper.hpp"
#include "xaifBooster/utils/inc/HashTable.hpp"

namespace xaifBooster {

  class XMLParser {
  public:
    XMLParser() {};
    ~XMLParser(){};

    void initialize();
    
    void parse(std::string theXMLFileName);

  private:

    /** 
     * local xercesc parser handle
     */
    xercesc::XercesDOMParser* myParser_p;

    /**
     * converts an XML boolean string
     */
    static bool convertToBoolean(const std::string& aValueString);

    /**
     * method used by 
     * XMLParser::moveOne.
     * selects action method appropriate for node name
     * from XMLParser::ourActionCatalogue
     */
    void actionInvocation(xercesc::DOMTreeWalker *theTreeWalker_p,
			  const XMLParserHelper& passingFromParent,
			  XMLParserHelper& passingToChild);

    /**
     * recursively invoked method 
     * travereses the DOM tree in depth first fashion
     * and invokes the action for each node encountered
     * see 
     * XMLParser::actionInvocation.
     */
    void moveOn(xercesc::DOMTreeWalker *theTreeWalker_p,
		const XMLParserHelper& passingFromParent);

    /** 
     * action held in ourActionCatalogue
     * keyed by DOM node name as specified in the 
     * XAIF schema
     */
    struct ActionItem { 
      typedef 
      void (XMLParser::* ActionFPType)(xercesc::DOMNode *theNode_p,
				       const XMLParserHelper& passingIn,
				       XMLParserHelper& passingOut);
      /** 
       * the actions are function pointers to XMLParser member 
       * functions with a signature as specified above
       * There are two 'helper' containers passingIn/Out
       * which hold references to the respective elements 
       * in the xaifBooster data structure as they 
       * are needed for building the xaifBooster structure
       * while traversing the DOM tree. 
       * The idea is to have for each level of recursion a corresponding
       * pair of in/out helpers such that an explicit stack of references
       * for nested structures is replaced by the stack of helper 
       * pairs as implicitely established through the recursive 
       * call stack.
       */
      ActionFPType myAction;
      ActionItem(const ActionFPType& anAction): myAction(anAction){};
    }; 

    /**
     * the action catalogue 
     * keyed by the DOM node names as specified 
     * in the XAIF schema
     */
    static HashTable<ActionItem> ourActionCatalogue;
    
    /**
     * flag guarding the onetime initialization of
     * ourActionCatalogue
     */
    static bool ourStaticInitFlag;

    /**
     * method that contains calls which 
     * add individual actions to 
     * ourActionCatalogue
     */
    static void staticInitialize();

    /**
     * convenience method which wraps 
     * xercesc calls to get to the attributes 
     * of a node
     */
    static 
    std::string getAttributeValueByName(xercesc::DOMNode *theNode_p,
					const std::string& theName);

    // Here are all the parsing methods: 

#ifndef PARSE_METHOD_DECL
#define PARSE_METHOD_DECL(name) void on##name(xercesc::DOMNode *theNode_p, const XMLParserHelper& passingIn, XMLParserHelper& passingOut)
#else
#error macro name for PARSE_METHOD_DECL already in use
#endif


    PARSE_METHOD_DECL(AliasActivityMap);
    PARSE_METHOD_DECL(AliasActivity);
    PARSE_METHOD_DECL(AliasRange);
    PARSE_METHOD_DECL(AliasSingle);
    PARSE_METHOD_DECL(Argument);
    PARSE_METHOD_DECL(ArgumentList);
    PARSE_METHOD_DECL(ArgumentSymbolReference);
    PARSE_METHOD_DECL(ArrayAccess);
    PARSE_METHOD_DECL(ArrayIndex);
    PARSE_METHOD_DECL(AssignmentLHS);
    PARSE_METHOD_DECL(AssignmentRHS); 
    PARSE_METHOD_DECL(Assignment);
    PARSE_METHOD_DECL(BasicBlock);
    PARSE_METHOD_DECL(BooleanOperation);
    PARSE_METHOD_DECL(CallGraph);
    PARSE_METHOD_DECL(CallGraphEdge);
    PARSE_METHOD_DECL(Condition);
    PARSE_METHOD_DECL(Constant);
    PARSE_METHOD_DECL(ControlFlowGraphEdge);
    PARSE_METHOD_DECL(ControlFlowGraph);
    PARSE_METHOD_DECL(Entry);
    PARSE_METHOD_DECL(Exit);
    PARSE_METHOD_DECL(ExpressionEdge);
    PARSE_METHOD_DECL(ForLoop);
    PARSE_METHOD_DECL(IfStatement); 
    PARSE_METHOD_DECL(Initialization);
    PARSE_METHOD_DECL(Intrinsic);
    PARSE_METHOD_DECL(Marker);
    PARSE_METHOD_DECL(PostLoop);
    PARSE_METHOD_DECL(PreLoop);
    PARSE_METHOD_DECL(ScopeContainment);
    PARSE_METHOD_DECL(Scopes);
    PARSE_METHOD_DECL(Scope);
    PARSE_METHOD_DECL(SubroutineCall);
    PARSE_METHOD_DECL(SymbolReference);
    PARSE_METHOD_DECL(SymbolTable);
    PARSE_METHOD_DECL(Symbol);
    PARSE_METHOD_DECL(VariableReference);
    PARSE_METHOD_DECL(VariableReferenceEdge);
    PARSE_METHOD_DECL(Update);

    PARSE_METHOD_DECL(Dummy);

#undef PARSE_METHOD_DECL

  }; // end of class XMLParser

} // end of namespace 

#endif
