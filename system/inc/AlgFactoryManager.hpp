#ifndef _ALGFACTORYMANAGER_INCLUDE_
#define _ALGFACTORYMANAGER_INCLUDE_
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

#include "xaifBooster/utils/inc/Mutex.hpp"
#include "xaifBooster/utils/inc/Debuggable.hpp"

namespace xaifBooster { 

class ArgumentAlgFactory;
class ArgumentSymbolReferenceAlgFactory;
class AssignmentAlgFactory;
class BasicBlockAlgFactory;
class BooleanOperationAlgFactory;
class BranchAlgFactory;
class CallGraphAlgFactory;
class CallGraphVertexAlgFactory;
class ConcreteArgumentAlgFactory;
class ConstantAlgFactory;
class ControlFlowGraphAlgFactory;
class ControlFlowGraphVertexAlgFactory;
class EndBranchAlgFactory;
class EndLoopAlgFactory;
class EntryAlgFactory;
class ExitAlgFactory;
class ExpressionAlgFactory;
class ExpressionEdgeAlgFactory;
class ForLoopAlgFactory;
class GotoAlgFactory;
class IfStatementAlgFactory;
class IntrinsicAlgFactory;
class LabelAlgFactory;
class MarkerAlgFactory;
class PreLoopAlgFactory;
class SubroutineCallAlgFactory;

  /** 
   * the singleton class for 
   * setting algorithm factory pointers
   */
  class AlgFactoryManager : public Debuggable { 

  public: 

    static AlgFactoryManager* instance();

    /** 
     * uses reset and the proper 
     * settings from the respective 
     * parent manager(s)
     */
    virtual void init(); 

    /** 
     * set a selection 
     * of factories 
     * overwriting earlier settings 
     * using the reset methods. 
     */
    virtual void resets(); 

    ArgumentAlgFactory* getArgumentAlgFactory() const ;
    ArgumentSymbolReferenceAlgFactory* getArgumentSymbolReferenceAlgFactory() const ;
    AssignmentAlgFactory* getAssignmentAlgFactory() const ;
    BasicBlockAlgFactory* getBasicBlockAlgFactory() const ;
    BooleanOperationAlgFactory* getBooleanOperationAlgFactory() const ;
    BranchAlgFactory* getBranchAlgFactory() const ;
    CallGraphAlgFactory* getCallGraphAlgFactory() const ;
    CallGraphVertexAlgFactory* getCallGraphVertexAlgFactory() const ;
    ConcreteArgumentAlgFactory* getConcreteArgumentAlgFactory() const ;
    ConstantAlgFactory* getConstantAlgFactory() const ;
    ControlFlowGraphAlgFactory* getControlFlowGraphAlgFactory() const ;
    ControlFlowGraphVertexAlgFactory* getControlFlowGraphVertexAlgFactory() const ;
    EndBranchAlgFactory* getEndBranchAlgFactory() const ;
    EndLoopAlgFactory* getEndLoopAlgFactory() const ;
    EntryAlgFactory* getEntryAlgFactory() const ;
    ExitAlgFactory* getExitAlgFactory() const ;
    ExpressionAlgFactory* getExpressionAlgFactory() const ;
    ExpressionEdgeAlgFactory* getExpressionEdgeAlgFactory() const ;
    ForLoopAlgFactory* getForLoopAlgFactory() const ;
    GotoAlgFactory* getGotoAlgFactory() const ;
    IfStatementAlgFactory* getIfStatementAlgFactory() const ;
    IntrinsicAlgFactory* getIntrinsicAlgFactory() const ;
    LabelAlgFactory* getLabelAlgFactory() const ;
    MarkerAlgFactory* getMarkerAlgFactory() const ;
    PreLoopAlgFactory* getPreLoopAlgFactory() const ;
    SubroutineCallAlgFactory* getSubroutineCallAlgFactory() const ;

    virtual std::string debug() const; 

  protected: 
    
