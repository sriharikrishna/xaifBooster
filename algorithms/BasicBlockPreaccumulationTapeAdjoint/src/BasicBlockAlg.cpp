#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/Scope.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorSaxpy.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"
#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/ArgumentSubstitute.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/BasicBlockAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationTapeAdjoint { 

  BasicBlockAlg::BasicBlockAlg(BasicBlock& theContaining) : 
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg(theContaining) { 
  }

  void
  BasicBlockAlg::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << PlainBasicBlock::ourXAIFName.c_str()
       << " " 
       << PlainBasicBlock::our_myId_XAIFName.c_str()
       << "=\"" 
       << getContaining().getId().c_str()
       << "\" " 
       << ObjectWithAnnotation::our_myAnnotation_XAIFName.c_str() 
       << "=\""
       << getContaining().getAnnotation().c_str()
       << "\" " 
       << PlainBasicBlock::our_myScopeId_XAIFName.c_str() 
       << "=\""
       << getContaining().getScope().getId().c_str()
       << "\">" 
       << std::endl;
    for (PlainBasicBlock::BasicBlockElementList::const_iterator li=myBasicBlockElementList.begin();
         li!=myBasicBlockElementList.end();
         li++)
      (*(li))->printXMLHierarchy(os);
    os << pm.indent()
       << "</"
       << PlainBasicBlock::ourXAIFName
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of BasicBlockAlg::printXMLHierarchy
  
  std::string BasicBlockAlg::debug () const { 
    std::ostringstream out;
    out << "BasicBlockAlg[" << this
 	<< "]" << std::ends;  
    return out.str();
  } // end of BasicBlockAlg::debug

  void BasicBlockAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& 
  BasicBlockAlg::addInlinableSubroutineCall(const std::string& aSubroutineName) { 
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* aNewCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall(aSubroutineName));
    myBasicBlockElementList.push_back(aNewCall_p);
    return *aNewCall_p;									     
  } 

  const Assignment& 
  BasicBlockAlg::addConstantAssignment(const BaseConstant& theConstant) { 
    Assignment* theNewAssignment_p(new Assignment(false,false));
    theNewAssignment_p->setId("tape_adjoint_constant_assignment");
    myBasicBlockElementList.push_back(theNewAssignment_p);
    Constant* theConstantRHS_p(new Constant(theConstant.getType(),false));
    theConstantRHS_p->setFromString(theConstant.toString());
    theConstantRHS_p->setId(theNewAssignment_p->getRHS().getNextVertexId());
    theNewAssignment_p->getRHS().supplyAndAddVertexInstance(*theConstantRHS_p);
    // create a new symbol and add a new VariableSymbolReference in the Variable
    VariableSymbolReference* theNewVariableSymbolReference_p=
      new VariableSymbolReference(getContaining().getScope().
				  getSymbolTable().
				  addUniqueAuxSymbol(SymbolKind::VARIABLE,
						     SymbolType::INTEGER_STYPE,
						     SymbolShape::SCALAR,
						     false),
				  getContaining().getScope());
    theNewVariableSymbolReference_p->setId("1");
    // pass it on to the LHS and relinquish ownership
    theNewAssignment_p->getLHS().supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
    theNewAssignment_p->getLHS().getAliasMapKey().setTemporary();
    theNewAssignment_p->getLHS().getDuUdMapKey().setTemporary();
    return *theNewAssignment_p;									     
  } 

  void BasicBlockAlg::algorithm_action_4() { // adjoin the DerivativePropagators
    for(SequencePList::const_reverse_iterator aSequencePListI=getUniqueSequencePList().rbegin();
	aSequencePListI!=getUniqueSequencePList().rend();
	++aSequencePListI) { 
      const xaifBoosterDerivativePropagator::DerivativePropagator& aDerivativePropagator((*aSequencePListI)->myDerivativePropagator);
      for(xaifBoosterDerivativePropagator::DerivativePropagator::EntryPList::const_reverse_iterator entryPListI=
	    aDerivativePropagator.getEntryPList().rbegin();
	  entryPListI!= aDerivativePropagator.getEntryPList().rend();
	  ++entryPListI) {
	xaifBoosterDerivativePropagator::DerivativePropagatorEntry::FactorList aFactorList;
	(*entryPListI)->getFactors(aFactorList);
	for (xaifBoosterDerivativePropagator::DerivativePropagatorEntry::FactorList::reverse_iterator aFactorListI=aFactorList.rbegin();
	     aFactorListI!=aFactorList.rend();
	     ++aFactorListI) { 
	  switch((*aFactorListI).getKind()) { 
	  case xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::ZERO_FACTOR:  // the ZeroDeriv in tlm
	    { 
	      xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theSubroutineCall(addInlinableSubroutineCall("ZeroDeriv"));
	      theSubroutineCall.setId("inline_zeroderiv");
	      (*entryPListI)->getTarget().copyMyselfInto(theSubroutineCall.addArgumentSubstitute(1).getVariable());
	      break; 
	    } 
	  case xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::UNIT_FACTOR: // the SetDeriv in tlm
	    { 
	      BaseConstant aBaseConstant(SymbolType::INTEGER_STYPE);
	      aBaseConstant.setint(1);
	      const Assignment& theConstantAssignment(addConstantAssignment(aBaseConstant));
	      xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theSaxpyCall(addInlinableSubroutineCall("Saxpy"));
	      theSaxpyCall.setId("inline_saxpy_with_constant_1");
	      theConstantAssignment.getLHS().copyMyselfInto(theSaxpyCall.addArgumentSubstitute(1).getVariable());
	      (*entryPListI)->getTarget().copyMyselfInto(theSaxpyCall.addArgumentSubstitute(2).getVariable());
	      (*aFactorListI).getSource().copyMyselfInto(theSaxpyCall.addArgumentSubstitute(3).getVariable());
	      xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theZeroDerivCall(addInlinableSubroutineCall("ZeroDeriv"));
	      theZeroDerivCall.setId("inline_zeroderiv");
	      (*entryPListI)->getTarget().copyMyselfInto(theZeroDerivCall.addArgumentSubstitute(1).getVariable());
	      break; 
	    } 
	  case xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::CONSTANT_FACTOR: 
	  case xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::VARIABLE_FACTOR: // both represent some saxpy or sax 
	    { 
	      const Variable* theFactorVariable_p=0; // here is where we keep the factor variable
	      if ((*aFactorListI).getKind()==xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::CONSTANT_FACTOR) { 
		const Assignment& theConstantAssignment(addConstantAssignment((*aFactorListI).getConstant()));
		theFactorVariable_p=&theConstantAssignment.getLHS();
	      } 
	      else { 
		xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theZeroDerivCall(addInlinableSubroutineCall("Pop"));
		theZeroDerivCall.setId("inline_pop");
		Variable* theInlineVariable_p(&(theZeroDerivCall.addArgumentSubstitute(1).getVariable()));
		// give it a name etc.
		// create a new symbol and add a new VariableSymbolReference in the Variable
		VariableSymbolReference* theNewVariableSymbolReference_p=
		  new VariableSymbolReference(getContaining().getScope().
					      getSymbolTable().
					      addUniqueAuxSymbol(SymbolKind::VARIABLE,
								 SymbolType::REAL_STYPE,
								 SymbolShape::SCALAR,
								 false),
					      getContaining().getScope());
		theNewVariableSymbolReference_p->setId("1");
		// pass it on to the variable and relinquish ownership
		theInlineVariable_p->supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
		theInlineVariable_p->getAliasMapKey().setTemporary();
		theInlineVariable_p->getDuUdMapKey().setTemporary();
		theFactorVariable_p=theInlineVariable_p;
	      } 
	      xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theSaxpyCall(addInlinableSubroutineCall("Saxpy"));
	      theSaxpyCall.setId("inline_saxpy");
	      theFactorVariable_p->copyMyselfInto(theSaxpyCall.addArgumentSubstitute(1).getVariable());
	      (*entryPListI)->getTarget().copyMyselfInto(theSaxpyCall.addArgumentSubstitute(2).getVariable());
	      (*aFactorListI).getSource().copyMyselfInto(theSaxpyCall.addArgumentSubstitute(3).getVariable());
	      if (!(*entryPListI)->isIncremental()) { 
		xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theZeroDerivCall(addInlinableSubroutineCall("ZeroDeriv"));
		theZeroDerivCall.setId("inline_zeroderiv");
		(*entryPListI)->getTarget().copyMyselfInto(theZeroDerivCall.addArgumentSubstitute(1).getVariable());
	      }
	      break; 
	    } 
	  default: 
	    THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::algorithm_action_4: cannot handle factor kind " 
				       << (*aFactorListI).getKind()); 
	    break; 
	  } // end switch 
	} // end for FactorList
      } // end for DerivativePropagatorEntry list
    } // end for SeqyencePList 
  } // end of algorithm_action_4 

} // end of namespace
