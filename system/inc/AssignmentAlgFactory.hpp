#ifndef _ASSIGNMENTALGFACTORY_INCLUDE_
#define _ASSIGNMENTALGFACTORY_INCLUDE_

#include "system/inc/AlgFactory.hpp"
#include "system/inc/AssignmentAlgBase.hpp"

namespace xaifBooster {  

  class Assignment;

  ALG_FACTORY_DECL_MACRO(Assignment,AssignmentAlgBase,AssignmentAlgBase);

} // end of namespace 

#endif
