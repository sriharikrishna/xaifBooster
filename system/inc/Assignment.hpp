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
     * \param makeAlgorithm  news up an algorithm object if required
     * this is also carried through for the respective members
     */
    Assignment (bool makeAlgorithm=true);

    ~Assignment();

    /** 
     * algorithm access where the Assignment may 
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

    static const std::string ourXAIFName;
    static const std::string our_myId_XAIFName;
    static const std::string our_myLHS_XAIFName;
    static const std::string our_myRHS_XAIFName;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

  private: 

    /**
     * no def
     */
    Assignment(const Assignment&);

    /**
     * no def
     */
    Assignment operator=(const Assignment&);

    /**
     * left hand side 
     */
    Variable myLHS;

    /** 
     * right hand side
     */
    Expression myRHS;

  }; // end of class Assignment
 
} // end of namespace xaifBooster
                                                                     
#endif
