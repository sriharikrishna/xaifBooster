#include <iostream>
#include <sstream>

#include "utils/inc/DbgLoggerManager.hpp"

#include "system/inc/Expression.hpp"
#include "system/inc/ExpressionAlgBase.hpp"
#include "system/inc/ExpressionAlgFactory.hpp"
#include "system/inc/InlinableIntrinsicsCatalogueItem.hpp"
#include "system/inc/ConceptuallyStaticInstances.hpp"
#include "system/inc/Variable.hpp"
#include "system/inc/Assignment.hpp"
#include "system/inc/CallGraph.hpp"
#include "system/inc/BaseVariableSymbolReference.hpp"


namespace xaifBooster { 

  Expression::Expression(bool hasAlgorithm) {
    if (hasAlgorithm)
      myExpressionAlgBase_p=ExpressionAlgFactory::instance()->makeNewAlg(*this); 
  }

  Expression::~Expression() {
    if (myExpressionAlgBase_p)
      delete myExpressionAlgBase_p;
  }

  ExpressionAlgBase&
  Expression::getExpressionAlgBase() const {
    if (!myExpressionAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("Expression::getExpressionAlgBase: not set");
    return *myExpressionAlgBase_p;
  }

  void
  Expression::printXMLHierarchy(std::ostream& os) const { 
    getExpressionAlgBase().printXMLHierarchy(os);
  } // end of Expression::printXMLHierarchy


  void 
  Expression::printXMLHierarchyImpl(std::ostream& os) const { 
    ConstVertexIteratorPair p(vertices());
    ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt)
      (*beginIt).printXMLHierarchy(os);
    ConstEdgeIteratorPair pe=edges();
    ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte) 
      (*beginIte).printXMLHierarchy(os,*this);
  } // end of Expression::printXMLHierarchyImpl


  std::string Expression::debug () const { 
    std::ostringstream out;
    out << "Expression[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of Expression::debug

  void Expression::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {        
    getExpressionAlgBase().genericTraversal(anAction_c);
  } // end traversalToChildren

} // end of namespace xaifBooster 
