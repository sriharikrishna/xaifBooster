#include <sstream>

#include "xercesc/util/PlatformUtils.hpp"
#include "xercesc/dom/DOM.hpp"

#include "utils/inc/XMLParserErrorHandler.hpp"
#include "utils/inc/XMLParserMessage.hpp"
#include "utils/inc/LogicException.hpp"
#include "utils/inc/DbgLoggerManager.hpp"

#include "system/inc/XMLParser.hpp"
#include "system/inc/ArrayAccess.hpp"
#include "system/inc/BasicBlock.hpp"
#include "system/inc/Entry.hpp"
#include "system/inc/Exit.hpp"
#include "system/inc/IfStatement.hpp"
#include "system/inc/Assignment.hpp"
#include "system/inc/Marker.hpp"
#include "system/inc/BaseVariableSymbolReference.hpp"
#include "system/inc/Variable.hpp"
#include "system/inc/Constant.hpp"
#include "system/inc/Intrinsic.hpp"
#include "system/inc/ExpressionEdge.hpp"
#include "system/inc/AliasActivity.hpp"
#include "system/inc/AliasSet.hpp"
#include "system/inc/AliasSingle.hpp"
#include "system/inc/AliasRange.hpp"
#include "system/inc/SubroutineCall.hpp"
#include "system/inc/ForLoop.hpp"
#include "system/inc/PreLoop.hpp"
#include "system/inc/PostLoop.hpp"
#include "system/inc/BooleanOperation.hpp"

namespace xaifBooster {
  
  HashTable<XMLParser::ActionItem> XMLParser::ourActionCatalogue;
  bool XMLParser::ourStaticInitFlag;

