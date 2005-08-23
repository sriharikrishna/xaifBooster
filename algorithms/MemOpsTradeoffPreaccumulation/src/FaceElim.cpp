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
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include "xaifBooster/system/inc/GraphVizDisplay.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/FaceElim.hpp"

using namespace MemOpsTradeoffPreaccumulation;

namespace xaifBoosterMemOpsTradeoffPreaccumulation { 

  void FaceElim::absorbMode_f(DualGraph& theDual,
			      DualGraph::FacePointerList& theOldFaceList,
			      const DualGraph::VertexPointerList& thePredList,
			      const DualGraph::VertexPointerList& theSuccList,
			      DualGraphVertex* newOrAbsorb){

    DualGraph::FacePointerList theNewFaceList;

    //spath iterates through each path in the list
    DualGraph::PathList::const_iterator spath;
    //svertex iterates through each vertex in the path
    DualGraphPath::Path::iterator svertex;
    DualGraph::FacePointerList::iterator sface;

    for(sface = theOldFaceList.begin(); sface != theOldFaceList.end(); sface++){

      DualGraph::InEdgeIteratorPair die (theDual.getInEdgesOf(theDual.getSourceOf(**sface)));
      DualGraph::InEdgeIterator diei (die.first), die_end (die.second);
      DualGraph::OutEdgeIteratorPair doe (theDual.getOutEdgesOf(theDual.getTargetOf(**sface)));
      DualGraph::OutEdgeIterator doei (doe.first), doe_end (doe.second);
      bool loopcheck = true;

      for(; (diei != die_end) && loopcheck; ++diei){
	if(theDual.numOutEdgesOf(theDual.getSourceOf(*diei)) > 1){
	  for(; (doei != doe_end) && loopcheck; ++doei){
	    if(theDual.numInEdgesOf(theDual.getTargetOf(*doei)) > 1){
	      for(spath = (theDual.myPathList).begin(); (spath != (theDual.myPathList).end()) && loopcheck; spath++){
		for(svertex = ((**spath).myPath).begin(); svertex != ((**spath).myPath).end(); svertex++){
		  if(*svertex == &theDual.getSourceOf(*diei)){
		    //if path contains the vertex, go to next vertex in the path
		    svertex++;
		    //if the next vertex is the source of the face, go to the next path
		    if(*svertex == &theDual.getSourceOf(**sface)){break;}
		    svertex++;
		    if(*svertex == &theDual.getTargetOf(*doei)){
		      theNewFaceList.push_back(*sface);
		      loopcheck = false;
		      break;
		    }// end if succ matches
		    break;
		  }// end if vertex is the pred
		}// end for each vertex in the path
	      }// end for all paths
	    }// end if succ has alternate paths
	  }// end for all out edges
	}// end if pred has alternate path
      }// end for all inedges
    }// end for each face in the old list

    if(!theNewFaceList.empty()){
      theDual.absum++;
      theOldFaceList = theNewFaceList;
    }// end if

  }// end absorbMode_f

} // end of namespace
