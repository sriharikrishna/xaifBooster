#include "xaifBooster/system/inc/InlinableIntrinsicsCatalogue.hpp"

namespace xaifBooster { 

  const std::string InlinableIntrinsicsCatalogue::ourXAIFName("xaifii:InlinableIntrinsicDefinitions");

  InlinableIntrinsicsCatalogue::InlinableIntrinsicsCatalogue(){
    
  }

  InlinableIntrinsicsCatalogue::~InlinableIntrinsicsCatalogue(){
    // JU need to implement the deletion
  }

  InlinableIntrinsicsCatalogueItem& 
  InlinableIntrinsicsCatalogue::addCatalogueItem(const std::string& theKey,
						 const std::string& theNumberOfArguments) { 
    unsigned int theArgNumber(atoi(theNumberOfArguments.c_str()));
    InlinableIntrinsicsCatalogueItem* theItem_p=new InlinableIntrinsicsCatalogueItem(theArgNumber);
    myHashTable.addElement(theKey,
			   theItem_p);
    return *theItem_p;
  }

  const InlinableIntrinsicsCatalogueItem& 
  InlinableIntrinsicsCatalogue::getElement(const std::string& theKey) const { 
    return *(myHashTable.getElement(theKey));
  } 

} 
