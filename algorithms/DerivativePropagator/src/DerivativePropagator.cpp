#include <sstream>

#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagator.hpp"
#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorSaxpy.hpp"
#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorSetDeriv.hpp"
#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorZeroDeriv.hpp"

using namespace xaifBooster;

namespace xaifBoosterDerivativePropagator { 

  const std::string DerivativePropagator::ourXAIFName("xaif:DerivativePropagator");

  DerivativePropagator::~DerivativePropagator(){
    for(EntryPList::const_iterator  entryList_iterator= myEntryPList.begin();
	entryList_iterator!= myEntryPList.end();
	++entryList_iterator)
      if (*entryList_iterator)
	delete *entryList_iterator;
  }

  void
  DerivativePropagator::printXMLHierarchyImpl(std::ostream& os,
					      const DerivativePropagator& aDerivativePropagator) { 
    if (!aDerivativePropagator.myEntryPList.size())
      return;
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent()
       << "<"
       << ourXAIFName 
       << ">" 
       << std::endl; 
    for(EntryPList::const_iterator  entryList_iterator= aDerivativePropagator.myEntryPList.begin();
	entryList_iterator!= aDerivativePropagator.myEntryPList.end();
	++entryList_iterator)
      (*entryList_iterator)->printXMLHierarchy(os);       
    os << pm.indent() 
       << "</"
       << ourXAIFName
       << ">" 
       << std::endl;
    pm.releaseInstance();
  } // end of DerivativePropagator::printXMLHierarchyImpl

  void
  DerivativePropagator::printXMLHierarchy(std::ostream& os) const { 
    printXMLHierarchyImpl(os,*this);
  } // end of DerivativePropagator::printXMLHierarchy

  std::string DerivativePropagator::debug () const { 
    std::ostringstream out;
    out << "DerivativePropagator[" << this 
	<< " #entries=" << myEntryPList.size()
	<< "]" << std::ends;  
    return out.str();
  } // end of DerivativePropagator::debug

  const DerivativePropagatorSetDeriv& 
  DerivativePropagator::addSetDerivToEntryPList(const Variable& theTarget,
						const Variable& theSource) { 
    DerivativePropagatorSetDeriv* theDPSD_p= new DerivativePropagatorSetDeriv(theTarget,
									      theSource);
    myEntryPList.push_front(theDPSD_p);
    return *theDPSD_p;
  } 

  DerivativePropagatorSaxpy& DerivativePropagator::addSaxpyToEntryPList(const Variable& thePartial,
									const Variable& theDependent,
									const Variable& theIndependent) { 
    DerivativePropagatorSaxpy* aSaxpy_p=new DerivativePropagatorSaxpy(thePartial,
								      theDependent,
								      theIndependent);
    myEntryPList.push_back(aSaxpy_p);
    return *aSaxpy_p;
  } 

  DerivativePropagatorSaxpy& DerivativePropagator::addSaxpyToEntryPList(const Constant& thePartial,
									const Variable& theDependent,
									const Variable& theIndependent) { 
    DerivativePropagatorSaxpy* aSaxpy_p=new DerivativePropagatorSaxpy(thePartial,
								      theDependent,
								      theIndependent);
    myEntryPList.push_back(aSaxpy_p);
    return *aSaxpy_p;
  } 

  void DerivativePropagator::addZeroDerivToEntryPList(const Variable& theTarget) { 
    myEntryPList.push_back(new DerivativePropagatorZeroDeriv(theTarget));
  } 

  const DerivativePropagator::EntryPList& DerivativePropagator::getEntryPList() const { 
    return myEntryPList;
  }

} // end of namespace 
