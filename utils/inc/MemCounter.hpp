#ifndef _MEMCOUNTER_INCLUDE_
#define _MEMCOUNTER_INCLUDE_
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

//#include "xaifBooster/utils/inc/Debuggable.hpp"

namespace xaifBooster { 

  class MemCounter  {
    private:
    /**
     *  All counters are used to count the number of opperations of their type.
     *  The operations being counted are defined by their name.
     */
    int myIntScalar;
    int myRealScalar;
    int myIntVector;
    int myRealVector;
    int myIntMatrix;
    int myRealMatrix;

	  
  public:

    /**
     * Initializes the values of all counters to 0.
     */
    MemCounter();
    
    MemCounter(const MemCounter&);
    /**
     * Retrieves values from the data structure as specified by the function name.
     */
    int getIntScaValue() const;
    int getRealScaValue() const;
    int getIntVecValue() const;
    int getRealVecValue() const;
    int getIntMatValue() const;
    int getRealMatValue() const;
    
    /**
     * Increments the value of the counter specified by 1.
     */
    void intScaInc();
    void realScaInc();
    void intVecInc();
    void realVecInc();
    void intMatInc();
    void realMatInc();

    void intScaInc(int);
    void realScaInc(int);
    void intVecInc(int);
    void realVecInc(int);
    void intMatInc(int);
    void realMatInc(int);

    /**
     * Calls each counter specific reset function.
     */
    void reset();

    /**
     * Resets the value of the specified counter to 0.
     */
    void intScaReset();
    void realScaReset();
    void intVecReset();
    void realVecReset();
    void intMatReset();
    void realMatReset();

    /**
     * Calls every counter's print function and the Total Print function.
     */
    void print() const;

    /**
     * Prints the value of the specified counter.
     */
    void intScaPrint() const;
    void realScaPrint() const;
    void intVecPrint() const;
    void realVecPrint() const;
    void intMatPrint() const;
    void realMatPrint() const;

    /**
     * Prints out the sum total of all the counters.
     */
    void totalPrint() const;

    /**
     * Overloads the = operator so that two Counter types can be set equal to
     * each other.
     */
    MemCounter& operator=(const MemCounter &p);

     /**
     * Overloads the > operator so that counter1 > counter2 if it has a greater
     * multiply value.  If the nultiply values are equal then counter1 > counter2
     * if it has more additions.
     */
//    bool operator>(const MemCounter &b) const;
    
    /**
     * Overloads the < operator so that counter1 < counter2 if it has a lesser
     * multiply value.  If the nultiply values are equal then counter1 < counter2
     * if it has fewer additions.
     */
//    bool operator<(const MemCounter &b) const;

    /*
     * Overloads the + operator so that counter1 = counter2 + counter3. The add
     * and multiply values are summed up seperatly.
     */
    MemCounter operator+(MemCounter &b);
  }; 
} // end of namespace xaifBooster
                                                                     
#endif

