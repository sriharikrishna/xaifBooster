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
#ifndef _HASHTABLE_INCLUDE_
#include "xaifBooster/utils/inc/HashTable.hpp"
#endif 

#include <sstream>
#include "xaifBooster/utils/inc/LogicException.hpp"


namespace xaifBooster { 

  template <class HashTableElement> 
  std::string 
  HashTable<HashTableElement>::debug() const {
    std::ostringstream out;
      out << "HashTable[" << this 
	  << ",#items=" << myHashMap.size() 
	  << "]" << std::ends; 
      return out.str();
  } // end of HashTable::debug

  template <class HashTableElement> 
  const HashTableElement&
  HashTable<HashTableElement>::getElement(const std::string& aKey) const {
    typename InternalHashMapType::const_iterator theFinder=
      myHashMap.find(aKey);
    if(theFinder==myHashMap.end())
      THROW_LOGICEXCEPTION_MACRO("HashTable.getElement: no element with key >" 
			   << aKey.c_str() << "<");
    return (*theFinder).second;
  }

  template <class HashTableElement> 
  HashTableElement&
  HashTable<HashTableElement>::getElement(const std::string& aKey) {
    typename InternalHashMapType::iterator theFinder=
      myHashMap.find(aKey);
    if(theFinder==myHashMap.end())
      THROW_LOGICEXCEPTION_MACRO("HashTable.getElement: no element with key >" 
			   << aKey.c_str() << "<");
    return (*theFinder).second;
  }

  template <class HashTableElement> 
  bool
  HashTable<HashTableElement>::hasElement(const std::string& aKey) const {
    typename InternalHashMapType::const_iterator theFinder=
      myHashMap.find(aKey);
    return (theFinder!=myHashMap.end());
  }

  template <class HashTableElement> 
  void
  HashTable<HashTableElement>::addElement(std::string theKey,
					  const HashTableElement& theElement) { 
    typename InternalHashMapType::iterator myHashMap_iterator=
      myHashMap.find(theKey);
    if (myHashMap_iterator==myHashMap.end()) 
      myHashMap.insert(std::make_pair(theKey,theElement));
    else 
      THROW_LOGICEXCEPTION_MACRO("HashTable::addElement key >" 
			   << theKey.c_str()
			   << "< already exists");
  } // end of HashTable<HashTableElement>::addElement

  template <class HashTableElement> 
  void 
  HashTable<HashTableElement>::removeElement(std::string theKey) { 
    myHashMap.erase(theKey);
  } 

  template <class HashTableElement> 
  const typename HashTable<HashTableElement>::InternalHashMapType& 
  HashTable<HashTableElement>::getInternalHashMap() const { 
    return myHashMap;
  } 

  template <class HashTableElement> 
  typename HashTable<HashTableElement>::InternalHashMapType& 
  HashTable<HashTableElement>::getInternalHashMap() { 
    return myHashMap;
  } 

} // end of namespace
