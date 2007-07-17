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
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/IndexTriplet.hpp"

namespace xaifBooster { 

  const std::string IndexTriplet::ourXAIFName("xaif:IndexTriplet");
  const std::string IndexTriplet::our_myIndex_XAIFName("xaif:Index");
  const std::string IndexTriplet::our_myBound_XAIFName("xaif:Bound");
  const std::string IndexTriplet::our_myStride_XAIFName("xaif:Stride");

  IndexTriplet::IndexTriplet (){
  }
  
  IndexTriplet::~IndexTriplet(){
    for (IndexPairList::const_iterator i=myIndexPairList.begin();
	 i!=myIndexPairList.end();
	 ++i)
      if ((*i).second)
	delete (*i).second;
  }
  
  void
  IndexTriplet::copyMyselfInto(IndexTriplet& anotherIndexTriplet) const { 
    for (IndexPairList::const_iterator i=myIndexPairList.begin();
	 i!=myIndexPairList.end();
	 ++i) { 
      Expression& theOtherExpression=anotherIndexTriplet.addExpression((*i).first);
      (*i).second->copyMyselfInto(theOtherExpression,false,false);
    }
  }

  std::string IndexTriplet::equivalenceSignature() const { 
    std::ostringstream oss;
    // JU: incomplete: 
    oss << "IndexTriplet::" << std::ends;
    return std::string(oss.str());
  } 

  void IndexTriplet::printXMLHierarchy(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<" 
       << ourXAIFName.c_str() 
       << ">" 
       << std::endl;
    if (hasExpression(IT_INDEX))
      printXMLHierarchyIndexTripletElement(os,getExpression(IT_INDEX),our_myIndex_XAIFName);
    if (hasExpression(IT_BOUND))
      printXMLHierarchyIndexTripletElement(os,getExpression(IT_BOUND),our_myBound_XAIFName);
    if (hasExpression(IT_STRIDE))
      printXMLHierarchyIndexTripletElement(os,getExpression(IT_STRIDE),our_myStride_XAIFName);
    os << pm.indent()
       << "</"
       << ourXAIFName.c_str()
       << ">"
       << std::endl;
    pm.releaseInstance(); 
  } // end IndexTriplet::printXMLHierarchy

  void IndexTriplet::printXMLHierarchyIndexTripletElement(std::ostream& os,
							const Expression& theIndexElement,
							const std::string& theXaifName) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<" 
       << theXaifName.c_str() 
       << ">" 
       << std::endl;
    theIndexElement.printXMLHierarchyImpl(os);
    os << pm.indent() 
       << "</"
       << theXaifName.c_str()
       << ">"
       << std::endl;
    pm.releaseInstance(); 
  } // end of IndexTriplet::printXMLHierarchyIndex

  Expression& IndexTriplet::addExpression(const IndexTriplet::IndexTriplet_E& discriminator) { 
    if (hasExpression(discriminator))
      THROW_LOGICEXCEPTION_MACRO("IndexTriplet::addExpression: already have this"); 
    Expression* anExpression_p=new Expression();
    myIndexPairList.push_back(IndexPair(discriminator,anExpression_p));
    return *anExpression_p;
  } 

  const Expression& IndexTriplet::getExpression(const IndexTriplet::IndexTriplet_E& discriminator) const { 
    IndexPairList::const_iterator i=myIndexPairList.begin();
    for (;
	 i!=myIndexPairList.end();
	 ++i)
      if ((*i).first==discriminator)
	break; 
    if (i==myIndexPairList.end())
      THROW_LOGICEXCEPTION_MACRO("IndexTriplet::getExpression: do not have this");
    return *((*i).second);
  } 

  Expression& IndexTriplet::getExpression(const IndexTriplet::IndexTriplet_E& discriminator) { 
    IndexPairList::iterator i=myIndexPairList.begin();
    for (;
	 i!=myIndexPairList.end();
	 ++i)
      if ((*i).first==discriminator)
	break; 
    if (i==myIndexPairList.end())
      THROW_LOGICEXCEPTION_MACRO("IndexTriplet::getExpression: do not have this");
    return *((*i).second);
  } 
  
  bool IndexTriplet::hasExpression(const IndexTriplet::IndexTriplet_E& discriminator) const { 
    IndexPairList::const_iterator i=myIndexPairList.begin();
    for (;
	 i!=myIndexPairList.end();
	 ++i)
      if ((*i).first==discriminator)
	break; 
    return (i!=myIndexPairList.end());
  } 

  const IndexTriplet::IndexPairList& IndexTriplet::getIndexPairList() const { 
    return myIndexPairList;
  }

} 
