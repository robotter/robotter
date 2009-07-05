#!/usr/bin/perl

for $k (1..3)
{
  for $i (1..20)
  {
    $v = 100-int(200*rand());
    print "$v,";
  }
  print "\n";
}
