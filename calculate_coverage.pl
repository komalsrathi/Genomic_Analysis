#!/usr/bin/perl
use File::Basename;

# source dir
my $source='gsnap/';

# open source dir
opendir(DIR, $source) or die "Can't open the current directory: $!\n";

# read in only *_filter_sort.bam files
my @files = <$source/*_filter_sort.bam>;

# calculate coverage of bam files
foreach $files(@files)
{
        my $basename=basename($files);                  
        (my $without_extension = $basename) =~ s/\.[^.]+$//;                            
        $without_extension="$without_extension".".out";
        my $cmd="bedtools coverage -abam $files -b Homo_sapiens_73_gtf2bed.bed -counts > $without_extension &";                                 
        print $cmd,"\n";
        system($cmd);
}
