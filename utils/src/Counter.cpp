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
#include "xaifBooster/utils/inc/Counter.hpp"
#include <iostream>
#include <sstream>

namespace xaifBooster { 
 
  Counter::Counter()
  : myJacobianEntry(0), myMultiply(0), myAdd(0)
  {
  }

  int Counter::getJacValue() const {
    return myJacobianEntry;
  }
  
  int Counter::getAddValue() const {
    return myAdd;
  }
  
  int Counter::getMulValue() const {
    return myMultiply;
  }
  
  void Counter::jacInc() {
    myJacobianEntry++;
  }
  
  void Counter::addInc() {
    myAdd++;
  }
  
  void Counter::mulInc() {
    myMultiply++;
  }
  
  void Counter::reset() {
    addReset();
    mulReset();
    jacReset();
  }
  
  void Counter::addReset() {
    myAdd = 0;
  }
  
  void Counter::mulReset() {
    myMultiply = 0;
  }
  
  void Counter::jacReset() {
    myJacobianEntry = 0;
  }
  
  std::string Counter::debug () const {
    std::ostringstream out;
    out << "Mults=" << myMultiply
        << " Adds=" << myAdd
        << " Jacs=" << myJacobianEntry
        << "]" << std::ends;
    return out.str();
  } // end of Symbol::debug

  
  void Counter::print() const {
    jacPrint(); 
    addPrint(); 
    mulPrint(); 
    totalPrint();
  }
  
  void Counter::jacPrint() const {
    std::cout << "The number of jacobian entries was: " << myJacobianEntry << std::endl;
  }
  
  void Counter::addPrint() const {
    std::cout << "The number of add operations was: " << myAdd << std::endl;
  }
  
  void Counter::mulPrint() const {
    std::cout << "The number of multiply operations was: " << myMultiply << std::endl;
  }
  
  void Counter::opPrint() const {
    std::cout << "The number of operations was: " << myAdd + myMultiply << std::endl;
  }
  
  void Counter::totalPrint() const {
    std::cout << "The total number of events was: " << myAdd + myJacobianEntry + myMultiply << std::endl;
  }
  
  Counter& Counter::operator=(const Counter &in) {
    myJacobianEntry = in.myJacobianEntry;
    myMultiply = in.myMultiply;
    myAdd = in.myAdd;
    return *this;    // Return ref for multiple assignment
  }

  

  bool Counter::operator>(const Counter &b) const
  { 
    if(this->getMulValue() > b.getMulValue())//check if mults greater
    {
      return true;
    }
    else if(this->getMulValue() < b.getMulValue()) //check if mults less
    {
      return false; 
    } 
    else //mults equal
    {
      if(this->getAddValue() > b.getAddValue()) //check if adds greater
      {
	return true;
      }
      else
      {
	return false;
      }
    }
  }
  
  bool Counter::operator<(const Counter &b) const
  {
    if(this->getMulValue() < b.getMulValue()) //check if mults less
    {
      return true;
    }
    else if(this->getMulValue() > b.getMulValue()) //check if mults greater
    {
      return false;
    }
    else
    {
      if(this->getAddValue() < b.getAddValue()) //check if adds less
      {
        return true;
      }
      else
      {
        return false;
      }
    }
  }

  Counter Counter::operator+(Counter &b)
  {
	  Counter temp;
	  temp.myAdd = myAdd + b.myAdd;
	  temp.myMultiply = myMultiply + b.myMultiply;
	  temp.myJacobianEntry = myJacobianEntry + b.myJacobianEntry;
	  return temp;
  }
} 
