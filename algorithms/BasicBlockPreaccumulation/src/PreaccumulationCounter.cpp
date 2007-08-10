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

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PreaccumulationCounter.hpp"

namespace xaifBooster { 
 
  bool PreaccumulationCounter::ourJacobianEntrCountIsPrimaryFlag=false;

  void PreaccumulationCounter::setJacobianEntrCountIsPrimary() { 
    ourJacobianEntrCountIsPrimaryFlag=true;
  } 

  PreaccumulationCounter::PreaccumulationCounter() : 
    myJacobianEntry(0), 
    myMultiply(0), 
    myAdd(0),
    myNumDivides(0),
    myNumReroutings(0) {
  }
  
  unsigned int PreaccumulationCounter::getJacValue() const {
    return myJacobianEntry;
  }
  
  unsigned int PreaccumulationCounter::getAddValue() const {
    return myAdd;
  }
  
  unsigned int PreaccumulationCounter::getMulValue() const {
    return myMultiply;
  }
  
  void PreaccumulationCounter::jacInc(unsigned int by) {
    myJacobianEntry+=by;
  }
  
  void PreaccumulationCounter::addInc(unsigned int by) {
    myAdd+=by;
  }
  
  void PreaccumulationCounter::mulInc(unsigned int by) {
    myMultiply+=by;
  }
  
  void PreaccumulationCounter::divideInc(unsigned int by) {
    myNumDivides+=by;
  }
  
  void PreaccumulationCounter::reroutingInc(unsigned int by) {
    myNumReroutings+=by;
  }
  
  void PreaccumulationCounter::reset() {
    addReset();
    mulReset();
    jacReset();
    divReset();
    rerReset();
  }
  
  void PreaccumulationCounter::addReset() {
    myAdd = 0;
  }
  
  void PreaccumulationCounter::mulReset() {
    myMultiply = 0;
  }
  
  void PreaccumulationCounter::jacReset() {
    myJacobianEntry = 0;
  }
  
  void PreaccumulationCounter::divReset() {
    myNumDivides = 0;
  }
  
  void PreaccumulationCounter::rerReset() {
    myNumReroutings = 0;
  }
  
  std::string PreaccumulationCounter::debug () const {
    std::ostringstream out;
    out << "PreaccumulationCounter["
	<< this 
	<< ",Mults=" << myMultiply
	<< ",Adds=" << myAdd
	<< ",Jacs=" << myJacobianEntry
	<< ",Divisions=" << myNumDivides
	<< ",Reroutings=" << myNumReroutings
	<< "]" << std::ends;
    return out.str();
  } // end of Symbol::debug
  
  bool PreaccumulationCounter::operator<(const PreaccumulationCounter &b) const {
    if (ourJacobianEntrCountIsPrimaryFlag) { 
      // this is the case when we in reverse mode 
      // and we store the Jacobian entries 
      // os they are much more costly 
      if(this->getJacValue() < b.getJacValue())
	return true;
      else if(this->getJacValue() > b.getJacValue()) 
	return false;
      else { 
	if(this->getMulValue() < b.getMulValue()) 
	  return true;
	else if(this->getMulValue() > b.getMulValue()) 
	  return false;
	else {
	  if(this->getAddValue() < b.getAddValue()) 
	    return true;
	  else 
	    return false;
	}
      }
    }
    else { 
      // we are in forward mode and don't store the 
      // jacobian entries and rather count them simply as multiplications
      if((this->getMulValue() + this->getJacValue()) < (b.getMulValue() + this->getJacValue())) {
	return true;
      }
      else if((this->getMulValue() + this->getJacValue()) > (b.getMulValue() + this->getJacValue())) {
	return false;
      }
      else {
	if(this->getAddValue() < b.getAddValue()) {
	  return true;
	}
	else {
	  return false;
	}
      }
    }
  }

  void PreaccumulationCounter::incrementBy(const PreaccumulationCounter &anotherCounter) {
    PreaccumulationCounter temp;
    myAdd +=  anotherCounter.myAdd;
    myMultiply += anotherCounter.myMultiply;
    myJacobianEntry += anotherCounter.myJacobianEntry;
    myNumDivides += anotherCounter.myNumDivides;
    myNumReroutings += anotherCounter.myNumReroutings;
  }

} 
