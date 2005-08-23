#ifndef _XAIFBOOSTERDERIVATIVEPROPAGATORENTRY_INCLUDE_
#define _XAIFBOOSTERDERIVATIVEPROPAGATORENTRY_INCLUDE_
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

#include <list>

#include "xaifBooster/utils/inc/XMLPrintable.hpp"

#include "xaifBooster/system/inc/Variable.hpp"

namespace xaifBooster { 
  class Constant; 
}

using namespace xaifBooster;

namespace xaifBoosterDerivativePropagator { 

  /** 
   * class representing different 
   * versions for y+=[a*x]
   * \todo: The problem with this class is that 
   * it should probably be a union rather than 
   * a base class for the other versions, since 
   * we need to recollect all the information at some 
   * point. The Factor class sort of represents it already.
   */
  class DerivativePropagatorEntry : public XMLPrintable {
  public:

    DerivativePropagatorEntry(const Variable& theTarget);

    ~DerivativePropagatorEntry(){};

    typedef std::list<const Variable*> VariablePList;

    /** 
     * Elements 'a' and 'x' in a*x
     */
    class Factor { 
    public: 
      /**
       * the kind of factor a 
       * in y+=a*x
       */
      enum FactorKind_E {  ZERO_FACTOR,
			   UNIT_FACTOR,
			   CONSTANT_FACTOR,
			   VARIABLE_FACTOR, 
			   NOT_SET};

      Factor() : 
	myFactorKind(NOT_SET),
	mySource_p(0) {
      };

      /** 
       * fix it to ZERO_FACTOR
       */
      void setZero(); 
 
      /** 
       * fix it to UNIT_FACTOR
       */
      void setUnit(); 

      /** 
       * fix it to CONSTANT_FACTOR
       */
      void setConstant(const Constant& theConstant); 

      /** 
       * fix it to VARIABLE_FACTOR
       */
      void setVariable(const Variable& theVariable); 

      FactorKind_E getKind() const;
      const Variable& getVariable() const;
      const Constant& getConstant() const;
      void  setSource(const Variable& theVariable);
      const Variable& getSource() const;

    private: 
      /**
       * this represents the factor 'a'
       * which can be either variable or constant
       */
      union { 
	const Variable* myVariable_p;
	const Constant* myConstant_p;
      } myFactor;
      
      /** 
       * used also as discriminator for myFactor
       */
      FactorKind_E myFactorKind;
      
      /** 
       * this represents the source 'x'
       */
      const Variable* mySource_p;
    };

    typedef std::list<Factor> FactorList;

    /**
     * fill in the list of all a*x 
     * in y+=a*x
     */
    virtual void getFactors(FactorList& theFactorList) const =0; 

    /**
     * returns y from y+=a*x
     */
    const Variable& getTarget() const;

    virtual bool isIncremental() const { return false;}; 

    std::string debug() const;

  private:

    /**
     * no def
     */
    DerivativePropagatorEntry ();

    /**
     * no def
     */
    DerivativePropagatorEntry (const DerivativePropagatorEntry&);

    /**
     * no def
     */
    DerivativePropagatorEntry& operator=(const DerivativePropagatorEntry&);

  protected: 

    /**
     * all versions have a single target
     * but we need this to be a copy
     * \todo: does it really need to be a copy?
     */
    Variable myTarget;

  }; // end of class DerivativePropagatorEntry
 
} // end of namespace
                                                                     
#endif
