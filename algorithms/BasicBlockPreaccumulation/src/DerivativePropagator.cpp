#include <sstream>

#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/DerivativePropagator.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/DerivativePropagatorSaxpy.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/DerivativePropagatorSetDeriv.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/DerivativePropagatorZeroDeriv.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  const std::string DerivativePropagator::ourXAIFName("xaif:DerivativePropagator");

  DerivativePropagator::~DerivativePropagator(){
    for(EntryList::const_iterator  entryList_iterator= myEntryList.begin();
	entryList_iterator!= myEntryList.end();
	++entryList_iterator)
      if (*entryList_iterator)
	delete *entryList_iterator;
  };

  void
  DerivativePropagator::printXMLHierarchyImpl(std::ostream& os,
					      const DerivativePropagator& aDerivativePropagator) { 
    if (!aDerivativePropagator.myEntryList.size())
      return;
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent()
       << "<"
       << ourXAIFName 
       << ">" 
       << std::endl; 
    for(EntryList::const_iterator  entryList_iterator= aDerivativePropagator.myEntryList.begin();
	entryList_iterator!= aDerivativePropagator.myEntryList.end();
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
	<< " #entries=" << myEntryList.size()
	<< "]" << std::ends;  
    return out.str();
  } // end of DerivativePropagator::debug

  const DerivativePropagatorSetDeriv& 
  DerivativePropagator::addSetDerivToEntryList(const Variable& theTarget,
					       const Variable& theSource) { 
    DerivativePropagatorSetDeriv* theDPSD_p= new DerivativePropagatorSetDeriv(theTarget,
									      theSource);
    myEntryList.push_front(theDPSD_p);
    return *theDPSD_p;
  } 

  DerivativePropagatorSaxpy& DerivativePropagator::addSaxpyToEntryList(const Variable& thePartial,
								  const Variable& theDependent,
								  const Variable& theIndependent) { 
    DerivativePropagatorSaxpy* aSaxpy_p=new DerivativePropagatorSaxpy(thePartial,
								      theDependent,
								      theIndependent);
    myEntryList.push_back(aSaxpy_p);
    return *aSaxpy_p;
  } 

  DerivativePropagatorSaxpy& DerivativePropagator::addSaxpyToEntryList(const Constant& thePartial,
								  const Variable& theDependent,
								  const Variable& theIndependent) { 
    DerivativePropagatorSaxpy* aSaxpy_p=new DerivativePropagatorSaxpy(thePartial,
								      theDependent,
								      theIndependent);
    myEntryList.push_back(aSaxpy_p);
    return *aSaxpy_p;
  } 

  void DerivativePropagator::addZeroDerivToEntryList(const Variable& theTarget) { 
    myEntryList.push_back(new DerivativePropagatorZeroDeriv(theTarget));
  } 

  const DerivativePropagator::EntryList& DerivativePropagator::getEntryList() const { 
    return myEntryList;
  }

} 