  void XMLParser::initialize() { 
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
      THROW_LOGICEXCEPTION_MACRO("XMLParser::initialize: XMLException: "
				 << XMLParserMessage(e.getMessage()));
    }
  } // end of XMLParser::initialize

  bool
  XMLParser::convertToBoolean(const std::string& aValueString) { 
    bool returnWhat;
    if (aValueString=="true" || aValueString=="1")
      returnWhat=true;
    else if (aValueString=="false" || aValueString=="0")
      returnWhat=false;
    else 
      THROW_LOGICEXCEPTION_MACRO("XMLParser::convertToBoolean: invalid input >"
				 << aValueString.c_str()
				 << "<");
    return returnWhat;
  } // end of XMLParser::convertToBoolean

  void XMLParser::parse(std::string theXMLFileName) { 
    try { 
      myParser_p->parse(theXMLFileName.c_str());
      // get the DOM representation
      xercesc::DOMDocument *theDocument_p = myParser_p->getDocument();
      if (!theDocument_p)
	THROW_LOGICEXCEPTION_MACRO("XMLParser::parse: didn't get a document");
      xercesc::DOMTreeWalker *theTreeWalker_p=
	theDocument_p->createTreeWalker(theDocument_p,
					// JU: alternatively SHOW_ALL
					xercesc::DOMNodeFilter::SHOW_ELEMENT,
					0, // no filter specified
					true); // expand all EntityReference nodes
      if (!theTreeWalker_p)
	THROW_LOGICEXCEPTION_MACRO("XMLParser::parse: didn't get a tree walker");
      XMLParserHelper aParserHelper;
      moveOn(theTreeWalker_p,
	     aParserHelper);
    }
    catch (const xercesc::XMLException& e) {
      THROW_LOGICEXCEPTION_MACRO("XMLParser::parse: XMLException:" 
				 << XMLParserMessage(e.getMessage()));
    }
    catch (const xercesc::DOMException& e) {
      // the following bit is suggested as such by Xercesc
      // to retrieve the message encoded in the exception
      const unsigned int maxChars = 2047;
      XMLCh errText[maxChars + 1];
      std::ostringstream err;
      err << "XMLParser::parse: DOMException: "
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
      THROW_LOGICEXCEPTION_MACRO("XMLParser::parse: caught an unspecified exception");
    }
  } // end of XMLParser::parse

  void XMLParser::actionInvocation(xercesc::DOMTreeWalker *theTreeWalker_p,
				   const XMLParserHelper & passingFromParent,
				   XMLParserHelper& passingToChild) { 
    xercesc::DOMNode* theCurrentNode_p=theTreeWalker_p->getCurrentNode();
    try { 
      ActionItem& theAction=ourActionCatalogue.getElement(XMLParserMessage(theCurrentNode_p->getNodeName()).toString());
      (this->*(theAction.myAction))(theCurrentNode_p,
				    passingFromParent,
				    passingToChild) ;
    } 
    catch (LogicException& e) { 
      DBG_MACRO(DbgGroup::ERROR,
		"XMLParser::actionInvocation: caught: " 
		<< e.getReason().c_str()); 
      throw e;
    } 
  } // end of XMLParser::actionInvocation

  void 
  XMLParser::moveOn(xercesc::DOMTreeWalker *theTreeWalker_p,
		    const XMLParserHelper & passingFromParent) { 
    // do whatever needs to be done for this node: 
    XMLParserHelper toBePassedDownFromFirstChild;
    try { 
      actionInvocation(theTreeWalker_p,
		       passingFromParent,
		       toBePassedDownFromFirstChild);
      // go to its first child
      if (theTreeWalker_p->firstChild()) { // we have a child node 
	// recursion
	moveOn(theTreeWalker_p,
	       toBePassedDownFromFirstChild);
      }
    }
    catch (LogicException&){} // if actionInvocation fails don't descend
    // go to all of this node's siblings
    while (theTreeWalker_p->nextSibling()) { // we have a sibling
      // do whatever needs to be done for the current sibling node
      XMLParserHelper toBePassedDownFromSiblings;
      try { 
	actionInvocation(theTreeWalker_p,
			 passingFromParent,
			 toBePassedDownFromSiblings);
	// go to the sibling's first child if any
	if (theTreeWalker_p->firstChild()) { // we have a child node 
	  moveOn(theTreeWalker_p,
		 toBePassedDownFromSiblings);
	}
      }
      catch (LogicException&){} // if actionInvocation fails don't descend
    } // end while
    // reset up to the parent node and return
    theTreeWalker_p->parentNode();
  }; // end of XMLParser::moveOn

  std::string XMLParser::getAttributeValueByName(xercesc::DOMNode *theNode_p,
						 const std::string& theName) {
    xercesc::DOMNamedNodeMap* attributeNodeMap_p=theNode_p->getAttributes();
    if (!attributeNodeMap_p)
      THROW_LOGICEXCEPTION_MACRO("XMLParser::getAttributeValueByName didn't get attribute map");
    xercesc::DOMNode* aNode_p=attributeNodeMap_p->getNamedItem(xercesc::XMLString::transcode(theName.c_str()));
    if (!aNode_p)
      THROW_LOGICEXCEPTION_MACRO("XMLParser::getAttributeValueByName didn't get attribute for >"
				 << theName.c_str() 
				 << "<");
    return XMLParserMessage(aNode_p->getNodeValue()).toString();
  } // end of XMLParser::getAttributeValueByName

  void 
  XMLParser::onPreLoop(xercesc::DOMNode *theNode_p,
		       const XMLParserHelper& passingIn,
		       XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onPreLoop");
    ControlFlowGraph& theControlFlowGraph(passingIn.getControlFlowGraph());
    PreLoop* theNewPreLoop_p=new PreLoop();
    theControlFlowGraph.supplyAndAddVertexInstance(*theNewPreLoop_p);
    theNewPreLoop_p->setId(getAttributeValueByName(theNode_p,
						   PreLoop::our_myId_XAIFName));
    passingOut.setCondition(theNewPreLoop_p->getCondition());
    theNewPreLoop_p->setAnnotation(getAttributeValueByName(theNode_p,
							   ObjectWithAnnotation::our_myAnnotation_XAIFName));
  };

  void 
  XMLParser::onPostLoop(xercesc::DOMNode *theNode_p,
			const XMLParserHelper& passingIn,
			XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onPostLoop");
    ControlFlowGraph& theControlFlowGraph(passingIn.getControlFlowGraph());
    PostLoop* theNewPostLoop_p=new PostLoop();
    theControlFlowGraph.supplyAndAddVertexInstance(*theNewPostLoop_p);
    theNewPostLoop_p->setId(getAttributeValueByName(theNode_p,
						    PostLoop::our_myId_XAIFName));
    passingOut.setCondition(theNewPostLoop_p->getCondition());
    theNewPostLoop_p->setAnnotation(getAttributeValueByName(theNode_p,
							    ObjectWithAnnotation::our_myAnnotation_XAIFName));
  };

  void 
  XMLParser::onForLoop(xercesc::DOMNode *theNode_p,
		       const XMLParserHelper& passingIn,
		       XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onForLoop");
    ControlFlowGraph& theControlFlowGraph(passingIn.getControlFlowGraph());
    ForLoop* theNewForLoop_p=new ForLoop();
    theControlFlowGraph.supplyAndAddVertexInstance(*theNewForLoop_p);
    theNewForLoop_p->setId(getAttributeValueByName(theNode_p,
						   ForLoop::our_myId_XAIFName));
    passingOut.setInitialization(theNewForLoop_p->getInitialization());
    passingOut.setCondition(theNewForLoop_p->getCondition());
    passingOut.setUpdate(theNewForLoop_p->getUpdate());
    theNewForLoop_p->setAnnotation(getAttributeValueByName(theNode_p,
							   ObjectWithAnnotation::our_myAnnotation_XAIFName));
  };

  void 
  XMLParser::onIfStatement(xercesc::DOMNode *theNode_p,
			   const XMLParserHelper& passingIn,
			   XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onIfStatement");
    ControlFlowGraph& theControlFlowGraph(passingIn.getControlFlowGraph());
    IfStatement* theNewIfStatement_p=new IfStatement();
    theControlFlowGraph.supplyAndAddVertexInstance(*theNewIfStatement_p);
    theNewIfStatement_p->setId(getAttributeValueByName(theNode_p,
						       IfStatement::our_myId_XAIFName));
    passingOut.setCondition(theNewIfStatement_p->getCondition());
    theNewIfStatement_p->setAnnotation(getAttributeValueByName(theNode_p,
							       ObjectWithAnnotation::our_myAnnotation_XAIFName));
  };

  void 
  XMLParser::onBasicBlock(xercesc::DOMNode *theNode_p,
			  const XMLParserHelper& passingIn,
			  XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onBasicBlock");
    ControlFlowGraph& theControlFlowGraph(passingIn.getControlFlowGraph());
    Scope& theScope(ConceptuallyStaticInstances::instance()->getCallGraph().getScopeTree().
		    getScopeById(getAttributeValueByName(theNode_p,
							 BasicBlock::our_myScopeId_XAIFName)));
    BasicBlock* theNewBasicBlock_p=new BasicBlock(theScope);
    theControlFlowGraph.supplyAndAddVertexInstance(*theNewBasicBlock_p);
    theNewBasicBlock_p->setId(getAttributeValueByName(theNode_p,
						      BasicBlock::our_myId_XAIFName));
    passingOut.setBasicBlock(*theNewBasicBlock_p);
    theNewBasicBlock_p->setAnnotation(getAttributeValueByName(theNode_p,
							      ObjectWithAnnotation::our_myAnnotation_XAIFName));
  };

  void 
  XMLParser::onControlFlowGraph(xercesc::DOMNode *theNode_p,
				const XMLParserHelper& passingIn,
				XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onControlFlowGraph" ); 
    const Scope& theScope(ConceptuallyStaticInstances::instance()->getCallGraph().getScopeTree().
			  getScopeById(getAttributeValueByName(theNode_p,
							       ControlFlowGraph::our_scopeId_XAIFName)));
    const Symbol& theSymbol(theScope.getSymbolTable().
			    getElement(getAttributeValueByName(theNode_p,
							       ControlFlowGraph::our_symbolId_XAIFName)));
    CallGraphVertex* theCallGraphVertex_p=new CallGraphVertex(theSymbol,
							      theScope,
							      convertToBoolean(getAttributeValueByName(theNode_p,
												       ControlFlowGraph::our_myActiveFlag_XAIFName)));
    ConceptuallyStaticInstances::instance()->
      getCallGraph().supplyAndAddVertexInstance(*theCallGraphVertex_p);
    passingOut.setControlFlowGraph(theCallGraphVertex_p->getControlFlowGraph());
    theCallGraphVertex_p->getControlFlowGraph().setId(getAttributeValueByName(theNode_p,
									      ControlFlowGraph::our_myId_XAIFName));
    theCallGraphVertex_p->getControlFlowGraph().setAnnotation(getAttributeValueByName(theNode_p,
										      ObjectWithAnnotation::our_myAnnotation_XAIFName));
  };

  void 
  XMLParser::onSymbol(xercesc::DOMNode *theNode_p,
		      const XMLParserHelper& passingIn,
		      XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onSymbol" ); 
    SymbolTable& theSymbolTable(passingIn.getSymbolTable());
    Symbol& theNewSymbol(theSymbolTable.addSymbol(getAttributeValueByName(theNode_p,
									  Symbol::our_myId_XAIFName),
						  SymbolKind::fromString(getAttributeValueByName(theNode_p,
												 SymbolKind::our_attribute_XAIFName)),
						  SymbolType::fromString(getAttributeValueByName(theNode_p,
												 SymbolType::our_attribute_XAIFName)),	
						  SymbolShape::fromString(getAttributeValueByName(theNode_p,
												  SymbolShape::our_attribute_XAIFName)),
						  convertToBoolean(getAttributeValueByName(theNode_p,
											   Symbol::our_myActiveTypeFlag_XAIFName)),
						  convertToBoolean(getAttributeValueByName(theNode_p,
											   Symbol::our_myTempFlag_XAIFName))));
    theNewSymbol.setAnnotation(getAttributeValueByName(theNode_p,
						       ObjectWithAnnotation::our_myAnnotation_XAIFName));
  };

  void 
  XMLParser::onScopeContainment(xercesc::DOMNode *theNode_p,
				const XMLParserHelper& passingIn,
				XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onScopeContainment" ); 
    Scopes& theScopes(passingIn.getScopes());
    std::string sourceId=getAttributeValueByName(theNode_p,
						 ScopeContainment::our_source_XAIFName);
    std::string targetId=getAttributeValueByName(theNode_p,
						 ScopeContainment::our_target_XAIFName);
    Scopes::VertexIteratorPair p=theScopes.vertices();
    Scopes::VertexIterator beginIt(p.first),endIt(p.second);
    Scope *theSource_p(0), *theTarget_p(0);
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
      THROW_LOGICEXCEPTION_MACRO("XMLParser::onScopeContainment: can't find source scope " 
				 << sourceId.c_str()
				 << " or target scope "
				 << targetId.c_str());
    ScopeContainment& theScopeContainment(theScopes.addEdge(*theSource_p,
							    *theTarget_p));
    theScopeContainment.setId(getAttributeValueByName(theNode_p,
						      ScopeContainment::our_myId_XAIFName));
  };

  void 
  XMLParser::onSymbolTable(xercesc::DOMNode *theNode_p,
			   const XMLParserHelper& passingIn,
			   XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onSymbolTable" ); 
    Scope& theScope(passingIn.getScope());
    SymbolTable& theSymbolTable(theScope.getSymbolTable());
    passingOut.setSymbolTable(theSymbolTable);
  };

  void 
  XMLParser::onScope(xercesc::DOMNode *theNode_p,
		     const XMLParserHelper& passingIn,
		     XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onScope" ); 
    Scopes& theScopes(passingIn.getScopes());
    Scope& theScope(theScopes.addVertex());
    theScope.setId(getAttributeValueByName(theNode_p,
					   Scope::our_myId_XAIFName));
    passingOut.setScope(theScope);
    theScope.setAnnotation(getAttributeValueByName(theNode_p,
						   ObjectWithAnnotation::our_myAnnotation_XAIFName));
  };

  void 
  XMLParser::onAliasActivityMap(xercesc::DOMNode *theNode_p,
				const XMLParserHelper& passingIn,
				XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onAliasActivityMap" ); 
    AliasActivityMap& theAliasActivityMap(passingIn.getAliasActivityMap());
    passingOut.setAliasActivityMap(theAliasActivityMap);
  };

  /**
   * \todo JU: need to retrieve active flag after it is added to the schema
   */
  void 
  XMLParser::onAliasActivity(xercesc::DOMNode *theNode_p,
			     const XMLParserHelper& passingIn,
			     XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onAliasActivity" ); 
    AliasActivityMap& theAliasActivityMap(passingIn.getAliasActivityMap());
    AliasActivity& theAliasActivity=theAliasActivityMap.
      addAliasActivity(getAttributeValueByName(theNode_p,
					       AliasActivity::our_myKey_XAIFName));
    passingOut.setAliasActivity(theAliasActivity);
  };

  void 
  XMLParser::onAliasSingle(xercesc::DOMNode *theNode_p,
			   const XMLParserHelper& passingIn,
			   XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onAliasSingle" ); 
    AliasSet& theAliasSet(passingIn.getAliasActivity().getAliasSet());
    theAliasSet.addAlias(atoi(getAttributeValueByName(theNode_p,
						      AliasSingle::our_myAddress_XAIFName).c_str()));
  };

  void 
  XMLParser::onAliasRange(xercesc::DOMNode *theNode_p,
			  const XMLParserHelper& passingIn,
			  XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onAliasRange" ); 
    AliasSet& theAliasSet(passingIn.getAliasActivity().getAliasSet());
    theAliasSet.addAlias(atoi(getAttributeValueByName(theNode_p,
						      AliasRange::our_myLowerAddress_XAIFName).c_str()),
			 atoi(getAttributeValueByName(theNode_p,
						      AliasRange::our_myUpperAddress_XAIFName).c_str()));
  };

  void 
  XMLParser::onScopes(xercesc::DOMNode *theNode_p,
		      const XMLParserHelper& passingIn,
		      XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onScopes" ); 
    Scopes& theScopes(passingIn.getScopes());
    passingOut.setScopes(theScopes);
  };

  void 
  XMLParser::onCallGraph(xercesc::DOMNode *theNode_p,
			 const XMLParserHelper& passingIn,
			 XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onCallGraph" ); 
    ConceptuallyStaticInstances::instance()->
      createCallGraph(getAttributeValueByName(theNode_p,
					      CallGraph::our_mySchemaInstance_XAIFName),
		      getAttributeValueByName(theNode_p,
					      CallGraph::our_myXAIFInstance_XAIFName),
		      getAttributeValueByName(theNode_p,
					      CallGraph::our_mySchemaLocation_XAIFName),
		      getAttributeValueByName(theNode_p,
					      CallGraph::our_myPrefix_XAIFName));
    CallGraph& theCallGraph=ConceptuallyStaticInstances::instance()->getCallGraph();
    theCallGraph.setProgramName(getAttributeValueByName(theNode_p,
							CallGraph::our_myProgramName_XAIFName));
    passingOut.setScopes(theCallGraph.getScopeTree());
    passingOut.setAliasActivityMap(theCallGraph.getAliasActivityMap());
  };

  void 
  XMLParser::onAssignment(xercesc::DOMNode *theNode_p,
			  const XMLParserHelper& passingIn,
			  XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onAssignment" ); 
    BasicBlock& theBasicBlock(passingIn.getBasicBlock());
    Assignment* theAssignment_p=new Assignment(convertToBoolean(getAttributeValueByName(theNode_p,
											PlainAssignment::our_myActiveFlag_XAIFName)));
    theAssignment_p->setId(getAttributeValueByName(theNode_p,
						   Assignment::our_myId_XAIFName));
    theBasicBlock.supplyAndAddBasicBlockElementInstance(*theAssignment_p);
    passingOut.setAssignment(*theAssignment_p);
  };

  void 
  XMLParser::onAssignmentLHS(xercesc::DOMNode *theNode_p,
			     const XMLParserHelper& passingIn,
			     XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onAssignmentLHS" ); 
    Assignment& theAssignment(passingIn.getAssignment());
    theAssignment.getLHS().getAliasActivityMapKey().
      setReference(atoi(getAttributeValueByName(theNode_p,
						BaseVariableReference::our_myKey_XAIFName).c_str()));
    passingOut.setBaseVariableReference(theAssignment.getLHS());
    
    // JU todo: remove this ugly hack.
    if (!convertToBoolean(getAttributeValueByName(theNode_p,
						  PlainAssignment::our_myActiveFlag_XAIFName))) 
      theAssignment.passivate();
  };

  void 
  XMLParser::onAssignmentRHS(xercesc::DOMNode *theNode_p,
			     const XMLParserHelper& passingIn,
			     XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onAssignmentRHS" ); 
    Assignment& theAssignment(passingIn.getAssignment());
    passingOut.setExpression(theAssignment.getRHS());
  };

  void 
  XMLParser::onConstant(xercesc::DOMNode *theNode_p,
			const XMLParserHelper& passingIn,
			XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onConstant" ); 
    Expression& theExpression(passingIn.getExpression());
    Constant* theConstant_p=new Constant(SymbolType::fromString(getAttributeValueByName(theNode_p,
											Constant::our_myType_XAIFName)));
    theConstant_p->setId(getAttributeValueByName(theNode_p,
						 Constant::our_myId_XAIFName));
    theConstant_p->setFromString(getAttributeValueByName(theNode_p,
							 Constant::our_myValue_XAIFName));
    // constants are always passive
    //     theConstant_p->passivate();
    theExpression.supplyAndAddVertexInstance(*theConstant_p);
  };

  void 
  XMLParser::onBooleanOperation(xercesc::DOMNode *theNode_p,
				const XMLParserHelper& passingIn,
				XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onBooleanOperation" ); 
    Expression& theExpression(passingIn.getExpression());
    BooleanOperation* theBooleanOperation_p=
      new BooleanOperation(BooleanOperationType::fromString(getAttributeValueByName(theNode_p,
										    BooleanOperation::our_myType_XAIFName)));
    theBooleanOperation_p->setId(getAttributeValueByName(theNode_p,
							 BooleanOperation::our_myId_XAIFName));
    theExpression.supplyAndAddVertexInstance(*theBooleanOperation_p);
  };

  void 
  XMLParser::onVariableReference(xercesc::DOMNode *theNode_p,
				 const XMLParserHelper& passingIn,
				 XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onVariableReference" ); 
    Expression& theExpression(passingIn.getExpression());
    Variable* theVariable_p=new Variable();
    theVariable_p->setId(getAttributeValueByName(theNode_p,
						 Variable::our_myId_XAIFName));
    theExpression.supplyAndAddVertexInstance(*theVariable_p);
    theVariable_p->getBaseVariableReference().getAliasActivityMapKey().
      setReference(atoi(getAttributeValueByName(theNode_p,
						BaseVariableReference::our_myKey_XAIFName).c_str()));
    if (! ConceptuallyStaticInstances::instance()->getCallGraph().
	getAliasActivityMap().
	isActive(theVariable_p->getBaseVariableReference().
		 getAliasActivityMapKey())) { 
      // it is marked as passive in the AliasActivityMap:
      //      theVariable_p->passivate();
    } 
    passingOut.setBaseVariableReference(theVariable_p->getBaseVariableReference());
  };

  void 
  XMLParser::onVariableReferenceEdge(xercesc::DOMNode *theNode_p,
				     const XMLParserHelper& passingIn,
				     XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onVariableReferenceEdge" ); 
    BaseVariableReference& theBaseVariableReference(passingIn.getBaseVariableReference());
    std::string sourceId=getAttributeValueByName(theNode_p,
						 BaseVariableReferenceEdge::our_source_XAIFName);
    std::string targetId=getAttributeValueByName(theNode_p,
						 BaseVariableReferenceEdge::our_target_XAIFName);
    BaseVariableReference::VertexIteratorPair p=theBaseVariableReference.vertices();
    BaseVariableReference::VertexIterator beginIt(p.first),endIt(p.second);
    BaseVariableReferenceVertex *theSource_p(0), *theTarget_p(0);
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
      THROW_LOGICEXCEPTION_MACRO("XMLParser::onBaseVariableReferenceEdge: can't find source  " 
				 << sourceId.c_str()
				 << " or target "
				 << targetId.c_str());
    BaseVariableReferenceEdge& theBaseVariableReferenceEdge(theBaseVariableReference.addEdge(*theSource_p, *theTarget_p));
    theBaseVariableReferenceEdge.setId(getAttributeValueByName(theNode_p,
							       BaseVariableReferenceEdge::our_myId_XAIFName));
  };

  void 
  XMLParser::onIntrinsic(xercesc::DOMNode *theNode_p,
			 const XMLParserHelper& passingIn,
			 XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onIntrinsic" ); 
    Expression& theExpression(passingIn.getExpression());
    Intrinsic* theIntrinsic_p=new Intrinsic(getAttributeValueByName(theNode_p,
								    Intrinsic::our_myName_XAIFName));
    theIntrinsic_p->setId(getAttributeValueByName(theNode_p,
						  Intrinsic::our_myId_XAIFName));
    theExpression.supplyAndAddVertexInstance(*theIntrinsic_p);
  };

  void 
  XMLParser::onExpressionEdge(xercesc::DOMNode *theNode_p,
			      const XMLParserHelper& passingIn,
			      XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onExpressionEdge" ); 
    Expression& theExpression(passingIn.getExpression());
    std::string sourceId=getAttributeValueByName(theNode_p,
						 ExpressionEdge::our_source_XAIFName);
    std::string targetId=getAttributeValueByName(theNode_p,
						 ExpressionEdge::our_target_XAIFName);
    Expression::VertexIteratorPair p=theExpression.vertices();
    Expression::VertexIterator beginIt(p.first),endIt(p.second);
    ExpressionVertex *theSource_p(0), *theTarget_p(0);
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
      THROW_LOGICEXCEPTION_MACRO("XMLParser::onExpressionEdge: can't find source  " 
				 << sourceId.c_str()
				 << " or target "
				 << targetId.c_str());
    ExpressionEdge& theExpressionEdge(theExpression.addEdge(*theSource_p,
							    *theTarget_p));
    theExpressionEdge.setId(getAttributeValueByName(theNode_p,
						    ExpressionEdge::our_myId_XAIFName));
    theExpressionEdge.setPosition(getAttributeValueByName(theNode_p,
							  ExpressionEdge::our_myPosition_XAIFName));
  };

  void 
  XMLParser::onControlFlowGraphEdge(xercesc::DOMNode *theNode_p,
				    const XMLParserHelper& passingIn,
				    XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onControlFlowGraphEdge" ); 
    ControlFlowGraph& theControlFlowGraph(passingIn.getControlFlowGraph());
    std::string sourceId=getAttributeValueByName(theNode_p,
						 ControlFlowGraphEdge::our_source_XAIFName);
    std::string targetId=getAttributeValueByName(theNode_p,
						 ControlFlowGraphEdge::our_target_XAIFName);
    ControlFlowGraph::VertexIteratorPair p=theControlFlowGraph.vertices();
    ControlFlowGraph::VertexIterator beginIt(p.first),endIt(p.second);
    ControlFlowGraphVertex *theSource_p(0), *theTarget_p(0);
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
      THROW_LOGICEXCEPTION_MACRO("XMLParser::onControlFlowGraphEdge: can't find source  " 
				 << sourceId.c_str()
				 << " or target "
				 << targetId.c_str());
    ControlFlowGraphEdge& theControlFlowGraphEdge(theControlFlowGraph.addEdge(*theSource_p,
									      *theTarget_p));
    theControlFlowGraphEdge.setId(getAttributeValueByName(theNode_p,
							  ControlFlowGraphEdge::our_myId_XAIFName));
  };

  void 
  XMLParser::onCallGraphEdge(xercesc::DOMNode *theNode_p,
			     const XMLParserHelper& passingIn,
			     XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onCallGraphEdge" ); 
    std::string sourceId=getAttributeValueByName(theNode_p,
						 CallGraphEdge::our_source_XAIFName);
    std::string targetId=getAttributeValueByName(theNode_p,
						 CallGraphEdge::our_target_XAIFName);
    CallGraph& theCallGraph=ConceptuallyStaticInstances::instance()->getCallGraph();
    CallGraph::VertexIteratorPair p=theCallGraph.vertices();
    CallGraph::VertexIterator beginIt(p.first),endIt(p.second);
    CallGraphVertex *theSource_p(0), *theTarget_p(0);
    for (; (beginIt!=endIt)
	   && !(theSource_p && theTarget_p)
	   ;++beginIt) { 
      if (!theSource_p && sourceId==(*beginIt).getControlFlowGraph().getId())
	theSource_p=&(*beginIt);
      if (!theTarget_p && targetId==(*beginIt).getControlFlowGraph().getId())
	theTarget_p=&(*beginIt);
    }
    if (!theTarget_p || 
	!theSource_p)
      THROW_LOGICEXCEPTION_MACRO("XMLParser::onCallGraphEdge: can't find source  " 
				 << sourceId.c_str()
				 << " or target "
				 << targetId.c_str());
    CallGraphEdge& theCallGraphEdge(theCallGraph.addEdge(*theSource_p,
							 *theTarget_p));
    theCallGraphEdge.setId(getAttributeValueByName(theNode_p,
						   CallGraphEdge::our_myId_XAIFName));
  };

  void 
  XMLParser::onSymbolReference(xercesc::DOMNode *theNode_p,
			       const XMLParserHelper& passingIn,
			       XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onSymbolReference" ); 
    BaseVariableReference& theBaseVariableReference(passingIn.getBaseVariableReference());
    const Scope& theScope(ConceptuallyStaticInstances::instance()->getCallGraph().getScopeTree().
			  getScopeById(getAttributeValueByName(theNode_p,
							       BaseVariableSymbolReference::our_scopeId_XAIFName)));
    const Symbol& theSymbol(theScope.getSymbolTable().
			    getElement(getAttributeValueByName(theNode_p,
							       Symbol::our_myId_XAIFName)));
    BaseVariableSymbolReference* theBaseVariableSymbolReference_p=new BaseVariableSymbolReference(theSymbol,
												  theScope);
    theBaseVariableReference.supplyAndAddVertexInstance(*theBaseVariableSymbolReference_p);
    theBaseVariableSymbolReference_p->setId(getAttributeValueByName(theNode_p,
								    BaseVariableSymbolReference::our_myId_XAIFName));
  };

  void 
  XMLParser::onArrayAccess(xercesc::DOMNode *theNode_p,
			   const XMLParserHelper& passingIn,
			   XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onArrayAccess" ); 
    BaseVariableReference& theBaseVariableReference(passingIn.getBaseVariableReference());
    ArrayAccess* theNewArrayAccess_p = new ArrayAccess();
    theBaseVariableReference.supplyAndAddVertexInstance(*theNewArrayAccess_p);
    theNewArrayAccess_p->setId(getAttributeValueByName(theNode_p, ArrayAccess::our_myId_XAIFName));
    passingOut.setArrayAccess(*theNewArrayAccess_p);
  };

  void 
  XMLParser::onArrayIndex(xercesc::DOMNode *theNode_p,
			  const XMLParserHelper& passingIn,
			  XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onArrayIndex" ); 
    ArrayAccess& theArrayAccess(passingIn.getArrayAccess());
    Expression& theIndexExpression(theArrayAccess.addIndex());
    passingOut.setExpression(theIndexExpression);
  };

  void 
  XMLParser::onEntry(xercesc::DOMNode *theNode_p,
		     const XMLParserHelper& passingIn,
		     XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onEntry" ); 
    ControlFlowGraph& theControlFlowGraph(passingIn.getControlFlowGraph());
    Entry* theNewEntry_p=new Entry();
    theControlFlowGraph.supplyAndAddVertexInstance(*theNewEntry_p);
    theNewEntry_p->setId(getAttributeValueByName(theNode_p,
						 Entry::our_myId_XAIFName));
    theNewEntry_p->setAnnotation(getAttributeValueByName(theNode_p,
							 ObjectWithAnnotation::our_myAnnotation_XAIFName));
  };

  void 
  XMLParser::onExit(xercesc::DOMNode *theNode_p,
		    const XMLParserHelper& passingIn,
		    XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onExit" ); 
    ControlFlowGraph& theControlFlowGraph(passingIn.getControlFlowGraph());
    Exit* theNewExit_p=new Exit();
    theControlFlowGraph.supplyAndAddVertexInstance(*theNewExit_p);
    theNewExit_p->setId(getAttributeValueByName(theNode_p,
						Exit::our_myId_XAIFName));
    theNewExit_p->setAnnotation(getAttributeValueByName(theNode_p,
							ObjectWithAnnotation::our_myAnnotation_XAIFName));
  };

  void 
  XMLParser::onSubroutineCall(xercesc::DOMNode *theNode_p,
			      const XMLParserHelper& passingIn,
			      XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onSubroutineCall" ); 
    BasicBlock& theBasicBlock(passingIn.getBasicBlock());
    const Scope& theScope(ConceptuallyStaticInstances::instance()->getCallGraph().getScopeTree().
			  getScopeById(getAttributeValueByName(theNode_p,
							       SubroutineCall::our_scopeId_XAIFName)));
    const Symbol& theSymbol(theScope.getSymbolTable().
			    getElement(getAttributeValueByName(theNode_p,
							       SubroutineCall::our_symbolId_XAIFName)));
    SubroutineCall* theNewSubroutineCall_p=
      new SubroutineCall(theSymbol,
			 theScope,
			 convertToBoolean(getAttributeValueByName(theNode_p,
								  SubroutineCall::our_myActiveFlag_XAIFName)));
    theBasicBlock.supplyAndAddBasicBlockElementInstance(*theNewSubroutineCall_p);
    theNewSubroutineCall_p->setId(getAttributeValueByName(theNode_p,
							  SubroutineCall::our_myId_XAIFName));
    passingOut.setSubroutineCall(*theNewSubroutineCall_p);
  };

  void 
  XMLParser::onMarker(xercesc::DOMNode *theNode_p,
		      const XMLParserHelper& passingIn,
		      XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onMarker" ); 
    BasicBlock& theBasicBlock(passingIn.getBasicBlock());
    Marker* theMarker_p=new Marker();
    theMarker_p->setId(getAttributeValueByName(theNode_p,
					       Marker::our_myId_XAIFName));
    theMarker_p->setAnnotation(getAttributeValueByName(theNode_p,
						       Marker::our_myAnnotation_XAIFName));
    theBasicBlock.supplyAndAddBasicBlockElementInstance(*theMarker_p);
  };

  void 
  XMLParser::onArgument(xercesc::DOMNode *theNode_p,
			const XMLParserHelper& passingIn,
			XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onArgument" ); 
    SubroutineCall& theSubroutineCall(passingIn.getSubroutineCall());
    ConcreteArgument* theNewConcreteArgument_p=
      new ConcreteArgument(atoi(getAttributeValueByName(theNode_p,
							ConcreteArgument::our_myPosition_XAIFName).c_str()));
    theSubroutineCall.getArgumentList().push_back(theNewConcreteArgument_p);
    passingOut.setBaseVariableReference(theNewConcreteArgument_p->getBaseVariableReference());
  };

  void 
  XMLParser::onArgumentList(xercesc::DOMNode *theNode_p,
			    const XMLParserHelper& passingIn,
			    XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onArgumentList"); 
    // pass all set elements through
    passingOut=passingIn;
    return;
  };

  void 
  XMLParser::onArgumentSymbolReference(xercesc::DOMNode *theNode_p,
				       const XMLParserHelper& passingIn,
				       XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onArgumentSymbolReference"); 
    ControlFlowGraph& theControlFlowGraph(passingIn.getControlFlowGraph());
    const Scope& theScope(ConceptuallyStaticInstances::instance()->getCallGraph().getScopeTree().
			  getScopeById(getAttributeValueByName(theNode_p,
							       ArgumentSymbolReference::our_scopeId_XAIFName)));
    const Symbol& theSymbol(theScope.getSymbolTable().
			    getElement(getAttributeValueByName(theNode_p,
							       ArgumentSymbolReference::our_symbolId_XAIFName)));
    // this will be deleted in the dtor of theControlFlowGraph
    ArgumentSymbolReference* theNewArgumentSymbolReference_p=
      new ArgumentSymbolReference(theSymbol,
				  theScope,
				  atoi(getAttributeValueByName(theNode_p,
							       ArgumentSymbolReference::our_myPosition_XAIFName).c_str()),
				  convertToBoolean(getAttributeValueByName(theNode_p,
									   ArgumentSymbolReference::our_myActiveFlag_XAIFName)),
				  IntentType::fromString(getAttributeValueByName(theNode_p,
										 ArgumentSymbolReference::our_myIntent_XAIFName)));
    theControlFlowGraph.getArgumentList().push_back(theNewArgumentSymbolReference_p);
  };

  void 
  XMLParser::onInitialization(xercesc::DOMNode *theNode_p,
			      const XMLParserHelper& passingIn,
			      XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onInitialization"); 
    passingOut.setAssignment(passingIn.getInitialization().getAssignment());;
  };

  void 
  XMLParser::onCondition(xercesc::DOMNode *theNode_p,
			 const XMLParserHelper& passingIn,
			 XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onCondition"); 
    passingOut.setExpression(passingIn.getCondition().getExpression());;
  };

  void 
  XMLParser::onUpdate(xercesc::DOMNode *theNode_p,
		      const XMLParserHelper& passingIn,
		      XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XMLParser::onUpdate"); 
    passingOut.setAssignment(passingIn.getUpdate().getAssignment());;
  };

  void 
  XMLParser::onDummy(xercesc::DOMNode *theNode_p,
		     const XMLParserHelper& passingIn,
		     XMLParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, 
	      "in XMLParser::onDummy for " 
	      << XMLParserMessage(theNode_p->getNodeName()) 
	      ); 
    // pass all set elements through
    passingOut=passingIn;
    return;
  };

  void 
  XMLParser::staticInitialize() { 
    if (ourStaticInitFlag)
      THROW_LOGICEXCEPTION_MACRO("XMLParser::staticInitialize: already initialized");
    ourStaticInitFlag=true;

#ifndef PARSE_METHOD_STMT
#define PARSE_METHOD_STMT(tag,method) ourActionCatalogue.addElement(tag, ActionItem(&XMLParser::method))
#else
#error macro name for PARSE_METHOD_STMT already in use
#endif

    PARSE_METHOD_STMT(AliasActivity::ourXAIFName,onAliasActivity);
    PARSE_METHOD_STMT(AliasActivityMap::ourXAIFName,onAliasActivityMap);
    PARSE_METHOD_STMT(AliasRange::ourXAIFName,onAliasRange);
    PARSE_METHOD_STMT(AliasSingle::ourXAIFName,onAliasSingle);
    PARSE_METHOD_STMT(ArgumentSymbolReference::ourXAIFName,onArgumentSymbolReference);
    PARSE_METHOD_STMT(ArrayAccess::ourXAIFName,onArrayAccess);
    PARSE_METHOD_STMT(ArrayAccess::our_myIndex_XAIFName,onArrayIndex);
    PARSE_METHOD_STMT(Assignment::ourXAIFName,onAssignment);
    PARSE_METHOD_STMT(Assignment::our_myLhs_XAIFName,onAssignmentLHS);
    PARSE_METHOD_STMT(Assignment::our_myRhs_XAIFName,onAssignmentRHS);
    PARSE_METHOD_STMT(BaseVariableSymbolReference::ourXAIFName,onSymbolReference);
    PARSE_METHOD_STMT(BasicBlock::ourXAIFName,onBasicBlock);
    PARSE_METHOD_STMT(BooleanOperation::ourXAIFName,onBooleanOperation);
    PARSE_METHOD_STMT(CallGraph::ourXAIFName,onCallGraph);
    PARSE_METHOD_STMT(CallGraphEdge::ourXAIFName,onCallGraphEdge);
    PARSE_METHOD_STMT(ConcreteArgument::ourXAIFName,onArgument);
    PARSE_METHOD_STMT(Condition::ourXAIFName,onCondition);
    PARSE_METHOD_STMT(Constant::ourXAIFName,onConstant);
    PARSE_METHOD_STMT(ControlFlowGraph::ourXAIFName,onControlFlowGraph);
    PARSE_METHOD_STMT(ControlFlowGraph::our_myArgumentList_XAIFName,onArgumentList);
    PARSE_METHOD_STMT(ControlFlowGraphEdge::ourXAIFName,onControlFlowGraphEdge);
    PARSE_METHOD_STMT(Entry::ourXAIFName,onEntry);
    PARSE_METHOD_STMT(Exit::ourXAIFName,onExit);
    PARSE_METHOD_STMT(ExpressionEdge::ourXAIFName,onExpressionEdge);
    PARSE_METHOD_STMT(ForLoop::ourXAIFName,onForLoop);
    PARSE_METHOD_STMT(IfStatement::ourXAIFName,onIfStatement);
    PARSE_METHOD_STMT(Initialization::ourXAIFName,onInitialization);
    PARSE_METHOD_STMT(Intrinsic::ourXAIFName,onIntrinsic);
    PARSE_METHOD_STMT(Marker::ourXAIFName,onMarker);
    PARSE_METHOD_STMT(PostLoop::ourXAIFName,onPostLoop);
    PARSE_METHOD_STMT(PreLoop::ourXAIFName,onPreLoop);
    PARSE_METHOD_STMT(Scope::ourXAIFName,onScope);
    PARSE_METHOD_STMT(ScopeContainment::ourXAIFName,onScopeContainment);
    PARSE_METHOD_STMT(Scopes::ourXAIFName,onScopes);
    PARSE_METHOD_STMT(SubroutineCall::ourXAIFName,onSubroutineCall);
    PARSE_METHOD_STMT(Symbol::ourXAIFName,onSymbol);
    PARSE_METHOD_STMT(SymbolTable::ourXAIFName,onSymbolTable);
    PARSE_METHOD_STMT(Update::ourXAIFName,onUpdate);
    PARSE_METHOD_STMT(Variable::ourXAIFName,onVariableReference);
    PARSE_METHOD_STMT(BaseVariableReferenceEdge::ourXAIFName,onVariableReferenceEdge);

    // dummy elements
    PARSE_METHOD_STMT("#comment",onDummy);
    PARSE_METHOD_STMT("#document",onDummy);
    PARSE_METHOD_STMT("#text",onDummy);

#undef PARSE_METHOD_STMT

  } // end of XMLParser::staticInitialize
  

} // end of namespace 
