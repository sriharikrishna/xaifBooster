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

#include <iostream>
#include <sstream>

#include "xaifBooster/utils/inc/LogicException.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PreaccumulationCounter.hpp"

namespace xaifBooster { 
 
  xaifBoosterBasicBlockPreaccumulation::PreaccumulationMetric::PreaccumulationMetric_E
  PreaccumulationCounter::ourPreaccumulationMetric = xaifBoosterBasicBlockPreaccumulation::PreaccumulationMetric::OPERATIONS_METRIC;

  xaifBoosterBasicBlockPreaccumulation::AwarenessLevel::AwarenessLevel_E
  PreaccumulationCounter::ourAwarenessLevel = xaifBoosterBasicBlockPreaccumulation::AwarenessLevel::NO_AWARENESS;

  void
  PreaccumulationCounter::setPreaccumulationMetric(xaifBoosterBasicBlockPreaccumulation::PreaccumulationMetric::PreaccumulationMetric_E aMetric) {
    ourPreaccumulationMetric = aMetric;
  } // end PreaccumulationCounter::setPreaccumulationMetric()

  void
  PreaccumulationCounter::setAwarenessLevel(xaifBoosterBasicBlockPreaccumulation::AwarenessLevel::AwarenessLevel_E anAwarenessLevel) {
    ourAwarenessLevel = anAwarenessLevel;
  } // end PreaccumulationCounter::setAwarenessLevel()

  PreaccumulationCounter::PreaccumulationCounter() : 
    myNumMultiplications(0), 
    myNumAdditions(0),
    myNumDivisions(0),
    myNumSubtractions(0),
    myNumEdges(0),
    myNumNonunitEdges(0),
    myNumNonconstantEdges(0) {
  } // end PreaccumulationCounter::PreaccumulationCounter()
  
  unsigned int PreaccumulationCounter::getNumMultiplications() const {
    return myNumMultiplications;
  } // end PreaccumulationCounter::getNumMultiplications()
  
  unsigned int PreaccumulationCounter::getNumAdditions() const {
    return myNumAdditions;
  } // end PreaccumulationCounter::getNumAdditions()
  
  unsigned int PreaccumulationCounter::getNumDivisions() const {
    return myNumDivisions;
  } // end PreaccumulationCounter::getNumDivisions()
  
  unsigned int PreaccumulationCounter::getNumSubtractions() const {
    return myNumSubtractions;
  } // end PreaccumulationCounter::getNumSubtractions()
  
  unsigned int PreaccumulationCounter::getNumEdges() const {
    return myNumEdges;
  } // end PreaccumulationCounter::getNumEdges()
  
  unsigned int PreaccumulationCounter::getNumNonunitEdges() const {
    return myNumNonunitEdges;
  } // end PreaccumulationCounter::getNumNonunitEdges()
  
  unsigned int PreaccumulationCounter::getNumNonconstantEdges() const {
    return myNumNonconstantEdges;
  } // end PreaccumulationCounter::getNumNonconstantEdges()
  
  void PreaccumulationCounter::numMultiplicationsInc(unsigned int by) {
    myNumMultiplications += by;
  } // end PreaccumulationCounter::numMultiplicationsInc()
  
  void PreaccumulationCounter::numAdditionsInc(unsigned int by) {
    myNumAdditions += by;
  } // end PreaccumulationCounter::numAdditionsInc()
  
  void PreaccumulationCounter::numDivisionsInc(unsigned int by) {
    myNumDivisions += by;
  } // end PreaccumulationCounter::numDivisionsInc()
  
  void PreaccumulationCounter::numSubtractionsInc(unsigned int by) {
    myNumSubtractions += by;
  } // end PreaccumulationCounter::numSubtractionsInc(unsigned int by)
  
  void PreaccumulationCounter::numEdgesInc(unsigned int by) {
    myNumEdges += by;
  } // end PreaccumulationCounter::numEdgesInc()
  
  void PreaccumulationCounter::numNonunitEdgesInc(unsigned int by) {
    myNumNonunitEdges += by;
  } // end PreaccumulationCounter::numNonunitEdgesInc()
  
