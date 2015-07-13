#!/bin/bash
sourcedir=<>/bw
destdir=<>/wig

for f in $sourcedir/*.bw
do      
	fbase=$(basename "$f")
	echo "File:$f"
	echo "Filename:$fbase"
	bigWigToWig $f $destdir/"$fbase".Wig
done
