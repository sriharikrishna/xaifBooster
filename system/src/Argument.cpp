#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/Argument.hpp"

namespace xaifBooster { 

  const std::string Argument::ourXAIFName("xaif:VariableReference");
  const std::string Argument::our_myId_XAIFName("vertex_id");

  Argument::Argument() { 
  } 

  ExpressionVertex& Argument::createCopyOfMyself(bool withAlgorithm) const { 
    Argument* aNewArgument_p=new Argument();
    myVariable.copyMyselfInto(aNewArgument_p->myVariable);
    aNewArgument_p->setId(getId());
//     if (!isActive())
//       aNewVariable_p->passivate();
    return *aNewArgument_p;
  } 

  void
  Argument::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str()
       << " " 
       << our_myId_XAIFName.c_str() 
       << "=\"" 
       << getId().c_str()
       << "\"";
    if (myVariable.getAliasActivityMapKey().getKind()==AliasActivityMapKey::SET) { 
      os << " "
	 << Variable::our_myKey_XAIFName
	 << "=\""
	 << myVariable.getAliasActivityMapKey().getKey()
	 << "\"";
      }
    os << ">" 
       << std::endl;
    Variable::ConstVertexIteratorPair p(myVariable.vertices());
    Variable::ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt)
      (*beginIt).printXMLHierarchy(os);
    Variable::ConstEdgeIteratorPair pe(myVariable.edges());
    Variable::ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte) 
      (*beginIte).printXMLHierarchy(os,
				    myVariable);
    os << pm.indent()
       << "</"
       << ourXAIFName
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of Argument::printXMLHierarchy

  std::string Argument::debug () const { 
    std::ostringstream out;
    out << "Argument[" << this << ","
	<< ExpressionVertex::debug().c_str()
	<< ",myVariable=" << myVariable.debug()
	<< "]" << std::ends;  
    return out.str();
  } // end of Argument::debug

  Variable& 
  Argument::getVariable() { 
    return myVariable;
  };

  const Variable& 
  Argument::getVariable() const { 
    return myVariable;
  };

  std::string Argument::equivalenceSignature() const { 
    return myVariable.equivalenceSignature();
  } ;

} // end of namespace xaifBooster 
