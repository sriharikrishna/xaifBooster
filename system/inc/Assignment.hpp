#ifndef _ASSIGNMENT_INCLUDE_
#define _ASSIGNMENT_INCLUDE_

#include "xaifBooster/system/inc/PlainAssignment.hpp"
#include "xaifBooster/system/inc/AssignmentAlgBase.hpp"

namespace xaifBooster { 

  /**
   * representation for Assignment with pointer to
   * AssignmentAlgBase
   */
  class Assignment : public PlainAssignment {
  public:
    
    Assignment (bool theActiveFlag);

    ~Assignment();

    virtual void printXMLHierarchy(std::ostream& os) const;

    void printXMLHierarchyImpl(std::ostream& os) const;

    std::string debug() const ;

    void linearize();

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    /** 
     * get algorithm
     */
    AssignmentAlgBase& getAssignmentAlgBase();

    /** 
     * get algorithm
     */
    const AssignmentAlgBase& getAssignmentAlgBase()const;

    /**
     * create replacement assignments that use the 
     * auxilliary variables for SSA
     */
    void makeSSACodeList();
    
    Expression& getLinearizedRightHandSide();

    const Expression& getLinearizedRightHandSide() const;

  private: 

    /**
     * no def
     */
    Assignment ();

    /**
     * no def
     */
    Assignment(const Assignment&);

    /**
     * no def
     */
    Assignment operator=(const Assignment&);

    /** 
     * this will be set to point a dynamically instance
     * during construction and deleted during 
     * destruction
     */
    AssignmentAlgBase* myAssignmentAlgBase_p;

    typedef std::pair<ExpressionVertex*, ExpressionVertex*> PointerPair;

    typedef std::list<PointerPair> PointerPairList;

    /**
     * this method is used by makeSSACodeList
     * this part of the iteration intends to go from the 
     * maximal node straight down to the 'leaf' nodes without 
     * any modification and then searches back up to the first 
     * node requiering the creation of a replacement assignment.
     * It creates the top node of the replacement assignment
     * and then calls localRHSExtractionInner for each in edge
     * which in turn recursively builds the rest of the 
     * replacement assignment
     * upon return of the inner recursion we add the 
     * completed replacement assignment to the end of 
     * myReplacementAssignmentList which should by means
     * of this recursion yield the correct order 
     */
    void localRHSExtractionOuter(const ExpressionEdge& theEdge);

    
    /**
     * this method is called by localRHSExtractionOuter for each 
     * top node of a subexpression that needs a replacement 
     * assignment constructed. This method adds the respective
     * source for the input edge to the replacement assignment expression, 
     * and the edge itself and recursively invokes itself for all 
     * input edges of the source vertex. If the source vertex however 
     * requires a replacement and has not gotten one, then it invokes 
     * localRHSExtractionOuter 
     * to ensure that we process subexpressions in the proper order
     */
    void localRHSExtractionInner(const ExpressionEdge& theEdge,
				 PlainAssignment& theReplacementAssignment,
				 const ExpressionVertex& theTargetVertex,
				 ExpressionVertex& theReplacementTargetVertex,
				 PointerPairList& theVertexPointerPairList); 

    /**
     * list of assignments replacing this 
     * assignment for SSA.
     * This list will be inserted in place of this 
     * assignment in the BasicBlockElement list
     * and the replacement transfers ownership
     * \todo JU revisit actual reinsertion of the 
     * \todo replacement assignments mentioned in the statement above
     */
    std::list<PlainAssignment*> mySSAReplacementAssignmentList;

    /** 
     * This is used by the linerization process. 
     * Initially it will hold a copy of the original 
     * right hand side
     */
    Expression myLinearizedRightHandSide;

    /** 
     * this indicates that the linearization has 
     * happened
     */
    bool myHaveLinearizedRightHandSide;

    /**
     * this dumps the linearization code
     * which needs to happen in dependency order, 
     * i.e. bottom up
     */
    void printEdgeAnnotationsBottomUp(const ExpressionEdge& theEdge,
				      const Expression& theExpression,
				      std::ostream& os) const;

    /** 
     * this is an assignment that will be created 
     * if the LHS occurs as an argument that 
     * is also used in a partial expression.
     * Since the partial are calculated after 
     * the assignment or its SSA replacements
     * the result will the assigned to a temporary
     * the partials will be calculated  and 
     * then the temporary is assigned to the 
     * original LHS
     */
    PlainAssignment* myDelayedLHSAssignment_p;

  }; // end of class Assignment
 
} // end of namespace xaifBooster
                                                                     
#endif
