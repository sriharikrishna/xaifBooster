#include <sstream>

#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/algorithms/CodeReplacement/inc/ReplacementList.hpp"
#include "xaifBooster/algorithms/CodeReplacement/inc/Replacement.hpp"

namespace xaifBoosterCodeReplacement { 

  const std::string ReplacementList::ourXAIFName("xaif:ReplacementList");
  const std::string ReplacementList::our_myTemplateName_XAIFName("template_name");

  ReplacementList::ReplacementList (const Symbol& theSymbol,
				    const Scope& theScope,
				    const std::string& aTemplateName,
				    const ArgumentList& anArgumentList) : 
    ControlFlowGraphCommonAttributes(theSymbol, theScope),
    myTemplateName(aTemplateName),
    myArgumentList(anArgumentList) { 
  } 

  ReplacementList::~ReplacementList(){
    for (ReplacementPList::iterator i=myReplacementPList.begin();
	 i!=myReplacementPList.end();
	 ++i) 
      if (*i)
	delete (*i);
  }

  void
  ReplacementList::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str()
       << " ";
    printAttributes(os);
    os << " "
       << our_myTemplateName_XAIFName.c_str() 
       << "=\"" 
       << myTemplateName.c_str()
       << "\""
       << ">"
       << std::endl; 
    myArgumentList.printXMLHierarchy(os);
    for (ReplacementPList::const_iterator i=myReplacementPList.begin();
	 i!=myReplacementPList.end();
	 ++i) 
      (*i)->printXMLHierarchy(os);
    os << pm.indent()
       << "</"
       << ourXAIFName.c_str()
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of ReplacementList::printXMLHierarchy

  std::string ReplacementList::debug () const { 
    std::ostringstream out;
    out << "ReplacementList[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of ReplacementList::debug

  const std::string& ReplacementList::getTemplateName() const {
    return myTemplateName; 
  }

  Replacement& ReplacementList::addReplacement(unsigned int aPlaceHolder) { 
    for (ReplacementPList::iterator i=myReplacementPList.begin();
	 i!=myReplacementPList.end();
	 ++i) 
      if (aPlaceHolder==(*i)->getPlaceHolder())
	THROW_LOGICEXCEPTION_MACRO("ReplacementList::addReplacement: place holder "
				   << aPlaceHolder
				   << " already in use");
    Replacement* aReplacement_p=new Replacement(aPlaceHolder);
    myReplacementPList.push_back(aReplacement_p);
    return *aReplacement_p;
  } 

} 