#include <sstream>

#include "xaifBooster/utils/inc/XMLParserMessage.hpp"

#include "xaifBooster/system/inc/XAIFBaseParserHandlers.hpp"
#include "xaifBooster/system/inc/XMLParser.hpp"


namespace xaifBooster {
  
  void 
  XAIFBaseParserHandlers::onPreLoop(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onPreLoop");
    ControlFlowGraph& theControlFlowGraph(passingIn.getControlFlowGraph());
    PreLoop* theNewPreLoop_p=new PreLoop();
    theControlFlowGraph.supplyAndAddVertexInstance(*theNewPreLoop_p);
    theNewPreLoop_p->setId(XMLParser::getAttributeValueByName(PreLoop::our_myId_XAIFName));
    passingOut.setCondition(theNewPreLoop_p->getCondition());
    theNewPreLoop_p->setAnnotation(XMLParser::getAttributeValueByName(ObjectWithAnnotation::our_myAnnotation_XAIFName));
  };

  void 
  XAIFBaseParserHandlers::onPostLoop(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onPostLoop");
    ControlFlowGraph& theControlFlowGraph(passingIn.getControlFlowGraph());
    PostLoop* theNewPostLoop_p=new PostLoop();
    theControlFlowGraph.supplyAndAddVertexInstance(*theNewPostLoop_p);
    theNewPostLoop_p->setId(XMLParser::getAttributeValueByName(PostLoop::our_myId_XAIFName));
    passingOut.setCondition(theNewPostLoop_p->getCondition());
    theNewPostLoop_p->setAnnotation(XMLParser::getAttributeValueByName(ObjectWithAnnotation::our_myAnnotation_XAIFName));
  };

  void 
  XAIFBaseParserHandlers::onForLoop(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onForLoop");
    ControlFlowGraph& theControlFlowGraph(passingIn.getControlFlowGraph());
    ForLoop* theNewForLoop_p=new ForLoop();
    theControlFlowGraph.supplyAndAddVertexInstance(*theNewForLoop_p);
    theNewForLoop_p->setId(XMLParser::getAttributeValueByName(ForLoop::our_myId_XAIFName));
    passingOut.setInitialization(theNewForLoop_p->getInitialization());
    passingOut.setCondition(theNewForLoop_p->getCondition());
    passingOut.setUpdate(theNewForLoop_p->getUpdate());
    theNewForLoop_p->setAnnotation(XMLParser::getAttributeValueByName(ObjectWithAnnotation::our_myAnnotation_XAIFName));
  };

  void 
  XAIFBaseParserHandlers::onIfStatement(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onIfStatement");
    ControlFlowGraph& theControlFlowGraph(passingIn.getControlFlowGraph());
    IfStatement* theNewIfStatement_p=new IfStatement();
    theControlFlowGraph.supplyAndAddVertexInstance(*theNewIfStatement_p);
    theNewIfStatement_p->setId(XMLParser::getAttributeValueByName(IfStatement::our_myId_XAIFName));
    passingOut.setCondition(theNewIfStatement_p->getCondition());
    theNewIfStatement_p->setAnnotation(XMLParser::getAttributeValueByName(ObjectWithAnnotation::our_myAnnotation_XAIFName));
  };

  void 
  XAIFBaseParserHandlers::onBasicBlock(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onBasicBlock");
    ControlFlowGraph& theControlFlowGraph(passingIn.getControlFlowGraph());
    Scope& theScope(ConceptuallyStaticInstances::instance()->getCallGraph().getScopeTree().
		    getScopeById(XMLParser::getAttributeValueByName(BasicBlock::our_myScopeId_XAIFName)));
    BasicBlock* theNewBasicBlock_p=new BasicBlock(theScope);
    theControlFlowGraph.supplyAndAddVertexInstance(*theNewBasicBlock_p);
    theNewBasicBlock_p->setId(XMLParser::getAttributeValueByName(BasicBlock::our_myId_XAIFName));
    passingOut.setBasicBlock(*theNewBasicBlock_p);
    theNewBasicBlock_p->setAnnotation(XMLParser::getAttributeValueByName(ObjectWithAnnotation::our_myAnnotation_XAIFName));
  };

