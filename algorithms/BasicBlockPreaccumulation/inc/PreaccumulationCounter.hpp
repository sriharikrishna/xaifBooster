#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATION_PREACCUMULATIONCOUNTER_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATION_PREACCUMULATIONCOUNTER_INCLUDE_
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

#include "xaifBooster/utils/inc/Debuggable.hpp"
#include <string>

namespace xaifBooster { 

  class PreaccumulationCounter  {
  private:
    
    /**
     *  All counters are used to count the number of opperations of their type.
     *  The operations being counted are defined by their name.
     */
    unsigned int myJacobianEntry;
    unsigned int myMultiply;
    unsigned int myAdd;
    unsigned int myNumDivides;

    /**
     * no def
     */
    PreaccumulationCounter(const PreaccumulationCounter&);
	
    /**
     * no def
     */
    PreaccumulationCounter& operator=(const PreaccumulationCounter&); 

    /** 
     * if this is true we first weigh by number of 
     * Jacobian entries or remainderGraph edges resp. 
     */
    static bool ourJacobianEntrCountIsPrimaryFlag;  

  public:

    static void setJacobianEntrCountIsPrimary();

    /**
     * Initializes the values of all counters to 0.
     */
    PreaccumulationCounter();

    /**
     * Retrieves values from the data structure as specified by the function name.
     */
    unsigned int getJacValue() const;
    unsigned int getMulValue() const;
    unsigned int getAddValue() const;
    unsigned int getDivValue() const;
    
    /**
     * Increments the value of the counter.
     */
    void mulInc(unsigned int by=1);
    /**
     * Increments the value of the counter.
     */
    void jacInc(unsigned int by=1);
    /**
     * Increments the value of the counter.
     */
    void addInc(unsigned int by=1);
    /**
     * Increments the value of the counter.
     */
    void divideInc(unsigned int by=1);

    /**
     * Calls each counter specific reset function.
     */
    void reset();

    /**
     * Resets the value of the specified counter to 0.
     */
    void addReset();
    void mulReset();
    void jacReset();
    void divReset();

    std::string debug() const ;
    
    /**
     * see definition
     */
    bool operator<(const PreaccumulationCounter &anotherCounter) const;

    /**
     * increments this counter by anotherCounter
     */
    void incrementBy(const PreaccumulationCounter &anotherCounter);

  }; 

} // end of namespace xaifBooster
                                                                     
#endif

