#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

namespace xaifBooster { 

  const std::string Variable::our_myKey_XAIFName("alias");
  const std::string Variable::our_myDerivFlag_XAIFName("deriv");

  Variable::Variable() : 
    myDerivFlag(false) { 
  } 

  void 
  Variable::copyMyselfInto(Variable& theTarget) const { 
    Variable::ConstVertexIteratorPair p(vertices());
    Variable::ConstVertexIterator beginIt(p.first),endIt(p.second);
    typedef std::pair<const VariableVertex*, const VariableVertex*> PointerPair;
    typedef std::list<PointerPair> PointerPairList;
    PointerPairList theList; // first original, second copy
    for (;beginIt!=endIt ;++beginIt) {
      VariableVertex& theCopy((*beginIt).createCopyOfMyself());
      theTarget.supplyAndAddVertexInstance(theCopy);
      theList.push_back(PointerPair(&(*beginIt),&theCopy));
    }
    Variable::ConstEdgeIteratorPair pe=edges();
    Variable::ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte) { 
      const VariableVertex 
	*theOriginalSource_p(&(getSourceOf(*beginIte))), 
	*theOriginalTarget_p(&(getTargetOf(*beginIte)));
      const VariableVertex 
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
	THROW_LOGICEXCEPTION_MACRO("Variable::copyMyselfInto: couldn't find source or target");
      VariableEdge& theEdge(theTarget.addEdge(*theCopySource_p,
					      *theCopyTarget_p));
      theEdge.setId((*beginIte).getId());
    } // end for 
    if (myAliasActivityMapKey.getKind()==AliasActivityMapKey::NOT_SET)
      THROW_LOGICEXCEPTION_MACRO("Variable::copyMyselfInto: myAliasActivityMapKey not initialized for " 
				 << debug().c_str());
    // just use the default assignment which should be good enough
    theTarget.myAliasActivityMapKey=myAliasActivityMapKey;
  } // end of Variable::copyMyselfInto

  bool 
  Variable::equivalentTo(const Variable& rhs) const { 
    if (numEdges()!=rhs.numEdges() ||
	numVertices()!=rhs.numVertices()) 
      // shortcut
      return false;
    return (equivalenceSignature()==rhs.equivalenceSignature());
  } 

  std::string 
  Variable::equivalenceSignature() const { 
    // JU: incomplete
    std::ostringstream theSignature;
    if (numEdges()>0 ||
	numVertices()!=1) { 
      // for now ensure uniqueness by appending the address
      theSignature << "Complex_" << this << "_";
      ConstVertexIteratorPair vIP=vertices();
      ConstVertexIterator vI(vIP.first), vIe(vIP.second);
      for (;vI!=vIe;++vI) 
	// for the real thing we would have to order this somehow
	theSignature << (*vI).equivalenceSignature().c_str() << "_";
    } 
    else { 
      ConstVertexIteratorPair this_pair=vertices();
      const VariableVertex& this_Vertex(*(this_pair.first));
      theSignature << this_Vertex.equivalenceSignature().c_str();
    } 
    theSignature << std::ends;
    return theSignature.str();
  } 

  void
  Variable::printXMLHierarchy(std::ostream& os) const { 
    Variable::ConstVertexIteratorPair p(vertices());
    Variable::ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt)
      (*beginIt).printXMLHierarchy(os);
    Variable::ConstEdgeIteratorPair pe=edges();
    Variable::ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte) 
      (*beginIte).printXMLHierarchy(os,*this);
  } // end of Variable::printXMLHierarchy

  std::string Variable::debug () const { 
    std::ostringstream out;
    out << "Variable[" << this 
	<< " " << equivalenceSignature().c_str() 
	<< ",myDerivFlag=" << myDerivFlag
	<< "]" << std::ends;  
    return out.str();
  } // end of Variable::debug

  AliasActivityMapKey& Variable::getAliasActivityMapKey() { 
    return myAliasActivityMapKey;
  } 

  const AliasActivityMapKey& Variable::getAliasActivityMapKey() const { 
    return myAliasActivityMapKey;
  }

  const SymbolType::SymbolType_E& Variable::getType() const { 
    return getVariableSymbolReference().getSymbol().getSymbolType();
  }

  bool Variable::getActiveType() const { 
    return getVariableSymbolReference().getSymbol().getActiveTypeFlag();
  }

  const VariableSymbolReference& Variable::getVariableSymbolReference() const { 
    Variable::ConstVertexIteratorPair p(vertices());
    Variable::ConstVertexIterator it(p.first),endIt(p.second);
    for (;it!=endIt ;++it) {
      if ((*it).isSymbol()) { 
	try { 
	  return dynamic_cast<const VariableSymbolReference&>(*it);
	}
	catch(std::bad_cast& e) { 
	  THROW_LOGICEXCEPTION_MACRO("Variable::getVariableSymbolReference: invalid cast of "
				     << (*it).debug().c_str() 
				     << " into a VariableSymbolReference");
	} // end catch
      } 
    }
    THROW_LOGICEXCEPTION_MACRO("Variable::getVariableSymbolReference: no symbol reference availabel");
  } 

  void Variable::setDerivFlag() { 
    myDerivFlag=true;
  } 

  bool Variable::getDerivFlag() const { 
    return myDerivFlag;
  } 

} // end of namespace xaifBooster 
