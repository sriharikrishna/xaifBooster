#include <sstream>
#include "utils/inc/PrintManager.hpp"
#include "system/inc/Variable.hpp"

namespace xaifBooster { 

  const std::string Variable::ourXAIFName("xaif:VariableReference");
  const std::string Variable::our_myId_XAIFName("vertex_id");

  Variable::Variable() { 
  } 

  ExpressionVertex& Variable::createCopyOfMyself(bool withAlgorithm) const { 
    Variable* aNewVariable_p=new Variable();
    myBaseVariableReference.copyMyselfInto(aNewVariable_p->myBaseVariableReference);
    aNewVariable_p->setId(getId());
//     if (!isActive())
//       aNewVariable_p->passivate();
    return *aNewVariable_p;
  } 

  void
  Variable::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str()
       << " " 
       << our_myId_XAIFName.c_str() 
       << "=\"" 
       << getId().c_str()
       << "\"";
    if (myBaseVariableReference.getAliasActivityMapKey().getKind()==AliasActivityMapKey::SET) { 
      os << " "
	 << BaseVariableReference::our_myKey_XAIFName
	 << "=\""
	 << myBaseVariableReference.getAliasActivityMapKey().getKey()
	 << "\"";
      }
    os << ">" 
       << std::endl;
    BaseVariableReference::ConstVertexIteratorPair p(myBaseVariableReference.vertices());
    BaseVariableReference::ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt)
      (*beginIt).printXMLHierarchy(os);
    BaseVariableReference::ConstEdgeIteratorPair pe(myBaseVariableReference.edges());
    BaseVariableReference::ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte) 
      (*beginIte).printXMLHierarchy(os,
				    myBaseVariableReference);
    os << pm.indent()
       << "</"
       << ourXAIFName
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of Variable::printXMLHierarchy

  std::string Variable::debug () const { 
    std::ostringstream out;
    out << "Variable[" << this << ","
	<< ExpressionVertex::debug().c_str()
	<< ",myBaseVariableReference=" << myBaseVariableReference.debug()
	<< "]" << std::ends;  
    return out.str();
  } // end of Variable::debug

  BaseVariableReference& 
  Variable::getBaseVariableReference() { 
    return myBaseVariableReference;
  };

  const BaseVariableReference& 
  Variable::getBaseVariableReference() const { 
    return myBaseVariableReference;
  };

  std::string Variable::equivalenceSignature() const { 
    return myBaseVariableReference.equivalenceSignature();
  } ;

} // end of namespace xaifBooster 
