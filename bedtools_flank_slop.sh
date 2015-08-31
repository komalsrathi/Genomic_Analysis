#!/bin/bash

# input the bedfile & number of bases you want to ge upstream and into the gene from the start

echo "Input bedfile:"
read bedfile
echo "Input upstream bases to add from start of the gene:"
read upstream
echo "Input bases to add from start of the gene:"
read down

bedtools flank -i $bedfile -g mm9.genome -l $upstream -r 0 -s | bedtools slop -i - -g mm9.genome -l 0 -r $down -s > ${bedfile%.*}_$upstream-upstream_$down-in.bed