  void 
  XAIFBaseParserHandlers::onControlFlowGraph(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onControlFlowGraph" ); 
    const Scope& theScope(ConceptuallyStaticInstances::instance()->getCallGraph().getScopeTree().
			  getScopeById(XMLParser::getAttributeValueByName(ControlFlowGraph::our_scopeId_XAIFName)));
    const Symbol& theSymbol(theScope.getSymbolTable().
			    getElement(XMLParser::getAttributeValueByName(ControlFlowGraph::our_symbolId_XAIFName)));
    CallGraphVertex* theCallGraphVertex_p=new CallGraphVertex(theSymbol,
							      theScope,
							      XMLParser::convertToBoolean(XMLParser::getAttributeValueByName(ControlFlowGraph::our_myActiveFlag_XAIFName)));
    ConceptuallyStaticInstances::instance()->
      getCallGraph().supplyAndAddVertexInstance(*theCallGraphVertex_p);
    passingOut.setControlFlowGraph(theCallGraphVertex_p->getControlFlowGraph());
    theCallGraphVertex_p->getControlFlowGraph().setId(XMLParser::getAttributeValueByName(ControlFlowGraph::our_myId_XAIFName));
    theCallGraphVertex_p->getControlFlowGraph().setAnnotation(XMLParser::getAttributeValueByName(ObjectWithAnnotation::our_myAnnotation_XAIFName));
  };

  void 
  XAIFBaseParserHandlers::onSymbol(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onSymbol" ); 
    SymbolTable& theSymbolTable(passingIn.getSymbolTable());
    Symbol& theNewSymbol(theSymbolTable.addSymbol(XMLParser::getAttributeValueByName(Symbol::our_myId_XAIFName),
						  SymbolKind::fromString(XMLParser::getAttributeValueByName(SymbolKind::our_attribute_XAIFName)),
						  SymbolType::fromString(XMLParser::getAttributeValueByName(SymbolType::our_attribute_XAIFName)),	
						  SymbolShape::fromString(XMLParser::getAttributeValueByName(SymbolShape::our_attribute_XAIFName)),
						  XMLParser::convertToBoolean(XMLParser::getAttributeValueByName(Symbol::our_myActiveTypeFlag_XAIFName)),
						  XMLParser::convertToBoolean(XMLParser::getAttributeValueByName(Symbol::our_myTempFlag_XAIFName))));
    theNewSymbol.setAnnotation(XMLParser::getAttributeValueByName(ObjectWithAnnotation::our_myAnnotation_XAIFName));
  };

