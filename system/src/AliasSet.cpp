#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/system/inc/AliasSet.hpp"
#include "xaifBooster/system/inc/AliasSingle.hpp"
#include "xaifBooster/system/inc/AliasRange.hpp"

namespace xaifBooster { 

  AliasSet::AliasSet() { 
  }

  AliasSet::~AliasSet() { 
    for (AliasList::const_iterator it=myAliasList.begin();
	 it==myAliasList.end();
	 ++it)
      delete (*it);       
  }

  std::string AliasSet::debug() const {
    std::ostringstream out;
    out << "AliasSet[" << this 
	<< "]" << std::ends; 
    return out.str();
  } // end of AliasSet::debug
  
  void AliasSet::printXMLHierarchy(std::ostream& os) const {
    for (AliasList::const_iterator it=myAliasList.begin();
	 it!=myAliasList.end();
	 ++it)
      (*it)->printXMLHierarchy(os);       
  } 

  void AliasSet::addAlias(unsigned int address) { 
    AliasSingle *anAlias_p=new AliasSingle(address);
    addAlias(anAlias_p);
  } 

  void AliasSet::addAlias(unsigned int lower,
			  unsigned int upper) { 
    AliasRange *anAlias_p=new AliasRange(lower,upper);
    addAlias(anAlias_p);
  }

  void AliasSet::addAlias(BaseAlias* anAlias_p) { 
    if (myAliasList.empty()) { 
      myAliasList.push_back(anAlias_p);
      return;
    }
    AliasList::iterator it=myAliasList.end();
    --it; // start at the end and point to the last
    while (true) { 
      if (anAlias_p->isGreaterThan(**it)) { 
	// the first one for which it is greater
	++it; 
	// increment one
	myAliasList.insert(it,anAlias_p); 
	// insert before it
	return;
      }
      else if (anAlias_p->overlapsWith(**it)) { 
	DBG_MACRO(DbgGroup::ERROR,
		  "AliasSet::addAlias :  "
		  << anAlias_p->debug().c_str() 
		  << " overlaps with "
		  << (*it)->debug().c_str());
	(*it)->add(*anAlias_p);
	delete anAlias_p;
	return;
      }
      else if (anAlias_p->isContainedIn(**it)) { 
	DBG_MACRO(DbgGroup::ERROR,
		  "AliasSet::addAlias :  "
		  << anAlias_p->debug().c_str() 
		  << " contained in "
		  << (*it)->debug().c_str());
	delete anAlias_p;
	return;
      }
      else if ((*it)->isContainedIn(*anAlias_p)) { 
	DBG_MACRO(DbgGroup::ERROR,
		  "AliasSet::addAlias :  "
		  << (*it)->debug().c_str()
		  << " contained in "
		  << anAlias_p->debug().c_str());
	delete *it;
	*it=anAlias_p;
	return;
      }
      else  // *anAlias_p must be less than **it
	if (it==myAliasList.begin()) { 
	myAliasList.insert(it,anAlias_p); 
	// insert before it
	return;
	}
	--it;
    } 
    // if we haven't returned yet then we are in trouble
    delete anAlias_p;
    THROW_LOGICEXCEPTION_MACRO("AliasSet::addAlias: problem with insertion");
  } 

}
