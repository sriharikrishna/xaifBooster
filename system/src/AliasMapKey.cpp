#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/AliasMapKey.hpp"

namespace xaifBooster { 

  AliasMapKey::AliasMapKey() : 
    myKey(0),
    myKind(NOT_SET) { 
  }

  void AliasMapKey::setReference(unsigned int key) {
    if (myKind!=NOT_SET) 
      THROW_LOGICEXCEPTION_MACRO("AliasMapKey::setReference: already set");
    if (key==0) 
      myKind=NO_INFO;
    else
      myKind=SET;
    myKey=key;
  }

  void AliasMapKey::setTemporary() {
    if (myKind!=NOT_SET) 
      THROW_LOGICEXCEPTION_MACRO("AliasMapKey::setTemporary: already set");
    myKind=TEMP_VAR;
  }

  unsigned int AliasMapKey::getKey() const { 
    if (myKind!=SET) 
      THROW_LOGICEXCEPTION_MACRO("AliasMapKey::getKey: not a regular key");
    return myKey;
  }

  AliasMapKey::AliasMapKey_E 
  AliasMapKey::getKind() const { 
    return myKind;
  }

  std::string 
  AliasMapKey::debug() const { 
    std::ostringstream out;
    out << "AliasMapKey[" << this 
	<< ",myKey=" << myKey
	<< ",myKind=" << myKind
	<< "]" << std::ends;  
    return out.str();
  } 

} // end of namespace xaifBooster
