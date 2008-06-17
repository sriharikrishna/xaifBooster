// ========== begin copyright notice ==============
// This file is part of 
// ---------------
// xaifBooster
// ---------------
// Distributed under the BSD license as follows:
// Copyright (c) 2005, The University of Chicago
// All rights materved.
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
// numerical programs repmatented as xml files according 
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
#include "xaifBooster/utils/inc/MemCounter.hpp"
#include <iostream>
#include <sstream>

namespace xaifBooster { 
 
  MemCounter::MemCounter()
  : myIntScalar(0), myRealScalar(0), myIntVector(0), myRealVector(0), myIntMatrix(0), myRealMatrix(0)
  {
  }
  
  int MemCounter::getIntMatValue() const {
    return myIntMatrix;
  }
  
  int MemCounter::getRealMatValue() const {
    return myRealMatrix;
  }

  int MemCounter::getIntVecValue() const {
    return myIntVector;
  }
  
  int MemCounter::getRealVecValue() const {
    return myRealVector;
  }

  int MemCounter::getIntScaValue() const {
    return myIntScalar;
  }
  
  int MemCounter::getRealScaValue() const {
    return myRealScalar;
  }

  void MemCounter::intMatInc() {
    myIntMatrix++;
  }

  void MemCounter::realMatInc() {
    myRealMatrix++;
  }
  
  void MemCounter::intVecInc() {
    myIntVector++;
  }
  
  void MemCounter::realVecInc() {
    myRealVector++;
  }

  void MemCounter::intScaInc() {
    myIntScalar++;
  }

  void MemCounter::realScaInc() {
    myRealScalar++;
  }

  void MemCounter::intScaInc(int count) {
      myIntScalar += count;
  }

  void MemCounter::realScaInc(int count) {
      myRealScalar += count;
  }

  void MemCounter::intVecInc(int count) {
      myIntVector += count;
  }
  
  void MemCounter::realVecInc(int count) {
      myRealVector += count;
  }

  void MemCounter::intMatInc(int count) {
      myIntMatrix += count;
  }
      
  void MemCounter::realMatInc(int count) {
      myRealMatrix += count;
  }
  
  void MemCounter::reset() {
    intScaReset();
    realScaReset();
    intVecReset();
    realVecReset();
    intMatReset();
    realMatReset();
  }
  
  void MemCounter::intMatReset() {
    myIntMatrix = 0;
  }

  void MemCounter::realMatReset() {
    myRealMatrix = 0;
  }
  
  void MemCounter::intVecReset() {
    myIntVector = 0;
  }
  
  void MemCounter::realVecReset() {
    myRealVector = 0;
  }
  
  void MemCounter::intScaReset() {
    myIntScalar = 0;
  }
  
  void MemCounter::realScaReset() {
    myRealScalar = 0;
  }

  std::string MemCounter::debug () const {
    std::ostringstream out;
    out << "Ints Sca=" << myIntScalar
        << " Vec=" << myIntVector
        << " Mat=" << myIntMatrix
        << " Reals Sca=" << myRealScalar
        << " Vec=" << myRealVector
        << " Mat=" << myRealMatrix
        << "]" << std::ends;
    return out.str();
  } // end of Symbol::debug


  void MemCounter::print() const {
    intScaPrint(); 
    realScaPrint();
    intVecPrint();
    realVecPrint(); 
    intMatPrint(); 
    realMatPrint();
    totalPrint();
  }
  
  void MemCounter::intScaPrint() const {
    std::cout << "The number of integer scalars was: " << myIntScalar << std::endl;
  }

  void MemCounter::realScaPrint() const {
    std::cout << "The number of real scalars was: " << myRealScalar << std::endl;
  }
  
  void MemCounter::intVecPrint() const {
    std::cout << "The number of integer vectors was: " << myIntVector << std::endl;
  }

  void MemCounter::realVecPrint() const {
    std::cout << "The number of real vectors was: " << myRealVector << std::endl;
  }
  
  void MemCounter::intMatPrint() const {
    std::cout << "The number of integer matricies was: " << myIntMatrix << std::endl;
  }
  
  void MemCounter::realMatPrint() const {
    std::cout << "The number of real matricies was: " << myRealMatrix << std::endl;
  }

  void MemCounter::totalPrint() const {
    std::cout << "The total number of memory uses was: " << myIntMatrix + myRealMatrix + myIntVector +myRealVector + myIntScalar + myRealScalar << std::endl;
  }
  
  MemCounter& MemCounter::operator=(const MemCounter &in) {
    myIntMatrix = in.myIntMatrix;
    myIntVector = in.myIntVector;
    myIntScalar = in.myIntScalar;
    myRealMatrix = in.myRealMatrix;
    myRealVector = in.myRealVector;
    myRealScalar = in.myRealScalar;
    return *this;    // Return ref for multiple assignment
  }

  

/*  bool Counter::operator>(const Counter &b) const
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
  }*/

  MemCounter MemCounter::operator+(MemCounter &b)
  {
	  MemCounter temp;
	  temp.myIntScalar = myIntScalar + b.myIntScalar;
          temp.myRealScalar = myRealScalar + b.myRealScalar;
	  temp.myIntVector = myIntVector + b.myIntVector;
          temp.myRealVector = myRealVector + b.myRealVector;
	  temp.myIntMatrix = myIntMatrix + b.myIntMatrix;
          temp.myRealMatrix = myRealMatrix + b.myRealMatrix;
	  return temp;
  }
} 
