#include <sstream>

#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"
#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/ArgumentSubstitute.hpp"

namespace xaifBooster { 

  const std::string InlinableSubroutineCall::ourXAIFName("xaif:InlinableSubroutineCall");

  const std::string InlinableSubroutineCall::our_mySubroutineName_XAIFName("subroutine_name");

  const std::string InlinableSubroutineCall::our_myId_XAIFName("statement_id");

  InlinableSubroutineCall::InlinableSubroutineCall(const std::string& aSubroutineName) : 
    mySubroutineName(aSubroutineName) { 
  } 

  InlinableSubroutineCall::~InlinableSubroutineCall(){
    for (ArgumentSubstitutePList::iterator i=myArgumentSubstitutePList.begin();
	 i!=myArgumentSubstitutePList.end();
	 ++i)
      if (*i)
	delete *i;
  };

  void
  InlinableSubroutineCall::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str()
       << " "
       << our_mySubroutineName_XAIFName.c_str() 
       << "=\"" 
       << mySubroutineName.c_str()
       << "\""
       << " "
       << our_myId_XAIFName.c_str() 
       << "=\"" 
       << getId().c_str()
       << "\""
       << ">"
       << std::endl;
    for (ArgumentSubstitutePList::const_iterator i=myArgumentSubstitutePList.begin();
	 i!=myArgumentSubstitutePList.end();
	 ++i)
      (*i)->printXMLHierarchy(os);
    os << pm.indent()
       << "</"
       << ourXAIFName.c_str()
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of InlinableSubroutineCall::printXMLHierarchy

  std::string InlinableSubroutineCall::debug () const { 
    std::ostringstream out;
    out << "InlinableSubroutineCall[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of InlinableSubroutineCall::debug

  ArgumentSubstitute& InlinableSubroutineCall::addArgumentSubstitute(unsigned int aPosition) { 
    for (ArgumentSubstitutePList::iterator i=myArgumentSubstitutePList.begin();
	 i!=myArgumentSubstitutePList.end();
	 ++i)
      if ((*i)->getPosition()==aPosition)
	THROW_LOGICEXCEPTION_MACRO("InlinableSubroutineCall::addArgumentSubstitute: position " 
				   << aPosition
				   << " already in use");
    ArgumentSubstitute* newSubstitute_p=new ArgumentSubstitute(aPosition);
    myArgumentSubstitutePList.push_back(newSubstitute_p);
    return * newSubstitute_p;
  } 

} 
