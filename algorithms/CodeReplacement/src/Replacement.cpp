#include <sstream>

#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/algorithms/CodeReplacement/inc/Replacement.hpp"

namespace xaifBoosterCodeReplacement { 

  const std::string Replacement::ourXAIFName("xaif:Replacement");
  const std::string Replacement::our_myPlaceHolder_XAIFName("placeholder");

  Replacement::Replacement (unsigned aPlaceHolder) : 
    myPlaceHolder(aPlaceHolder) { 
  } 

  Replacement::~Replacement(){
  }

  void
  Replacement::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str()
       << " "
       << our_myPlaceHolder_XAIFName.c_str() 
       << "=\"" 
       << myPlaceHolder
       << "\""
       << ">" 
       << std::endl;
    ConstVertexIteratorPair p(vertices());
    ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt)
      (*beginIt).printXMLHierarchy(os);
    ConstEdgeIteratorPair pe=edges();
    ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte)
      (*beginIte).printXMLHierarchy(os,
				    *this);
    os << pm.indent()
       << "</"
       << ourXAIFName.c_str()
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of Replacement::printXMLHierarchy

  std::string Replacement::debug () const { 
    std::ostringstream out;
    out << "Replacement[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of Replacement::debug

  const unsigned int Replacement::getPlaceHolder() const {
    return myPlaceHolder; 
  }

} 
