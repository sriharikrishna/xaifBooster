#include <sstream>

#include "xercesc/dom/DOM.hpp"
#include "xercesc/util/PlatformUtils.hpp"

#include "utils/inc/DbgLoggerManager.hpp"
#include "utils/inc/LogicException.hpp"
#include "utils/inc/XMLParserErrorHandler.hpp"
#include "utils/inc/XMLParserMessage.hpp"

#include "system/inc/ConceptuallyStaticInstances.hpp"
#include "system/inc/InlinableIntrinsicsParser.hpp"
#include "system/inc/InlinableIntrinsicsCatalogue.hpp"
#include "system/inc/InlinableIntrinsicsCatalogueItem.hpp"
#include "system/inc/InlinableIntrinsicsArgumentReference.hpp"
#include "system/inc/InlinableIntrinsicsConstant.hpp"
#include "system/inc/InlinableIntrinsicsIntrinsic.hpp"
#include "system/inc/InlinableIntrinsicsExpressionEdge.hpp"

namespace xaifBooster {
  
  HashTable<InlinableIntrinsicsParser::ActionItem> InlinableIntrinsicsParser::ourActionCatalogue;
  bool InlinableIntrinsicsParser::ourStaticInitFlag;

  InlinableIntrinsicsParser::InlinableIntrinsicsParser(InlinableIntrinsicsCatalogue& theInlinableIntrinsicsCatalogue_r) : 
    myInlinableIntrinsicsCatalogue(theInlinableIntrinsicsCatalogue_r){
  };
  
  void InlinableIntrinsicsParser::initialize() { 
    try { 

      if (!ourStaticInitFlag)
	staticInitialize();

      // per process parser init
      xercesc::XMLPlatformUtils::Initialize();
      
      myParser_p = new xercesc::XercesDOMParser();
      myParser_p->setValidationScheme(xercesc::XercesDOMParser::Val_Always);
      myParser_p->setDoNamespaces(true);
      myParser_p->setDoSchema(true);
      myParser_p->setValidationSchemaFullChecking(true);
      myParser_p->setCreateEntityReferenceNodes(true);

      static XMLParserErrorHandler anErrorHandler;
      myParser_p->setErrorHandler(&anErrorHandler);

    } catch (const xercesc::XMLException& e) {
      THROW_LOGICEXCEPTION_MACRO("InlinableIntrinsicsParser::initialize: XMLException: "
				 << XMLParserMessage(e.getMessage()));
    }
  } // end of InlinableIntrinsicsParser::initialize

  void InlinableIntrinsicsParser::parse(std::string theXMLFileName) { 
    try { 
      myParser_p->parse(theXMLFileName.c_str());
      // get the DOM representation
      xercesc::DOMDocument *theDocument_p = myParser_p->getDocument();
      if (!theDocument_p)
	THROW_LOGICEXCEPTION_MACRO("InlinableIntrinsicsParser::parse: didn't get a document");
      xercesc::DOMTreeWalker *theTreeWalker_p=
	theDocument_p->createTreeWalker(theDocument_p,
					// JU: alternatively SHOW_ALL
					xercesc::DOMNodeFilter::SHOW_ELEMENT,
					0, // no filter specified
					true); // expand all EntityReference nodes
      if (!theTreeWalker_p)
	THROW_LOGICEXCEPTION_MACRO("InlinableIntrinsicsParser::parse: didn't get a tree walker");
      InlinableIntrinsicsParserHelper aParserHelper;
      moveOn(theTreeWalker_p,
	     aParserHelper);
    }
    catch (const xercesc::XMLException& e) {
      THROW_LOGICEXCEPTION_MACRO("InlinableIntrinsicsParser::parse: XMLException:"
				 << XMLParserMessage(e.getMessage()));
    }
    catch (const xercesc::DOMException& e) {
      // the following bit is suggested as such by Xercesc
      // to retrieve the message encoded in the exception
      const unsigned int maxChars = 2047;
      XMLCh errText[maxChars + 1];
      std::ostringstream err;
      err << "InlinableIntrinsicsParser::parse: DOMException: "
	  << "DOMException code is: " << e.code; 
      if (xercesc::DOMImplementation::loadDOMExceptionMsg(e.code, 
							  errText, 
							  maxChars))
	err << " Message is: " << XMLParserMessage(errText) << std::ends;
      // JU: not sure if calling str() still requires a subsequent 
      // delete of the returned pointer...
      THROW_LOGICEXCEPTION_MACRO(err.str());
    }
    catch (BaseException& e) { 
      throw e;
    }
    catch (...) {
      THROW_LOGICEXCEPTION_MACRO("InlinableIntrinsicsParser::parse: caught an unspecified exception");
    }
  } // end of InlinableIntrinsicsParser::parse