  void 
  XAIFBaseParserHandlers::onScopeContainment(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onScopeContainment" ); 
    Scopes& theScopes(passingIn.getScopes());
    std::string sourceId=XMLParser::getAttributeValueByName(ScopeContainment::our_source_XAIFName);
    std::string targetId=XMLParser::getAttributeValueByName(ScopeContainment::our_target_XAIFName);
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
      THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHandlers::onScopeContainment: can't find source scope " 
				 << sourceId.c_str()
				 << " or target scope "
				 << targetId.c_str());
    ScopeContainment& theScopeContainment(theScopes.addEdge(*theSource_p,
							    *theTarget_p));
    theScopeContainment.setId(XMLParser::getAttributeValueByName(ScopeContainment::our_myId_XAIFName));
  };

  void 
  XAIFBaseParserHandlers::onSymbolTable(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onSymbolTable" ); 
    Scope& theScope(passingIn.getScope());
    SymbolTable& theSymbolTable(theScope.getSymbolTable());
    passingOut.setSymbolTable(theSymbolTable);
  };

  void 
  XAIFBaseParserHandlers::onScope(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onScope" ); 
    Scopes& theScopes(passingIn.getScopes());
    Scope& theScope(theScopes.addVertex());
    theScope.setId(XMLParser::getAttributeValueByName(Scope::our_myId_XAIFName));
    passingOut.setScope(theScope);
    theScope.setAnnotation(XMLParser::getAttributeValueByName(ObjectWithAnnotation::our_myAnnotation_XAIFName));
  };

  void 
  XAIFBaseParserHandlers::onAliasMap(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onAliasMap" ); 
    AliasMap& theAliasMap(passingIn.getAliasMap());
    passingOut.setAliasMap(theAliasMap);
  };

  void 
  XAIFBaseParserHandlers::onAliasMapEntry(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onAliasMapEntry" ); 
    AliasMap& theAliasMap(passingIn.getAliasMap());
    AliasMapEntry& theAliasMapEntry=theAliasMap.
      addAliasMapEntry(XMLParser::getAttributeValueByName(AliasMapEntry::our_myKey_XAIFName));
    passingOut.setAliasMapEntry(theAliasMapEntry);
  };

  void 
  XAIFBaseParserHandlers::onAliasSingle(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onAliasSingle" ); 
    AliasSet& theAliasSet(passingIn.getAliasMapEntry().getAliasSet());
    theAliasSet.addAlias(atoi(XMLParser::getAttributeValueByName(AliasSingle::our_myAddress_XAIFName).c_str()));
  };

  void 
  XAIFBaseParserHandlers::onAliasRange(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onAliasRange" ); 
    AliasSet& theAliasSet(passingIn.getAliasMapEntry().getAliasSet());
    theAliasSet.addAlias(atoi(XMLParser::getAttributeValueByName(AliasRange::our_myLowerAddress_XAIFName).c_str()),
			 atoi(XMLParser::getAttributeValueByName(AliasRange::our_myUpperAddress_XAIFName).c_str()));
  };

  void 
  XAIFBaseParserHandlers::onScopes(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onScopes" ); 
    Scopes& theScopes(passingIn.getScopes());
    passingOut.setScopes(theScopes);
  };

  void 
  XAIFBaseParserHandlers::onCallGraph(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onCallGraph" ); 
    ConceptuallyStaticInstances::instance()->
      createCallGraph(XMLParser::getAttributeValueByName(CallGraph::our_mySchemaInstance_XAIFName),
		      XMLParser::getAttributeValueByName(CallGraph::our_myXAIFInstance_XAIFName),
		      XMLParser::getAttributeValueByName(CallGraph::our_mySchemaLocation_XAIFName),
		      XMLParser::getAttributeValueByName(CallGraph::our_myPrefix_XAIFName));
    CallGraph& theCallGraph=ConceptuallyStaticInstances::instance()->getCallGraph();
    theCallGraph.setProgramName(XMLParser::getAttributeValueByName(CallGraph::our_myProgramName_XAIFName));
    passingOut.setScopes(theCallGraph.getScopeTree());
    passingOut.setAliasMap(theCallGraph.getAliasMap());
  };

  void 
  XAIFBaseParserHandlers::onAssignment(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onAssignment" ); 
    BasicBlock& theBasicBlock(passingIn.getBasicBlock());
    Assignment* theAssignment_p=new Assignment(XMLParser::convertToBoolean(XMLParser::getAttributeValueByName(Assignment::our_myActiveFlag_XAIFName)));
    theAssignment_p->setId(XMLParser::getAttributeValueByName(Assignment::our_myId_XAIFName));
    theBasicBlock.supplyAndAddBasicBlockElementInstance(*theAssignment_p);
    passingOut.setAssignment(*theAssignment_p);
  };

  void 
  XAIFBaseParserHandlers::onAssignmentLHS(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onAssignmentLHS" ); 
    Assignment& theAssignment(passingIn.getAssignment());
    theAssignment.getLHS().getAliasMapKey().
      setReference(atoi(XMLParser::getAttributeValueByName(Variable::our_myAliasMapKey_XAIFName).c_str()));
    theAssignment.getLHS().getDuUdMapKey().
      setReference(atoi(XMLParser::getAttributeValueByName(Variable::our_myDuUdMapKey_XAIFName).c_str()));
    theAssignment.getLHS().
      setActiveUseType(ActiveUseType::fromString(XMLParser::getAttributeValueByName(ActiveUseType::our_attribute_XAIFName).c_str()));
    passingOut.setVariable(theAssignment.getLHS());
  };

  void 
  XAIFBaseParserHandlers::onAssignmentRHS(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onAssignmentRHS" ); 
    Assignment& theAssignment(passingIn.getAssignment());
    passingOut.setExpression(theAssignment.getRHS());
  };

  void 
  XAIFBaseParserHandlers::onConstant(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onConstant" ); 
    Expression& theExpression(passingIn.getExpression());
    Constant* theConstant_p=new Constant(SymbolType::fromString(XMLParser::getAttributeValueByName(Constant::our_myType_XAIFName)));
    theConstant_p->setId(XMLParser::getAttributeValueByName(Constant::our_myId_XAIFName));
    theConstant_p->setFromString(XMLParser::getAttributeValueByName(Constant::our_myValue_XAIFName));
    // constants are always passive
    // theConstant_p->passivate();
    theExpression.supplyAndAddVertexInstance(*theConstant_p);
  };

  void 
  XAIFBaseParserHandlers::onBooleanOperation(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onBooleanOperation" ); 
    Expression& theExpression(passingIn.getExpression());
    BooleanOperation* theBooleanOperation_p=
      new BooleanOperation(BooleanOperationType::fromString(XMLParser::getAttributeValueByName(BooleanOperation::our_myType_XAIFName)));
    theBooleanOperation_p->setId(XMLParser::getAttributeValueByName(BooleanOperation::our_myId_XAIFName));
    theExpression.supplyAndAddVertexInstance(*theBooleanOperation_p);
  };

  void 
  XAIFBaseParserHandlers::onArgument(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onArgument" ); 
    Expression& theExpression(passingIn.getExpression());
    Argument* theArgument_p=new Argument();
    theArgument_p->setId(XMLParser::getAttributeValueByName(Argument::our_myId_XAIFName));
    theExpression.supplyAndAddVertexInstance(*theArgument_p);
    theArgument_p->getVariable().getAliasMapKey().
      setReference(atoi(XMLParser::getAttributeValueByName(Variable::our_myAliasMapKey_XAIFName).c_str()));
    theArgument_p->getVariable().getDuUdMapKey().
      setReference(atoi(XMLParser::getAttributeValueByName(Variable::our_myDuUdMapKey_XAIFName).c_str()));
    theArgument_p->getVariable().
      setActiveUseType(ActiveUseType::fromString(XMLParser::getAttributeValueByName(ActiveUseType::our_attribute_XAIFName).c_str()));
    passingOut.setVariable(theArgument_p->getVariable());
  };

  void 
  XAIFBaseParserHandlers::onVariableEdge(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onVariableEdge" ); 
    Variable& theVariable(passingIn.getVariable());
    std::string sourceId=XMLParser::getAttributeValueByName(VariableEdge::our_source_XAIFName);
    std::string targetId=XMLParser::getAttributeValueByName(VariableEdge::our_target_XAIFName);
    Variable::VertexIteratorPair p=theVariable.vertices();
    Variable::VertexIterator beginIt(p.first),endIt(p.second);
    VariableVertex *theSource_p(0), *theTarget_p(0);
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
      THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHandlers::onVariableEdge: can't find source  " 
				 << sourceId.c_str()
				 << " or target "
				 << targetId.c_str());
    VariableEdge& theVariableEdge(theVariable.addEdge(*theSource_p, *theTarget_p));
    theVariableEdge.setId(XMLParser::getAttributeValueByName(VariableEdge::our_myId_XAIFName));
  };

  void 
  XAIFBaseParserHandlers::onIntrinsic(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onIntrinsic" ); 
    Expression& theExpression(passingIn.getExpression());
    Intrinsic* theIntrinsic_p=new Intrinsic(XMLParser::getAttributeValueByName(Intrinsic::our_myName_XAIFName));
    theIntrinsic_p->setId(XMLParser::getAttributeValueByName(Intrinsic::our_myId_XAIFName));
    theExpression.supplyAndAddVertexInstance(*theIntrinsic_p);
  };

  void 
  XAIFBaseParserHandlers::onExpressionEdge(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onExpressionEdge" ); 
    Expression& theExpression(passingIn.getExpression());
    std::string sourceId=XMLParser::getAttributeValueByName(ExpressionEdge::our_source_XAIFName);
    std::string targetId=XMLParser::getAttributeValueByName(ExpressionEdge::our_target_XAIFName);
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
      THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHandlers::onExpressionEdge: can't find source  " 
				 << sourceId.c_str()
				 << " or target "
				 << targetId.c_str());
    ExpressionEdge& theExpressionEdge(theExpression.addEdge(*theSource_p,
							    *theTarget_p));
    theExpressionEdge.setId(XMLParser::getAttributeValueByName(ExpressionEdge::our_myId_XAIFName));
    theExpressionEdge.setPosition(XMLParser::getAttributeValueByName(ExpressionEdge::our_myPosition_XAIFName));
  };

  void 
  XAIFBaseParserHandlers::onControlFlowGraphEdge(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onControlFlowGraphEdge" ); 
    ControlFlowGraph& theControlFlowGraph(passingIn.getControlFlowGraph());
    std::string sourceId=XMLParser::getAttributeValueByName(ControlFlowGraphEdge::our_source_XAIFName);
    std::string targetId=XMLParser::getAttributeValueByName(ControlFlowGraphEdge::our_target_XAIFName);
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
      THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHandlers::onControlFlowGraphEdge: can't find source  " 
				 << sourceId.c_str()
				 << " or target "
				 << targetId.c_str());
    ControlFlowGraphEdge& theControlFlowGraphEdge(theControlFlowGraph.addEdge(*theSource_p,
									      *theTarget_p));
    theControlFlowGraphEdge.setId(XMLParser::getAttributeValueByName(ControlFlowGraphEdge::our_myId_XAIFName));
  };

  void 
  XAIFBaseParserHandlers::onCallGraphEdge(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onCallGraphEdge" ); 
    std::string sourceId=XMLParser::getAttributeValueByName(CallGraphEdge::our_source_XAIFName);
    std::string targetId=XMLParser::getAttributeValueByName(CallGraphEdge::our_target_XAIFName);
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
      THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHandlers::onCallGraphEdge: can't find source  " 
				 << sourceId.c_str()
				 << " or target "
				 << targetId.c_str());
    CallGraphEdge& theCallGraphEdge(theCallGraph.addEdge(*theSource_p,
							 *theTarget_p));
    theCallGraphEdge.setId(XMLParser::getAttributeValueByName(CallGraphEdge::our_myId_XAIFName));
  };

  void 
  XAIFBaseParserHandlers::onSymbolReference(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onSymbolReference" ); 
    Variable& theVariable(passingIn.getVariable());
    const Scope& theScope(ConceptuallyStaticInstances::instance()->getCallGraph().getScopeTree().
			  getScopeById(XMLParser::getAttributeValueByName(VariableSymbolReference::our_scopeId_XAIFName)));
    const Symbol& theSymbol(theScope.getSymbolTable().
			    getElement(XMLParser::getAttributeValueByName(Symbol::our_myId_XAIFName)));
    VariableSymbolReference* theVariableSymbolReference_p=new VariableSymbolReference(theSymbol,
										      theScope);
    theVariable.supplyAndAddVertexInstance(*theVariableSymbolReference_p);
    theVariableSymbolReference_p->setId(XMLParser::getAttributeValueByName(VariableSymbolReference::our_myId_XAIFName));
  };

  void 
  XAIFBaseParserHandlers::onArrayAccess(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onArrayAccess" ); 
    Variable& theVariable(passingIn.getVariable());
    ArrayAccess* theNewArrayAccess_p = new ArrayAccess();
    theVariable.supplyAndAddVertexInstance(*theNewArrayAccess_p);
    theNewArrayAccess_p->setId(XMLParser::getAttributeValueByName(ArrayAccess::our_myId_XAIFName));
    passingOut.setArrayAccess(*theNewArrayAccess_p);
  };

  void 
  XAIFBaseParserHandlers::onArrayIndex(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onArrayIndex" ); 
    ArrayAccess& theArrayAccess(passingIn.getArrayAccess());
    Expression& theIndexExpression(theArrayAccess.addIndex());
    passingOut.setExpression(theIndexExpression);
  };

  void 
  XAIFBaseParserHandlers::onEntry(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onEntry" ); 
    ControlFlowGraph& theControlFlowGraph(passingIn.getControlFlowGraph());
    Entry* theNewEntry_p=new Entry();
    theControlFlowGraph.supplyAndAddVertexInstance(*theNewEntry_p);
    theNewEntry_p->setId(XMLParser::getAttributeValueByName(Entry::our_myId_XAIFName));
    theNewEntry_p->setAnnotation(XMLParser::getAttributeValueByName(ObjectWithAnnotation::our_myAnnotation_XAIFName));
  };

  void 
  XAIFBaseParserHandlers::onExit(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onExit" ); 
    ControlFlowGraph& theControlFlowGraph(passingIn.getControlFlowGraph());
    Exit* theNewExit_p=new Exit();
    theControlFlowGraph.supplyAndAddVertexInstance(*theNewExit_p);
    theNewExit_p->setId(XMLParser::getAttributeValueByName(Exit::our_myId_XAIFName));
    theNewExit_p->setAnnotation(XMLParser::getAttributeValueByName(ObjectWithAnnotation::our_myAnnotation_XAIFName));
  };

  void 
  XAIFBaseParserHandlers::onEndBranch(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onEndBranch" ); 
    ControlFlowGraph& theControlFlowGraph(passingIn.getControlFlowGraph());
    EndBranch* theNewEndBranch_p=new EndBranch();
    theControlFlowGraph.supplyAndAddVertexInstance(*theNewEndBranch_p);
    theNewEndBranch_p->setId(XMLParser::getAttributeValueByName(EndBranch::our_myId_XAIFName));
    theNewEndBranch_p->setAnnotation(XMLParser::getAttributeValueByName(ObjectWithAnnotation::our_myAnnotation_XAIFName));
  };
 
  void 
  XAIFBaseParserHandlers::onEndLoop(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onEndLoop" ); 
    ControlFlowGraph& theControlFlowGraph(passingIn.getControlFlowGraph());
    EndLoop* theNewEndLoop_p=new EndLoop();
    theControlFlowGraph.supplyAndAddVertexInstance(*theNewEndLoop_p);
    theNewEndLoop_p->setId(XMLParser::getAttributeValueByName(EndLoop::our_myId_XAIFName));
    theNewEndLoop_p->setAnnotation(XMLParser::getAttributeValueByName(ObjectWithAnnotation::our_myAnnotation_XAIFName));
  };

  void 
  XAIFBaseParserHandlers::onSubroutineCall(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onSubroutineCall" ); 
    BasicBlock& theBasicBlock(passingIn.getBasicBlock());
    const Scope& theScope(ConceptuallyStaticInstances::instance()->getCallGraph().getScopeTree().
			  getScopeById(XMLParser::getAttributeValueByName(SubroutineCall::our_scopeId_XAIFName)));
    const Symbol& theSymbol(theScope.getSymbolTable().
			    getElement(XMLParser::getAttributeValueByName(SubroutineCall::our_symbolId_XAIFName)));
    SubroutineCall* theNewSubroutineCall_p=
      new SubroutineCall(theSymbol,
			 theScope,
			 XMLParser::convertToBoolean(XMLParser::getAttributeValueByName(SubroutineCall::our_myActiveFlag_XAIFName)));
    theBasicBlock.supplyAndAddBasicBlockElementInstance(*theNewSubroutineCall_p);
    theNewSubroutineCall_p->setId(XMLParser::getAttributeValueByName(SubroutineCall::our_myId_XAIFName));
    passingOut.setSubroutineCall(*theNewSubroutineCall_p);
  };

  void 
  XAIFBaseParserHandlers::onMarker(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onMarker" ); 
    BasicBlock& theBasicBlock(passingIn.getBasicBlock());
    Marker* theMarker_p=new Marker();
    theMarker_p->setId(XMLParser::getAttributeValueByName(Marker::our_myId_XAIFName));
    theMarker_p->setAnnotation(XMLParser::getAttributeValueByName(Marker::our_myAnnotation_XAIFName));
    theBasicBlock.supplyAndAddBasicBlockElementInstance(*theMarker_p);
  };

  void 
  XAIFBaseParserHandlers::onConcreteArgument(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onArgument" ); 
    SubroutineCall& theSubroutineCall(passingIn.getSubroutineCall());
    ConcreteArgument* theNewConcreteArgument_p=
      new ConcreteArgument(atoi(XMLParser::getAttributeValueByName(ConcreteArgument::our_myPosition_XAIFName).c_str()));
    theSubroutineCall.getArgumentList().push_back(theNewConcreteArgument_p);
    passingOut.setVariable(theNewConcreteArgument_p->getVariable());
  };

  void 
  XAIFBaseParserHandlers::onArgumentList(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onArgumentList"); 
    // pass all set elements through
    passingOut=passingIn;
    return;
  };

  void 
  XAIFBaseParserHandlers::onArgumentSymbolReference(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onArgumentSymbolReference"); 
    ControlFlowGraph& theControlFlowGraph(passingIn.getControlFlowGraph());
    const Scope& theScope(ConceptuallyStaticInstances::instance()->getCallGraph().getScopeTree().
			  getScopeById(XMLParser::getAttributeValueByName(ArgumentSymbolReference::our_scopeId_XAIFName)));
    const Symbol& theSymbol(theScope.getSymbolTable().
			    getElement(XMLParser::getAttributeValueByName(ArgumentSymbolReference::our_symbolId_XAIFName)));
    // this will be deleted in the dtor of theControlFlowGraph
    ArgumentSymbolReference* theNewArgumentSymbolReference_p=
      new ArgumentSymbolReference(theSymbol,
				  theScope,
				  atoi(XMLParser::getAttributeValueByName(ArgumentSymbolReference::our_myPosition_XAIFName).c_str()),
				  XMLParser::convertToBoolean(XMLParser::getAttributeValueByName(ArgumentSymbolReference::our_myActiveFlag_XAIFName)),
				  IntentType::fromString(XMLParser::getAttributeValueByName(ArgumentSymbolReference::our_myIntent_XAIFName)));
    theControlFlowGraph.getArgumentList().getArgumentSymbolReferencePList().push_back(theNewArgumentSymbolReference_p);
  };

  void 
  XAIFBaseParserHandlers::onInitialization(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onInitialization"); 
    passingOut.setAssignment(passingIn.getInitialization().getAssignment());;
  };

  void 
  XAIFBaseParserHandlers::onCondition(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onCondition"); 
    passingOut.setExpression(passingIn.getCondition().getExpression());;
  };

  void 
  XAIFBaseParserHandlers::onUpdate(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onUpdate"); 
    passingOut.setAssignment(passingIn.getUpdate().getAssignment());;
  };

  void 
  XAIFBaseParserHandlers::onInOutList(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onInOutList"); 
    passingOut=passingIn;
    return;
  };

  void 
  XAIFBaseParserHandlers::onInput(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onInput"); 
    ControlFlowGraph& theControlFlowGraph(passingIn.getControlFlowGraph());
    Variable* theNewInput=new Variable();
    InOutList& theInOutList=theControlFlowGraph.getInOutList();
    theInOutList.getInList().push_back(theNewInput);
    passingOut.setVariable(*theNewInput);
  };

  void 
  XAIFBaseParserHandlers::onOutput(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, "in XAIFBaseParserHandlers::onOutput"); 
    ControlFlowGraph& theControlFlowGraph(passingIn.getControlFlowGraph());
    Variable* theNewOutput=new Variable();
    InOutList& theInOutList=theControlFlowGraph.getInOutList();
    theInOutList.getOutList().push_back(theNewOutput);
    passingOut.setVariable(*theNewOutput);
  };

  void 
  XAIFBaseParserHandlers::onDummy(const XAIFBaseParserHelper& passingIn, XAIFBaseParserHelper& passingOut) {
    DBG_MACRO(DbgGroup::CALLSTACK, 
	      "in XAIFBaseParserHandlers::onDummy"); 
    // pass all set elements through
    passingOut=passingIn;
    return;
  };

} // end of namespace 
