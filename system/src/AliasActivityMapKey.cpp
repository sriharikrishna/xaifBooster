#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/AliasActivityMapKey.hpp"

namespace xaifBooster { 

  AliasActivityMapKey::AliasActivityMapKey() : 
    myKey(0),
    myKind(NOT_SET) { 
  }

  void AliasActivityMapKey::setReference(unsigned int key) {
    if (myKind!=NOT_SET) 
      THROW_LOGICEXCEPTION_MACRO("AliasActivityMapKey::setReference: already set");
    if (key==0) 
      myKind=NO_INFO;
    else
      myKind=SET;
    myKey=key;
  }

  void AliasActivityMapKey::setTemporary() {
    if (myKind!=NOT_SET) 
      THROW_LOGICEXCEPTION_MACRO("AliasActivityMapKey::setTemporary: already set");
    myKind=TEMP_VAR;
  }

  unsigned int AliasActivityMapKey::getKey() const { 
    if (myKind!=SET) 
      THROW_LOGICEXCEPTION_MACRO("AliasActivityMapKey::getKey: not a regular key");
    return myKey;
  }

  AliasActivityMapKey::AliasActivityMapKey_E 
  AliasActivityMapKey::getKind() const { 
    return myKind;
  }

} // end of namespace xaifBooster
