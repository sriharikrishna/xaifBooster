//let's begin by assuming we have the edge we want to remove...
//so we need to:
//1. find all edges that go to j^@
//2. make all edges that don't goto j now goto j
//3. make them have the right value
#include <sstream>
#include<iterator>
#include<iostream.h>
#include "xaifBooster/system/inc/Argument.hpp"

#include "xaifBooster/system/inc/Intrinsic.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

#include "xaifBooster/system/inc/ExpressionEdge.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdge.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ExpressionEdgeAlg.hpp"
#include "xaifBooster/algorithms/Linearization/inc/IntrinsicAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/ConstantFolding/inc/EnhancedPrivateLinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/ConstantFolding/inc/EnhancedPrivateLinearizedComputationalGraphEdge.hpp"
#include "xaifBooster/algorithms/ConstantFolding/inc/EnhancedPrivateLinearizedComputationalGraphVertex.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"

using namespace xaifBooster;

namespace xaifBoosterConstantFolding {

  void EnhancedPrivateLinearizedComputationalGraph::back_elim(EnhancedPrivateLinearizedComputationalGraphEdge& e) {
    cout<<"back_elim";
    //1.find all i' depen i but not a depend of j
    //2.do the mult
    //3.find all i' depn j, and depend i
    //4.do the math
    EnhancedPrivateLinearizedComputationalGraphVertex& vo = (dynamic_cast 
<EnhancedPrivateLinearizedComputationalGraphVertex&>( getTargetOf(e)));
    EnhancedPrivateLinearizedComputationalGraphVertex& vi = (dynamic_cast 
<EnhancedPrivateLinearizedComputationalGraphVertex&>( getSourceOf(e)));
    EnhancedPrivateLinearizedComputationalGraph::InEdgeIteratorPair vii(getInEdgesOf(vi));
    EnhancedPrivateLinearizedComputationalGraph::InEdgeIterator currentEdge=vii.first,endEdge=vii.second;
    bool alreadyconnected;
    for(;currentEdge!=endEdge;++currentEdge) {
      alreadyconnected=false;
      EnhancedPrivateLinearizedComputationalGraphVertex& viii= (dynamic_cast 
<EnhancedPrivateLinearizedComputationalGraphVertex&>( getSourceOf(*currentEdge)));
      EnhancedPrivateLinearizedComputationalGraph::OutEdgeIteratorPair viiio (getOutEdgesOf(viii));
      EnhancedPrivateLinearizedComputationalGraph::OutEdgeIterator nowEdge=viiio.first,thenEdge=viiio.second;
      EnhancedPrivateLinearizedComputationalGraphEdge* conn1;
      EnhancedPrivateLinearizedComputationalGraphEdge* conn2;
      for(;nowEdge!=thenEdge;++nowEdge) {
        if(&vo == &(dynamic_cast <EnhancedPrivateLinearizedComputationalGraphVertex&>( getTargetOf(*nowEdge)))) {
          alreadyconnected=true;
          conn2 = &(dynamic_cast <EnhancedPrivateLinearizedComputationalGraphEdge&>( *nowEdge));
        }
        if(&vi == &(dynamic_cast <EnhancedPrivateLinearizedComputationalGraphVertex&>( getTargetOf(*nowEdge)))) {
          conn1 = &(dynamic_cast <EnhancedPrivateLinearizedComputationalGraphEdge&>( *nowEdge));
        }
      }

      xaifBoosterLinearization::ExpressionEdgeAlg* tempee1;
      Assignment* tempAssignment1;
      Expression* tempExpression1;

      xaifBoosterLinearization::ExpressionEdgeAlg* tempee2;
      Assignment* tempAssignment2;
      Expression* tempExpression2; 

      if(!e.isUnitExpressionEdge()) {
        if (e.hasConstantFoldedAssignment()) {
          tempAssignment1=e.getConstantFoldedAssignment();
          tempExpression1=&(tempAssignment1->getRHS());
        }
        else {
          tempee1 =  
&(dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>(e.getLinearizedExpressionEdge().getExpressionEdgeAlgBase()));      
          //      ExpressionEdge* tempee1=e.getLinearizedExpressionEdge ();
          tempAssignment1=(&(*tempee1).getConcretePartialAssignment());
          tempExpression1=(&(*tempAssignment1).getRHS());
        }
      }
      else {
	tempExpression1=new Expression();
      }
      if (!(*conn1).isUnitExpressionEdge()) {
        if((*conn1).hasConstantFoldedAssignment()) {
          tempAssignment2=(*conn1).getConstantFoldedAssignment();
          tempExpression2=&(tempAssignment2->getRHS());
        }
        else {
          tempee2 =  
&(dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>((*conn1).getLinearizedExpressionEdge().getExpressionEdgeAlgBase())); 
          //    ExpressionEdge tempee2=conn1.getLinearizedExpressionEdge ();
          tempAssignment2=&((*tempee2).getConcretePartialAssignment ());
          tempExpression2=&((*tempAssignment2).getRHS());
        }
      }
      else {
	tempExpression2=new Expression();
      }
      if(alreadyconnected) {
        Expression* Expression3;
        Assignment* Assignment3;
        if ((*conn2).hasConstantFoldedAssignment()) {
          Assignment3 = (*conn2).getConstantFoldedAssignment();
          Expression3= &(Assignment3->getRHS());
        }
        else {
          xaifBoosterLinearization::ExpressionEdgeAlg& tempee3 =  
dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>((*conn2).getLinearizedExpressionEdge().getExpressionEdgeAlgBase()); 
          //    ExpressionEdge tempee3=conn2.getLinearizedExpressionEdge ();
          Assignment& tempAssignment3=tempee3.getConcretePartialAssignment ();
          Expression3= &(tempAssignment3.getRHS());
        }
        //find maximal vertex (Ie: vertex that has no out edges)
        Expression::VertexIteratorPair vit3 ((*Expression3).vertices());
        Expression::VertexIterator startVertex3=vit3.first,endVertex3=vit3.second;
        ExpressionVertex* v3;
        for (;startVertex3!=endVertex3;++startVertex3) {
          if((*Expression3).numOutEdgesOf((dynamic_cast <ExpressionVertex&>( *startVertex3)))==0) {
            v3 = &(dynamic_cast <ExpressionVertex&>( *startVertex3));
          }
        }
        Intrinsic* I1 = (new Intrinsic ("mul_scal_scal"));
        (*I1).setId((*Expression3).getNextVertexId());
        Intrinsic* I2 = (new Intrinsic ("add_scal_scal"));
        (*I2).setId((*Expression3).getNextVertexId());
        (*tempExpression1).copyMyselfInto(*Expression3,false,true);
        (*tempExpression2).copyMyselfInto(*Expression3,false,true);
        (*Expression3).supplyAndAddVertexInstance(*I1);
        (*Expression3).supplyAndAddVertexInstance(*I2);

          //find maximal vertex (Ie: vertex that has no out edges)
        Expression::VertexIteratorPair vit ((*Expression3).vertices());
        Expression::VertexIterator startVertex =vit.first,endVertex =vit.second;
        ExpressionVertex* v;
        for (;startVertex!=endVertex;++startVertex) {
          if((*Expression3).numOutEdgesOf((dynamic_cast <ExpressionVertex&>( *startVertex)))==0 && (&(*startVertex)) != v3) {
            v = &(dynamic_cast <ExpressionVertex&>( *startVertex));
            break;
          }
        }

        //find maximal vertex (Ie: vertex that has no out edges)
        Expression::VertexIteratorPair vit2 ((*Expression3).vertices());
        Expression::VertexIterator startVertex2=vit2.first, endVertex2=vit2.second;
        ExpressionVertex* v2;
        for (;startVertex2!=endVertex2;++startVertex2) {
          if((*Expression3).numOutEdgesOf((dynamic_cast <ExpressionVertex&>( *startVertex2)))==0 &&  (&(*startVertex2)) != v 
&& (&(*startVertex2)) != v3) {
            v2 = &(dynamic_cast <ExpressionVertex&>( *startVertex2));
            break;
          }
        }
        ExpressionEdge& ExpresE1=(*Expression3).addEdge(*I1,*I2);
        ExpresE1.setId((*Expression3).getNextEdgeId());
        ExpressionEdge& ExpresE2=(*Expression3).addEdge(*v3,*I2);
        ExpresE2.setId((*Expression3).getNextEdgeId());
        ExpressionEdge& ExpresE3=(*Expression3).addEdge(*v,*I1);
        ExpresE3.setId((*Expression3).getNextEdgeId());
        ExpressionEdge& ExpresE4=(*Expression3).addEdge(*v2,*I1);
        ExpresE4.setId((*Expression3).getNextEdgeId());
      }
      else {
        EnhancedPrivateLinearizedComputationalGraphEdge* E2 = new EnhancedPrivateLinearizedComputationalGraphEdge();
        Assignment* Assignment3 = new Assignment(true);
        Expression* Expression3 =(new Expression());
        Intrinsic* I= (new Intrinsic("mul_scal_scal"));
        (*I).setId((*Expression3).getNextVertexId());
        //set the intrinsic as a vertex
        (*Expression3).supplyAndAddVertexInstance(*I);
        (*tempExpression1).copyMyselfInto((*Expression3),true,false);
        (*tempExpression2).copyMyselfInto((*Expression3),true,false);

        //find maximal vertex (Ie: vertex that has no out edges)
        Expression::VertexIteratorPair vit ((*Expression3).vertices());
        Expression::VertexIterator startVertex =vit.first,endVertex =vit.second;
        ExpressionVertex* v;
        for (;startVertex!=endVertex;++startVertex) {
          if((*Expression3).numOutEdgesOf((dynamic_cast <ExpressionVertex&>( *startVertex)))==0) {
            v = &(dynamic_cast <ExpressionVertex&>( *startVertex));
            break;
          }
        }

        //find maximal vertex (Ie: vertex that has no out edges)
        Expression::VertexIteratorPair vit2 ((*Expression3).vertices());
        Expression::VertexIterator startVertex2=vit2.first, endVertex2=vit2.second;
        ExpressionVertex* v2;
        for (;startVertex2!=endVertex2;++startVertex2) {
          if((*Expression3).numOutEdgesOf((dynamic_cast <ExpressionVertex&>( *startVertex2)))==0 && (&(*startVertex2)) != v) {
            v2 = &(dynamic_cast <ExpressionVertex&>( *startVertex2));
            break;
          }
        }

        ExpressionEdge& ExpresE1=(*Expression3).addEdge(*v,*I);
        ExpresE1.setId((*Expression3).getNextEdgeId());
        ExpressionEdge& ExpresE2=(*Expression3).addEdge(*v2,*I);
        ExpresE2.setId((*Expression3).getNextEdgeId());

        //connect the two previously maximal vertices to the intrinsic, so that it can now be the new maximal vertex.
        //Insert the Expression into the Edge  //ADDASSIGNMENTSTUFFHERE

//	  theDelayVertex_p->getVariable().copyMyselfInto(theReplacementAssignment.getLHS());theDelayVertex_p->getVariable().copyMyselfInto(theReplacementAssignment.getLHS());

          // make a temporary Variable on the RHS:
          Argument* theDelayVertex_p=new Argument();
          theDelayVertex_p->setId(1);
          // add it to the RHS of the temp assignment
//          Assignment3->getRHS().supplyAndAddVertexInstance(*theDelayVertex_p);
          // set the alias key to temporary:
          theDelayVertex_p->getVariable().getAliasMapKey().setTemporary();
          theDelayVertex_p->getVariable().getDuUdMapKey().setTemporary();
          // get the global scope
          Scope& theGlobalScope(ConceptuallyStaticInstances::instance()->
                                getCallGraph().getScopeTree().getGlobalScope());
          // create a new symbol and add a new VariableSymbolReference in the Variable
          VariableSymbolReference* theNewVariableSymbolReference_p=
            new VariableSymbolReference(theGlobalScope.
                                        getSymbolTable().
                                        addUniqueAuxSymbol(SymbolKind::VARIABLE,
                                                           SymbolType::REAL_STYPE, 
                                                           SymbolShape::SCALAR,
                                                           false),
                                        theGlobalScope);
          theNewVariableSymbolReference_p->setId("1");
          theDelayVertex_p->getVariable().
            supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
  	  Expression3->copyMyselfInto(Assignment3->getRHS(),false,false);
 	  theDelayVertex_p->getVariable().copyMyselfInto(Assignment3->getLHS());
        (*E2).setConstantFoldedAssignment((*Assignment3));
        supplyAndAddEdgeInstance(*E2,viii,vo);
        //              new edge(viii,vo,conn1*e);
      }
    }
    cout<<"end of back elim\n";
  }
  
