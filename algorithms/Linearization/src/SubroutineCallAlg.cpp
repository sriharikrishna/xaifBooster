#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/SubroutineCall.hpp"
#include "xaifBooster/system/inc/ArgumentList.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"
#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/ArgumentSubstitute.hpp"

#include "xaifBooster/algorithms/Linearization/inc/SubroutineCallAlg.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ConcreteArgumentAlg.hpp"

namespace xaifBoosterLinearization {  

  SubroutineCallAlg::SubroutineCallAlg(const SubroutineCall& theContainingSubroutineCall) : 
    SubroutineCallAlgBase(theContainingSubroutineCall) { 
  }

  void SubroutineCallAlg::printXMLHierarchy(std::ostream& os) const { 
    for (PlainBasicBlock::BasicBlockElementList::const_iterator priorI=myPriorAdjustmentsList.begin();
	 priorI!=myPriorAdjustmentsList.end();
	 ++priorI) { 
      (*priorI)->printXMLHierarchy(os);
    } 
    getContaining().printXMLHierarchyImpl(os);
    for (PlainBasicBlock::BasicBlockElementList::const_iterator postI=myPostAdjustmentsList.begin();
	 postI!=myPostAdjustmentsList.end();
	 ++postI) { 
      (*postI)->printXMLHierarchy(os);
    } 
  }

  std::string 
  SubroutineCallAlg::debug() const { 
    std::ostringstream out;
    out << "xaifBoosterLinearization::SubroutineCallAlg["
	<< this 
	<< ","
 	<< SubroutineCallAlgBase::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  }

  void SubroutineCallAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  void SubroutineCallAlg::algorithm_action_1() { 
    try { 
      // get the formal argument list; 
      const ArgumentList::ArgumentSymbolReferencePList& 
	theArgumentSymbolReferencePList(ConceptuallyStaticInstances::instance()->
					getCallGraph().
					getSubroutineBySymbolReference(getContainingSubroutineCall().getSymbolReference()).
					getArgumentList().
					getArgumentSymbolReferencePList());
      ArgumentList::ArgumentSymbolReferencePList::const_iterator formalArgumentPI=theArgumentSymbolReferencePList.begin();
      SubroutineCall::ConcreteArgumentPList::const_iterator concreteArgumentPI=getContainingSubroutineCall().getConcreteArgumentPList().begin();
      for (;;++concreteArgumentPI,++formalArgumentPI) { 
	if(concreteArgumentPI==getContainingSubroutineCall().getConcreteArgumentPList().end()  && 
	   formalArgumentPI==theArgumentSymbolReferencePList.end() ) 
	  break;
	if(concreteArgumentPI==getContainingSubroutineCall().getConcreteArgumentPList().end()  ||
	   formalArgumentPI==theArgumentSymbolReferencePList.end() ) 
	  THROW_LOGICEXCEPTION_MACRO("SubroutineCallAlg::algorithm_action_1: argument count mismatch ("
				     << theArgumentSymbolReferencePList.size() 
				     << " formal vs. "
				     << getContainingSubroutineCall().getConcreteArgumentPList().size()
				     << " concrete ) for "
				     << getContainingSubroutineCall().getSymbolReference().debug().c_str());
	bool concreteArgumentActive=(*concreteArgumentPI)->getVariable().getActiveType();
	bool formalArgumentActive=(*formalArgumentPI)->getSymbol().getActiveTypeFlag();
	if (concreteArgumentActive!=formalArgumentActive) { 
	  addConversion(**concreteArgumentPI,
			**formalArgumentPI);
	} 
      }// end for 
    } 
    catch (const  LogicException& e) { 
      DBG_MACRO(DbgGroup::ERROR,
		"SubroutineCallAlg::algorithm_action_1: " 
		<< e.getReason().c_str() 
		<< " but this may be an external call, we continue");
    }
  }

  std::string SubroutineCallAlg::giveCallName(bool concreteArgumentActive,
					      const SymbolReference &aTempSymbolReference,
					      bool prior) const { 
    std::string aSubroutineName("convert_");
    if (prior && concreteArgumentActive 
	|| 
	!prior && !concreteArgumentActive)
      aSubroutineName.append("a2p_");
    else
      aSubroutineName.append("p2a_");
    aSubroutineName.append(SymbolShape::toString(aTempSymbolReference.getSymbol().getSymbolShape()));
    return aSubroutineName;
  } 