  void PreaccumulationCounter::numNonconstantEdgesInc(unsigned int by) {
    myNumNonconstantEdges += by;
  } // end PreaccumulationCounter::numNonconstantEdgesInc()
  
  void PreaccumulationCounter::reset() {
    numMultiplicationsReset();
    numAdditionsReset();
    numDivisionsReset();
    numEdgesReset();
    numNonunitEdgesReset();
    numNonconstantEdgesReset();
  }
  
  void PreaccumulationCounter::numMultiplicationsReset() {
    myNumMultiplications = 0;
  } // end PreaccumulationCounter::numMultiplicationsReset()
  
  void PreaccumulationCounter::numAdditionsReset() {
    myNumAdditions = 0;
  } // end PreaccumulationCounter::numAdditionsReset()
  
  void PreaccumulationCounter::numDivisionsReset() {
    myNumDivisions = 0;
  } // end PreaccumulationCounter::numDivisionsReset()
 
  void PreaccumulationCounter::numSubtractionsReset() {
    myNumSubtractions = 0;
  } // end PreaccumulationCounter::numSubtractionsReset()
 
  void PreaccumulationCounter::numEdgesReset() {
    myNumEdges = 0;
  } // end PreaccumulationCounter::numEdgesReset()

  void PreaccumulationCounter::numNonunitEdgesReset() {
    myNumNonunitEdges = 0;
  } // end PreaccumulationCounter::numNonunitEdgesReset()

  void PreaccumulationCounter::numNonconstantEdgesReset() {
    myNumNonconstantEdges = 0;
  } // end PreaccumulationCounter::numNonconstantEdgesReset()
 
  std::string PreaccumulationCounter::debug () const {
    std::ostringstream out;
    out << "PreaccumulationCounter[" << this 
	<< ",Multiplications=" << myNumMultiplications
	<< ",Additions=" << myNumAdditions
	<< ",Divisions=" << myNumDivisions
	<< ",Subtractions=" << myNumSubtractions
	<< ",NumEdges=" << myNumEdges
	<< ",NumNonunitEdges=" << myNumNonunitEdges
	<< ",NumNonconstantEdges=" << myNumNonconstantEdges
	<< "]" << std::ends;
    return out.str();
  } // end of Symbol::debug

  bool PreaccumulationCounter::isMoreScarceThan(const PreaccumulationCounter& anotherCounter) const {
    unsigned int myNumNontrivialEdges, theirNumNontrivialEdges;
    switch (ourAwarenessLevel) {
      case xaifBoosterBasicBlockPreaccumulation::AwarenessLevel::NO_AWARENESS: {
        myNumNontrivialEdges = myNumEdges;
        theirNumNontrivialEdges = anotherCounter.getNumEdges();
        break;
      } // end NO_AWARENESS
      case xaifBoosterBasicBlockPreaccumulation::AwarenessLevel::UNIT_AWARENESS: {
        myNumNontrivialEdges = myNumNonunitEdges;
        theirNumNontrivialEdges = anotherCounter.getNumNonunitEdges();
        break;
      } // end UNIT_AWARENESS
      case xaifBoosterBasicBlockPreaccumulation::AwarenessLevel::CONSTANT_AWARENESS: {
        myNumNontrivialEdges = myNumNonconstantEdges;
        theirNumNontrivialEdges = anotherCounter.getNumNonconstantEdges();
        break;
      } // end CONSTANT_AWARENESS
    } // end switch (ourAwarenessLevel)
    if (myNumNontrivialEdges < theirNumNontrivialEdges)
      return true;
    if (myNumNontrivialEdges > theirNumNontrivialEdges)
      return false;
    // at this point, they are equally scarce
    return hasFewerOpsThan(anotherCounter);
  } // end isMoreScarceThan()

