#!/usr/bin/perl 
use File::Basename;

my $source='<>/bedGraph';
my $dest='<>/bedGraphTobed';

# open the directory containing fastq files, read the names of the files, close the directory
opendir(DIR, $source) or die "Can't open the current directory: $!\n";

# read in only .fastq.gz files
my @files = <$source/*.bedGraph>;

closedir(DH);

foreach $file(@files)
{
	print "$file\n";
	# my $basename=basename($file);
	# print "$basename\n";
	open(DATA, $file) or die("Could not open input BEDGRAPH file!\n"); 
	$file=~/(chr\d*\w*)/;
	my $outfile= "$dest/$1.bed";
	print "$outfile\n";
	open(OUTPUT, ">$dest/$1.bed") or die("Could not open output BED file!\n");
	
	my ($prev_chr, $prev_start, $prev_end);
	my $thresh = 0.57;

	while (<DATA>) 
	{
	  my ($chr, $start, $end, $score) = split;
	  if ($score >= $thresh) 
		{
        		$prev_chr   //= $chr;
       	 		$prev_start //= $start;
        		$prev_end = $end;
    }
    else 
		{
        		if ($prev_chr) 
        		{
              print OUTPUT "$prev_chr\t$prev_start\t$prev_end\n";
				      ($prev_chr, $prev_start, $prev_end) = (undef) x 3;
        		}
    }
	}
	print "$prev_chr\t$prev_start\t$prev_end\n" if $prev_chr;
	close(DATA);
}
