#include <sstream>

#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/algorithms/CodeReplacement/inc/Replacement.hpp"

namespace xaifBoosterCodeReplacement { 

  const std::string Replacement::ourXAIFName("xaif:Replacement");
  const std::string Replacement::our_myPlaceHolder_XAIFName("placeholder");

  Replacement::Replacement (unsigned aPlaceHolder) : 
    myPlaceHolder(aPlaceHolder),
    myControlFlowGraphBaseOwnerFlag(false), 
    myControlFlowGraphBase_p(0) { 
  } 

  Replacement::~Replacement(){
    if (myControlFlowGraphBaseOwnerFlag && myControlFlowGraphBase_p)
      delete myControlFlowGraphBase_p;
  }

  ControlFlowGraphBase& Replacement::makeNewControlFlowGraphBase() { 
    if (myControlFlowGraphBase_p)
      THROW_LOGICEXCEPTION_MACRO("Replacement::makeNewControlFlowGraphBase: already got one");
    ControlFlowGraphBase* theCFG_p(new ControlFlowGraphBase());
    myControlFlowGraphBase_p=theCFG_p;
    myControlFlowGraphBaseOwnerFlag=true;
    return *theCFG_p;
  } 

  void Replacement::setControlFlowGraphBase(const ControlFlowGraphBase& theOtherControlFlowGraphBase) { 
    if (myControlFlowGraphBase_p)
      THROW_LOGICEXCEPTION_MACRO("Replacement::setControlFlowGraphBase: already got one");
    myControlFlowGraphBase_p=&theOtherControlFlowGraphBase;
    myControlFlowGraphBaseOwnerFlag=false;
  } 

  const ControlFlowGraphBase& Replacement::getControlFlowGraphBase() const { 
    if (!myControlFlowGraphBase_p)
      THROW_LOGICEXCEPTION_MACRO("Replacement::setControlFlowGraphBase: don't have one");
    return *myControlFlowGraphBase_p;
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
    ControlFlowGraphBase::ConstVertexIteratorPair p(getControlFlowGraphBase().vertices());
    ControlFlowGraphBase::ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt)
      (*beginIt).printXMLHierarchy(os);
    ControlFlowGraphBase::ConstEdgeIteratorPair pe(getControlFlowGraphBase().edges());
    ControlFlowGraphBase::ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte)
      (*beginIte).printXMLHierarchy(os,
				    getControlFlowGraphBase());
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
