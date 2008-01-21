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
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/ConcreteArgument.hpp"
#include "xaifBooster/system/inc/ConcreteArgumentAlgFactory.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"

namespace xaifBooster { 

  const std::string ConcreteArgument::ourXAIFName("xaif:Argument");
  const std::string ConcreteArgument::our_myPosition_XAIFName("position");

  ConcreteArgument::ConcreteArgument (unsigned int thePosition,
				      bool makeAlgorithm) :
    myPosition(thePosition),
    myKind(UNDEFINED_KIND),
    myArgument_p(0),
    myConstant_p(0) {
    if (makeAlgorithm)
      myConcreteArgumentAlgBase_p=ConcreteArgumentAlgFactory::instance()->makeNewAlg(*this); 
    else 
      myConcreteArgumentAlgBase_p=0;
  }

  ConcreteArgument::~ConcreteArgument(){
    if (myArgument_p)
      delete myArgument_p;
    if (myConstant_p)
      delete myConstant_p;
    if (myConcreteArgumentAlgBase_p)
      delete myConcreteArgumentAlgBase_p;
  }

  ConcreteArgumentAlgBase& 
  ConcreteArgument::getConcreteArgumentAlgBase() const { 
    if (!myConcreteArgumentAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("ConcreteArgument::getConcreteArgumentAlgBase: not set");
    return dynamic_cast<ConcreteArgumentAlgBase&>(*myConcreteArgumentAlgBase_p);
  }

  void
  ConcreteArgument::printXMLHierarchy(std::ostream& os) const { 
    if (myConcreteArgumentAlgBase_p
// 	&& 
// 	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY
	)
      getConcreteArgumentAlgBase().printXMLHierarchy(os);
    else 
      printXMLHierarchyImpl(os);
  }

  void ConcreteArgument::printXMLHierarchyImpl(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str() 
       << " "
       << our_myPosition_XAIFName.c_str()
       << "=\""
       << myPosition
       << "\">" 
       << std::endl; 
    if (isArgument())
      myArgument_p->printXMLHierarchy(os);
    else if (isConstant())
      myConstant_p->printXMLHierarchy(os);
    else { 
      THROW_LOGICEXCEPTION_MACRO("ConcreteArgument::printXMLHierarchyImpl: is not initialized");
    } 
    os << pm.indent()
       << "</"
       << ourXAIFName.c_str()
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end if ConcreteArgument::printXMLHierarchy
  
  std::string ConcreteArgument::debug () const { 
    std::ostringstream out;
    out << "ConcreteArgument[" << this 
	<< ",myKind=" << myKind;
    if (myArgument_p)
      out << ",myArgument_p=" << myArgument_p->debug();
    else 
      out << ",myArgument_p=0";
    if (myConstant_p)
      out << ",myConstant_p=" << myConstant_p->debug();
    else 
      out << ",myConstant_p=0";
    out << "]" << std::ends;  
    return out.str();
  } // end of ConcreteArgument::debug

  unsigned int ConcreteArgument::getPosition() const { 
    return myPosition;
  } 
    
  Argument& 
  ConcreteArgument::getArgument() { 
    if (myKind==UNDEFINED_KIND) { 
      myArgument_p=new Argument(false);
      // there will always be only one
      myArgument_p->setId(1);
      myKind=VARIABLE_KIND;
    }
    else if (myKind==CONSTANT_KIND) { 
      THROW_LOGICEXCEPTION_MACRO("ConcreteArgument::getArgument is a Constant");
    }
    return *myArgument_p;
  } 

  bool ConcreteArgument::isArgument() const {
    if (myKind==UNDEFINED_KIND) { 
      THROW_LOGICEXCEPTION_MACRO("ConcreteArgument::isArgument: is not initialized");
    }
    return  (myKind==VARIABLE_KIND)? true:false;
  } 

  const Argument& 
  ConcreteArgument::getArgument() const { 
    if (myKind==UNDEFINED_KIND) { 
      THROW_LOGICEXCEPTION_MACRO("ConcreteArgument::getArgument: is not initialized");
    }
    else if (myKind==CONSTANT_KIND) { 
      THROW_LOGICEXCEPTION_MACRO("ConcreteArgument::getArgument: is a Constant");
    }
    return *myArgument_p;
  } 

  Constant& 
  ConcreteArgument::makeConstant(const SymbolType::SymbolType_E aType) { 
    if (myKind==UNDEFINED_KIND) { 
      myConstant_p=new Constant(aType,false);
      // there will always be only one
      myConstant_p->setId(1);
      myKind=CONSTANT_KIND;
    }
    else if (myKind==VARIABLE_KIND) { 
      THROW_LOGICEXCEPTION_MACRO("ConcreteArgument::getConstant is an Argument");
    }
    return *myConstant_p;
  } 

  Constant& 
  ConcreteArgument::getConstant() { 
    if (myKind==UNDEFINED_KIND) { 
      THROW_LOGICEXCEPTION_MACRO("ConcreteArgument::getConstant: is not initialized");
    }
    else if (myKind==VARIABLE_KIND) { 
      THROW_LOGICEXCEPTION_MACRO("ConcreteArgument::getConstant: is an Argument");
    }
    return *myConstant_p;
  } 

  bool ConcreteArgument::isConstant() const {
    if (myKind==UNDEFINED_KIND) { 
      THROW_LOGICEXCEPTION_MACRO("ConcreteArgument::isConstant: is not initialized");
    }
    return  (myKind==CONSTANT_KIND)? true:false;
  } 

  const Constant& 
  ConcreteArgument::getConstant() const { 
    if (myKind==UNDEFINED_KIND) { 
      THROW_LOGICEXCEPTION_MACRO("ConcreteArgument::getConstant: is not initialized");
    }
    else if (myKind==VARIABLE_KIND) { 
      THROW_LOGICEXCEPTION_MACRO("ConcreteArgument::getConstant: is an Argument");
    }
    return *myConstant_p;
  } 

  void ConcreteArgument::copyMyselfInto(ConcreteArgument& theTarget) const { 
    if (isArgument()) { 
      getArgument().getVariable().copyMyselfInto(theTarget.getArgument().getVariable());
    } 
    else { 
      Constant& theConstantArg(theTarget.makeConstant(getConstant().getType()));
      theConstantArg.setFromString(getConstant().toString());
      theConstantArg.setFrontEndType(getConstant().getFrontEndType());
    } 
  } 

} // end of namespace xaifBooster 