  void EnhancedPrivateLinearizedComputationalGraph::front_elim(EnhancedPrivateLinearizedComputationalGraphEdge& e) {
    cout<<"front_elim";
    //1.find all j such that j depend j' but i not depen j'/
    //2.do the mult
    //3.find all j such that j depend j' and i depend i'
    //4.do the math...
    EnhancedPrivateLinearizedComputationalGraphVertex& vo= (dynamic_cast 
<EnhancedPrivateLinearizedComputationalGraphVertex&>(getTargetOf(e)));
    EnhancedPrivateLinearizedComputationalGraphVertex& vi= (dynamic_cast 
<EnhancedPrivateLinearizedComputationalGraphVertex&>(getSourceOf(e))) ;
    EnhancedPrivateLinearizedComputationalGraphEdge *conn1;
    EnhancedPrivateLinearizedComputationalGraph::OutEdgeIteratorPair voo (getOutEdgesOf(vo));
    EnhancedPrivateLinearizedComputationalGraph::OutEdgeIterator currentEndOutEdge=voo.first,finalEndOutEdge=voo.second;
    //      EnhancedPrivateLinearizedComputationalGraphVertex& v (dynamic_cast <EnhancedPrivateLinearizedComputationalGraphVertex&>( *currentVertex));
    //      EnhancedPrivateLinearizedComputationalGraphEdge& e (dynamic_cast <EnhancedPrivateLinearizedComputationalGraphEdge&>( *currentEdge));
    //      xaifBoosterLinearization::ExpressionEdgeAlg& tempee1 = dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>(e.getLinearizedExpressionEdge().getExpressionEdgeAlgBase());      
    bool alreadyconnected;
    for(;currentEndOutEdge!=finalEndOutEdge;++currentEndOutEdge) {
      alreadyconnected=false;
      EnhancedPrivateLinearizedComputationalGraph::OutEdgeIteratorPair vio (getOutEdgesOf(vi));
      EnhancedPrivateLinearizedComputationalGraph::OutEdgeIterator currentStartEdge=vio.first, finalStartEdge=vio.second;
      for(;currentStartEdge!=finalStartEdge;++currentStartEdge) {
        EnhancedPrivateLinearizedComputationalGraphEdge& startEdge =(dynamic_cast <EnhancedPrivateLinearizedComputationalGraphEdge&>( *currentStartEdge));
        EnhancedPrivateLinearizedComputationalGraphEdge& endEdge =(dynamic_cast <EnhancedPrivateLinearizedComputationalGraphEdge&>( *currentEndOutEdge));
        if(&getTargetOf(startEdge)==&getTargetOf(endEdge)) {
          alreadyconnected=true;
          conn1 = &(dynamic_cast <EnhancedPrivateLinearizedComputationalGraphEdge&>( startEdge)); 
        }
      }   


      xaifBoosterLinearization::ExpressionEdgeAlg* tempee1;
      Assignment* tempAssignment1;
      Expression* tempExpression1;

      xaifBoosterLinearization::ExpressionEdgeAlg* tempee2;
      Assignment* tempAssignment2;
      Expression* tempExpression2;

      if(!e.isUnitExpressionEdge()) {
        if (e.hasConstantFoldedAssignment()) {
          tempAssignment1=e.getConstantFoldedAssignment();
          tempExpression1=&(tempAssignment1->getRHS());
        }
        else {
          tempee1 =  &(dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>(e.getLinearizedExpressionEdge().getExpressionEdgeAlgBase()));      
          //      ExpressionEdge* tempee1=e.getLinearizedExpressionEdge ();
          tempAssignment1=&((*tempee1).getConcretePartialAssignment());
          tempExpression1=&((*tempAssignment1).getRHS());
        }
      }
      EnhancedPrivateLinearizedComputationalGraphEdge& conn2 = dynamic_cast <EnhancedPrivateLinearizedComputationalGraphEdge&> 
(*currentEndOutEdge);
      if (!(conn2.isUnitExpressionEdge())) {
        if (conn2.hasConstantFoldedAssignment()) {
          tempAssignment2=conn2.getConstantFoldedAssignment();
          tempExpression2=&(tempAssignment2->getRHS());
        }
        else {
          tempee2 =  
&(dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>((conn2).getLinearizedExpressionEdge().getExpressionEdgeAlgBase())); 
          //    ExpressionEdge tempee2=conn1.getLinearizedExpressionEdge ();
          tempAssignment2=&((*tempee2).getConcretePartialAssignment ());
          tempExpression2=&((*tempAssignment2).getRHS());
        }
      }
      
      
      //      xaifBoosterLinearization::ExpressionEdgeAlg& tempee1 =  
dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>(e.getLinearizedExpressionEdge().getExpressionEdgeAlgBase());
      //      ExpressionEdge tempee1=e.getLinearizedExpressionEdge ();
      //      Assignment& tempassignment1=tempee1.getConcretePartialAssignment ();
      //      Expression& tempExpression1=tempassignment1.getRHS();

      //      xaifBoosterLinearization::ExpressionEdgeAlg& tempee2 =  
dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>((dynamic_cast <EnhancedPrivateLinearizedComputationalGraphEdge&>( 
*currentEndOutEdge)).getLinearizedExpressionEdge().getExpressionEdgeAlgBase());
      //   ExpressionEdge tempee2=voo.first*.getLinearizedExpressionEdge ();
      //      Assignment& tempassignment2=tempee2.getConcretePartialAssignment ();
      //      Expression& tempExpression2=tempassignment2.getRHS();
      Expression* Expression3;
      Assignment* Assignment3;
      if(alreadyconnected) {
        if ((*conn1).hasConstantFoldedAssignment()) {
          Assignment3 = (*conn1).getConstantFoldedAssignment();
          Expression3 = &(Assignment3->getRHS());
        }
        else {
          xaifBoosterLinearization::ExpressionEdgeAlg& tempee3 =  
dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>((*conn1).getLinearizedExpressionEdge().getExpressionEdgeAlgBase());
          //    ExpressionEdge tempee3=conn1.getLinearizedExpressionEdge ();
          Assignment& tempassignment3=tempee3.getConcretePartialAssignment ();
          Expression3=&(tempassignment3.getRHS());
        }
        //find maximal vertex (Ie: vertex that has no out edges)
        Expression::VertexIteratorPair vit3((*Expression3).vertices());
        Expression::VertexIterator startVertex3=vit3.first;
        Expression::VertexIterator endVertex3=vit3.second;
        ExpressionVertex* v3;

        for (;startVertex3!=endVertex3;++startVertex3) {
          if((*Expression3).numOutEdgesOf(*startVertex3)==0) {
            v3 = &(dynamic_cast <ExpressionVertex&>( *startVertex3));
            break;
          }
        }
        Intrinsic* I1 = new Intrinsic("mul_scal_scal");
        (*I1).setId((*Expression3).getNextVertexId());
        Intrinsic* I2 = new Intrinsic("add_scal_scal");
        (*I2).setId((*Expression3).getNextVertexId());
        (*tempExpression1).copyMyselfInto(*Expression3,true,false);
        (*tempExpression2).copyMyselfInto(*Expression3,true,false);
        (*Expression3).supplyAndAddVertexInstance(*I1);
        (*Expression3).supplyAndAddVertexInstance(*I2);

        //find maximal vertex (Ie: vertex that has no out edges)
        Expression::VertexIteratorPair vit((*Expression3).vertices());
        Expression::VertexIterator startVertex=vit.first,endVertex=vit.second;
        ExpressionVertex* v;
        for (;startVertex!=endVertex;++startVertex) {
          if((*Expression3).numOutEdgesOf(*startVertex)==0 && (&(*startVertex)) != v3) {
            v = &(dynamic_cast <ExpressionVertex&>( *startVertex));
            break;
          }
        }

        //find maximal vertex (Ie: vertex that has no out edges)
        Expression::VertexIteratorPair vit2((*Expression3).vertices());
        Expression::VertexIterator startVertex2=vit2.first;
        Expression::VertexIterator endVertex2=vit2.second;
        ExpressionVertex* v2;
        for (;startVertex3!=endVertex2;++startVertex2) {
          if((*Expression3).numOutEdgesOf(*startVertex2)==0 && (&(*startVertex2)) != v3 && (&(*startVertex2)) != v) {
            v2 = &(dynamic_cast <ExpressionVertex&>( *startVertex2));
            break;
          }
        }

        ExpressionEdge& ExpresE1=(*Expression3).addEdge(*I1,*I2);
        ExpresE1.setId((*Expression3).getNextEdgeId());
        ExpressionEdge& ExpresE2=(*Expression3).addEdge(*v3,*I2);
        ExpresE2.setId((*Expression3).getNextEdgeId());
        ExpressionEdge& ExpresE3=(*Expression3).addEdge(*v,*I1);
        ExpresE3.setId((*Expression3).getNextEdgeId());
        ExpressionEdge& ExpresE4=(*Expression3).addEdge(*v2,*I1);
        ExpresE4.setId((*Expression3).getNextEdgeId());
        //      conn1+=voo.first*e;
      }
      else {
        EnhancedPrivateLinearizedComputationalGraphEdge* E2 = new EnhancedPrivateLinearizedComputationalGraphEdge();
	Assignment* Assignment3 = new Assignment(true);
        Expression* Expression3 = (new Expression());
        Intrinsic* I = new Intrinsic("mul_scal_scal");
        (*I).setId((*Expression3).getNextVertexId());
        //set the intrinsic as a vertex
        (*Expression3).supplyAndAddVertexInstance(*I);
        (*tempExpression1).copyMyselfInto(*Expression3,true,false);
        (*tempExpression2).copyMyselfInto(*Expression3,true,false);

        //find maximal vertex (Ie: vertex that has no out edges)
        Expression::VertexIteratorPair vit((*Expression3).vertices());
        Expression::VertexIterator startVertex=vit.first,endVertex=vit.second;
        ExpressionVertex* v;
        for (;startVertex!=endVertex;++startVertex) {
          if((*Expression3).numOutEdgesOf(*startVertex)==0) {
            v = &(dynamic_cast <ExpressionVertex&>( *startVertex));
          }
        }

        //find maximal vertex (Ie: vertex that has no out edges)
        Expression::VertexIteratorPair vit2((*Expression3).vertices());
        Expression::VertexIterator startVertex2=vit2.first;
        Expression::VertexIterator endVertex2=vit2.second;
        ExpressionVertex* v2;
        for (;startVertex2!=endVertex2;++startVertex2) {
          if((*Expression3).numOutEdgesOf(*startVertex2)==0  && (&(*startVertex2)) != v) {
            v2 = &(dynamic_cast <ExpressionVertex&>( *startVertex2));
          }
        }

        ExpressionEdge& ExpresE1=(*Expression3).addEdge(*v,*I);
        ExpresE1.setId((*Expression3).getNextEdgeId());
        ExpressionEdge& ExpresE2=(*Expression3).addEdge(*v2,*I);
        ExpresE2.setId((*Expression3).getNextEdgeId());
        //connect the two previously maximal vertices to the intrinsic, so that it can now be the new maximal vertex.
        //Insert the Expression into the Edge  //add ASSIGNMENTSTUFF here

          // make a temporary Variable on the RHS:
          Argument* theDelayVertex_p=new Argument();
          theDelayVertex_p->setId(1);
          // add it to the RHS of the temp assignment
//          Assignment3->getRHS().supplyAndAddVertexInstance(*theDelayVertex_p);
          // set the alias key to temporary:
          theDelayVertex_p->getVariable().getAliasMapKey().setTemporary();
          theDelayVertex_p->getVariable().getDuUdMapKey().setTemporary();
          // get the global scope
          Scope& theGlobalScope(ConceptuallyStaticInstances::instance()->
                                getCallGraph().getScopeTree().getGlobalScope());
          // create a new symbol and add a new VariableSymbolReference in the Variable
          VariableSymbolReference* theNewVariableSymbolReference_p=
            new VariableSymbolReference(theGlobalScope.
                                        getSymbolTable().
                                        addUniqueAuxSymbol(SymbolKind::VARIABLE,
                                                           SymbolType::REAL_STYPE,
                                                           SymbolShape::SCALAR,
                                                           false),
                                        theGlobalScope);
          theNewVariableSymbolReference_p->setId("1");
          theDelayVertex_p->getVariable().
            supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
          Expression3->copyMyselfInto(Assignment3->getRHS(),false,false);
	  theDelayVertex_p->getVariable().copyMyselfInto(Assignment3->getLHS());  
 
        (*E2).setConstantFoldedAssignment((*Assignment3));
        supplyAndAddEdgeInstance(*E2,vi,getTargetOf((dynamic_cast <EnhancedPrivateLinearizedComputationalGraphEdge&>( 
*currentEndOutEdge))));

        //      new edge(vi,getTargetOf(voo.first),voo.first*e);
      }
    }
    cout<<"end of front elim\n";
  }



