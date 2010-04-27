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

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/RemainderGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/RemainderGraphVertex.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/RemainderGraphEdge.hpp"

namespace xaifBoosterBasicBlockPreaccumulation {

  void RemainderGraph::initFrom(const xaifBoosterCrossCountryInterface::Elimination& anElimination) {
    const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& aBaseRemainderGraph(anElimination.getRemainderLCG());
    xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstVertexIteratorPair p(aBaseRemainderGraph.vertices());
    xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstVertexIterator 
      beginIt(p.first), endIt(p.second);
    typedef std::pair<const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex*, const RemainderGraphVertex*> PointerPair;
    typedef std::list<PointerPair> PointerPairList;
    PointerPairList theList; // first original, second copy
    for(; beginIt!=endIt; ++beginIt) {
      RemainderGraphVertex* theCopy_p=new RemainderGraphVertex();
      supplyAndAddVertexInstance(*theCopy_p);
      myRemainderVertexP2OriginalVertexPMap[theCopy_p]=dynamic_cast<const PrivateLinearizedComputationalGraphVertex*>(&(anElimination.rVertex2oVertex(*beginIt)));
      theList.push_back(PointerPair(&(*beginIt), theCopy_p));
    }
    const xaifBoosterCrossCountryInterface::Elimination::RemainderEdge2AccumulationVertexMap&
      theRemainderEdge2AccumulationVertexMap (anElimination.getRemainderEdge2AccumulationVertexMap()); 
    xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstEdgeIteratorPair pe(aBaseRemainderGraph.edges());
    xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstEdgeIterator 
      beginIte(pe.first), endIte(pe.second);
    for(; beginIte!=endIte; ++beginIte) {
      const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex
	*theOriginalSource_p(&(getSourceOf(*beginIte))),
	*theOriginalTarget_p(&(getTargetOf(*beginIte)));
      const RemainderGraphVertex
	*theCopySource_p(0),
	*theCopyTarget_p(0);
      for(PointerPairList::const_iterator li=theList.begin();
	  li!=theList.end()
	    &&
	    !(theCopySource_p&&theCopyTarget_p);
	  ++li) {
	if(!theCopySource_p&&(*li).first==theOriginalSource_p)
	  theCopySource_p=(*li).second;
	if(!theCopyTarget_p&&(*li).first==theOriginalTarget_p)
	  theCopyTarget_p=(*li).second;
      } // end for 
      if(!theCopySource_p|| !theCopyTarget_p)
	THROW_LOGICEXCEPTION_MACRO("RemainderGraph::initFrom: couldn't find source or target");
      RemainderGraphEdge* theCopy=new RemainderGraphEdge();
      supplyAndAddEdgeInstance(*theCopy, *theCopySource_p, *theCopyTarget_p);
      xaifBoosterCrossCountryInterface::Elimination::RemainderEdge2AccumulationVertexMap::const_iterator aMapIt;
      if ((aMapIt=theRemainderEdge2AccumulationVertexMap.find(&(*beginIte)))==theRemainderEdge2AccumulationVertexMap.end()) { 
	THROW_LOGICEXCEPTION_MACRO("RemainderGraph::initFrom: couldn't find remainder edge in map");
      }
      myRemainderEdgeP2AccumulationVertexPMap[theCopy]=aMapIt->second;
      // std::cout << "for " << this << " mapping " << theCopy << " to " <<  aMapIt->second << std::endl; 
    } 
  }

  const PrivateLinearizedComputationalGraphVertex& 
  RemainderGraph::getOriginalVertexFor(const RemainderGraphVertex& aRemainderGraphVertex) const {
    RemainderVertexP2OriginalVertexPMap::const_iterator vertexMapI;
    if ((vertexMapI = myRemainderVertexP2OriginalVertexPMap.find(&aRemainderGraphVertex)) == myRemainderVertexP2OriginalVertexPMap.end()) { 
      THROW_LOGICEXCEPTION_MACRO("RemainderGraph::getOriginalVertexFor: could not find original vertex for remainder graph vertex");
    }
    return *(vertexMapI->second);
  }

  const xaifBoosterCrossCountryInterface::AccumulationGraphVertex& 
  RemainderGraph::getAccumulationGraphVertexFor(const RemainderGraphEdge& aRemainderGraphEdge) const { 
    RemainderEdgeP2AccumulationVertexPMap::const_iterator edgeMapI;
    if ((edgeMapI = myRemainderEdgeP2AccumulationVertexPMap.find(&aRemainderGraphEdge)) == myRemainderEdgeP2AccumulationVertexPMap.end()) { 
      THROW_LOGICEXCEPTION_MACRO("RemainderGraph::getAccumulationVertexFor: " << this << " could not find accumulation vertex for remainder graph edge " << &aRemainderGraphEdge << " in map");
    }
    return *(edgeMapI->second);
  } 

} 

