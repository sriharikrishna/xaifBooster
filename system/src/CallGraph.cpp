#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"

namespace xaifBooster { 

  const std::string CallGraph::ourXAIFName("xaif:CallGraph");
  const std::string CallGraph::our_mySchemaInstance_XAIFName("xmlns:xsi");
  const std::string CallGraph::our_myXAIFInstance_XAIFName("xmlns:xaif");
  const std::string CallGraph::our_mySchemaLocation_XAIFName("xsi:schemaLocation");
  const std::string CallGraph::our_myProgramName_XAIFName("program_name");
  const std::string CallGraph::our_myPrefix_XAIFName("prefix");

  CallGraph::CallGraph(const std::string& aSchemaInstance,
		       const std::string& anXAIFInstance,
		       const std::string& aSchemaLocation,
		       const std::string& aPrefix) : 
    mySchemaInstance(aSchemaInstance),
    myXAIFInstance(anXAIFInstance),
    mySchemaLocation(aSchemaLocation),
    myPrefix(aPrefix) {
  }

  void
  CallGraph::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str() 
       << " " 
       << our_mySchemaInstance_XAIFName.c_str() 
       << "=\"" 
       << mySchemaInstance.c_str()
       << "\" " 
       << our_myXAIFInstance_XAIFName.c_str() 
       << "=\""
       << myXAIFInstance.c_str()
       << "\" " 
       << our_mySchemaLocation_XAIFName.c_str() 
       << "=\""
       << mySchemaLocation.c_str()
       << "\" " 
       << our_myProgramName_XAIFName.c_str() 
       << "=\""
       << myProgramName.c_str()
       << "\" " 
       << our_myPrefix_XAIFName.c_str() 
       << "=\""
       << myPrefix.c_str()
       << "\">" 
       << std::endl; 
    myScopeTree.printXMLHierarchy(os);
    myAliasMap.printXMLHierarchy(os);
    CallGraph::ConstVertexIteratorPair p(vertices());
    CallGraph::ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt)
      (*beginIt).printXMLHierarchy(os);
    CallGraph::ConstEdgeIteratorPair pe=edges();
    CallGraph::ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte) 
      (*beginIte).printXMLHierarchy(os,
				    *this);
    os << pm.indent()
       << "</"
       << ourXAIFName
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of CallGraph::printXMLHierarchy

  std::string CallGraph::debug () const { 
    std::ostringstream out;
    out << "CallGraph[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of CallGraph::debug

  Scopes& CallGraph::getScopeTree() { 
    return myScopeTree;
  }

  AliasMap& CallGraph::getAliasMap() { 
    return myAliasMap;
  }

  const AliasMap& CallGraph::getAliasMap() const { 
    return myAliasMap;
  }
  
  void CallGraph::setProgramName(const std::string& aProgramName) { 
    myProgramName=aProgramName;
  } 

  const std::string& CallGraph::getSchemaLocation() const { 
    return mySchemaLocation;
  } 

  void CallGraph::resetSchemaLocation(const std::string& aNewLocation) { 
    mySchemaLocation=aNewLocation;
  } 

  const std::string& CallGraph::getPrefix() const { 
    return myPrefix;
  }

} // end of namespace xaifBooster 
