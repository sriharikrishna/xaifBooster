#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"

namespace xaifBooster { 
  
  ConceptuallyStaticInstances* ConceptuallyStaticInstances::ourInstance_p(0);

  ConceptuallyStaticInstances::ConceptuallyStaticInstances() : 
    myCallGraph_p(0),
    myPrintVersion(PrintVersion::VIRTUAL) { 
  }

  ConceptuallyStaticInstances::~ConceptuallyStaticInstances() {
    if (myCallGraph_p)
      delete myCallGraph_p;
  }


  ConceptuallyStaticInstances* 
  ConceptuallyStaticInstances::instance() { 
    if (!ourInstance_p)
      ourInstance_p=new ConceptuallyStaticInstances();
    return ourInstance_p;
  } 

  CallGraph& 
  ConceptuallyStaticInstances::getCallGraph() { 
    if (!myCallGraph_p)
      THROW_LOGICEXCEPTION_MACRO("ConceptuallyStaticInstances::getCallGraph: has not been created");
    return *myCallGraph_p;
  } 

  InlinableIntrinsicsCatalogue& 
  ConceptuallyStaticInstances::getInlinableIntrinsicsCatalogue() { 
    return myInlinableIntrinsicsCatalogue;
  }

  void ConceptuallyStaticInstances::createCallGraph(const std::string& aSchemaInstance,
						    const std::string& anXAIFInstance,
						    const std::string& aSchemaLocation,
						    const std::string& aPrefix) { 
    if (myCallGraph_p)
      THROW_LOGICEXCEPTION_MACRO("ConceptuallyStaticInstances::createCallGraph: already created");
    myCallGraph_p=new CallGraph(aSchemaInstance,
				anXAIFInstance,
				aSchemaLocation,
				aPrefix);
    myNameCreator.setBaseName(aPrefix+"Symbol");
  } 

  PrintVersion::PrintVersion_E 
  ConceptuallyStaticInstances::getPrintVersion() const { 
    return myPrintVersion;
  }

  void ConceptuallyStaticInstances::setPrintVersion(PrintVersion::PrintVersion_E aPrintVersion) { 
    myPrintVersion=aPrintVersion;
  }

  const NameCreator& ConceptuallyStaticInstances::getNameCreator() const { 
    return myNameCreator;
  }

} 

