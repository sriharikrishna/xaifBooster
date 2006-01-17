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
#include <list>
#include <algorithm>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include "xaifBooster/system/inc/GraphVizDisplay.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/VertexElim.hpp"

using namespace MemOpsTradeoffPreaccumulation;

namespace xaifBoosterMemOpsTradeoffPreaccumulation { 

  void VertexElim::forwardMode_v(LinearizedComputationalGraphCopy& theCopy,
				 LinearizedComputationalGraphCopy::VertexPointerList& theOldVertexList,
				 const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
				 const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList){
    
    LinearizedComputationalGraphCopy::VertexPointerList theNewList;
    theNewList.push_back(theOldVertexList.front());
    theOldVertexList = theNewList;

  }// end forwardMode

  void VertexElim::reverseMode_v(LinearizedComputationalGraphCopy& theCopy,
				 LinearizedComputationalGraphCopy::VertexPointerList& theOldVertexList,
				 const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
				 const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList){

    LinearizedComputationalGraphCopy::VertexPointerList theNewList;
    theNewList.push_back(theOldVertexList.back());
    theOldVertexList = theNewList;

  }// end reverseMode

  void VertexElim::markowitzMode_v(LinearizedComputationalGraphCopy& theCopy,
				   LinearizedComputationalGraphCopy::VertexPointerList& theOldVertexList,
				   const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
				   const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList){

    LinearizedComputationalGraphCopy::VertexPointerList theNewList;
    LinearizedComputationalGraphCopy::VertexPointerList::iterator bi=theOldVertexList.begin();
    //push the first element in the list to have something to compare the rest to
    theNewList.push_back(*bi);
    bi++;
    for(; bi != theOldVertexList.end(); bi++) {
        //for each vertex in the list, if the markowitz degree is lower than those in the list, we clear the list
        //and add the vertex.  if the degree is the same as the list, we simply push it into the list
      	if(((theCopy.numInEdgesOf(**bi))*(theCopy.numOutEdgesOf(**bi))) <
	   ((theCopy.numInEdgesOf(*theNewList.front()))*(theCopy.numOutEdgesOf(*theNewList.front())))){
	  theNewList.clear();
	  theNewList.push_back(*bi);
	}// end if
	else if(((theCopy.numInEdgesOf(**bi))*(theCopy.numOutEdgesOf(**bi))) ==
	   ((theCopy.numInEdgesOf(*theNewList.front()))*(theCopy.numOutEdgesOf(*theNewList.front())))){
	  theNewList.push_back(*bi);
	}// end else if
    }// end for
    theOldVertexList = theNewList;
  }// end markowitzMode

  void VertexElim::siblingMode_v(LinearizedComputationalGraphCopy& theCopy,
				 LinearizedComputationalGraphCopy::VertexPointerList& theOldVertexList,
				 const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
				 const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList){

    LinearizedComputationalGraphCopy::VertexPointerList theNewList;
    LinearizedComputationalGraphCopy::VertexPointerList::const_iterator predi, succi;
    LinearizedComputationalGraphCopy::VertexPointerList::iterator bi;
    //iterate through every vertex in the list of intermediates
    for(bi = theOldVertexList.begin(); bi != theOldVertexList.end(); bi++) {
      bool predMatch = false;
      bool succMatch = false;

      //if the vertex has a predecessor in the predlist, set predmatch to true
      LinearizedComputationalGraphCopy::InEdgeIteratorPair inedges (theCopy.getInEdgesOf(**bi));
      LinearizedComputationalGraphCopy::InEdgeIterator ie=inedges.first, iend=inedges.second;
      for(; ie != iend; ++ie){
	for(predi=thePredList.begin(); predi != thePredList.end(); predi++) {
	  if(&theCopy.getSourceOf(*ie) == *predi){
	    predMatch = true;
	    break;
	  }// end if
	}// end for pred list
	if(predMatch){
	  break;
	}// end if
      }// end for candidate inedges
	
      //if there is a predmatch, check for a succmatch.  if there is a match, push the vertyex to the new list
      if(predMatch){
	LinearizedComputationalGraphCopy::OutEdgeIteratorPair outedges (theCopy.getOutEdgesOf(**bi));
	LinearizedComputationalGraphCopy::OutEdgeIterator oe=outedges.first, oend=outedges.second;
	for(; oe != oend; ++oe){
	  for(succi=theSuccList.begin(); succi != theSuccList.end(); succi++) {
	    if(&theCopy.getTargetOf(*oe) == *succi){
	      succMatch = true;
	      break;
	    }// end if
	  }//end for succ list
	  if(succMatch){
	    break;
	  }// end if
	}// end for candidate outedges
      }// end if

      if(predMatch && succMatch){
	theNewList.push_back(*bi);
      }// end if
    }// end for each in old list
    //only change the vertex list if we have found a sibling
    if(theNewList.size() > 0){
      theOldVertexList = theNewList;
    }// end if
  }// end siblingMode

