#ifndef _ASSIGNMENT_INCLUDE_
#define _ASSIGNMENT_INCLUDE_

#include "xaifBooster/system/inc/BasicBlockElement.hpp"
#include "xaifBooster/system/inc/Expression.hpp"
#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/system/inc/AssignmentAlgBase.hpp"

namespace xaifBooster { 

  /**
   * representation for an Assignment 
   */
  class Assignment : public BasicBlockElement {
  public:
    
    /** 
     * ctor news up an algorithm object if required
     */
    Assignment (bool theActiveFlag,
		bool makeAlgorithm=true);

    /** 
     * dtor deletes the algorithm object if present 
     */
    ~Assignment();

    /** 
     * algorithm access where the Expression may 
     * be const but in difference to the 
     * internal representation (wich is always 
     * const for the algorithms) the algorithm 
     * instances will always be modifiable.
     */
    AssignmentAlgBase& getAssignmentAlgBase()const;

    virtual void printXMLHierarchy(std::ostream& os) const;

    /**
     * actual implementation for printing xaif
     */
    void printXMLHierarchyImpl(std::ostream& os) const;

    /**
     * unparse the left hand side only
     */
    void printXMLHierarchyLHS(std::ostream& os) const;

    /**
     * unparse the right hand side only
     */
    void printXMLHierarchyRHS(std::ostream& os) const;

    std::string debug() const;

    Variable& getLHS();

    Expression& getRHS();

    const Variable& getLHS() const;

    const Expression& getRHS() const;

    /** 
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for inherited member myId as represented in XAIF schema
     */
    static const std::string our_myId_XAIFName;

    /**
     * name for inherited member myLHS as represented in XAIF schema
     */
    static const std::string our_myLHS_XAIFName;

    /**
     * name for inherited member myRHS as represented in XAIF schema
     */
    static const std::string our_myRHS_XAIFName;

    /**
     * name for member myActiveFlag as represented in XAIF schema
     */
    static const std::string our_myActiveFlag_XAIFName;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    void setLHSActiveFlag(bool anActiveFlag);

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
     * lvalue on the 
     * left hand side 
     */
    Variable myLHS;

    /** 
     * expression on the right hand side
     */
    Expression myRHS;

    /** 
     * this will be set to point a dynamically instance
     * during construction and deleted during 
     * destruction
     */
    AssignmentAlgBase* myAssignmentAlgBase_p;

    /** 
     * this determines if the assignment is active or not
     */
    bool myActiveFlag;

    /** 
     * this determines if the assignment is active or not
     */
    bool myLHSActiveFlag;

  }; // end of class Assignment
 
} // end of namespace xaifBooster
                                                                     
#endif
