#!/usr/bin/env python

import os
import sys
import shutil
import re

def main():
    try:
	fout = open("algGraph.dot","w")
	fout.write("Digraph {\n")
	fout.write("  rankdir=RL;\n")
	fout.write("  nodesep=0.1;\n")
	fout.write("  size=\"20,20\";\n")
	fout.write("  node [fontsize=10,style=filled,fillcolor=white];\n")

	os.system(". ./makeAlgGraph")

	vertices = []

	fin = open("algGraphRaw.dot")
	for line in fin.readlines():
	    if (re.search("Digraph",line) or re.match("}",line)):
		continue
	    if (re.search("->",line)): # recognize EDGES
		fout.write("  " + line)
	    else: # if it's not an edge, it's a vertex
		vertices.append(line[:-2])
	fin.close()

	# search for an algorithm_action_# implementation
	algActions = {}
	for vertex in vertices:
	    algActions[vertex] = ""
	    (dirName,headerFileName) = vertex.split("_")
	    if (dirName == "Base"):
		continue
	    elif (dirName == "CFR"):
		dirName = "ControlFlowReversal"
	    elif (dirName == "BBP"):
		dirName = "BasicBlockPreaccumulation"
	    elif (dirName == "BBPTape"):
		dirName = "BasicBlockPreaccumulationTape"
	    elif (dirName == "BBPTapeAdjoint"):
		dirName = "BasicBlockPreaccumulationTapeAdjoint"
	    elif (dirName == "BBPReverse"):
		dirName = "BasicBlockPreaccumulationReverse"
	    headerFile = open("%s/inc/%sAlg.hpp" % (dirName,headerFileName))
	    for line in headerFile.readlines():
		if (re.match("\s+virtual void algorithm_action_",line)):
		    algActions[vertex] = algActions[vertex] + line.split()[2][17]
	    headerFile.close()

	# Draw clusters
	for i in [["Base","lightblue"],["CFR","purple"],["AddressArithmetic","beige"],["BBP","lightcyan"],["BBPReverse","lemonchiffon"],["BBPTapeAdjoint","lightgreen"],\
		  ["BBPTape","lightgoldenrod"],["ConstantFolding","lightgrey"],["Linearization","dimgray"],["TypeChange","palevioletred"],["MemOpsTradeoffPreaccumulation","coral"]]:
	    (algName,algColor) = i
	    fout.write("\n  subgraph cluster_%s {\n" % algName)
	    fout.write("    label=\"%s\";\n" % algName)
	    fout.write("    style=filled;\n")
	    fout.write("    color=%s;\n" % algColor)
	    for vertex in vertices:
		if (vertex.split("_")[0] == algName):
		    if (algActions[vertex] != ""):
			fout.write("    %s [label=\"%s(%s)\"];\n" % (vertex,vertex.split("_")[1],algActions[vertex]))
		    else:
			fout.write("    %s [label=\"%s\"];\n" % (vertex,vertex.split("_")[1]))
	    fout.write("  }\n")
	    
	fout.write("\n}\n")
	fout.close()
	os.system("dot -T svg algGraph.dot > algGraph.svg && firefox algGraph.svg")

    except RuntimeError, errtxt:
	print 'caught exception: ',errtxt
	return -1
    return 0

if __name__ == "__main__":
    sys.exit(main())