  void InlinableIntrinsicsParser::actionInvocation(xercesc::DOMTreeWalker *theTreeWalker_p,
						   const InlinableIntrinsicsParserHelper & passingFromParent,
						   InlinableIntrinsicsParserHelper& passingToChild) { 
    xercesc::DOMNode* theCurrentNode_p=theTreeWalker_p->getCurrentNode();
    try { 
      ActionItem& theAction=ourActionCatalogue.getElement(XMLParserMessage(theCurrentNode_p->getNodeName()).toString());
      (this->*(theAction.myAction))(theCurrentNode_p,
				    passingFromParent,
				    passingToChild) ;
    } 
    catch (LogicException& e) { 
      DBG_MACRO(DbgGroup::ERROR,
		"InlinableIntrinsicsParser::actionInvocation: caught: " 
		<< e.getReason().c_str());
      throw e;
    } 
  } // end of InlinableIntrinsicsParser::actionInvocation

  void 
  InlinableIntrinsicsParser::moveOn(xercesc::DOMTreeWalker *theTreeWalker_p,
				    const InlinableIntrinsicsParserHelper & passingFromParent) { 
    // do whatever needs to be done for this node: 
    InlinableIntrinsicsParserHelper toBePassedDownFromFirstChild;
    actionInvocation(theTreeWalker_p,
		     passingFromParent,
		     toBePassedDownFromFirstChild);
    // go to its first child
    if (theTreeWalker_p->firstChild()) { // we have a child node 
      // recursion
      moveOn(theTreeWalker_p,
	     toBePassedDownFromFirstChild);
    }
    // go to all of this node's siblings
    while (theTreeWalker_p->nextSibling()) { // we have a sibling
      // do whatever needs to be done for the current sibling node
      InlinableIntrinsicsParserHelper toBePassedDownFromSiblings;
      actionInvocation(theTreeWalker_p,
		       passingFromParent,
		       toBePassedDownFromSiblings);
      // go to the sibling's first child if any
      if (theTreeWalker_p->firstChild()) { // we have a child node 
	moveOn(theTreeWalker_p,
	       toBePassedDownFromSiblings);
      }
    } // end while
    // reset up to the parent node and return
    theTreeWalker_p->parentNode();
  }; // end of InlinableIntrinsicsParser::moveOn

  std::string InlinableIntrinsicsParser::getAttributeValueByName(xercesc::DOMNode *theNode_p,
								 const std::string& theName) {
    xercesc::DOMNamedNodeMap* attributeNodeMap_p=theNode_p->getAttributes();
    if (!attributeNodeMap_p)
      THROW_LOGICEXCEPTION_MACRO("InlinableIntrinsicsParser::getAttributeValueByName didn't get attribute map");
    xercesc::DOMNode* aNode_p=attributeNodeMap_p->getNamedItem(xercesc::XMLString::transcode(theName.c_str()));
    if (!aNode_p)
      THROW_LOGICEXCEPTION_MACRO("InlinableIntrinsicsParser::getAttributeValueByName didn't get attribute for >"
				 << theName.c_str() << "<");
    return XMLParserMessage(aNode_p->getNodeValue()).toString();
  } // end of InlinableIntrinsicsParser::getAttributeValueByName