  void 
EnhancedPrivateLinearizedComputationalGraph::CheckInEdgesForTriviality(EnhancedPrivateLinearizedComputationalGraphVertex& 
testingVertex) {
      EnhancedPrivateLinearizedComputationalGraph::InEdgeIteratorPair theInEdges (getInEdgesOf(testingVertex));
      EnhancedPrivateLinearizedComputationalGraph::InEdgeIterator currentEdge = theInEdges.first, endEdge=theInEdges.second;
      cout<<"numInEdgesOf(j)="<<numInEdgesOf(testingVertex)<<"\n";
      if (numInEdgesOf(testingVertex)==1) {
        EnhancedPrivateLinearizedComputationalGraphEdge& testingEdge (dynamic_cast <EnhancedPrivateLinearizedComputationalGraphEdge&>(*currentEdge));
        cout<<"0";
        if(!(testingEdge.isUnitExpressionEdge())) {
          if(testingEdge.hasConstantFoldedAssignment()) {
            cout<<"testingEdge has a ConstantFolded Assignment\n";
            return;
          }
          cout<<"1";
          xaifBoosterLinearization::ExpressionEdgeAlg& EE= dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>(testingEdge.getLinearizedExpressionEdge().getExpressionEdgeAlgBase());
          xaifBooster::PartialDerivativeKind::PartialDerivativeKind_E PDK = EE.getPartialDerivativeKind ();
          cout<<"2";
        if (!(PDK==PartialDerivativeKind::LINEAR_ONE||PDK==PartialDerivativeKind::LINEAR_MINUS_ONE)) {
          return;
        }
      }
      cout<<"front_elim::trivialedges";
      front_elim(testingEdge);
    }
  }
  
