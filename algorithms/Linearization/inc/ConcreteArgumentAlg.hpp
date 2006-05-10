#ifndef _XAIFBOOSTERLINEARIZATION_CONCRETEARGUMENTALG_INCLUDE_
#define _XAIFBOOSTERLINEARIZATION_CONCRETEARGUMENTALG_INCLUDE_
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

#include "xaifBooster/system/inc/ConcreteArgumentAlgBase.hpp"

using namespace xaifBooster;

namespace xaifBooster { 
  class ConcreteArgument;
}

namespace xaifBoosterLinearization {  

  /** 
   * class to hold a replaced argument for 
   * cases of enforced conversions between active 
   * and passive types when there is a mismatch 
   * of types between the actual and the formal 
   * argument
   */
  class ConcreteArgumentAlg : public ConcreteArgumentAlgBase {

  public:
    
    ConcreteArgumentAlg(const ConcreteArgument& theContainingConcreteArgument);

    virtual ~ConcreteArgumentAlg();

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    void makeReplacement(const Variable& aVariable);

    bool hasReplacement() const;

    ConcreteArgument& getReplacement();

    bool hasPriorConversionConcreteArgument() const;

    ConcreteArgument& getPriorConversionConcreteArgument();

    void setPriorConversionConcreteArgument(ConcreteArgument& aConcreteArgument);

    bool hasPostConversionConcreteArgument() const;

    ConcreteArgument& getPostConversionConcreteArgument();

    void setPostConversionConcreteArgument(ConcreteArgument& aConcreteArgument);

  private: 

    /** 
     * no def
     */
    ConcreteArgumentAlg();

    /** 
     * no def
     */
    ConcreteArgumentAlg(const ConcreteArgumentAlg&);

    /** 
     * no def
     */
    ConcreteArgumentAlg operator=(const ConcreteArgumentAlg&);

    /** 
     * my replacement, i.e. the converted argument.
     */
    ConcreteArgument* myReplacement_p;

    /** 
     * a reference to the old argument used in the prior conversion
     * we want to keep track of those in case of a later need 
     * to modify them, e.g. for storing/restoring indices
     */
    ConcreteArgument* myPriorConversionConcreteArgument_p;

    /** 
     * a reference to the old argument used in the post conversion
     * we want to keep track of those in case of a later need 
     * to modify them, e.g. for storing/restoring indices
     */
    ConcreteArgument* myPostConversionConcreteArgument_p;
    
  }; // end of class ConcreteArgumentAlg
 
} 
                                                                     
#endif
