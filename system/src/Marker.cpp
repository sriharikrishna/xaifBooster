#include "utils/inc/LogicException.hpp"
#include "utils/inc/PrintManager.hpp"
#include "system/inc/Marker.hpp"

namespace xaifBooster { 

  const std::string Marker::ourXAIFName("xaif:Marker");
  const std::string Marker::our_myId_XAIFName("statement_id");
  const std::string Marker::our_myAnnotation_XAIFName("annotation");

  Marker::Marker() : myAnnotationFlag(false) { 
  } // end of Marker::Marker

  std::string Marker::debug () const { 
    std::ostringstream out;
    out << "Marker[" << this 
	<< ",myAnnotation=" << myAnnotation.c_str() 
	<< ",myAnnotationFlag=" << myAnnotationFlag
	<< "]" << std::ends;  
    return out.str();
  } // end of Marker::debug

  void
  Marker::setAnnotation(const std::string& anAnnotation) { 
    if (myAnnotationFlag)
      THROW_LOGICEXCEPTION_MACRO("Marker::setAnnotation can't reset myAnnotation");
    myAnnotationFlag=true;
    myAnnotation=anAnnotation;
  } // end of Marker::setAnnotation

  const std::string&
  Marker::getAnnotation() const { 
    if (!myAnnotationFlag)
      THROW_LOGICEXCEPTION_MACRO("Marker::getAnnotation myAnnotation not set");
    return myAnnotation;
  } // end of Marker::getAnnotation

  void Marker::printXMLHierarchy(std::ostream& os) const {
    printXMLHierarchyImpl(os);
  }

  void
  Marker::printXMLHierarchyImpl(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent()
       << "<"
       << ourXAIFName
       << " "
       << our_myId_XAIFName
       << "=\"" 
       << getId() 
       << "\" " 
       << our_myAnnotation_XAIFName
       << "=\"" 
       << getAnnotation() 
       << "\"/>" 
       << std::endl;
       pm.releaseInstance(); 
  } // end of Marker::printXMLHierarchyImpl

} 
