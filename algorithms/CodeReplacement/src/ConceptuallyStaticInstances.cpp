#include "xaifBooster/algorithms/CodeReplacement/inc/ConceptuallyStaticInstances.hpp"

namespace xaifBoosterCodeReplacement { 
  
  ConceptuallyStaticInstances* ConceptuallyStaticInstances::ourInstance_p(0);

  ConceptuallyStaticInstances::ConceptuallyStaticInstances() : 
    myPrintVersion(PrintVersion::ORIGINAL) {
  }

  ConceptuallyStaticInstances::~ConceptuallyStaticInstances() {
  }


  ConceptuallyStaticInstances* 
  ConceptuallyStaticInstances::instance() { 
    if (!ourInstance_p)
      ourInstance_p=new ConceptuallyStaticInstances();
    return ourInstance_p;
  } 

  PrintVersion::PrintVersion_E 
  ConceptuallyStaticInstances::getPrintVersion() const { 
    return myPrintVersion;
  }

  void ConceptuallyStaticInstances::setPrintVersion(PrintVersion::PrintVersion_E aPrintVersion) { 
    myPrintVersion=aPrintVersion;
  }

} 