  void 
EnhancedPrivateLinearizedComputationalGraph::CheckOutEdgesForTriviality(EnhancedPrivateLinearizedComputationalGraphVertex& 
testingVertex) {
    cout<<"numOutEdgesOf(j)="<<numOutEdgesOf(testingVertex)<<"\n"; 
    if (numOutEdgesOf(testingVertex)==1) { 
      EnhancedPrivateLinearizedComputationalGraph::OutEdgeIteratorPair theOutEdges (getOutEdgesOf(testingVertex));
      EnhancedPrivateLinearizedComputationalGraph::OutEdgeIterator currentEdge = theOutEdges.first, endEdge=theOutEdges.second;
      EnhancedPrivateLinearizedComputationalGraphEdge& testingEdge =dynamic_cast <EnhancedPrivateLinearizedComputationalGraphEdge&>( *currentEdge);
      cout<<"0";
      if(!(testingEdge.isUnitExpressionEdge())) {
        if(testingEdge.hasConstantFoldedAssignment()) {
          cout<<"testingEdge has a ConstantFolded Assignment\n";
          return;
        }
        cout<<"1";
        xaifBoosterLinearization::ExpressionEdgeAlg& EE=dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>(testingEdge.getLinearizedExpressionEdge().getExpressionEdgeAlgBase());
        xaifBooster::PartialDerivativeKind::PartialDerivativeKind_E PDK = EE.getPartialDerivativeKind ();
        cout<<"2";
        if (!(PDK==PartialDerivativeKind::LINEAR_ONE||PDK==PartialDerivativeKind::LINEAR_MINUS_ONE)) {
           return;
        }
      }
      cout<<"back_elim::trivialedges";
      back_elim(testingEdge);
    }
  }
  
