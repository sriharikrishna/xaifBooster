#ifndef _ASSIGNMENTALGBASE_INCLUDE_
#define _ASSIGNMENTALGBASE_INCLUDE_

#include "xaifBooster/system/inc/BasicBlockElementAlgBase.hpp"

namespace xaifBooster {  
  
  class Assignment;

  class AssignmentAlgBase: public BasicBlockElementAlgBase { 

  public: 

    AssignmentAlgBase(const Assignment& theContaining);

    virtual ~AssignmentAlgBase();

    const Assignment& getContainingAssignment() const;

  private: 

    /** 
     * not defined
     */
    AssignmentAlgBase();

    /** 
     * not defined
     */
    AssignmentAlgBase(const AssignmentAlgBase&);

    /** 
     * not defined
     */
    AssignmentAlgBase& operator=(const AssignmentAlgBase&);

  }; 

} // end of namespace 

#endif
