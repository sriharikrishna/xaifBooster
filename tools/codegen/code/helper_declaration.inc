public:

void setAliasActivity(AliasActivity& whatToSet);
AliasActivity& getAliasActivity() const;
void setAliasActivityMap(AliasActivityMap& whatToSet);
AliasActivityMap& getAliasActivityMap() const;
void setArrayAccess(ArrayAccess& whatToSet);
ArrayAccess& getArrayAccess() const;
void setAssignment(Assignment& whatToSet);
Assignment& getAssignment() const;
void setVariable(Variable& whatToSet);
Variable& getVariable() const;
void setVariableEdge(VariableEdge& whatToSet);
VariableEdge& getVariableEdge() const;
void setBasicBlock(BasicBlock& whatToSet);
BasicBlock& getBasicBlock() const;
void setCallGraph(CallGraph& whatToSet);
CallGraph& getCallGraph() const;
void setCondition(Condition& whatToSet);
Condition& getCondition() const;
void setControlFlowGraph(ControlFlowGraph& whatToSet);
ControlFlowGraph& getControlFlowGraph() const;
void setExpression(Expression& whatToSet);
Expression& getExpression() const;
void setExpressionEdge(ExpressionEdge& whatToSet);
ExpressionEdge& getExpressionEdge() const;
void setForLoop(ForLoop& whatToSet);
ForLoop& getForLoop() const;
void setIfStatement(IfStatement& whatToSet);
IfStatement& getIfStatement() const;
void setInitialization(Initialization& whatToSet);
Initialization& getInitialization() const;
void setPostLoop(PostLoop& whatToSet);
PostLoop& getPostLoop() const;
void setPreLoop(PreLoop& whatToSet);
PreLoop& getPreLoop() const;
void setScope(Scope& whatToSet);
Scope& getScope() const;
void setScopes(Scopes& whatToSet);
Scopes& getScopes() const;
void setSubroutineCall(SubroutineCall& whatToSet);
SubroutineCall& getSubroutineCall() const;
void setSymbolTable(SymbolTable& whatToSet);
SymbolTable& getSymbolTable() const;
void setUpdate(Update& whatToSet);
Update& getUpdate() const;

private:
AliasActivity* myAliasActivity_p;
AliasActivityMap* myAliasActivityMap_p;
ArrayAccess* myArrayAccess_p;
Assignment* myAssignment_p;
Variable* myVariable_p;
VariableEdge* myVariableEdge_p;
BasicBlock* myBasicBlock_p;
CallGraph* myCallGraph_p;
Condition* myCondition_p;
ControlFlowGraph* myControlFlowGraph_p;
Expression* myExpression_p;
ExpressionEdge* myExpressionEdge_p;
ForLoop* myForLoop_p;
IfStatement* myIfStatement_p;
Initialization* myInitialization_p;
PostLoop* myPostLoop_p;
PreLoop* myPreLoop_p;
Scope* myScope_p;
Scopes* myScopes_p;
SubroutineCall* mySubroutineCall_p;
SymbolTable* mySymbolTable_p;
Update* myUpdate_p;