#include <sstream>

#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"

#include "xaifBooster/system/inc/DuUdMapEntry.hpp"

namespace xaifBooster { 

  const std::string DuUdMapEntry::ourXAIFName("xaif:DUUDSet");

  const std::string DuUdMapEntry::our_myKey_XAIFName("key");

  const std::string DuUdMapEntry::our_StatementId_XAIFName("xaif:StatementId");

  const std::string DuUdMapEntry::our_IdRef_XAIFName("idRef");

  DuUdMapEntry::DuUdMapEntry(unsigned int theKey) : 
    myKey(theKey) {}; 
 
  DuUdMapEntry::~DuUdMapEntry(){};

  std::string DuUdMapEntry::debug() const {
    std::ostringstream out;
    out << "DuUdMapEntry[" << this 
	<< "]" << std::ends; 
    return out.str();
  }; 
  
  void DuUdMapEntry::printXMLHierarchy(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<" 
       << ourXAIFName.c_str() 
       << ">" 
       << std::endl; 
    for(DuUdMapDefinitionResult::StatementIdList::const_iterator it=myStatementIdList.begin();
	it!=myStatementIdList.end();
	it++) { 
      os << pm.indent(2) 
	 << "<" 
	 << our_StatementId_XAIFName.c_str()
	 << " "
	 << our_IdRef_XAIFName.c_str()
	 << "=\""
	 << (*it).c_str()
	 << "\""
	 << "/>"
	 << std::endl; 
    } 
    os << pm.indent() 
       << "</"
       << ourXAIFName
       << ">" << std::endl;
    pm.releaseInstance();
  } 

  void DuUdMapEntry::appendToStatementIdList(const std::string& anId) { 
    myStatementIdList.push_back(anId);
  } 

  const DuUdMapDefinitionResult DuUdMapEntry::definition(const DuUdMapDefinitionResult::StatementIdList& anIdList) const { 
    if (!myStatementIdList.size()) 
      THROW_LOGICEXCEPTION_MACRO("DuUdMapEntry::definition: empty StatementIdList implies use of a variable that has not been defined");
    DuUdMapDefinitionResult theResult;
    unsigned int matchNumber=0;
    bool hasOutOfScope=false;
    for(DuUdMapDefinitionResult::StatementIdList::const_iterator itChain=myStatementIdList.begin();
	itChain!=myStatementIdList.end();
	itChain++) {
      for(DuUdMapDefinitionResult::StatementIdList::const_iterator it=anIdList.begin();
	  it!=anIdList.end();
	  it++) { 
	if (*it=="")
	  THROW_LOGICEXCEPTION_MACRO("DuUdMapEntry::definition: all StatementIds in anIdList are supposed to be for regular statements and therefore cannot be empty");
	if (*it==*itChain)
	  matchNumber++;
	if (matchNumber==1)
	  theResult.myStatementId=*itChain;
      }
      if (*itChain=="") 
	hasOutOfScope=true;
    }
    if ((matchNumber==0 
	 &&
	 hasOutOfScope)
	|| 
	(!hasOutOfScope 
	 && 
	 myStatementIdList.size()>1))
      theResult.myAnswer=DuUdMapDefinitionResult::AMBIGUOUS_OUTSIDE;
    else if (matchNumber==0 
	     && 
	     !hasOutOfScope
	     && 
	     myStatementIdList.size()==1)
      theResult.myAnswer=DuUdMapDefinitionResult::UNIQUE_OUTSIDE;
    else if (matchNumber>0 
	     && 
	     (hasOutOfScope
	      || 
	      myStatementIdList.size()>matchNumber))
      theResult.myAnswer=DuUdMapDefinitionResult::AMBIGUOUS_BOTHSIDES;
    else if (matchNumber==1 
	     && 
	     myStatementIdList.size()==1)
      theResult.myAnswer=DuUdMapDefinitionResult::UNIQUE_INSIDE;
    else if (matchNumber>1 
	     && 
	     myStatementIdList.size()==matchNumber)
      theResult.myAnswer=DuUdMapDefinitionResult::AMBIGUOUS_INSIDE;
    else 
      THROW_LOGICEXCEPTION_MACRO("DuUdMapEntry::definition: missing case");
    return theResult;
  } 

} // end of namespace  
