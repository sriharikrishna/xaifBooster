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
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/system/inc/AliasSet.hpp"
#include "xaifBooster/system/inc/AliasRange.hpp"

namespace xaifBooster { 

  AliasSet::AliasSet() { 
  }

  AliasSet::~AliasSet() { 
    for (AliasRangePList::const_iterator it=myAliasRangePList.begin();
	 it==myAliasRangePList.end();
	 ++it)
      delete (*it);       
  }

  std::string AliasSet::debug() const {
    std::ostringstream out;
    out << "AliasSet[" << this 
	<< "]" << std::ends; 
    return out.str();
  } // end of AliasSet::debug
  
  void AliasSet::printXMLHierarchy(std::ostream& os) const {
    for (AliasRangePList::const_iterator it=myAliasRangePList.begin();
	 it!=myAliasRangePList.end();
	 ++it)
      (*it)->printXMLHierarchy(os);       
  } 

  void AliasSet::addAlias(unsigned int lower,
			  unsigned int upper,
			  bool isPartial) { 
    if (myAliasRangePList.empty()) { 
      myAliasRangePList.push_back(new AliasRange(lower,upper,isPartial));
      return;
    }
    AliasRange theNewRange(lower,upper,isPartial);
    AliasRangePList::iterator it=myAliasRangePList.end();
    --it; // start at the end and point to the last
    while (true) { 
      if (theNewRange.sameAs(**it))
	return;
      if (theNewRange.isGreaterThan(**it)) { 
	// the first one for which it is greater
	if (theNewRange.overlapsWith(**it)
	    || 
	    theNewRange.isContainedIn(**it)) { 
	  if (!(*it)->isPartial() 
	      ||
	      !theNewRange.isPartial())
	    THROW_LOGICEXCEPTION_MACRO("AliasSet::addAlias: overlapping full reference ranges, fix the code");
	  (*it)->absorb(theNewRange);
	  return;
	}
	else if (theNewRange.bordersWith(**it) 
		 &&
		 theNewRange.isPartial() 
		 &&
		 (*it)->isPartial()) { 
	  (*it)->absorb(theNewRange);
	  return;
	}
	else { 
	  // increment iterator by one
	  ++it; 
	  // and insert before it
	  myAliasRangePList.insert(it,new AliasRange(lower,upper,isPartial)); 
	  return;
	}
      }
      else {
	// *theNewRange must be less than **it
	if (it==myAliasRangePList.begin()) { 
	  myAliasRangePList.insert(it,new AliasRange(lower,upper,isPartial)); 
	  // insert before it
	  return;
	}
	--it;
      }
    } 
    // if we haven't returned yet then we are in trouble
    THROW_LOGICEXCEPTION_MACRO("AliasSet::addAlias: problem with insertion");
  } 

  bool AliasSet::sharesAliasWith(const AliasSet& anotherSet) const {
    if (myAliasRangePList.empty() || anotherSet.myAliasRangePList.empty()) { 
      return false;
    }
    AliasRangePList::const_iterator myI=myAliasRangePList.begin();
    AliasRangePList::const_iterator theOtherI=anotherSet.myAliasRangePList.begin();
    while (myI!=myAliasRangePList.end()
	   &&
	   theOtherI!=anotherSet.myAliasRangePList.end()) { 
      // both sets are ordered
      if ((*myI)->isGreaterThan(**theOtherI)) { 
	++theOtherI; 
      }
      else if ((*myI)->overlapsWith(**theOtherI)
	       || 
	       (*myI)->isContainedIn(**theOtherI)
	       ||
	       (*theOtherI)->isContainedIn(**myI)) { 
	return true;
      }
      else  // myI must be less than theOtherI
	++myI;
    }
    return false;
  } 

  bool AliasSet::mustAlias(const AliasSet& anotherSet) const {
    if (myAliasRangePList.size()!=1 
	|| 
	anotherSet.myAliasRangePList.size()!=1) { 
      return false;
    }
    AliasRangePList::const_iterator myI=myAliasRangePList.begin();
    AliasRangePList::const_iterator theOtherI=anotherSet.myAliasRangePList.begin();
    if ((*myI)->isContainedIn(**theOtherI)
	&&
	(*theOtherI)->isContainedIn(**myI)) { 
      return true;
    }
    return false;
  } 
  
  bool AliasSet::subSetOf(const AliasSet& anotherSet) const { 
    // some obvious things first:
    if (myAliasRangePList.empty()) { 
      return true;
    }
    if (anotherSet.myAliasRangePList.empty() 
	&& 
	!myAliasRangePList.empty()) { 
      return false;
    }
    // go through both sets:
    AliasRangePList::const_iterator myI=myAliasRangePList.begin();
    AliasRangePList::const_iterator theOtherI=anotherSet.myAliasRangePList.begin();
    while (myI!=myAliasRangePList.end()
	   &&
	   theOtherI!=anotherSet.myAliasRangePList.end()) { 
      // both sets are ordered
      if ((*myI)->isGreaterThan(**theOtherI)) { 
	++theOtherI; 
      }
      else { 
	if ((*myI)->isContainedIn(**theOtherI)){ 
	  ++myI;
	} 
	else { 
	  return false;
	}
      } 
    }
    return (myI==myAliasRangePList.end());
  }

  const AliasSet::AliasRangePList& AliasSet::getAliasRangePList() const { 
    return myAliasRangePList;
  } 


} // end of namespace