  bool 
EnhancedPrivateLinearizedComputationalGraph::CheckInEdgesForConstants(EnhancedPrivateLinearizedComputationalGraphVertex& 
testingVertex){
    cout<<"numInEdgesOf(j)="<<numInEdgesOf(testingVertex)<<"\n";
    if (numInEdgesOf(testingVertex)) {
    EnhancedPrivateLinearizedComputationalGraph::InEdgeIteratorPair theInEdges ( getInEdgesOf(testingVertex)); 
    EnhancedPrivateLinearizedComputationalGraph::InEdgeIterator currentEdge=theInEdges.first, endEdge=theInEdges.second;
    while( currentEdge!=endEdge) {
      EnhancedPrivateLinearizedComputationalGraphEdge& testingEdge (dynamic_cast <EnhancedPrivateLinearizedComputationalGraphEdge&>( *currentEdge));
      if (!(testingEdge.isUnitExpressionEdge())) {
        if(testingEdge.hasConstantFoldedAssignment()) {
          cout<<"testingEdge has a ConstantFolded Assignment\n";
          return false;
        }
        xaifBoosterLinearization::ExpressionEdgeAlg& currentExpressionEdge = dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>(testingEdge.getLinearizedExpressionEdge().getExpressionEdgeAlgBase());
        const xaifBooster::PartialDerivativeKind::PartialDerivativeKind_E PDK = currentExpressionEdge.getPartialDerivativeKind(); 
        if (!( PDK==PartialDerivativeKind::LINEAR_ONE || PDK==PartialDerivativeKind::LINEAR_MINUS_ONE || PDK==PartialDerivativeKind::LINEAR))
          {
            return false;
          }
      }
      ++currentEdge;
    }
    cout<<"inedges are constant";
    return true;
    }
    return false;
  }
  