  void 
  InlinableIntrinsicsParser::onInlinableIntrinsicsCatalogue(xercesc::DOMNode *theNode_p,
							    const InlinableIntrinsicsParserHelper& passingIn,
							    InlinableIntrinsicsParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in InlinableIntrinsicsParser::onInlinableIntrinsicDefinitions");
    InlinableIntrinsicsCatalogue& theInlinableIntrinsicsCatalogue_r(ConceptuallyStaticInstances::instance()->getInlinableIntrinsicsCatalogue());
    passingOut.setInlinableIntrinsicsCatalogue(theInlinableIntrinsicsCatalogue_r);
  };

  void 
  InlinableIntrinsicsParser::onInlinableIntrinsicsCatalogueItem(xercesc::DOMNode *theNode_p,
								const InlinableIntrinsicsParserHelper& passingIn,
								InlinableIntrinsicsParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in InlinableIntrinsicsParser::onInlinableIntrinsic");
    InlinableIntrinsicsCatalogue& theInlinableIntrinsicsCatalogue_r(passingIn.getInlinableIntrinsicsCatalogue());
    InlinableIntrinsicsCatalogueItem& theItem_r(theInlinableIntrinsicsCatalogue_r.addCatalogueItem(getAttributeValueByName(theNode_p,InlinableIntrinsicsCatalogueItem::our_myName_XAIFName), getAttributeValueByName(theNode_p,InlinableIntrinsicsCatalogueItem::our_myNrArgs_XAIFName)));
    passingOut.setInlinableIntrinsicsCatalogueItem(theItem_r);
  };

  void 
  InlinableIntrinsicsParser::onInlinableIntrinsicsFunction(xercesc::DOMNode *theNode_p,
							   const InlinableIntrinsicsParserHelper& passingIn,
							   InlinableIntrinsicsParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in InlinableIntrinsicsParser::onInlinableIntrinsicsFunction");
    InlinableIntrinsicsCatalogueItem& theItem_r(passingIn.getInlinableIntrinsicsCatalogueItem());
    InlinableIntrinsicsExpression& theFunction_r(theItem_r.getFunction());
    if (getAttributeValueByName(theNode_p,InlinableIntrinsicsCatalogueItem::our_myFunctionType_XAIFName)=="builtin") {
      theFunction_r.setBuiltinFunction();
      theFunction_r.setBuiltinFunctionName(getAttributeValueByName(theNode_p,InlinableIntrinsicsCatalogueItem::our_myFunctionBuiltinName_XAIFName) );
    }
    passingOut.setInlinableIntrinsicsExpression(theFunction_r);
  };

  void 
  InlinableIntrinsicsParser::onInlinableIntrinsicsPartial(xercesc::DOMNode *theNode_p,
							  const InlinableIntrinsicsParserHelper& passingIn,
							  InlinableIntrinsicsParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in InlinableIntrinsicsParser::onInlinableIntrinsicsPartial" ); 
    InlinableIntrinsicsCatalogueItem& theItem_r(passingIn.getInlinableIntrinsicsCatalogueItem());
    int id=atoi(getAttributeValueByName(theNode_p,InlinableIntrinsicsCatalogueItem::our_myPartialId_XAIFName).c_str());
    PartialDerivativeKind::PartialDerivativeKind_E pdk_e(PartialDerivativeKind::fromString(getAttributeValueByName(theNode_p,InlinableIntrinsicsCatalogueItem::our_myPartialType_XAIFName)));
    InlinableIntrinsicsExpression& thePartial_r(theItem_r.addPartial(id,pdk_e));
    passingOut.setInlinableIntrinsicsExpression(thePartial_r);
  };

