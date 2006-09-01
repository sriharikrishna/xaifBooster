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
#include <fstream>
#include <iostream>
#include <utility>
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include "xaifBooster/utils/inc/CommandLineParser.hpp"
#include "xaifBooster/system/inc/XAIFBaseParser.hpp"
#include "xaifBooster/system/inc/InlinableIntrinsicsParser.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/algorithms/Linearization/inc/SubroutineCallAlg.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ControlFlowGraphAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/AddressArithmetic/inc/CallGraphVertexAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/ArgumentSymbolReferenceAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/CallGraphVertexAlg.hpp"
#include "xaifBooster/system/inc/GraphVizDisplay.hpp"//IK

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ReversibleControlFlowGraph.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"


using namespace xaifBooster;

void Usage(char** argv) { 
  std::cout << "test driver: "
	    << argv[0]
	    << " -i <inputFile> -c <intrinsicsCatalogueFile> " << std::endl
	    << "             [-s <pathToSchema> ] defaults to ./" << std::endl
	    << "             [-o <outputFile> ] [-d <debugOutputFile>]" << std::endl
	    << "                 both default to cout" << std::endl
	    << "             [-g <debugGroup]" << std::endl
	    << "                 with debugGroup >=0 the sum of any of: " << DbgGroup::printAll().c_str() << std::endl
	    << "                 default to 0(ERROR)" << std::endl
	    << "             [-S] force statement level preaccumulation" << std::endl
	    << "             [-I] change all argument INTENTs for checkpoints" << std::endl
	    << "             [-v] validate <inputFile> against the schema" << std::endl
	    << "             [-w \"<list of subroutines with wrappers>\" " << std::endl
            << "                 space separated list enclosed in double quotes" << std::endl
	    << "             [-p \"<list of symbols to forcibly passivate>\" " << std::endl
            << "                 space separated list enclosed in double quotes" << std::endl
	    << "             [-r] force renaming of all non-external routines" << std::endl
	    << "             [-u] user decides on all variables violating simple loop restrictions" << std::endl
	    << "             [-U] ignore all variables violating simple loop restrictions" << std::endl
            << "             [-a] dynamically choose graph elimination algorithm" << std::endl
	    << "             [-C] turn on runtime counters"  << std::endl;
} 

/*class CallGraphVertexLabelWriter
{
   public:
    CallGraphVertexLabelWriter(const CallGraph& g) : myG(g) {};
    template <class BoostIntenalVertexDescriptor>
    void operator()(std::ostream& out, const BoostIntenalVertexDescriptor& v) const {
      CallGraphVertex* theCallGraphVertex_p=boost::get(boost::get(BoostVertexContentType(),myG.getInternalBoostGraph()),v);
      std::string theVertexKind;
      std::string theXaifId;
      if (dynamic_cast<ControlFlowGraphVertex*>(theCallGraphVertex_p)->isOriginal()) {
        const xaifBoosterBasicBlockPreaccumulationReverse::CallGraphVertexAlg& va(dynamic_cast<const xaifBoosterBasicBlockPreaccumulationReverse::CallGraphVertexAlg&>(theCallGraphVertex_p->getOriginalVertex().getCallGraphVertexAlgBase()));
        theVertexKind=va.kindToString();
        const CallGraphVertex& v(dynamic_cast<const CallGraphVertex&>(theCallGraphVertex_p->getOriginalVertex()));
        theXaifId=v.getId();

      }
      else {
        const xaifBoosterBasicBlockPreaccumulationReverse::CallGraphVertexAlg& va(dynamic_cast<const xaifBoosterBasicBlockPreaccumulationReverse::CallGraphVertexAlg&>(theCallGraphVertex_p->getNewVertex().getCallGraphVertexAlgBase()));
        theVertexKind=va.kindToString();
        const CallGraphVertex& v(dynamic_cast<const CallGraphVertex&>(theCallGraphVertex_p->getNewVertex()));
        theXaifId=v.getId();
      }
      if (theCallGraphVertex_p->getReversalType()==ForLoopReversalType::EXPLICIT) {
        std::ostringstream temp;
        temp << theXaifId.c_str() << ".e" << std::ends;
        theXaifId=temp.str();
      }
      out << "[label=\"" << boost::get(boost::get(BoostVertexContentType(), myG.getInternalBoostGraph()), v)->getIndex() << " (" << theXaifId.c_str() << "): " << theVertexKind.c_str() << "\"]";
    }
    const CallGraph& myG;
};

class CallGraphEdgeLabelWriter
{
    public:
    CallGraphEdgeLabelWriter(const CallGraph& g) : myG(g) {};
    template <class BoostIntenalEdgeDescriptor>
    void operator()(std::ostream& out, const BoostIntenalEdgeDescriptor& v) const {
      CallGraphEdge* theCallGraphEdge_p=boost::get(boost::get(BoostEdgeContentType(),myG.getInternalBoostGraph()),v);
      if (theCallGraphEdge_p->hasConditionValue() ||
          theCallGraphEdge_p->hasRevConditionValue()) {
        out << "[label=\"";
        if (theCallGraphEdge_p->hasConditionValue())
          out << theCallGraphEdge_p->getConditionValue();
        if (theCallGraphEdge_p->hasRevConditionValue())
          out << "r" << theCallGraphEdge_p->getRevConditionValue();
        out << "\"]";
      }
    }
    const CallGraph& myG;

	
};*/



