#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/AliasActivityMap.hpp"
#include "xaifBooster/system/inc/AliasActivityMapKey.hpp"
#include "xaifBooster/system/inc/AliasActivity.hpp"

namespace xaifBooster { 

  const std::string AliasActivityMap::ourXAIFName("xaif:AliasSetList");
  
  AliasActivityMap::~AliasActivityMap() {
    for(AAVector::const_iterator it=myAAVector.begin();
	it!=myAAVector.end();
	it++)
      if (*it)
	delete (*it);
  } 

  AliasActivity& 
  AliasActivityMap::addAliasActivity(const std::string& aKey) { 
    unsigned int intKey = atoi(aKey.c_str());
    if (!intKey)
      THROW_LOGICEXCEPTION_MACRO("AliasActivityMap::addAliasActivity: cannot add key >" << aKey.c_str() << "<");
    if (intKey>=myAAVector.size())
      // resize and initialize to 0
      myAAVector.resize(intKey>myAAVector.size()+256?intKey:myAAVector.size()+256,0);
    AliasActivity* aNewAliasActivity_p=new AliasActivity(intKey);
    myAAVector[intKey]=aNewAliasActivity_p;
    return (*aNewAliasActivity_p);
  } // end of AliasActivityMap::addAliasActivity

  std::string AliasActivityMap::debug() const {
    std::ostringstream out;
    out << "AliasActivityMap[" << this 
	<< "]" << std::ends; 
    return out.str();
  } // end of AliasActivityMap::debug
  
  void AliasActivityMap::printXMLHierarchy(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<" 
       << ourXAIFName 
       << ">" 
       << std::endl; 
    for(AAVector::const_iterator it=myAAVector.begin();
	it!=myAAVector.end();
	it++)
      if (*it)
	(*it)->printXMLHierarchy(os);       
    os << pm.indent() 
       << "</"
       << ourXAIFName
       << ">" << std::endl;
    pm.releaseInstance();
  } // end of  AliasActivityMap::printXMLHierarchy

  bool AliasActivityMap::isActive(const AliasActivityMapKey& theKey) const { 
    bool returnValue=true;
    switch (theKey.getKind()) { 
    case AliasActivityMapKey::NOT_SET: 
      THROW_LOGICEXCEPTION_MACRO("AliasActivityMap::isActive: theKey is not set");
      break; 
    case AliasActivityMapKey::NO_INFO: 
    case AliasActivityMapKey::TEMP_VAR: 
      returnValue=true;
      break; 
    case AliasActivityMapKey::SET: { 
      unsigned int theIndex=theKey.getKey();
      if (0>theIndex || theIndex>=myAAVector.size())
	THROW_LOGICEXCEPTION_MACRO("AliasActivityMap::isActive: key >"
				   << theIndex
				   << "< out of bounds");
      if (!myAAVector[theIndex]) 
	THROW_LOGICEXCEPTION_MACRO("AliasActivityMap::isActive: not initialized for key >"
				   << theIndex
				   << "<");
      returnValue=(myAAVector[theIndex])->getActivity();
      break;
    }
    default: 
      THROW_LOGICEXCEPTION_MACRO("AliasActivityMap::isActive: cannot handle key kind "
				 << theKey.getKind());
      break;
    } // end switch
    return returnValue;
  } // end of AliasActivityMap::isActive 

  bool AliasActivityMap::isAliased(const AliasActivityMapKey& theKey, const AliasActivityMap::AliasActivityMapKeyList& theList) const { 
    return true;
  }

} // end of namespace  
