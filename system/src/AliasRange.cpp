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
#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include "xaifBooster/system/inc/AliasRange.hpp"

namespace xaifBooster { 
  
  const std::string AliasRange::ourXAIFName("xaif:AliasRange");
  const std::string AliasRange::our_myLowerAddress_XAIFName("from_virtual_address");
  const std::string AliasRange::our_myUpperAddress_XAIFName("to_virtual_address");
  const std::string AliasRange::our_myPartial_XAIFName("partial");

  AliasRange::AliasRange(unsigned int lower,
			 unsigned int upper,
			 bool aPartial): 
    myLowerAddress(lower),
    myUpperAddress(upper),
    myPartial(aPartial){
    // JU: fix this, don't like excception in ctor
    if (lower>upper)
      THROW_LOGICEXCEPTION_MACRO("AliasRange::AliasRange: lower larger than upper");
  } 
 
  std::string AliasRange::debug() const {
    std::ostringstream out;
    out << "AliasRange[" << this 
	<< ", myLowerAddress=" << myLowerAddress
	<< ", myUpperAddress=" << myUpperAddress
	<< ", myPartial=" << myPartial
	<< "]" << std::ends; 
    return out.str();
  } // end of AliasRange::debug
  
  void AliasRange::printXMLHierarchy(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<" 
       << ourXAIFName.c_str() 
       << " " 
       << our_myLowerAddress_XAIFName.c_str()
       << "=\""
       << myLowerAddress
       << "\" " 
       << our_myUpperAddress_XAIFName.c_str()
       << "=\""
       << myUpperAddress
       << "\" " 
       << our_myPartial_XAIFName.c_str()
       << "=\""
       << myPartial
       << "\"/>" 
       << std::endl;
    pm.releaseInstance();
  } 

  unsigned int AliasRange::max() const { 
    return myUpperAddress;
  }

  unsigned int AliasRange::min() const {
    return myLowerAddress;
  }

  void AliasRange::max(unsigned int newUpper) { 
    if (newUpper<myUpperAddress)
      THROW_LOGICEXCEPTION_MACRO("AliasRange::max: lowering of max not permitted");
    myUpperAddress=newUpper;
  }

  void AliasRange::min(unsigned int newLower) {
    if (newLower>myLowerAddress)
      THROW_LOGICEXCEPTION_MACRO("AliasRange::min: raising of min not permitted");
    myLowerAddress=newLower;
  }

  bool AliasRange::sameAs(const AliasRange& theOther) const { 
    if (min()==theOther.min() && 
	max()==theOther.max()) { 
      if (isPartial()!=theOther.isPartial())
	DBG_MACRO(DbgGroup::ERROR,"AliasRange::sameAs: identical ranges with different partial settings");
      return true;
    }
    return false;
  } // end of AliasRange::sameAs

  bool AliasRange::isGreaterThan(const AliasRange& theOther) const { 
    return (max()<theOther.min() ? true:false);
  } // end of AliasRange::isGreaterThan

  bool AliasRange::isContainedIn(const AliasRange& theOther) const { 
    return (max()<=theOther.max() && min()>=theOther.min() ?
	    true:false);
  } // end of AliasRange::isGreaterThan

  bool AliasRange::overlapsWith(const AliasRange& theOther) const { 
    if (((min()<=theOther.max() && max()>theOther.max())
	 || 
	 (max()>=theOther.min() && min()<theOther.min())) 
	&&
	min()!=max())
      return true;
    return false;
  } // end of AliasRange::overlapsWith

  bool AliasRange::bordersWith(const AliasRange& theOther) const { 
    if (min()==theOther.max()+1
	|| 
	max()+1==theOther.min())
      return true;
    return false;
  } // end of AliasRange::bordersWith

  void AliasRange::absorb(const AliasRange& theOther) { 
    if (theOther.min()<min())
      min(theOther.min());
    if (theOther.max()>max())
      max(theOther.max());
  } // end of AliasRange::absorb

  bool AliasRange::isPartial()const { 
    return myPartial;
  }

}
