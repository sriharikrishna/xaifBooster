#ifndef _PLAINASSIGNMENT_INCLUDE_
#define _PLAINASSIGNMENT_INCLUDE_

#include "xaifBooster/system/inc/AssignmentWrapper.hpp"

namespace xaifBooster { 

  /** 
   * class to represent assignments to lvalues
   */
  class PlainAssignment : public AssignmentWrapper<BaseVariableReference,
			                           Expression> {
  public:
    
    PlainAssignment (bool theActiveFlag);

    ~PlainAssignment();

    virtual void printXMLHierarchy(std::ostream& os) const; 

    /**
     * Actual implementation for printing XAIF
     * of this expression
     */
    void printXMLHierarchyImpl(std::ostream& os) const;

    std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c) {};

    /** 
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for inherited member myId as represented in XAIF schema
     */
    static const std::string our_myId_XAIFName;

    /**
     * name for inherited member myLhs as represented in XAIF schema
     */
    static const std::string our_myLhs_XAIFName;

    /**
     * name for inherited member myRhs as represented in XAIF schema
     */
    static const std::string our_myRhs_XAIFName;

    /**
     * name for member myActiveFlag as represented in XAIF schema
     */
    static const std::string our_myActiveFlag_XAIFName;

    /**
     * if the right hand side of an assignment is passive
     * the entire assignment will be marked passive
     */
    void passivate();

    /**
     * unparse the left hand side only
     */
    void printXMLHierarchyLHS(std::ostream& os) const;

    /**
     * unparse the right hand side only
     */
    void printXMLHierarchyRHS(std::ostream& os) const;

    bool isActive() const; 
    
    bool isPassivated() const;

  private: 

    /**
     * no def
     */
    PlainAssignment ();

    /**
     * no def
     */
    PlainAssignment(const PlainAssignment&);

    /**
     * no def
     */
    PlainAssignment operator=(const PlainAssignment&);

    /** 
     * this determines if the assignment is active or not
     * it is set initially based on the XML input but 
     * can switch from true to false through passivate()
     */
    bool myActiveFlag;

    /**
     * this determines if the flag has been changed 
     * from active to passive
     */
    bool myPassivationFlag;

  }; // end of class PlainAssignment
 
} // end of namespace xaifBooster
                                                                     
#endif