  bool EnhancedPrivateLinearizedComputationalGraph::CheckOutEdgesForConstants  
(EnhancedPrivateLinearizedComputationalGraphVertex& testingVertex){
    cout<<"numOutEdgesOf(j)="<<numOutEdgesOf(testingVertex)<<"\n";
    if(numOutEdgesOf(testingVertex)) {
    EnhancedPrivateLinearizedComputationalGraph::OutEdgeIteratorPair theOutEdges ( getOutEdgesOf(testingVertex));
    EnhancedPrivateLinearizedComputationalGraph::OutEdgeIterator currentEdge=theOutEdges.first, endEdge=theOutEdges.second;
    while(currentEdge!=endEdge) {
      EnhancedPrivateLinearizedComputationalGraphEdge& testingEdge (dynamic_cast 
<EnhancedPrivateLinearizedComputationalGraphEdge&>( *currentEdge));
      if (!(testingEdge.isUnitExpressionEdge())) {
        if(testingEdge.hasConstantFoldedAssignment()) {
          cout<<"testingEdge has a ConstantFolded Assignment\n";
          return false;
        }
        xaifBoosterLinearization::ExpressionEdgeAlg& currentExpressionEdge =  
dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>(testingEdge.getLinearizedExpressionEdge().getExpressionEdgeAlgBase());
        const xaifBooster::PartialDerivativeKind::PartialDerivativeKind_E PDK = 
currentExpressionEdge.getPartialDerivativeKind();
        if (( PDK==PartialDerivativeKind::LINEAR_ONE || PDK==PartialDerivativeKind::LINEAR_MINUS_ONE || 
PDK==PartialDerivativeKind::LINEAR)==false)
        {
            return false;
        }
      }
      ++currentEdge;
    }
    cout<<"outedges are constant";
    return true;
    }
    return false;
  }
  
