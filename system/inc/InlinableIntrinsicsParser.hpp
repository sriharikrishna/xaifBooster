#ifndef _INLINABLEINTRINSICSPARSER_INCLUDE_
#define _INLINABLEINTRINSICSPARSER_INCLUDE_

#include <string>
#include "xercesc/parsers/XercesDOMParser.hpp"
#include "system/inc/InlinableIntrinsicsCatalogue.hpp"
#include "system/inc/InlinableIntrinsicsParserHelper.hpp"
#include "utils/inc/HashTable.hpp"

namespace xaifBooster {

  class InlinableIntrinsicsParser {
  public:
    InlinableIntrinsicsParser(InlinableIntrinsicsCatalogue& theInlinableIntrinsicsCatalogue_r);

    void initialize();
    
    void parse(std::string theInlinableIntrinsicsFileName);

  private:

    InlinableIntrinsicsCatalogue& myInlinableIntrinsicsCatalogue;

    /** 
     * local xercesc parser handle
     */
    xercesc::XercesDOMParser* myParser_p;

    /**
     * method used by 
     * InlinableIntrinsicsParser::moveOne.
     * selects action method appropriate for node name
     * from InlinableIntrinsicsParser::ourActionCatalogue
     */
    void actionInvocation(xercesc::DOMTreeWalker *theTreeWalker_p,
			  const InlinableIntrinsicsParserHelper& passingFromParent,
			  InlinableIntrinsicsParserHelper& passingToChild);

    /**
     * recursively invoked method 
     * travereses the DOM tree in depth first fashion
     * and invokes the action for each node encountered
     * see 
     * InlinableIntrinsicsParser::actionInvocation.
     */
    void moveOn(xercesc::DOMTreeWalker *theTreeWalker_p,
		const InlinableIntrinsicsParserHelper& passingFromParent);

    /** 
     * action held in ourActionCatalogue
     * keyed by DOM node name as specified in the 
     * XAIF schema
     */
    struct ActionItem { 
      typedef 
      void (InlinableIntrinsicsParser::* ActionFPType)(xercesc::DOMNode *theNode_p,
				       const InlinableIntrinsicsParserHelper& passingIn,
				       InlinableIntrinsicsParserHelper& passingOut);
      /** 
       * the actions are function pointers to InlinableIntrinsicsParser member 
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

    /** 
     * method for InlinableIntrinsicDefinitions which is 
     * added to ourActionCatalogue
     */  
    void onInlinableIntrinsicsCatalogue(xercesc::DOMNode *theNode_p,
		      const InlinableIntrinsicsParserHelper& passingIn,
		      InlinableIntrinsicsParserHelper& passingOut);

    /** 
     * method for InlinableIntrinsic which is 
     * added to ourActionCatalogue
     */  
    void onInlinableIntrinsicsCatalogueItem(xercesc::DOMNode *theNode_p,
		      const InlinableIntrinsicsParserHelper& passingIn,
		      InlinableIntrinsicsParserHelper& passingOut);

    /** 
     * method for Function which is 
     * added to ourActionCatalogue
     */  
    void onInlinableIntrinsicsFunction(xercesc::DOMNode *theNode_p,
		      const InlinableIntrinsicsParserHelper& passingIn,
		      InlinableIntrinsicsParserHelper& passingOut);

    /** 
     * method for Partial which is 
     * added to ourActionCatalogue
     */  
    void onInlinableIntrinsicsPartial(xercesc::DOMNode *theNode_p,
		      const InlinableIntrinsicsParserHelper& passingIn,
		      InlinableIntrinsicsParserHelper& passingOut);

    /** 
     * method for ArgumentReference which is 
     * added to ourActionCatalogue
     */  
    void onInlinableIntrinsicsArgumentReference(xercesc::DOMNode *theNode_p,
		       const InlinableIntrinsicsParserHelper& passingIn,
		       InlinableIntrinsicsParserHelper& passingOut);

    /** 
     * method for Constant which is 
     * added to ourActionCatalogue
     */  
    void onInlinableIntrinsicsConstant(xercesc::DOMNode *theNode_p,
		    const InlinableIntrinsicsParserHelper& passingIn,
		    InlinableIntrinsicsParserHelper& passingOut);

    /** 
     * method for Intrinsic which is 
     * added to ourActionCatalogue
     */  
    void onInlinableIntrinsicsIntrinsic(xercesc::DOMNode *theNode_p,
		     const InlinableIntrinsicsParserHelper& passingIn,
		     InlinableIntrinsicsParserHelper& passingOut);

    /** 
     * method for ExpressionEdge which is 
     * added to ourActionCatalogue
     */  
    void onInlinableIntrinsicsExpressionEdge(xercesc::DOMNode *theNode_p,
			  const InlinableIntrinsicsParserHelper& passingIn,
			  InlinableIntrinsicsParserHelper& passingOut);

    /*
     * currently don't deal with 
     * added to ourActionCatalogue
     */  
    void onDummy(xercesc::DOMNode *theNode_p,
		 const InlinableIntrinsicsParserHelper& passingIn,
		 InlinableIntrinsicsParserHelper& passingOut);

  }; // end of class InlinableIntrinsicsParser

} // end of namespace 

#endif