  void 
  InlinableIntrinsicsParser::onInlinableIntrinsicsArgumentReference(xercesc::DOMNode *theNode_p,
								    const InlinableIntrinsicsParserHelper& passingIn,
								    InlinableIntrinsicsParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in InlinableIntrinsicsParser::onArgumentReference" ); 
    InlinableIntrinsicsExpression& theExpression_r(passingIn.getInlinableIntrinsicsExpression());
    int argref=atoi(getAttributeValueByName(theNode_p,InlinableIntrinsicsArgumentReference::our_myArgRef_XAIFName).c_str());
    InlinableIntrinsicsArgumentReference* aReference_p=new InlinableIntrinsicsArgumentReference(argref);
    aReference_p->setId(getAttributeValueByName(theNode_p,InlinableIntrinsicsArgumentReference::our_myId_XAIFName));
    theExpression_r.supplyAndAddVertexInstance(*aReference_p);
    theExpression_r.setPartialArgument(*aReference_p,argref);
  };

  void 
  InlinableIntrinsicsParser::onInlinableIntrinsicsConstant(xercesc::DOMNode *theNode_p,
							   const InlinableIntrinsicsParserHelper& passingIn,
							   InlinableIntrinsicsParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in InlinableIntrinsicsParser::onInlinableIntrinsicsConstant" ); 
    InlinableIntrinsicsExpression& theExpression_r(passingIn.getInlinableIntrinsicsExpression());
    InlinableIntrinsicsConstant* aConstant_p=new InlinableIntrinsicsConstant(
									     SymbolType::fromString(getAttributeValueByName(theNode_p,InlinableIntrinsicsConstant::our_myType_XAIFName)));
    aConstant_p->setId(getAttributeValueByName(theNode_p,InlinableIntrinsicsConstant::our_myId_XAIFName));
    aConstant_p->setFromString(
			       getAttributeValueByName(theNode_p,InlinableIntrinsicsConstant::our_myValue_XAIFName));
    theExpression_r.supplyAndAddVertexInstance(*aConstant_p);
  };

  void 
  InlinableIntrinsicsParser::onInlinableIntrinsicsIntrinsic(xercesc::DOMNode *theNode_p,
							    const InlinableIntrinsicsParserHelper& passingIn,
							    InlinableIntrinsicsParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in InlinableIntrinsicsParser::onInlinableIntrinsicsIntrinsic" ); 
    InlinableIntrinsicsExpression& theExpression_r(passingIn.getInlinableIntrinsicsExpression());
    InlinableIntrinsicsIntrinsic* aIntrinsic_p=new InlinableIntrinsicsIntrinsic(
										getAttributeValueByName(theNode_p,InlinableIntrinsicsIntrinsic::our_myName_XAIFName));
    aIntrinsic_p->setId(getAttributeValueByName(theNode_p,InlinableIntrinsicsConstant::our_myId_XAIFName));
    theExpression_r.supplyAndAddVertexInstance(*aIntrinsic_p);
  };

  void 
  InlinableIntrinsicsParser::onInlinableIntrinsicsExpressionEdge(xercesc::DOMNode *theNode_p,
								 const InlinableIntrinsicsParserHelper& passingIn,
								 InlinableIntrinsicsParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in InlinableIntrinsicsParser::onInlinableIntrinsicsExpressionEdge" ); 
    InlinableIntrinsicsExpression& theExpression_r(passingIn.getInlinableIntrinsicsExpression());
    std::string sourceId=getAttributeValueByName(theNode_p,
						 InlinableIntrinsicsExpressionEdge::our_source_XAIFName);
    std::string targetId=getAttributeValueByName(theNode_p,
						 InlinableIntrinsicsExpressionEdge::our_target_XAIFName);
    InlinableIntrinsicsExpression::VertexIteratorPair p=theExpression_r.vertices();
    InlinableIntrinsicsExpression::VertexIterator beginIt(p.first),endIt(p.second);
    InlinableIntrinsicsExpressionVertex *theSource_p(0), *theTarget_p(0);
    for (; (beginIt!=endIt)
	   && !(theSource_p && theTarget_p)
	   ;++beginIt) { 
      if (!theSource_p && sourceId==(*beginIt).getId())
	theSource_p=&(*beginIt);
      if (!theTarget_p && targetId==(*beginIt).getId())
	theTarget_p=&(*beginIt);
    }
    if (!theTarget_p || 
 	!theSource_p)
      THROW_LOGICEXCEPTION_MACRO("XAIFInlinableIntrinsicsParser::onInlinableIntrinsicsExpressionEdge: can't find source  " 
				 << sourceId.c_str()
				 << " or target "
				 << targetId.c_str());
    InlinableIntrinsicsExpressionEdge& theInlinableIntrinsicsExpressionEdge(theExpression_r.addEdge(*theSource_p, *theTarget_p));
    theInlinableIntrinsicsExpressionEdge.setId(getAttributeValueByName(theNode_p,InlinableIntrinsicsExpressionEdge::our_myId_XAIFName));
    theInlinableIntrinsicsExpressionEdge.setPosition(getAttributeValueByName(theNode_p, InlinableIntrinsicsExpressionEdge::our_myPosition_XAIFName));
  };