  void EnhancedPrivateLinearizedComputationalGraph::RunTrivialCheckBackwards() {
    cout<<"trivialcheckbackwards\n";
    EnhancedPrivateLinearizedComputationalGraph::VertexIteratorPair completeVertex ( vertices( ) );
    EnhancedPrivateLinearizedComputationalGraph::VertexIterator currentVertex = completeVertex.first , endVertex = 
completeVertex.second;
    while(currentVertex!=endVertex) {
      EnhancedPrivateLinearizedComputationalGraphVertex& testingVertex (dynamic_cast 
<EnhancedPrivateLinearizedComputationalGraphVertex&>( *currentVertex));
      CheckOutEdgesForTriviality(testingVertex);
      ++currentVertex;
      }
  }

  void EnhancedPrivateLinearizedComputationalGraph::RunTrivialCheckForward() {
    cout<<"trivialCheckFroward\n";
    EnhancedPrivateLinearizedComputationalGraph::VertexIteratorPair completeVertex ( vertices( ) );
    EnhancedPrivateLinearizedComputationalGraph::VertexIterator currentVertex = completeVertex.first, endVertex = 
completeVertex.second;
    while(currentVertex!=endVertex) {
      EnhancedPrivateLinearizedComputationalGraphVertex& testingVertex (dynamic_cast 
<EnhancedPrivateLinearizedComputationalGraphVertex&>( *currentVertex));
      CheckInEdgesForTriviality(testingVertex);
      ++currentVertex;
      }
  }
  