int main(int argc,char** argv) { 
  DbgLoggerManager::instance()->setSelection(DbgGroup::ERROR 
					     //| DbgGroup::CALLSTACK | DbgGroup::TEMPORARY
					     );
  std::string inFileName, outFileName, intrinsicsFileName, schemaPath;
  // to contain the namespace url in case of -s having a schema location
  std::string aUrl;
  bool forceStatementLevel=false;
  bool intentChange=false;
  bool validateAgainstSchema=false;
  try { 
    CommandLineParser::instance()->initialize("iocdgsSIvwpruUaC",argc,argv);
    inFileName=CommandLineParser::instance()->argAsString('i');
    intrinsicsFileName=CommandLineParser::instance()->argAsString('c');
    if (CommandLineParser::instance()->isSet('s')) 
      schemaPath=CommandLineParser::instance()->argAsString('s');
    if (CommandLineParser::instance()->isSet('o')) 
      outFileName=CommandLineParser::instance()->argAsString('o');
    if (CommandLineParser::instance()->isSet('d')) 
      DbgLoggerManager::instance()->setFile(CommandLineParser::instance()->argAsString('d'));
    if (CommandLineParser::instance()->isSet('g')) 
      DbgLoggerManager::instance()->setSelection(CommandLineParser::instance()->argAsInt('g'));
    if (CommandLineParser::instance()->isSet('S')) 
      forceStatementLevel=true;
    if (CommandLineParser::instance()->isSet('I')) 
      intentChange=true;
    if (CommandLineParser::instance()->isSet('v')) 
      validateAgainstSchema=true;
    if (CommandLineParser::instance()->isSet('w')) 
      xaifBoosterLinearization::SubroutineCallAlg::addWrapperNames(CommandLineParser::instance()->argAsString('w'));
    if (CommandLineParser::instance()->isSet('p')) 
      Symbol::addSymbolNamesToPassivate(CommandLineParser::instance()->argAsString('p'));
    if (CommandLineParser::instance()->isSet('r')) 
      xaifBoosterLinearization::ControlFlowGraphAlg::setForceNonExternalRenames();
    if (CommandLineParser::instance()->isSet('u')) 
      xaifBoosterAddressArithmetic::CallGraphVertexAlg::setUserDecides();
    if (CommandLineParser::instance()->isSet('U')) 
      xaifBoosterAddressArithmetic::CallGraphVertexAlg::setIgnorance();
    if (CommandLineParser::instance()->isSet('a'))
      xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::setAllAlgorithms();
    if (CommandLineParser::instance()->isSet('C'))
    {
     xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::setRuntimeCounters();
     xaifBoosterBasicBlockPreaccumulationReverse::CallGraphVertexAlg::setRuntimeCounters();
    }
  } catch (BaseException& e) { 
    DBG_MACRO(DbgGroup::ERROR,
	      "caught exception: " << e.getReason());
    Usage(argv);
    return -1;
  } // end catch 
  try {   
    DBG_MACRO(DbgGroup::TIMING,"before initialization");
    xaifBoosterBasicBlockPreaccumulationReverse::AlgFactoryManager::instance()->init();
//     DBG_MACRO(DbgGroup::TEMPORARY,
// 	      "t.cpp: " 
// 	      << xaifBoosterBasicBlockPreaccumulationReverse::AlgFactoryManager::instance()->debug().c_str());
    if (forceStatementLevel)
      xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::limitToStatementLevel();
    if (intentChange)
      xaifBoosterBasicBlockPreaccumulationReverse::ArgumentSymbolReferenceAlg::changeIntentForCheckPoints();
    InlinableIntrinsicsParser ip(ConceptuallyStaticInstances::instance()->getInlinableIntrinsicsCatalogue());
    ip.initialize();
    if (schemaPath.size()) { 
      aUrl="http://www.mcs.anl.gov/XAIFInlinableIntrinsics ";
      ip.setExternalSchemaLocation(aUrl+schemaPath+"/xaif_inlinable_intrinsics.xsd");
    } 
    DBG_MACRO(DbgGroup::TIMING,"before intrinsics XAIF parsing");
    ip.parse(intrinsicsFileName);
    XAIFBaseParser p;
    DBG_MACRO(DbgGroup::TIMING,"before input XAIF parsing");
    p.initialize(validateAgainstSchema);
    if (schemaPath.size()) { 
      aUrl="http://www.mcs.anl.gov/XAIF ";
      p.setExternalSchemaLocation(aUrl+schemaPath+"/xaif.xsd");
    } 
    p.parse(inFileName);
    CallGraph& Cg(ConceptuallyStaticInstances::instance()->getCallGraph());
    Cg.getScopeTree().forcedPassivation();
    DBG_MACRO(DbgGroup::TIMING,"before linearize");
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_1); // linearize
    DBG_MACRO(DbgGroup::TIMING,"before flatten");
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_2); // flatten
    DBG_MACRO(DbgGroup::TIMING,"before Jacobian accumulation");
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_3); // accumulate Jacobian
    DBG_MACRO(DbgGroup::TIMING,"before reversal");
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_4); // use linearized version in 1st replacement
    DBG_MACRO(DbgGroup::TIMING,"before unparse");

      //  if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {
    /*GraphVizDisplay::show(Cg,
                          "StaticGraph",
                          CallGraphVertexLabelWriter(Cg),
                          CallGraphEdgeLabelWriter(Cg));*/
      //   }
  
    
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_5); // fix up the addresses in simple loops
    const std::string& oldSchemaLocation(Cg.getSchemaLocation());
    std::string newLocation(oldSchemaLocation,0,oldSchemaLocation.find(' '));
    if (schemaPath.size())
      newLocation.append(" "+schemaPath+"/xaif_output.xsd");
    else 
      newLocation.append(" xaif_output.xsd");
    Cg.resetSchemaLocation(newLocation);
    if (CommandLineParser::instance()->isSet('o')) { 
      std::ofstream theOutFile(CommandLineParser::instance()->argAsString('o').c_str(),
			       std::ios::out);
      Cg.printXMLHierarchy(theOutFile);
      theOutFile.close();
    } 
    else 
      Cg.printXMLHierarchy(std::cout);
  } catch (BaseException& e) { 
    DBG_MACRO(DbgGroup::ERROR,
	      "caught exception: " << e.getReason());
    return -1;
  } // end catch 
  DBG_MACRO(DbgGroup::METRIC,"total number of assignments: "
	    << xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::getAssignmentCounter()
	    << " total number of Sequences: "
	    << xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::getSequenceCounter());
  return 0;
}
  