  void 
  InlinableIntrinsicsParser::onDummy(xercesc::DOMNode *theNode_p,
				     const InlinableIntrinsicsParserHelper& passingIn,
				     InlinableIntrinsicsParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK,
	      "InlinableIntrinsicsParser::onDummy for " 
	      << XMLParserMessage(theNode_p->getNodeName()));
    // pass all set elements through
    passingOut=passingIn;
    return;
  };

  void 
  InlinableIntrinsicsParser::staticInitialize() { 
    if (ourStaticInitFlag)
      THROW_LOGICEXCEPTION_MACRO("InlinableIntrinsicsParser::staticInitialize: already initialized");
    ourStaticInitFlag=true;
    ourActionCatalogue.addElement(InlinableIntrinsicsCatalogue::ourXAIFName,
				  ActionItem(&InlinableIntrinsicsParser::onInlinableIntrinsicsCatalogue));
    ourActionCatalogue.addElement(InlinableIntrinsicsCatalogueItem::ourXAIFName,
				  ActionItem(&InlinableIntrinsicsParser::onInlinableIntrinsicsCatalogueItem));
    ourActionCatalogue.addElement(InlinableIntrinsicsCatalogueItem::ourFunctionXAIFName,
				  ActionItem(&InlinableIntrinsicsParser::onInlinableIntrinsicsFunction));
    ourActionCatalogue.addElement(InlinableIntrinsicsCatalogueItem::ourPartialXAIFName,
				  ActionItem(&InlinableIntrinsicsParser::onInlinableIntrinsicsPartial));
    ourActionCatalogue.addElement(InlinableIntrinsicsArgumentReference::ourXAIFName,
				  ActionItem(&InlinableIntrinsicsParser::onInlinableIntrinsicsArgumentReference));
    ourActionCatalogue.addElement(InlinableIntrinsicsConstant::ourXAIFName,
				  ActionItem(&InlinableIntrinsicsParser::onInlinableIntrinsicsConstant));
    ourActionCatalogue.addElement(InlinableIntrinsicsIntrinsic::ourXAIFName,
				  ActionItem(&InlinableIntrinsicsParser::onInlinableIntrinsicsIntrinsic));
    ourActionCatalogue.addElement(InlinableIntrinsicsExpressionEdge::ourXAIFName,
				  ActionItem(&InlinableIntrinsicsParser::onInlinableIntrinsicsExpressionEdge));
    ourActionCatalogue.addElement("#comment",
				  ActionItem(&InlinableIntrinsicsParser::onDummy));
    ourActionCatalogue.addElement("#document",
				  ActionItem(&InlinableIntrinsicsParser::onDummy));
    ourActionCatalogue.addElement("#text",
				  ActionItem(&InlinableIntrinsicsParser::onDummy));
  } // end of InlinableIntrinsicsParser::staticInitialize
  

} // end of namespace 