    void resetArgumentAlgFactory(ArgumentAlgFactory*);
    void resetArgumentSymbolReferenceAlgFactory(ArgumentSymbolReferenceAlgFactory*);
    void resetAssignmentAlgFactory(AssignmentAlgFactory*);
    void resetBasicBlockAlgFactory(BasicBlockAlgFactory*);
    void resetBooleanOperationAlgFactory(BooleanOperationAlgFactory*);
    void resetBranchAlgFactory(BranchAlgFactory*);
    void resetCallGraphAlgFactory(CallGraphAlgFactory*);
    void resetCallGraphVertexAlgFactory(CallGraphVertexAlgFactory*);
    void resetConcreteArgumentAlgFactory(ConcreteArgumentAlgFactory*);
    void resetConstantAlgFactory(ConstantAlgFactory*);
    void resetControlFlowGraphAlgFactory(ControlFlowGraphAlgFactory*);
    void resetControlFlowGraphVertexAlgFactory(ControlFlowGraphVertexAlgFactory*);
    void resetEndBranchAlgFactory(EndBranchAlgFactory*);
    void resetEndLoopAlgFactory(EndLoopAlgFactory*);
    void resetEntryAlgFactory(EntryAlgFactory*);
    void resetExitAlgFactory(ExitAlgFactory*);
    void resetExpressionAlgFactory(ExpressionAlgFactory*);
    void resetExpressionEdgeAlgFactory(ExpressionEdgeAlgFactory*);
    void resetForLoopAlgFactory(ForLoopAlgFactory*);
    void resetGotoAlgFactory(GotoAlgFactory*);
    void resetIfStatementAlgFactory(IfStatementAlgFactory*);
    void resetIntrinsicAlgFactory(IntrinsicAlgFactory*);
    void resetLabelAlgFactory(LabelAlgFactory*);
    void resetMarkerAlgFactory(MarkerAlgFactory*);
    void resetPreLoopAlgFactory(PreLoopAlgFactory*);
    void resetSubroutineCallAlgFactory(SubroutineCallAlgFactory*);
    
    AlgFactoryManager();

    virtual ~AlgFactoryManager();

    static AlgFactoryManager* ourInstance_p;

    /**
     * the mutex to protect the instance
     */
    static Mutex ourInstanceMutex;

  private: 

    ArgumentAlgFactory* ourArgumentAlgFactory_p;
    ArgumentSymbolReferenceAlgFactory* ourArgumentSymbolReferenceAlgFactory_p;
    AssignmentAlgFactory* ourAssignmentAlgFactory_p;
    BasicBlockAlgFactory* ourBasicBlockAlgFactory_p;
    BooleanOperationAlgFactory* ourBooleanOperationAlgFactory_p;
    BranchAlgFactory* ourBranchAlgFactory_p;
    CallGraphAlgFactory* ourCallGraphAlgFactory_p;
    CallGraphVertexAlgFactory* ourCallGraphVertexAlgFactory_p;
    ConcreteArgumentAlgFactory* ourConcreteArgumentAlgFactory_p;
    ConstantAlgFactory* ourConstantAlgFactory_p;
    ControlFlowGraphAlgFactory* ourControlFlowGraphAlgFactory_p;
    ControlFlowGraphVertexAlgFactory* ourControlFlowGraphVertexAlgFactory_p;
    EndBranchAlgFactory* ourEndBranchAlgFactory_p;
    EndLoopAlgFactory* ourEndLoopAlgFactory_p;
    EntryAlgFactory* ourEntryAlgFactory_p;
    ExitAlgFactory* ourExitAlgFactory_p;
    ExpressionAlgFactory* ourExpressionAlgFactory_p;
    ExpressionEdgeAlgFactory* ourExpressionEdgeAlgFactory_p;
    ForLoopAlgFactory* ourForLoopAlgFactory_p;
    GotoAlgFactory* ourGotoAlgFactory_p;
    IfStatementAlgFactory* ourIfStatementAlgFactory_p;
    IntrinsicAlgFactory* ourIntrinsicAlgFactory_p;
    LabelAlgFactory* ourLabelAlgFactory_p;
    MarkerAlgFactory* ourMarkerAlgFactory_p;
    PreLoopAlgFactory* ourPreLoopAlgFactory_p;
    SubroutineCallAlgFactory* ourSubroutineCallAlgFactory_p;

    /**
     * no def
     */
    AlgFactoryManager(const AlgFactoryManager&);

    /**
     * no def
     */
    AlgFactoryManager& operator=(const AlgFactoryManager&);

  }; // end of class AlgFactoryManager

}

#endif
