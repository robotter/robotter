#!/usr/bin/perl 
use warnings;

my @data;

open(FIN,$ARGV[0]) or die "$!";

while(<FIN>)
{
  # Erase data if plot mark is reached
  @data = () if(/<PLOTMARK>/);

  push(@data,$1) if(/PLOT (.+)$/);
}

close(FIN);

open(FOUT,">/tmp/plotfile") or die "$!";

for $d (@data)
{
  print FOUT $d."\n";
}

close(FOUT);
