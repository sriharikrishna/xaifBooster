void XAIFBaseParserHelper::setAliasMapEntry(AliasMapEntry& whatToSet) {
if (myAliasMapEntry_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::set " << "AliasMapEntry" << " item already set");
myAliasMapEntry_p=&whatToSet;
}
AliasMapEntry& XAIFBaseParserHelper::getAliasMapEntry() const {
if (!myAliasMapEntry_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::get " << "AliasMapEntry" << " item not set");
return *myAliasMapEntry_p;
}

void XAIFBaseParserHelper::setAliasMap(AliasMap& whatToSet) {
if (myAliasMap_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::set " << "AliasMap" << " item already set");
myAliasMap_p=&whatToSet;
}
AliasMap& XAIFBaseParserHelper::getAliasMap() const {
if (!myAliasMap_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::get " << "AliasMap" << " item not set");
return *myAliasMap_p;
}

void XAIFBaseParserHelper::setArrayAccess(ArrayAccess& whatToSet) {
if (myArrayAccess_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::set " << "ArrayAccess" << " item already set");
myArrayAccess_p=&whatToSet;
}
ArrayAccess& XAIFBaseParserHelper::getArrayAccess() const {
if (!myArrayAccess_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::get " << "ArrayAccess" << " item not set");
return *myArrayAccess_p;
}

void XAIFBaseParserHelper::setAssignment(Assignment& whatToSet) {
if (myAssignment_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::set " << "Assignment" << " item already set");
myAssignment_p=&whatToSet;
}
Assignment& XAIFBaseParserHelper::getAssignment() const {
if (!myAssignment_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::get " << "Assignment" << " item not set");
return *myAssignment_p;
}

void XAIFBaseParserHelper::setVariable(Variable& whatToSet) {
if (myVariable_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::set " << "Variable" << " item already set");
myVariable_p=&whatToSet;
}
Variable& XAIFBaseParserHelper::getVariable() const {
if (!myVariable_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::get " << "Variable" << " item not set");
return *myVariable_p;
}

void XAIFBaseParserHelper::setVariableEdge(VariableEdge& whatToSet) {
if (myVariableEdge_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::set " << "VariableEdge" << " item already set");
myVariableEdge_p=&whatToSet;
}
VariableEdge& XAIFBaseParserHelper::getVariableEdge() const {
if (!myVariableEdge_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::get " << "VariableEdge" << " item not set");
return *myVariableEdge_p;
}

void XAIFBaseParserHelper::setBasicBlock(BasicBlock& whatToSet) {
if (myBasicBlock_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::set " << "BasicBlock" << " item already set");
myBasicBlock_p=&whatToSet;
}
BasicBlock& XAIFBaseParserHelper::getBasicBlock() const {
if (!myBasicBlock_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::get " << "BasicBlock" << " item not set");
return *myBasicBlock_p;
}

void XAIFBaseParserHelper::setCallGraph(CallGraph& whatToSet) {
if (myCallGraph_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::set " << "CallGraph" << " item already set");
myCallGraph_p=&whatToSet;
}
CallGraph& XAIFBaseParserHelper::getCallGraph() const {
if (!myCallGraph_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::get " << "CallGraph" << " item not set");
return *myCallGraph_p;
}

void XAIFBaseParserHelper::setCondition(Condition& whatToSet) {
if (myCondition_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::set " << "Condition" << " item already set");
myCondition_p=&whatToSet;
}
Condition& XAIFBaseParserHelper::getCondition() const {
if (!myCondition_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::get " << "Condition" << " item not set");
return *myCondition_p;
}

void XAIFBaseParserHelper::setControlFlowGraph(ControlFlowGraph& whatToSet) {
if (myControlFlowGraph_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::set " << "ControlFlowGraph" << " item already set");
myControlFlowGraph_p=&whatToSet;
}
ControlFlowGraph& XAIFBaseParserHelper::getControlFlowGraph() const {
if (!myControlFlowGraph_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::get " << "ControlFlowGraph" << " item not set");
return *myControlFlowGraph_p;
}

void XAIFBaseParserHelper::setExpression(Expression& whatToSet) {
if (myExpression_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::set " << "Expression" << " item already set");
myExpression_p=&whatToSet;
}
Expression& XAIFBaseParserHelper::getExpression() const {
if (!myExpression_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::get " << "Expression" << " item not set");
return *myExpression_p;
}

void XAIFBaseParserHelper::setExpressionEdge(ExpressionEdge& whatToSet) {
if (myExpressionEdge_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::set " << "ExpressionEdge" << " item already set");
myExpressionEdge_p=&whatToSet;
}
ExpressionEdge& XAIFBaseParserHelper::getExpressionEdge() const {
if (!myExpressionEdge_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::get " << "ExpressionEdge" << " item not set");
return *myExpressionEdge_p;
}

void XAIFBaseParserHelper::setForLoop(ForLoop& whatToSet) {
if (myForLoop_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::set " << "ForLoop" << " item already set");
myForLoop_p=&whatToSet;
}
ForLoop& XAIFBaseParserHelper::getForLoop() const {
if (!myForLoop_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::get " << "ForLoop" << " item not set");
return *myForLoop_p;
}

void XAIFBaseParserHelper::setIfStatement(IfStatement& whatToSet) {
if (myIfStatement_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::set " << "IfStatement" << " item already set");
myIfStatement_p=&whatToSet;
}
IfStatement& XAIFBaseParserHelper::getIfStatement() const {
if (!myIfStatement_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::get " << "IfStatement" << " item not set");
return *myIfStatement_p;
}

void XAIFBaseParserHelper::setInitialization(Initialization& whatToSet) {
if (myInitialization_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::set " << "Initialization" << " item already set");
myInitialization_p=&whatToSet;
}
Initialization& XAIFBaseParserHelper::getInitialization() const {
if (!myInitialization_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::get " << "Initialization" << " item not set");
return *myInitialization_p;
}

void XAIFBaseParserHelper::setPostLoop(PostLoop& whatToSet) {
if (myPostLoop_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::set " << "PostLoop" << " item already set");
myPostLoop_p=&whatToSet;
}
PostLoop& XAIFBaseParserHelper::getPostLoop() const {
if (!myPostLoop_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::get " << "PostLoop" << " item not set");
return *myPostLoop_p;
}

void XAIFBaseParserHelper::setPreLoop(PreLoop& whatToSet) {
if (myPreLoop_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::set " << "PreLoop" << " item already set");
myPreLoop_p=&whatToSet;
}
PreLoop& XAIFBaseParserHelper::getPreLoop() const {
if (!myPreLoop_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::get " << "PreLoop" << " item not set");
return *myPreLoop_p;
}

void XAIFBaseParserHelper::setScope(Scope& whatToSet) {
if (myScope_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::set " << "Scope" << " item already set");
myScope_p=&whatToSet;
}
Scope& XAIFBaseParserHelper::getScope() const {
if (!myScope_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::get " << "Scope" << " item not set");
return *myScope_p;
}

void XAIFBaseParserHelper::setScopes(Scopes& whatToSet) {
if (myScopes_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::set " << "Scopes" << " item already set");
myScopes_p=&whatToSet;
}
Scopes& XAIFBaseParserHelper::getScopes() const {
if (!myScopes_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::get " << "Scopes" << " item not set");
return *myScopes_p;
}

void XAIFBaseParserHelper::setSubroutineCall(SubroutineCall& whatToSet) {
if (mySubroutineCall_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::set " << "SubroutineCall" << " item already set");
mySubroutineCall_p=&whatToSet;
}
SubroutineCall& XAIFBaseParserHelper::getSubroutineCall() const {
if (!mySubroutineCall_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::get " << "SubroutineCall" << " item not set");
return *mySubroutineCall_p;
}

void XAIFBaseParserHelper::setSymbolTable(SymbolTable& whatToSet) {
if (mySymbolTable_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::set " << "SymbolTable" << " item already set");
mySymbolTable_p=&whatToSet;
}
SymbolTable& XAIFBaseParserHelper::getSymbolTable() const {
if (!mySymbolTable_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::get " << "SymbolTable" << " item not set");
return *mySymbolTable_p;
}

void XAIFBaseParserHelper::setUpdate(Update& whatToSet) {
if (myUpdate_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::set " << "Update" << " item already set");
myUpdate_p=&whatToSet;
}
Update& XAIFBaseParserHelper::getUpdate() const {
if (!myUpdate_p)
THROW_LOGICEXCEPTION_MACRO("XAIFBaseParserHelper" << " ::get " << "Update" << " item not set");
return *myUpdate_p;
}