  void VertexElim::sibling2Mode_v(LinearizedComputationalGraphCopy& theCopy,
				  LinearizedComputationalGraphCopy::VertexPointerList& theOldVertexList,
				  const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
				  const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList){

    LinearizedComputationalGraphCopy::VertexPointerList theNewList;
    unsigned int highestdegree = 0;
    LinearizedComputationalGraphCopy::VertexPointerList::const_iterator predi, succi;
    LinearizedComputationalGraphCopy::VertexPointerList::iterator bi;
    for(bi = theOldVertexList.begin(); bi != theOldVertexList.end(); bi++) {
      unsigned int predMatch = 0;
      unsigned int succMatch = 0;

      //find the number of matching predecessors
      LinearizedComputationalGraphCopy::InEdgeIteratorPair inedges (theCopy.getInEdgesOf(**bi));
      LinearizedComputationalGraphCopy::InEdgeIterator ie=inedges.first, iend=inedges.second;
      for(; ie != iend; ++ie){
	for(predi=thePredList.begin(); predi != thePredList.end(); predi++) {
	  if(&theCopy.getSourceOf(*ie) == *predi){
	    predMatch++;
	  }// end if
	}// end for pred list
      }// end for candidate inedges

      //if any preds match, find the number of matching sucessors
      if(predMatch){
	LinearizedComputationalGraphCopy::OutEdgeIteratorPair outedges (theCopy.getOutEdgesOf(**bi));
	LinearizedComputationalGraphCopy::OutEdgeIterator oe=outedges.first, oend=outedges.second;
	for(; oe != oend; ++oe){
	  for(succi=theSuccList.begin(); succi != theSuccList.end(); succi++) {
	    if(&theCopy.getTargetOf(*oe) == *succi){
	      succMatch++;
	    }// end if
	  }//end for succ list
	}// end for candidate outedges
      }// end if

      //if the "sibling degree" is higher than those already in the list, clear the list and push back the vertex
      if(predMatch*succMatch > highestdegree){
	highestdegree = predMatch*succMatch;
	theNewList.clear();
	theNewList.push_back(*bi);
      }// end if
      //if they have the same degree, simply push it to the list
      else if((predMatch*succMatch == highestdegree) && (highestdegree > 0)){
	theNewList.push_back(*bi);
      }// end else if
    }// end for each in old list
    //only change the old list if we have found at least one candidate
    if(theNewList.size() > 0){

      theCopy.sdsum += highestdegree;

      theOldVertexList = theNewList;
    }// end if
  }// end sibling2Mode

  void VertexElim::succPredMode_v(LinearizedComputationalGraphCopy& theCopy,
				  LinearizedComputationalGraphCopy::VertexPointerList& theOldVertexList,
				  const LinearizedComputationalGraphCopy::VertexPointerList& thePredList,
				  const LinearizedComputationalGraphCopy::VertexPointerList& theSuccList){

    LinearizedComputationalGraphCopy::VertexPointerList theNewListSucc, theNewListPred;
    LinearizedComputationalGraphCopy::VertexPointerList::const_iterator predi, succi;
    LinearizedComputationalGraphCopy::VertexPointerList::iterator bi;

    for(bi = theOldVertexList.begin(); bi != theOldVertexList.end(); bi++) {
      bool found = false;
      //search for the vertex in the predlist
      for(predi=thePredList.begin(); (predi != thePredList.end()) && (!found); predi++) {
	if(*bi == *predi){
	  theNewListPred.push_back(*bi);
	  found = true;
	}// end if
      }// end for pred list

      //search for the vertex in the succlist
      for(succi=theSuccList.begin(); (succi != theSuccList.end()) && (!found); succi++) {
	if(*bi == *succi){
	  theNewListSucc.push_back(*bi);
	  found = true;
        }// end if
      }//end for succ list
    }// end for each in old list

    if((thePredList.size() > theSuccList.size()) && (!theNewListSucc.empty())){
      theOldVertexList = theNewListSucc;
      theCopy.spsum += thePredList.size();
    }// end if
    else if((theSuccList.size() > thePredList.size()) && (!theNewListPred.empty())){
      theOldVertexList = theNewListPred;
      theCopy.spsum += theSuccList.size();
    } // end else if
    else if((!theNewListSucc.empty()) || (!theNewListPred.empty())){
      //set the target set to all succs and preds
      theOldVertexList = theNewListPred;
      for(bi = theNewListSucc.begin(); bi != theNewListSucc.end(); bi++){
	theOldVertexList.push_back(*bi);
      }// end for

      if(!theNewListPred.empty()){
	theCopy.spsum += theSuccList.size();
      }// end if
      else{
	theCopy.spsum += thePredList.size();
      }// end else
    }// end else if
    
  }// end succPredMode

} // end of namespace
