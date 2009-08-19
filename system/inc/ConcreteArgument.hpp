#ifndef _CONCRETEARGUMENT_INCLUDE_
#define _CONCRETEARGUMENT_INCLUDE_
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

#include "xaifBooster/utils/inc/XMLPrintable.hpp"

#include "xaifBooster/system/inc/ObjectWithAnnotation.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/Constant.hpp"
#include "xaifBooster/system/inc/ConcreteArgumentAlgBase.hpp"

namespace xaifBooster { 

  /**
   * this class represents a concrete 
   * argument in a SubroutineCall.
   * Note the restriction that 
   * concrete arguments are always 
   * lvalues or literal constants.
   * The front-end achieves this through 
   * canonicalization.
   */
  class ConcreteArgument: public XMLPrintable, 
			  public ObjectWithAnnotation { 
  public:
    
    ConcreteArgument (unsigned int thePosition,
		      bool makeAlgorithm=true);

    ~ConcreteArgument();

    virtual void printXMLHierarchy(std::ostream& os) const;
    void printXMLHierarchyImpl(std::ostream& os) const;

    std::string debug() const ;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for member myPosition as represented in XAIF schema
     */
    static const std::string our_myPosition_XAIFName;

    /**
     * get algorithm
     */
    ConcreteArgumentAlgBase& getConcreteArgumentAlgBase() const;
                                                                                
    unsigned int getPosition() const;
    
    bool isArgument() const;

    Argument& getArgument();

    const Argument& getArgument() const ;

    bool isConstant() const;

    Constant& getConstant();

    const Constant& getConstant() const ;

    Constant& makeConstant(const SymbolType::SymbolType_E aType);

    /** 
     * copy
     * the 'deep' argument refers to the AST  
     * i.e. deep=true means 'a[i]' is copied as 'a[i]'
     * while deep=false means 'a[i]' is copied as 'a'
     */
    void copyMyselfInto(ConcreteArgument& theTarget, 
			bool deep=true) const;

  private:
    
    /**
     * no def
     */
    ConcreteArgument();

    /**
     * position of this argument in the argument list of 
     * a subroutine
     */
    unsigned int myPosition;

    enum ConcreteArgumentKind_E{ UNDEFINED_KIND=0,
				 VARIABLE_KIND=1,
				 CONSTANT_KIND=2 };

    /** 
     * the kind of this argument
     * determined by the first call 
     * to the non-const version of 
     * getArgument or getConstant
     */
    ConcreteArgumentKind_E myKind;

    /**
     * the actual concrete argument is a variable
     */
    Argument* myArgument_p;

    /**
     * the actual concrete argument is a constant
     */
    Constant* myConstant_p;

    /**
     * this will be set to point a dynamically instance
     * during construction and deleted during
     * destruction
     */
    ConcreteArgumentAlgBase* myConcreteArgumentAlgBase_p;

  }; // end of class ConcreteArgument

} // end of namespace xaifBooster
                                                                     
#endif
