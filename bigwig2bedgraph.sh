#!/bin/bash
sourcedir=<>/bw
destdir=<>/bedGraph

for f in $sourcedir/*.bw
do      
	fbase=$(basename "$f")
	echo "File:$f"
	echo "Filename:$fbase"
	bigWigToBedGraph $f $destdir/"$fbase".bedGraph
done
