#include "DerivativePropagator.hpp"
#include "DerivativePropagatorSaxpy.hpp"
#include "DerivativePropagatorSetDeriv.hpp"
#include "DerivativePropagatorZeroDeriv.hpp"
#include "PrintManager.hpp"
#include <sstream>

namespace xaifBooster { 

  const std::string DerivativePropagator::ourXAIFName("xaif:DerivativePropagator");

  DerivativePropagator::~DerivativePropagator(){
    for(EntryList::const_iterator  entryList_iterator= myEntryList.begin();
	entryList_iterator!= myEntryList.end();
	++entryList_iterator)
      if (*entryList_iterator)
	delete *entryList_iterator;
  };

  void
  DerivativePropagator::printXMLHierarchy(std::ostream& os) const { 
    if (!myEntryList.size())
      return;
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent()
       << "<"
       << ourXAIFName 
       << ">" 
       << std::endl; 
    for(EntryList::const_iterator  entryList_iterator= myEntryList.begin();
	entryList_iterator!= myEntryList.end();
	++entryList_iterator)
      (*entryList_iterator)->printXMLHierarchy(os);       
    os << pm.indent() 
       << "</"
       << ourXAIFName
       << ">" 
       << std::endl;
    pm.releaseInstance();
  } // end of DerivativePropagator::printXMLHierarchy

  std::string DerivativePropagator::debug () const { 
    std::ostringstream out;
    out << "DerivativePropagator[" << this 
	<< " #entries=" << myEntryList.size()
	<< "]" << std::ends;  
    return out.str();
  } // end of DerivativePropagator::debug

  const DerivativePropagatorSetDeriv& 
  DerivativePropagator::addSetDerivToEntryList(const BaseVariableReference& theTarget,
					       const BaseVariableReference& theSource) { 
    DerivativePropagatorSetDeriv* theDPSD_p= new DerivativePropagatorSetDeriv(theTarget,
									      theSource);
    myEntryList.push_front(theDPSD_p);
    return *theDPSD_p;
  } 

  DerivativePropagatorSaxpy& DerivativePropagator::addSaxpyToEntryList(const BaseVariableReference& thePartial,
								  const BaseVariableReference& theDependent,
								  const BaseVariableReference& theIndependent) { 
    DerivativePropagatorSaxpy* aSaxpy_p=new DerivativePropagatorSaxpy(thePartial,
								      theDependent,
								      theIndependent);
    myEntryList.push_back(aSaxpy_p);
    return *aSaxpy_p;
  } 

  DerivativePropagatorSaxpy& DerivativePropagator::addSaxpyToEntryList(const Constant& thePartial,
								  const BaseVariableReference& theDependent,
								  const BaseVariableReference& theIndependent) { 
    DerivativePropagatorSaxpy* aSaxpy_p=new DerivativePropagatorSaxpy(thePartial,
								      theDependent,
								      theIndependent);
    myEntryList.push_back(aSaxpy_p);
    return *aSaxpy_p;
  } 

  void DerivativePropagator::addZeroDerivToEntryList(const BaseVariableReference& theTarget) { 
    myEntryList.push_back(new DerivativePropagatorZeroDeriv(theTarget));
  } 

} // end of namespace xaifBooster 
