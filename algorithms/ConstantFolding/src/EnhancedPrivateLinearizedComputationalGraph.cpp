//let's begin by assuming we have the edge we want to remove...
//so we need to:
//1. find all edges that go to j
//2. make all edges that don't goto j now goto j
//3. make them have the right value
#include <sstream>
#include<iterator>
#include "xaifBooster/system/inc/Intrinsic.hpp"
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
    //1.find all i' depen i but not a depend of j
    //2.do the mult
    //3.find all i' depn j, and depend i
    //4.do the math
    EnhancedPrivateLinearizedComputationalGraphVertex& vo = (dynamic_cast <EnhancedPrivateLinearizedComputationalGraphVertex&>( getTargetOf(e)));
    EnhancedPrivateLinearizedComputationalGraphVertex& vi = (dynamic_cast <EnhancedPrivateLinearizedComputationalGraphVertex&>( getSourceOf(e)));
    EnhancedPrivateLinearizedComputationalGraph::InEdgeIteratorPair vii(getInEdgesOf(vi));
    EnhancedPrivateLinearizedComputationalGraph::InEdgeIterator currentEdge=vii.first,endEdge=vii.second;
    bool alreadyconnected;
    for(;currentEdge!=endEdge;++currentEdge) {
      alreadyconnected=false;
      EnhancedPrivateLinearizedComputationalGraphVertex& viii= (dynamic_cast <EnhancedPrivateLinearizedComputationalGraphVertex&>( getSourceOf(*currentEdge)));
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
      //      EnhancedPrivateLinearizedComputationalGraphVertex& v (dynamic_cast <EnhancedPrivateLinearizedComputationalGraphVertex&>( *currentVertex));
      //      EnhancedPrivateLinearizedComputationalGraphEdge& e (dynamic_cast <EnhancedPrivateLinearizedComputationalGraphEdge&>( *currentEdge));
      xaifBoosterLinearization::ExpressionEdgeAlg& tempee1 =  dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>(e.getLinearizedExpressionEdge().getExpressionEdgeAlgBase());      
      //      ExpressionEdge* tempee1=e.getLinearizedExpressionEdge ();
      Assignment& tempassignment1=tempee1.getConcretePartialAssignment();
      Expression& tempExpression1=tempassignment1.getRHS();
      //find maximal vertex (Ie: vertex that has no out edges)
      Expression::VertexIteratorPair vit (tempExpression1.vertices());
      Expression::VertexIterator startVertex =vit.first,endVertex =vit.second;
      ExpressionVertex* v;
      for (;startVertex!=endVertex;++startVertex) {
	if(tempExpression1.numOutEdgesOf((dynamic_cast <ExpressionVertex&>( *startVertex)))==0) {
	  v = &(dynamic_cast <ExpressionVertex&>( *startVertex));
	}
      }
      xaifBoosterLinearization::ExpressionEdgeAlg& tempee2 =  dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>((*conn1).getLinearizedExpressionEdge().getExpressionEdgeAlgBase()); 
      //	ExpressionEdge tempee2=conn1.getLinearizedExpressionEdge ();
      Assignment& tempassignment2=tempee2.getConcretePartialAssignment ();
      Expression& tempExpression2=tempassignment2.getRHS();
      //find maximal vertex (Ie: vertex that has no out edges)
      Expression::VertexIteratorPair vit2 (tempExpression2.vertices());
      Expression::VertexIterator startVertex2=vit2.first, endVertex2=vit2.second;
      ExpressionVertex* v2;
      for (;startVertex2!=endVertex2;++startVertex2) {
	if(tempExpression2.numOutEdgesOf((dynamic_cast <ExpressionVertex&>( *startVertex2)))==0) {
	  v2 = &(dynamic_cast <ExpressionVertex&>( *startVertex2));
	}
      }
      if(alreadyconnected) {
	
	xaifBoosterLinearization::ExpressionEdgeAlg& tempee3 =  dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>((*conn2).getLinearizedExpressionEdge().getExpressionEdgeAlgBase()); 
	//	ExpressionEdge tempee3=conn2.getLinearizedExpressionEdge ();
	Assignment& tempassignment3=tempee3.getConcretePartialAssignment ();
	Expression& Expression3=tempassignment3.getRHS();
	//find maximal vertex (Ie: vertex that has no out edges)
	Expression::VertexIteratorPair vit3 (Expression3.vertices());
	Expression::VertexIterator startVertex3=vit3.first,endVertex3=vit3.second;
	ExpressionVertex* v3;
	for (;startVertex3!=endVertex3;++startVertex3) {
	  if(tempExpression2.numOutEdgesOf((dynamic_cast <ExpressionVertex&>( *startVertex3)))==0) {
	    v3 = &(dynamic_cast <ExpressionVertex&>( *startVertex3));
	  }
	}
	Intrinsic* I1 = (new Intrinsic ("mul_scal_scal"));
	Intrinsic* I2 = (new Intrinsic ("add_scal_scal"));
	tempExpression1.copyMyselfInto(Expression3);
	tempExpression2.copyMyselfInto(Expression3);
	Expression3.supplyAndAddVertexInstance(*I1);
	Expression3.supplyAndAddVertexInstance(*I2);
	Expression3.addEdge(*I1,*I2);
	Expression3.addEdge(*v3,*I2);
	Expression3.addEdge(*v,*I1);
	Expression3.addEdge(*v2,*I1);
      }
      else {
	EnhancedPrivateLinearizedComputationalGraphEdge* E2 = new EnhancedPrivateLinearizedComputationalGraphEdge();
	
	Expression* Expression3=(new Expression());
	Intrinsic* I= (new Intrinsic("mul_scal_scal"));
	
	//set the intrinsic as a vertex	
	(*Expression3).supplyAndAddVertexInstance(*I);
	tempExpression1.copyMyselfInto((*Expression3));
	tempExpression2.copyMyselfInto((*Expression3));
	(*Expression3).addEdge(*v,*I);
	(*Expression3).addEdge(*v2,*I);
	
	//connect the two previously maximal vertices to the intrinsic, so that it can now be the new maximal vertex.
	//Insert the Expression into the Edge
	(*E2).setConstantFoldedExpression((*Expression3));
	supplyAndAddEdgeInstance(*E2,viii,vo);
	//      	new edge(viii,vo,conn1*e);
      }
    }
  }
  
  void EnhancedPrivateLinearizedComputationalGraph::front_elim(EnhancedPrivateLinearizedComputationalGraphEdge& e) {
    //1.find all j such that j depend j' but i not depen j'/
    //2.do the mult
    //3.find all j such that j depend j' and i depend i'
    //4.do the math...
    EnhancedPrivateLinearizedComputationalGraphVertex& vo= (dynamic_cast <EnhancedPrivateLinearizedComputationalGraphVertex&>(getTargetOf(e)));
    EnhancedPrivateLinearizedComputationalGraphVertex& vi= (dynamic_cast <EnhancedPrivateLinearizedComputationalGraphVertex&>(getSourceOf(e))) ;
    EnhancedPrivateLinearizedComputationalGraphEdge *conn1;
    EnhancedPrivateLinearizedComputationalGraph::OutEdgeIteratorPair voo (getOutEdgesOf(vo));
    EnhancedPrivateLinearizedComputationalGraph::OutEdgeIterator currentEndOutEdge=voo.first,finalEndOutEdge=voo.second;
    //      EnhancedPrivateLinearizedComputationalGraphVertex& v (dynamic_cast <EnhancedPrivateLinearizedComputationalGraphVertex&>( *currentVertex));
    //      EnhancedPrivateLinearizedComputationalGraphEdge& e (dynamic_cast <EnhancedPrivateLinearizedComputationalGraphEdge&>( *currentEdge));
    //      xaifBoosterLinearization::ExpressionEdgeAlg& tempee1 =  dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>(e.getLinearizedExpressionEdge().getExpressionEdgeAlgBase());      
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

      xaifBoosterLinearization::ExpressionEdgeAlg& tempee1 =  dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>(e.getLinearizedExpressionEdge().getExpressionEdgeAlgBase());
      //      ExpressionEdge tempee1=e.getLinearizedExpressionEdge ();
      Assignment& tempassignment1=tempee1.getConcretePartialAssignment ();
      Expression& tempExpression1=tempassignment1.getRHS();
      //find maximal vertex (Ie: vertex that has no out edges)
      Expression::VertexIteratorPair vit(tempExpression1.vertices());
      Expression::VertexIterator startVertex=vit.first,endVertex=vit.second;
      ExpressionVertex* v;
      for (;startVertex!=endVertex;++startVertex) {
	if(tempExpression1.numOutEdgesOf(*startVertex)==0) {
	  v = &(dynamic_cast <ExpressionVertex&>( *startVertex));
	}
      }
      xaifBoosterLinearization::ExpressionEdgeAlg& tempee2 =  dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>((dynamic_cast <EnhancedPrivateLinearizedComputationalGraphEdge&>( *currentEndOutEdge)).getLinearizedExpressionEdge().getExpressionEdgeAlgBase());
      //   ExpressionEdge tempee2=voo.first*.getLinearizedExpressionEdge ();
      Assignment& tempassignment2=tempee2.getConcretePartialAssignment ();
      Expression& tempExpression2=tempassignment2.getRHS();
      //find maximal vertex (Ie: vertex that has no out edges)
      Expression::VertexIteratorPair vit2(tempExpression2.vertices());
      Expression::VertexIterator startVertex2=vit2.first;
      Expression::VertexIterator endVertex2=vit2.second;
      ExpressionVertex* v2;
      for (;startVertex2!=endVertex2;++startVertex2) {
	if(tempExpression2.numOutEdgesOf(*startVertex2)==0) {
	  v2 = &(dynamic_cast <ExpressionVertex&>( *startVertex2));
	  //	  v2=  &(dynamic_cast <ExpressionVertex&>( *startVertex2));
	}
      }
      if(alreadyconnected) {
	xaifBoosterLinearization::ExpressionEdgeAlg& tempee3 =  dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>((*conn1).getLinearizedExpressionEdge().getExpressionEdgeAlgBase());
	//	ExpressionEdge tempee3=conn1.getLinearizedExpressionEdge ();
	Assignment& tempassignment3=tempee3.getConcretePartialAssignment ();
	Expression& Expression3=tempassignment3.getRHS();
	//find maximal vertex (Ie: vertex that has no out edges)
	Expression::VertexIteratorPair vit3(Expression3.vertices());
	Expression::VertexIterator startVertex3=vit3.first;
	Expression::VertexIterator endVertex3=vit3.second;
	ExpressionVertex* v3;
	for (;startVertex3!=endVertex3;++startVertex3) {
	  if(Expression3.numOutEdgesOf(*startVertex3)==0) {
	    v3 = &(dynamic_cast <ExpressionVertex&>( *startVertex3));
	    //	    v3=vit.first*;
	  }
	}
	Intrinsic* I1 = new Intrinsic("mul_scal_scal");
	Intrinsic* I2 = new Intrinsic("add_scal_scal");
	tempExpression1.copyMyselfInto(Expression3);
	tempExpression2.copyMyselfInto(Expression3);
	Expression3.supplyAndAddVertexInstance(*I1);
	Expression3.supplyAndAddVertexInstance(*I2);
	Expression3.addEdge(*I1,*I2);
	Expression3.addEdge(*v3,*I2);
	Expression3.addEdge(*v,*I1);
	Expression3.addEdge(*v2,*I1);
	
	//	conn1+=voo.first*e;
      }
      else {
	EnhancedPrivateLinearizedComputationalGraphEdge* E2 = new EnhancedPrivateLinearizedComputationalGraphEdge();

	Expression* Expression3 = (new Expression());
	Intrinsic* I = new Intrinsic("mul_scal_scal");
	
	//set the intrinsic as a vertex	
	(*Expression3).supplyAndAddVertexInstance(*I);
	tempExpression1.copyMyselfInto(*Expression3);
	tempExpression2.copyMyselfInto(*Expression3);
	(*Expression3).addEdge(*v,*I);
	(*Expression3).addEdge(*v2,*I);
	
	//connect the two previously maximal vertices to the intrinsic, so that it can now be the new maximal vertex.
	//Insert the Expression into the Edge
	(*E2).setConstantFoldedExpression((*Expression3));
	supplyAndAddEdgeInstance(*E2,vi,getTargetOf((dynamic_cast <EnhancedPrivateLinearizedComputationalGraphEdge&>( *currentEndOutEdge))));
	
	//	new edge(vi,getTargetOf(voo.first),voo.first*e);
      }
    }
  }



  void EnhancedPrivateLinearizedComputationalGraph::CheckInEdgesForTriviality(EnhancedPrivateLinearizedComputationalGraphVertex& j) {
    EnhancedPrivateLinearizedComputationalGraph::InEdgeIteratorPair theInEdges (getInEdgesOf(j));
    EnhancedPrivateLinearizedComputationalGraph::InEdgeIterator currentEdge = theInEdges.first, endEdge=theInEdges.second;
    if (currentEdge==endEdge) {
      EnhancedPrivateLinearizedComputationalGraphEdge& e (dynamic_cast <EnhancedPrivateLinearizedComputationalGraphEdge&>( *currentEdge));
      xaifBoosterLinearization::ExpressionEdgeAlg& EE=  dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>(e.getLinearizedExpressionEdge().getExpressionEdgeAlgBase());          //e.getLinearizedExpressionEdge();
      PartialDerivativeKind::PartialDerivativeKind_E PDK = EE.getPartialDerivativeKind ();
      if (PDK==PartialDerivativeKind::LINEAR_ONE||PDK==PartialDerivativeKind::LINEAR_MINUS_ONE) {
      	front_elim(e);
      }
    }
  }
  
  void EnhancedPrivateLinearizedComputationalGraph::CheckOutEdgesForTriviality(EnhancedPrivateLinearizedComputationalGraphVertex& j) {
    EnhancedPrivateLinearizedComputationalGraph::OutEdgeIteratorPair theOutEdges (getOutEdgesOf(j));
    EnhancedPrivateLinearizedComputationalGraph::OutEdgeIterator currentEdge = theOutEdges.first, endEdge=theOutEdges.second;
    if (currentEdge==endEdge) {
      EnhancedPrivateLinearizedComputationalGraphEdge& e =dynamic_cast <EnhancedPrivateLinearizedComputationalGraphEdge&>( *currentEdge);
      xaifBoosterLinearization::ExpressionEdgeAlg& EE=dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>(e.getLinearizedExpressionEdge().getExpressionEdgeAlgBase());  //e.getLinearizedExpressionEdge();
      PartialDerivativeKind::PartialDerivativeKind_E PDK = EE.getPartialDerivativeKind ();
      if (PDK==PartialDerivativeKind::LINEAR_ONE||PDK==PartialDerivativeKind::LINEAR_MINUS_ONE) {
      	back_elim(e);
      }
    }
  }
  
  bool EnhancedPrivateLinearizedComputationalGraph::CheckInEdgesForConstants(EnhancedPrivateLinearizedComputationalGraphVertex& j){
    EnhancedPrivateLinearizedComputationalGraph::InEdgeIteratorPair theInEdges ( getInEdgesOf(j)); 
    EnhancedPrivateLinearizedComputationalGraph::InEdgeIterator currentEdge=theInEdges.first, endEdge=theInEdges.second;
    while( currentEdge!=endEdge) {
      EnhancedPrivateLinearizedComputationalGraphEdge& e (dynamic_cast <EnhancedPrivateLinearizedComputationalGraphEdge&>( *currentEdge));
      xaifBoosterLinearization::ExpressionEdgeAlg& currentExpressionEdge = dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>(e.getLinearizedExpressionEdge().getExpressionEdgeAlgBase());
      const PartialDerivativeKind::PartialDerivativeKind_E PDK = currentExpressionEdge.getPartialDerivativeKind(); 
      if (( PDK==PartialDerivativeKind::LINEAR_ONE || PDK==PartialDerivativeKind::LINEAR_MINUS_ONE || PDK==PartialDerivativeKind::LINEAR)==false) 
	{
	  return false;
	}
      ++currentEdge;
    }
    return true;
  }
  
  bool EnhancedPrivateLinearizedComputationalGraph::CheckOutEdgesForConstants  (EnhancedPrivateLinearizedComputationalGraphVertex& j){
    EnhancedPrivateLinearizedComputationalGraph::OutEdgeIteratorPair theOutEdges ( getOutEdgesOf(j));
    EnhancedPrivateLinearizedComputationalGraph::OutEdgeIterator currentEdge=theOutEdges.first, endEdge=theOutEdges.second;
    while(currentEdge!=endEdge) {
      EnhancedPrivateLinearizedComputationalGraphEdge& e (dynamic_cast <EnhancedPrivateLinearizedComputationalGraphEdge&>( *currentEdge));
      xaifBoosterLinearization::ExpressionEdgeAlg& currentExpressionEdge =  dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>(e.getLinearizedExpressionEdge().getExpressionEdgeAlgBase());                             //e.getLinearizedExpressionEdge();
      const PartialDerivativeKind::PartialDerivativeKind_E PDK = currentExpressionEdge.getPartialDerivativeKind();
      if (( PDK==PartialDerivativeKind::LINEAR_ONE || PDK==PartialDerivativeKind::LINEAR_MINUS_ONE || PDK==PartialDerivativeKind::LINEAR)==false)
      {
	return false;
      }
      ++currentEdge;
    }
    return true;
  }
  
  void EnhancedPrivateLinearizedComputationalGraph::RunTrivialCheckBackwards() {
    EnhancedPrivateLinearizedComputationalGraph::VertexIteratorPair P ( vertices( ) );
    EnhancedPrivateLinearizedComputationalGraph::VertexIterator currentVertex = P.first , endVertex = P.second;
    while(currentVertex!=endVertex) {
      //      EnhancedPrivateLinearizedComputationalGraphVertex& v;
      EnhancedPrivateLinearizedComputationalGraphVertex& v (dynamic_cast <EnhancedPrivateLinearizedComputationalGraphVertex&>( *currentVertex));
      CheckOutEdgesForTriviality(v);
      ++currentVertex;
      }
  }

  void EnhancedPrivateLinearizedComputationalGraph::RunTrivialCheckForward() {
    EnhancedPrivateLinearizedComputationalGraph::VertexIteratorPair fullgraph ( vertices( ) );
    EnhancedPrivateLinearizedComputationalGraph::VertexIterator currentVertex = fullgraph.first, endVertex = fullgraph.second;
    while(currentVertex!=endVertex) {
      //      EnhancedPrivateLinearizedComputationalGraphVertex& v;
      EnhancedPrivateLinearizedComputationalGraphVertex& v (dynamic_cast <EnhancedPrivateLinearizedComputationalGraphVertex&>( *currentVertex));
      CheckInEdgesForTriviality(v);
      ++currentVertex;
      }
  }
  
  void EnhancedPrivateLinearizedComputationalGraph::RunConstantCheckForwardBackward() {
    EnhancedPrivateLinearizedComputationalGraph::VertexIteratorPair fullgraph ( vertices( ) );
    EnhancedPrivateLinearizedComputationalGraph::VertexIterator currentVertex = fullgraph.first, endVertex =fullgraph.second;
    while(currentVertex != endVertex) {
      EnhancedPrivateLinearizedComputationalGraphVertex& v (dynamic_cast <EnhancedPrivateLinearizedComputationalGraphVertex&>( *currentVertex));
      if (CheckOutEdgesForConstants(v) || CheckInEdgesForConstants(v)) {
	if (numInEdgesOf(*currentVertex)==1) {
	  EnhancedPrivateLinearizedComputationalGraph::InEdgeIteratorPair Ine1 ( (getInEdgesOf(*currentVertex)));
	  EnhancedPrivateLinearizedComputationalGraph::InEdgeIterator Ief = Ine1.first;
	  EnhancedPrivateLinearizedComputationalGraphEdge& e (dynamic_cast <EnhancedPrivateLinearizedComputationalGraphEdge&>( *Ief));
	  front_elim(e);
	} 
	else if (numOutEdgesOf(*currentVertex)==1) {
	  EnhancedPrivateLinearizedComputationalGraph::OutEdgeIteratorPair One1 = getOutEdgesOf(*currentVertex);
	  EnhancedPrivateLinearizedComputationalGraph::OutEdgeIterator Oef = One1.first;
	  EnhancedPrivateLinearizedComputationalGraphEdge& e2 (dynamic_cast <EnhancedPrivateLinearizedComputationalGraphEdge&>( *Oef));
	  back_elim(e2);
	}
      }
      ++currentVertex;
    }
  }
}

   
  //constantPropigation...
  /*Do stuff, make it work...
    I like working code, it is nice...*/
