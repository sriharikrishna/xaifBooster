#include "utils/inc/ObjectWithId.hpp"
#include "utils/inc/LogicException.hpp"

namespace xaifBooster { 

  ObjectWithId::ObjectWithId() : myIdFlag(false) { 
  } // end of ObjectWithId::ObjectWithId

  std::string ObjectWithId::debug () const { 
    std::ostringstream out;
    out << "ObjectWithId[" << this 
	<< ",myId=" << myId.c_str() 
	<< ",myIdFlag=" << myIdFlag
	<< "]" << std::ends;  
    return out.str();
  } // end of ObjectWithId::debug

  void
  ObjectWithId::setId(const std::string& anId) { 
    if (myIdFlag)
      THROW_LOGICEXCEPTION_MACRO("ObjectWithId::setId can't reset myId for "
				 << debug().c_str());
    myIdFlag=true;
    myId=anId;
  } // end of ObjectWithId::ObjectWithId

  void
  ObjectWithId::setId(int anId) { 
    if (myIdFlag)
      THROW_LOGICEXCEPTION_MACRO("ObjectWithId::setId can't reset myId for "
				 << debug().c_str());
    myIdFlag=true;
    std::ostringstream out;
    out << anId << std::ends; 
    myId=out.str();
  } // end of ObjectWithId::ObjectWithId

  void
  ObjectWithId::overWriteId(const std::string& anId) { 
    myIdFlag=true;
    myId=anId;
  } // end of ObjectWithId::ObjectWithId

  void
  ObjectWithId::overWriteId(unsigned int anId) { 
    myIdFlag=true;
    std::ostringstream out;
    out << anId << std::ends; 
    myId=out.str();
  } // end of ObjectWithId::ObjectWithId

  const std::string&
  ObjectWithId::getId() const { 
    if (!myIdFlag)
      THROW_LOGICEXCEPTION_MACRO("ObjectWithId::getId myId not set for "
				 << debug().c_str());
    return myId;
  } // end of ObjectWithId::ObjectWithId

} 
