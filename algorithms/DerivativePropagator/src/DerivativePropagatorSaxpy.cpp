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

#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/Constant.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorSaxpy.hpp"

using namespace xaifBooster;

namespace xaifBoosterDerivativePropagator { 

  const std::string DerivativePropagatorSaxpy::ourXAIFName("xaif:Saxpy");
  const std::string DerivativePropagatorSaxpy::our_SAX_XAIFName("xaif:Sax");
  const std::string DerivativePropagatorSaxpy::our_myA_XAIFName("xaif:A");
  const std::string DerivativePropagatorSaxpy::our_myX_XAIFName("xaif:X");
  const std::string DerivativePropagatorSaxpy::our_myTarget_XAIFName("xaif:Y");
  const std::string DerivativePropagatorSaxpy::our_myAX_XAIFName("xaif:AX");

  DerivativePropagatorSaxpy::DerivativePropagatorSaxpy(const Variable& theA,
						       const Variable& theX,
						       const Variable& theY) : 
    DerivativePropagatorEntry(theY),
    useAsSaxFlag(false) { 
    AX* theAX_p=new AX();
    myAXPList.push_back(theAX_p);
    Argument* theArgument_p=new Argument();
    theArgument_p->setId(1);
    theAX_p->myA.supplyAndAddVertexInstance(*theArgument_p);
    theA.copyMyselfInto(theArgument_p->getVariable());
    theX.copyMyselfInto(theAX_p->myX);
    theAX_p->myX.setId(1);
    theAX_p->myX.setDerivFlag();
  }

  void DerivativePropagatorSaxpy::addAX(const Variable& theA,
					const Variable& theX) { 
    AX* theAX_p=new AX();
    myAXPList.push_back(theAX_p);
    Argument* theArgument_p=new Argument();
    theArgument_p->setId(1);
    theAX_p->myA.supplyAndAddVertexInstance(*theArgument_p);
    theA.copyMyselfInto(theArgument_p->getVariable());
    theX.copyMyselfInto(theAX_p->myX);
    theAX_p->myX.setId(1);
    theAX_p->myX.setDerivFlag();
  } 

  DerivativePropagatorSaxpy::DerivativePropagatorSaxpy(const Constant& theA,
						       const Variable& theX,
						       const Variable& theY) : 
    DerivativePropagatorEntry(theY),
    useAsSaxFlag(false) { 
    AX* theAX_p=new AX();
    myAXPList.push_back(theAX_p);
    ExpressionVertex& theConstant(theA.createCopyOfMyself());
    theAX_p->myA.supplyAndAddVertexInstance(theConstant);
    theX.copyMyselfInto(theAX_p->myX);
    theAX_p->myX.setId(1);
    theAX_p->myX.setDerivFlag();
  }


  void DerivativePropagatorSaxpy::addAX(const Constant& theA,
					const Variable& theX) { 
    AX* theAX_p=new AX();
    myAXPList.push_back(theAX_p);
    ExpressionVertex& theConstant(theA.createCopyOfMyself());
    theAX_p->myA.supplyAndAddVertexInstance(theConstant);
    theX.copyMyselfInto(theAX_p->myX);
    theAX_p->myX.setId(1);
    theAX_p->myX.setDerivFlag();
  } 
  
  DerivativePropagatorSaxpy::~DerivativePropagatorSaxpy() { 
    for (AXPList::iterator i=myAXPList.begin();
	 i!=myAXPList.end();
	 ++i) 
      if (*i)
	delete *i;
  } 

  void DerivativePropagatorSaxpy::useAsSax() { 
    useAsSaxFlag=true;
  }

  void
  DerivativePropagatorSaxpy::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"; 
    if (useAsSaxFlag) 
      os << our_SAX_XAIFName.c_str();
    else
      os << ourXAIFName.c_str(); 
    os << ">" 
       << std::endl; 
    for (AXPList::const_iterator i=myAXPList.begin();
	 i!=myAXPList.end();
	 ++i) 
      printAXMemberXMLHierarchy(**i,os);
    printMemberXMLHierarchy(myTarget,our_myTarget_XAIFName,os);
    os << pm.indent() 
       << "</";
    if (useAsSaxFlag) 
      os << our_SAX_XAIFName.c_str();
    else
      os << ourXAIFName.c_str(); 
    os << ">" 
       << std::endl;
    pm.releaseInstance();
  } // end of DerivativePropagatorSaxpy::printXMLHierarchy

  void
  DerivativePropagatorSaxpy::printAXMemberXMLHierarchy(const AX& theAX,
						       std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << our_myAX_XAIFName.c_str()
       << ">" 
       << std::endl; 
    printMemberXMLHierarchy(theAX.myA,our_myA_XAIFName,os);
    printMemberXMLHierarchy(theAX.myX,our_myX_XAIFName,os);
    os << pm.indent() 
       << "</"
       << our_myAX_XAIFName.c_str()
       << ">" 
       << std::endl;
    pm.releaseInstance();
  } // end of DerivativePropagatorSaxpy::printXMLHierarchy

  void
  DerivativePropagatorSaxpy::printMemberXMLHierarchy(const Variable& theVariable,
						     const std::string& aName,
						     std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent()
       << "<"
       << aName.c_str() 
       << " "
       << Variable::our_myDerivFlag_XAIFName.c_str()
       << "=\""
       << theVariable.getDerivFlag()
       << "\""
       << ">" 
       << std::endl; 
    theVariable.printXMLHierarchy(os);
    os << pm.indent() 
       << "</"
       << aName.c_str()
       << ">" 
       << std::endl;
    pm.releaseInstance();
  } // end of DerivativePropagatorSaxpy::printXMLHierarchy

  void
  DerivativePropagatorSaxpy::printMemberXMLHierarchy(const Expression& theA,
						     const std::string& aName,
						     std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent()
       << "<"
       << aName.c_str() 
       << ">" 
       << std::endl; 
    theA.printXMLHierarchyImpl(os);
    os << pm.indent() 
       << "</"
       << aName.c_str()
       << ">" 
       << std::endl;
    pm.releaseInstance();
  } // end of DerivativePropagatorSaxpy::printXMLHierarchy

  std::string DerivativePropagatorSaxpy::debug () const { 
    std::ostringstream out;
    out << "DerivativePropagatorSaxpy[" << this 
	<< DerivativePropagatorEntry::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  } // end of DerivativePropagatorSaxpy::debug

  void  DerivativePropagatorSaxpy::getFactors(FactorList& theFactorList) const { 
    for (AXPList::const_iterator i=myAXPList.begin();
	 i!=myAXPList.end();
	 ++i) { 
      // get the Expression
      const Expression& theA((*i)->myA);
      if(theA.numVertices()!=1) 
	THROW_LOGICEXCEPTION_MACRO("DerivativePropagatorSaxpy::getVariables: not defined for factor expressions");
      const ExpressionVertex& theVertex(*(theA.vertices().first));
      Factor aFactor;
      aFactor.setSource((*i)->myX);
      if (theVertex.isArgument()) { 
	aFactor.setVariable(dynamic_cast<const Argument&>(theVertex).getVariable());
	theFactorList.push_back(aFactor);
      }
      else { 
	// This cast shouldn't fail or something else is seriously wrong
	aFactor.setConstant(dynamic_cast<const Constant&>(theVertex));
	theFactorList.push_back(aFactor);
      } 
    }
  } 

  bool DerivativePropagatorSaxpy::isIncremental()const { 
    return !useAsSaxFlag;
  }  

} // end of namespace 
