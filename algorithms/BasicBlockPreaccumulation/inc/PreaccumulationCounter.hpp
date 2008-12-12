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

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/AwarenessLevel.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PreaccumulationMetric.hpp"

namespace xaifBooster { 

  class PreaccumulationCounter  {
  private:
    
    unsigned int myNumMultiplications;
    unsigned int myNumAdditions;
    unsigned int myNumDivisions;
    unsigned int myNumSubtractions;
    unsigned int myNumEdges;
    unsigned int myNumNonunitEdges;
    unsigned int myNumNonconstantEdges;

    /**
     * no def
     */
    PreaccumulationCounter(const PreaccumulationCounter&);
	
    /**
     * no def
     */
    PreaccumulationCounter& operator=(const PreaccumulationCounter&); 

    /// the metric by which we measure the quality of a preaccumulation
    static xaifBoosterBasicBlockPreaccumulation::PreaccumulationMetric::PreaccumulationMetric_E ourPreaccumulationMetric;

    /// the way we measure the scarcity properties of a remainder graph
    static xaifBoosterBasicBlockPreaccumulation::AwarenessLevel::AwarenessLevel_E ourAwarenessLevel;

    bool isMoreScarceThan(const PreaccumulationCounter& anotherCounter) const;
    bool hasFewerOpsThan(const PreaccumulationCounter& anotherCounter) const;

  public:

    /**
     * Initializes the values of all counters to 0.
     */
    PreaccumulationCounter();

    /// defines the metric by which we measure the quality of a preaccumulation
    /** The goal of the preaccumulation is set by a command-line flag.
     *  The current default is to minimize operations (complete preaccumulation).
     */
    static void
    setPreaccumulationMetric(xaifBoosterBasicBlockPreaccumulation::PreaccumulationMetric::PreaccumulationMetric_E aMetric);

    /// defines the way in which we measure the scarcity properties of a remainder graph
    /** The awareness (none/unit/constant) of edge properties is set by a command-line flag.
     *  The current default is to have no awareness (all edges are counted).
     */
    static void
    setAwarenessLevel(xaifBoosterBasicBlockPreaccumulation::AwarenessLevel::AwarenessLevel_E anAwarenessLevel);

    unsigned int getNumMultiplications() const;
    unsigned int getNumAdditions() const;
    unsigned int getNumDivisions() const;
    unsigned int getNumSubtractions() const;
    unsigned int getNumEdges() const;
    unsigned int getNumNonunitEdges() const;
    unsigned int getNumNonconstantEdges() const;
    
    void numMultiplicationsInc(unsigned int by=1);
    void numAdditionsInc(unsigned int by=1);
    void numDivisionsInc(unsigned int by = 1);
    void numSubtractionsInc(unsigned int by = 1);
    void numEdgesInc(unsigned int by = 1);
    void numNonunitEdgesInc(unsigned int by = 1);
    void numNonconstantEdgesInc(unsigned int by = 1);

    /**
     * Calls each counter specific reset function.
     */
    void reset();

    /**
     * Resets the value of the specified counter to 0.
     */
    void numMultiplicationsReset();
    void numAdditionsReset();
    void numDivisionsReset();
    void numSubtractionsReset();
    void numEdgesReset();
    void numNonunitEdgesReset();
    void numNonconstantEdgesReset();

    std::string debug() const ;
    
    /**
     * see definition
     */
    bool operator<(const PreaccumulationCounter& anotherCounter) const;

    bool operator==(const PreaccumulationCounter& anotherCounter) const;

    /**
     * increments this counter by anotherCounter
     */
    void incrementBy(const PreaccumulationCounter &anotherCounter);

  }; 

} // end of namespace xaifBooster
                                                                     
#endif