  bool PreaccumulationCounter::hasFewerOpsThan(const PreaccumulationCounter& anotherCounter) const {
    if ((myNumMultiplications + myNumDivisions)
      < (anotherCounter.getNumMultiplications() + anotherCounter.getNumDivisions()))
      return true;
    if ((myNumMultiplications + myNumDivisions)
      > (anotherCounter.getNumMultiplications() + anotherCounter.getNumDivisions()))
      return false;
    // at this point we know that mults+divides are equal
    if ((myNumAdditions + myNumSubtractions)
      < (anotherCounter.getNumAdditions() + anotherCounter.getNumSubtractions()))
      return true;
    if ((myNumAdditions + myNumSubtractions)
      > (anotherCounter.getNumAdditions() + anotherCounter.getNumSubtractions()))
      return false;
    // at this point we know that they are equal in terms of ops
    return isMoreScarceThan(anotherCounter);
  } // end PreaccumulationCounter::hasFewerOpsThan()

  bool PreaccumulationCounter::operator<(const PreaccumulationCounter& anotherCounter) const {
    // this should prevent an infinite loop
    if (*this == anotherCounter)
      return false;
    // at this point we know that they are different in some way (ops, scarcity, or both)
    switch (ourPreaccumulationMetric) {
      case xaifBoosterBasicBlockPreaccumulation::PreaccumulationMetric::SCARCITY_METRIC:
        return this->isMoreScarceThan(anotherCounter);
        break;
      case xaifBoosterBasicBlockPreaccumulation::PreaccumulationMetric::OPERATIONS_METRIC:
        return this->hasFewerOpsThan(anotherCounter);
        break;
      default:
        THROW_LOGICEXCEPTION_MACRO("PreaccumulationCounter::operator<(const PreaccumulationCounter &b): ourPreaccumulationMetric is set to the unknown value "
                                   << xaifBoosterBasicBlockPreaccumulation::PreaccumulationMetric::toString(ourPreaccumulationMetric));
        break;
    } // end switch (ourPreaccumulationMetric)
  }

  bool PreaccumulationCounter::operator==(const PreaccumulationCounter& anotherCounter) const {
    // compare the relevant edge count
    switch (ourAwarenessLevel) {
      case xaifBoosterBasicBlockPreaccumulation::AwarenessLevel::NO_AWARENESS:
        if (this->getNumEdges() != anotherCounter.getNumEdges())
          return false;
        break;
      case xaifBoosterBasicBlockPreaccumulation::AwarenessLevel::UNIT_AWARENESS:
        if (this->getNumNonunitEdges() != anotherCounter.getNumNonunitEdges())
          return false;
        break;
      case xaifBoosterBasicBlockPreaccumulation::AwarenessLevel::CONSTANT_AWARENESS:
        if (this->getNumNonconstantEdges() != anotherCounter.getNumNonconstantEdges())
          return false;
        break;
      default:
        THROW_LOGICEXCEPTION_MACRO("PreaccumulationCounter::operator==(const PreaccumulationCounter& anotherCounter): ourAwarenessLevel is set to the unknown value "
                                   << xaifBoosterBasicBlockPreaccumulation::AwarenessLevel::toString(ourAwarenessLevel));
        break;
    } // end switch (ourAwarenessLevel)

    // compare operations counts
    if ((this->getNumMultiplications() + this->getNumDivisions())
     != (anotherCounter.getNumMultiplications() + anotherCounter.getNumDivisions()))
      return false;
    if ((this->getNumAdditions() + this->getNumSubtractions())
     != (anotherCounter.getNumAdditions() + anotherCounter.getNumSubtractions()))
      return false;
    return true;
  } // end PreaccumulationCounter::operator==()

  void PreaccumulationCounter::incrementBy(const PreaccumulationCounter &anotherCounter) {
    myNumMultiplications += anotherCounter.myNumMultiplications;
    myNumAdditions += anotherCounter.myNumAdditions;
    myNumDivisions += anotherCounter.myNumDivisions;
    myNumSubtractions += anotherCounter.myNumSubtractions;
    myNumEdges += anotherCounter.myNumEdges;
    myNumNonunitEdges += anotherCounter.myNumNonunitEdges;
    myNumNonconstantEdges += anotherCounter.myNumNonconstantEdges;
  } // end PreaccumulationCounter::incrementBy()

} 
