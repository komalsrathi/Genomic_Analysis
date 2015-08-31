#!/bin/bash
# apply bigwig
sourcedir=<contains wig files>
destdir=<outputs bigwig files>

for f in $sourcedir/*.data
do      
	fbase=$(basename "$f")
	echo "File:$f \n"
	echo "Filename:$fbase \n"
	echo "Command: wigToBigWig -clip $f <chrom.sizes> $destdir/$fbase.bw"
	wigToBigWig -clip $f <chrom.sizes> $destdir/"$fbase".bw
	echo "BigWig File: $destdir/"$fbase".bw done"
done
