#ifndef _ASSIGNMENTALGFACTORY_INCLUDE_
#define _ASSIGNMENTALGFACTORY_INCLUDE_

#include "xaifBooster/system/inc/AlgFactory.hpp"
#include "xaifBooster/system/inc/AssignmentAlgBase.hpp"

namespace xaifBooster {  

  class Assignment;

  ALG_FACTORY_DECL_MACRO(Assignment,AssignmentAlgBase,AssignmentAlgBase);

} // end of namespace 

#endif
