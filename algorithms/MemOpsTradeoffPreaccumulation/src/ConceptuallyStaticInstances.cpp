#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/ConceptuallyStaticInstances.hpp"

namespace MemOpsTradeoffPreaccumulation { 
  
  ConceptuallyStaticInstances* ConceptuallyStaticInstances::ourInstance_p(0);

  ConceptuallyStaticInstances::ConceptuallyStaticInstances() : myList_p(0){
    createList();
  }

  ConceptuallyStaticInstances::~ConceptuallyStaticInstances(){
    if (myList_p){
      delete myList_p;
    }// end if
  }// end deconstructor

  ConceptuallyStaticInstances* 
  ConceptuallyStaticInstances::instance() { 
    if (!ourInstance_p)
      ourInstance_p=new ConceptuallyStaticInstances();
    return ourInstance_p;
  }

  void ConceptuallyStaticInstances::createList(){
    if (myList_p){
      THROW_LOGICEXCEPTION_MACRO("MemOps ConceptuallyStaticInstances::createList: already created");
    }// end if already created
    myList_p = new HeuristicList;
  }// end createList

  ConceptuallyStaticInstances::HeuristicList& ConceptuallyStaticInstances::getList(){
    if (!myList_p)
      THROW_LOGICEXCEPTION_MACRO("MemOps ConceptuallyStaticInstances::getList: has not been created");
    return *myList_p;
  }//

} 

