#include <iostream>
#include <sstream>

#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/Expression.hpp"
#include "xaifBooster/system/inc/ExpressionAlgBase.hpp"
#include "xaifBooster/system/inc/ExpressionAlgFactory.hpp"
#include "xaifBooster/system/inc/InlinableIntrinsicsCatalogueItem.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"


namespace xaifBooster { 

  Expression::Expression(bool hasAlgorithm) : 
    myExpressionAlgBase_p(0) {
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
    if (myExpressionAlgBase_p
	&& 
	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY)
      getExpressionAlgBase().printXMLHierarchy(os);
    else
      printXMLHierarchyImpl(os);
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

  void 
  Expression::copyMyselfInto(Expression& theTarget,
			     bool withAlgorithm) const { 
    ConstVertexIteratorPair p(vertices());
    ConstVertexIterator beginIt(p.first),endIt(p.second);
    typedef std::pair<const ExpressionVertex*, const ExpressionVertex*> PointerPair;
    typedef std::list<PointerPair> PointerPairList;
    PointerPairList theList; // first original, second copy
    for (;beginIt!=endIt ;++beginIt) {
      ExpressionVertex& theCopy((*beginIt).createCopyOfMyself(withAlgorithm));
      theTarget.supplyAndAddVertexInstance(theCopy);
      theList.push_back(PointerPair(&(*beginIt),&theCopy));
    }
    ConstEdgeIteratorPair pe=edges();
    ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte) { 
      const ExpressionVertex 
	*theOriginalSource_p(&(getSourceOf(*beginIte))), 
	*theOriginalTarget_p(&(getTargetOf(*beginIte)));
      const ExpressionVertex 
	*theCopySource_p(0), 
	*theCopyTarget_p(0);
      for (PointerPairList::const_iterator li=theList.begin();
	   li!=theList.end() 
	     && 
	     !(theCopySource_p && theCopyTarget_p);
	   ++li) { 
	if (!theCopySource_p && (*li).first==theOriginalSource_p)
	  theCopySource_p=(*li).second;
	if (!theCopyTarget_p && (*li).first==theOriginalTarget_p)
	  theCopyTarget_p=(*li).second;
      } // end for 
      if (!theCopySource_p || !theCopyTarget_p) 
	THROW_LOGICEXCEPTION_MACRO("Expression::copyMyselfInto: couldn't find source or target");
      ExpressionEdge* theCopy = new ExpressionEdge(withAlgorithm);
      (*beginIte).copyMyselfInto(*theCopy);
      theTarget.supplyAndAddEdgeInstance(*theCopy,*theCopySource_p, *theCopyTarget_p);
    } // end for 
  } // end of Expression::copyMyselfInto

} // end of namespace xaifBooster 
