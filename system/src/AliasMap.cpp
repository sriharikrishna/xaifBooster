#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/AliasMap.hpp"
#include "xaifBooster/system/inc/AliasMapKey.hpp"
#include "xaifBooster/system/inc/AliasMapEntry.hpp"

namespace xaifBooster { 

  const std::string AliasMap::ourXAIFName("xaif:AliasSetList");
  
  AliasMap::~AliasMap() {
    for(AAVector::const_iterator it=myAAVector.begin();
	it!=myAAVector.end();
	it++)
      if (*it)
	delete (*it);
  } 

  AliasMapEntry& 
  AliasMap::addAliasMapEntry(const std::string& aKey) { 
    unsigned int intKey = atoi(aKey.c_str());
    if (!intKey)
      THROW_LOGICEXCEPTION_MACRO("AliasMap::addAliasMapEntry: cannot add key >" << aKey.c_str() << "<");
    if (intKey>=myAAVector.size())
      // resize and initialize to 0
      myAAVector.resize(intKey>myAAVector.size()+256?intKey:myAAVector.size()+256,0);
    AliasMapEntry* aNewAliasMapEntry_p=new AliasMapEntry(intKey);
    myAAVector[intKey]=aNewAliasMapEntry_p;
    return (*aNewAliasMapEntry_p);
  } // end of AliasMap::addAliasMapEntry

  std::string AliasMap::debug() const {
    std::ostringstream out;
    out << "AliasMap[" << this 
	<< "]" << std::ends; 
    return out.str();
  } // end of AliasMap::debug
  
  void AliasMap::printXMLHierarchy(std::ostream& os) const {
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
  } // end of  AliasMap::printXMLHierarchy

  bool AliasMap::mayAlias(const AliasMapKey& theKey, 
			  const AliasMap::AliasMapKeyList& theList) const { 
    // some obvious things first
    if (!theList.size()) 
      return false; 
    if (theKey.getKind()==AliasMapKey::TEMP_VAR)
      // by agreed usage patterns, i.e. a single 
      // relevant assignment within a given scope
      return false; 
    if (theKey.getKind()!=AliasMapKey::NO_INFO) {
      AliasMapKeyList::const_iterator i=theList.begin();
      for (;i!=theList.end();
	   ++i)
	if (haveNonEmptyIntersection(theKey,**i))
	  break;
      if(i==theList.end())
	return false;
    } 
    return true;
  }

  bool AliasMap::mayAlias(const AliasMapKey& theKey, 
			  const AliasMapKey& theOtherKey) const { 
    if (theKey.getKind()==AliasMapKey::TEMP_VAR)
      // by agreed usage patterns, i.e. a single 
      // relevant assignment within a given scope
      return false; 
    if (theKey.getKind()!=AliasMapKey::NO_INFO) 
      return haveNonEmptyIntersection(theKey,theOtherKey);
    return true;
  }

  bool AliasMap::mustAlias(const AliasMapKey& theKey, 
			   const AliasMapKey& theOtherKey) const { 
    // some obvious things first
    if (theKey.getKind()==AliasMapKey::TEMP_VAR 
	|| 
	theOtherKey.getKind()==AliasMapKey::TEMP_VAR)
      THROW_LOGICEXCEPTION_MACRO("AliasMap::mustAlias: not supported for temporaries");
    if (theKey.getKind()==AliasMapKey::NO_INFO
	||
	theOtherKey.getKind()==AliasMapKey::NO_INFO) 
      return false;
    // shortcut in the following line: 
    if (theKey.getKey()==theOtherKey.getKey())
      return true;
    return false;
  }

  bool AliasMap::haveNonEmptyIntersection(const AliasMapKey& theKey,
					  const AliasMapKey& theOtherKey) const { 
    if (theOtherKey.getKind()==AliasMapKey::TEMP_VAR)
      // by agreed usage patterns, i.e. a single 
      // relevant assignment within a given scope
      return false; 
    if (theOtherKey.getKind()!=AliasMapKey::NO_INFO) {
	// shortcut by commenting out the following line: 
	//	if (myAAVector[theKey.getKey()]->disjointFrom(*myAAVector[theOtherKey.getKey()]))
        // for now always return true or it won't work
	  return true;
    } 
    return true;
  } 

} // end of namespace  
