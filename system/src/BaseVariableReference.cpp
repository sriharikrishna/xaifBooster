#include <sstream>
#include "utils/inc/PrintManager.hpp"
#include "system/inc/BaseVariableReference.hpp"
#include "system/inc/BaseVariableSymbolReference.hpp"

namespace xaifBooster { 

  const std::string BaseVariableReference::our_myKey_XAIFName("alias");
  const std::string BaseVariableReference::our_myDerivFlag_XAIFName("deriv");

  BaseVariableReference::BaseVariableReference() : 
    myDerivFlag(false) { 
  } 

  void 
  BaseVariableReference::copyMyselfInto(BaseVariableReference& theTarget) const { 
    BaseVariableReference::ConstVertexIteratorPair p(vertices());
    BaseVariableReference::ConstVertexIterator beginIt(p.first),endIt(p.second);
    typedef std::pair<const BaseVariableReferenceVertex*, const BaseVariableReferenceVertex*> PointerPair;
    typedef std::list<PointerPair> PointerPairList;
    PointerPairList theList; // first original, second copy
    for (;beginIt!=endIt ;++beginIt) {
      BaseVariableReferenceVertex& theCopy((*beginIt).createCopyOfMyself());
      theTarget.supplyAndAddVertexInstance(theCopy);
      theList.push_back(PointerPair(&(*beginIt),&theCopy));
    }
    BaseVariableReference::ConstEdgeIteratorPair pe=edges();
    BaseVariableReference::ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte) { 
      const BaseVariableReferenceVertex 
	*theOriginalSource_p(&(getSourceOf(*beginIte))), 
	*theOriginalTarget_p(&(getTargetOf(*beginIte)));
      const BaseVariableReferenceVertex 
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
	THROW_LOGICEXCEPTION_MACRO("BaseVariableReference::copyMyselfInto: couldn't find source or target");
      BaseVariableReferenceEdge& theEdge(theTarget.addEdge(*theCopySource_p,
							   *theCopyTarget_p));
      theEdge.setId((*beginIte).getId());
    } // end for 
    if (myAliasActivityMapKey.getKind()==AliasActivityMapKey::NOT_SET)
      THROW_LOGICEXCEPTION_MACRO("BaseVariableReference::copyMyselfInto: myAliasActivityMapKey not initialized for " 
				 << debug().c_str());
    // just use the default assignment which should be good enough
    theTarget.myAliasActivityMapKey=myAliasActivityMapKey;
  } // end of BaseVariableReference::copyMyselfInto

  bool 
  BaseVariableReference::equivalentTo(const BaseVariableReference& rhs) const { 
    if (numEdges()!=rhs.numEdges() ||
	numVertices()!=rhs.numVertices()) 
      // shortcut
      return false;
    return (equivalenceSignature()==rhs.equivalenceSignature());
  } 

  std::string 
  BaseVariableReference::equivalenceSignature() const { 
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
      const BaseVariableReferenceVertex& this_Vertex(*(this_pair.first));
      theSignature << this_Vertex.equivalenceSignature().c_str();
    } 
    theSignature << std::ends;
    return theSignature.str();
  } 

  void
  BaseVariableReference::printXMLHierarchy(std::ostream& os) const { 
    BaseVariableReference::ConstVertexIteratorPair p(vertices());
    BaseVariableReference::ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt)
      (*beginIt).printXMLHierarchy(os);
    BaseVariableReference::ConstEdgeIteratorPair pe=edges();
    BaseVariableReference::ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte) 
      (*beginIte).printXMLHierarchy(os,*this);
  } // end of BaseVariableReference::printXMLHierarchy

  std::string BaseVariableReference::debug () const { 
    std::ostringstream out;
    out << "BaseVariableReference[" << this 
	<< " " << equivalenceSignature().c_str() 
	<< ",myDerivFlag=" << myDerivFlag
	<< "]" << std::ends;  
    return out.str();
  } // end of BaseVariableReference::debug

  AliasActivityMapKey& BaseVariableReference::getAliasActivityMapKey() { 
    return myAliasActivityMapKey;
  } 

  const AliasActivityMapKey& BaseVariableReference::getAliasActivityMapKey() const { 
    return myAliasActivityMapKey;
  }

  const SymbolType::SymbolType_E& BaseVariableReference::getType() const { 
    return getBaseVariableSymbolReference().getSymbol().getSymbolType();
  }

  bool BaseVariableReference::getActiveType() const { 
    return getBaseVariableSymbolReference().getSymbol().getActiveTypeFlag();
  }

  const BaseVariableSymbolReference& BaseVariableReference::getBaseVariableSymbolReference() const { 
    BaseVariableReference::ConstVertexIteratorPair p(vertices());
    BaseVariableReference::ConstVertexIterator it(p.first),endIt(p.second);
    for (;it!=endIt ;++it) {
      if ((*it).isSymbol()) { 
	try { 
	  return dynamic_cast<const BaseVariableSymbolReference&>(*it);
	}
	catch(std::bad_cast& e) { 
	  THROW_LOGICEXCEPTION_MACRO("BaseVariableReference::getBaseVariableSymbolReference: invalid cast of "
				     << (*it).debug().c_str() 
				     << " into a BaseVariableSymbolReference");
	} // end catch
      } 
    }
    THROW_LOGICEXCEPTION_MACRO("BaseVariableReference::getBaseVariableSymbolReference: no symbol reference availabel");
  } 

  void BaseVariableReference::setDerivFlag() { 
    myDerivFlag=true;
  } 

  bool BaseVariableReference::getDerivFlag() const { 
    return myDerivFlag;
  } 

} // end of namespace xaifBooster 
