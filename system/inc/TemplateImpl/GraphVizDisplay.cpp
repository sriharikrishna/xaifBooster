#ifndef _GRAPHVIZDISPLAY_INCLUDE_
#include "xaifBooster/system/inc/GraphVizDisplay.hpp"
#endif

#include "boost/graph/graphviz.hpp"
#include <fstream>
#include <cerrno>

namespace xaifBooster { 

  
  template <class Graph>
  void GraphVizDisplay::show(const Graph& g, 
			     const std::string& aFileName) { 
    show(g,aFileName,DefaultVertexLabelWriter());
  } 

  template <class Graph, class VertexLabelWriter>
  void GraphVizDisplay::show(const Graph& g, 
			     const std::string& aFileName, 
			     const VertexLabelWriter& aVertexLabelWriter) { 
    show(g,aFileName,aVertexLabelWriter, DefaultEdgeLabelWriter());
  } 

  template <class Graph, class VertexLabelWriter, class EdgeLabelWriter>
  void GraphVizDisplay::show(const Graph& g,
			     const std::string& aFileName, 
			     const VertexLabelWriter& aVertexLabelWriter, 
			     const EdgeLabelWriter& anEdgeLabelWriter) { 
    std::string theFileName("/tmp/GraphVizDisplay.dot");    
    if (!aFileName.empty())
      theFileName="/tmp/"+aFileName+".dot";
    std::ofstream anOutFileStream;
    errno=0;
    anOutFileStream.open(theFileName.c_str(),std::ios::out);
    if(!anOutFileStream)
      THROW_LOGICEXCEPTION_MACRO("GraphVizDisplay<Vertex,Edge>::show : cannot open file >"
				 << theFileName.c_str()
				 << "< , system error: " 
				 << strerror(errno));
    boost::write_graphviz(anOutFileStream,
			  g.getInternalBoostGraph() ,
			  aVertexLabelWriter,
			  anEdgeLabelWriter);
    anOutFileStream.close();
    // in case of listS there are hex identifiers in the dot file 
    // which dot cannot interpret as a hex number so we need to make it a 'name' 
    // pre prepending HEX
    std::string commandString(" sed \"s/0x/HEX/g\" " + theFileName + " >| " + theFileName + ".1;" +
                              " dot -Tgif " + theFileName + ".1 >| " + theFileName + ".gif ; xv -geometry +0+0 " + theFileName + ".gif" );
    system(commandString.c_str());
  } 
} 