  void SubroutineCallAlg::addConversion(const ConcreteArgument& theConcreteArgument,
					const ArgumentSymbolReference& aFormalArgumentSymbolReference) { 
    std::string aSubroutineName(giveCallName(theConcreteArgument.getVariable().getActiveType(),aFormalArgumentSymbolReference,true));
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* 
      thePriorCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall(aSubroutineName));
    myPriorAdjustmentsList.push_back(thePriorCall_p);
    thePriorCall_p->setId("SubroutineCallAlg::addConversion prior");
    // this is the extra temporary that replaces the original argument
    Variable& theTempVar(thePriorCall_p->addArgumentSubstitute(1).getVariable());
    makeTempSymbol(theConcreteArgument,
		   aFormalArgumentSymbolReference.getSymbol(),
		   aFormalArgumentSymbolReference.getScope(),
		   theTempVar);
    Variable& theInlineVariablePriorArg(thePriorCall_p->addArgumentSubstitute(2).getVariable());
    theConcreteArgument.getVariable().copyMyselfInto(theInlineVariablePriorArg);

    dynamic_cast<ConcreteArgumentAlg&>(theConcreteArgument.getConcreteArgumentAlgBase()).makeReplacement(theTempVar);

    aSubroutineName=giveCallName(theConcreteArgument.getVariable().getActiveType(),aFormalArgumentSymbolReference,false);
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* 
      thePostCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall(aSubroutineName));
    myPostAdjustmentsList.push_back(thePostCall_p);
    thePostCall_p->setId("SubroutineCallAlg::addConversion post");
    Variable& theInlineVariablePostRes(thePostCall_p->addArgumentSubstitute(1).getVariable());
    theConcreteArgument.getVariable().copyMyselfInto(theInlineVariablePostRes);
    Variable& theInlineVariablePostArg(thePostCall_p->addArgumentSubstitute(2).getVariable());
    theTempVar.copyMyselfInto(theInlineVariablePostArg);
  } 
  
  void SubroutineCallAlg::makeTempSymbol(const ConcreteArgument& theConcreteArgument,
					 const Symbol& formalArgumentSymbol,
					 const Scope&, // formalArgumentScope  when we finally get around it
					 Variable& aVariable) { 
    // create a new symbol and add a new VariableSymbolReference in the Variable
    Scope& theGlobalScope(ConceptuallyStaticInstances::instance()->
			  getCallGraph().getScopeTree().getGlobalScope());
    Symbol& theNewVariableSymbol(theGlobalScope.
				 getSymbolTable().
				 addUniqueAuxSymbol(SymbolKind::VARIABLE,
						    formalArgumentSymbol.getSymbolType(),
						    formalArgumentSymbol.getSymbolShape(),
						    formalArgumentSymbol.getActiveTypeFlag()));
    VariableSymbolReference* 
      theNewVariableSymbolReference_p(new VariableSymbolReference(theNewVariableSymbol,
								  theGlobalScope));
    // preserve dimension information from the concrete argument if any:
    const Symbol& theConcreteArgumentSymbol(theConcreteArgument.
					    getVariable().
					    getVariableSymbolReference().
					    getSymbol());
    if (theConcreteArgumentSymbol.hasDimensionBounds()) { 
      const Symbol::DimensionBoundsPList& aDimensionBoundsPList(theConcreteArgumentSymbol.getDimensionBoundsPList());
      for (Symbol::DimensionBoundsPList::const_iterator li=aDimensionBoundsPList.begin();
	   li!=aDimensionBoundsPList.end();
	   ++li) { 
	theNewVariableSymbol.addDimensionBounds((*li)->getLower(),
						(*li)->getUpper());
      }
    }
    theNewVariableSymbolReference_p->setId("1");
    theNewVariableSymbolReference_p->setAnnotation("xaifBoosterLinearization::SubroutineCallAlg::makeTempVariable");
    aVariable.supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
    aVariable.getAliasMapKey().setTemporary();
    aVariable.getDuUdMapKey().setTemporary();
  } 

} // end of namespace 