  void EnhancedPrivateLinearizedComputationalGraph::RunConstantCheckForwardBackward() {
    cout<<"constantChecking forward/backwards\n";
    EnhancedPrivateLinearizedComputationalGraph::VertexIteratorPair completeVertex ( vertices( ) );
    EnhancedPrivateLinearizedComputationalGraph::VertexIterator currentVertex = completeVertex.first, endVertex 
=completeVertex.second;
    while(currentVertex != endVertex) {
      EnhancedPrivateLinearizedComputationalGraphVertex& testingVertex (dynamic_cast 
<EnhancedPrivateLinearizedComputationalGraphVertex&>( *currentVertex));
      cout<<"numInEdgesOf(v)="<<numInEdgesOf(testingVertex)<<"\n";
      cout<<"numOutEdgesOf(v)="<<numOutEdgesOf(testingVertex)<<"\n";
      if (CheckOutEdgesForConstants(testingVertex) && CheckInEdgesForConstants(testingVertex)) {
        if (numInEdgesOf(testingVertex)==1) {
          EnhancedPrivateLinearizedComputationalGraph::InEdgeIteratorPair InEI ( getInEdgesOf(testingVertex));
          EnhancedPrivateLinearizedComputationalGraph::InEdgeIterator Ief = InEI.first;
          EnhancedPrivateLinearizedComputationalGraphEdge& eliminatedEdgeIn (dynamic_cast 
<EnhancedPrivateLinearizedComputationalGraphEdge&>( *Ief));
          cout<<"front_elim::ConstantCheck";
          front_elim(eliminatedEdgeIn);
        } 
        else if (numOutEdgesOf(*currentVertex)==1) {
          EnhancedPrivateLinearizedComputationalGraph::OutEdgeIteratorPair OnEI ( getOutEdgesOf(testingVertex));
          EnhancedPrivateLinearizedComputationalGraph::OutEdgeIterator Oef = OnEI.first;
          EnhancedPrivateLinearizedComputationalGraphEdge& eliminatedEdgeOut (dynamic_cast 
<EnhancedPrivateLinearizedComputationalGraphEdge&>( *Oef));
          cout<<"back_elim::ConstantCheck";
          back_elim(eliminatedEdgeOut);
        }
      }
      ++currentVertex;
    }
  }
}

   
  //constantPropigation...
  /*Do stuff, make it work...
    I like working code, it is nice...*/
