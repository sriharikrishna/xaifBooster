// ========== begin copyright notice ==============
// This file is part of 
// ---------------
// xaifBooster
// ---------------
// Distributed under the BSD license as follows:
// Copyright (c) 2005, The University of Chicago
// All rights reserved.
//
// Redistribution and use in source and binary forms, 
// with or without modification, are permitted provided that the following conditions are met:
//
//    - Redistributions of source code must retain the above copyright notice, 
//      this list of conditions and the following disclaimer.
//    - Redistributions in binary form must reproduce the above copyright notice, 
//      this list of conditions and the following disclaimer in the documentation 
//      and/or other materials provided with the distribution.
//    - Neither the name of The University of Chicago nor the names of its contributors 
//      may be used to endorse or promote products derived from this software without 
//      specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
// OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
// SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
// LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
// General Information:
// xaifBooster is intended for the transformation of 
// numerical programs represented as xml files according 
// to the XAIF schema. It is part of the OpenAD framework. 
// The main application is automatic 
// differentiation, i.e. the generation of code for 
// the computation of derivatives. 
// The following people are the principal authors of the 
// current version: 
// 	Uwe Naumann
//	Jean Utke
// Additional contributors are: 
//	Andrew Lyons
//	Peter Fine
//
// For more details about xaifBooster and its use in OpenAD please visit:
//   http://www.mcs.anl.gov/openad
//
// This work is partially supported by:
// 	NSF-ITR grant OCE-0205590
// ========== end copyright notice ==============
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

  const DerivativePropagatorSetDeriv& 
  DerivativePropagator::addSetDerivToEntryPList(const Variable& theTarget,
						const Variable& theSource,
						EntryPList::iterator& insertBefore) { 
    DerivativePropagatorSetDeriv* theDPSD_p= new DerivativePropagatorSetDeriv(theTarget,
									      theSource);
    myEntryPList.insert(insertBefore,theDPSD_p);
    return *theDPSD_p;
  } 

  DerivativePropagatorSaxpy& DerivativePropagator::addSaxpyToEntryPList(const Variable& thePartial,
									const Variable& theIndependent,
									const Variable& theDependent) {
    DerivativePropagatorSaxpy* aSaxpy_p=new DerivativePropagatorSaxpy(thePartial,
								      theIndependent,
								      theDependent);
    myEntryPList.push_back(aSaxpy_p);
    return *aSaxpy_p;
  } 

  DerivativePropagatorSaxpy& DerivativePropagator::addSaxpyToEntryPList(const Constant& thePartial,
									const Variable& theIndependent,
									const Variable& theDependent) {
    DerivativePropagatorSaxpy* aSaxpy_p=new DerivativePropagatorSaxpy(thePartial,
								      theIndependent,
								      theDependent);
    myEntryPList.push_back(aSaxpy_p);
    return *aSaxpy_p;
  } 

  void DerivativePropagator::addZeroDerivToEntryPList(const Variable& theTarget) { 
    myEntryPList.push_back(new DerivativePropagatorZeroDeriv(theTarget));
  } 

  const DerivativePropagator::EntryPList& DerivativePropagator::getEntryPList() const { 
    return myEntryPList;
  }

  DerivativePropagator::EntryPList& DerivativePropagator::getEntryPList() { 
    return myEntryPList;
  }

} // end of namespace 
