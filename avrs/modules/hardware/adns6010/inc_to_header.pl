#!/usr/bin/perl
use warnings;
use strict;

# Automaticaly generate C header with firmware byte array from Avago .inc files
#

use Data::Dumper;

if( @ARGV != 2 )
{
  print "usage : inc_to_header.pl <inc file> <header file>\n";
  exit 0;
}

my @firmware_array;

#-----------------------------------------
# Read bytes from inc file 

open(FIN,$ARGV[0]);

my @list;

while(<FIN>)
{
  if( my ($data) = /^\s+db\s+(.+)$/ )
  {
    for my $e (split /,/,$1)
    {
      my ($byte) = $e =~ /0(\w\w)h/g;
      push @firmware_array,$byte;
    }
  }
}

close(FIN);

#-----------------------------------------
# Compute firmware CRC

my $firmware_crc = 0;

for my $e (@firmware_array)
{
  $firmware_crc = $firmware_crc ^ hex($e);
}

$firmware_crc = sprintf("%#02x",$firmware_crc);

#-----------------------------------------
# Write C header file 

my $date = `date`;
chomp($date);

my $firmsize = @firmware_array;

open(FOUT,">".$ARGV[1]);

print FOUT <<EOF;
/** \\file $ARGV[1]
  * 
  * File automaticaly generated from $ARGV[0] by inc_to_header.pl.
  * Generated at $date
  */

#ifndef _ADNS6010_FIRWARE_H_
#define _ADNS6010_FIRWARE_H_

#include <stdint.h>
#include <avr/pgmspace.h>

#define ADNS6010_FIRMWARE_CRCHI (0x00)
#define ADNS6010_FIRMWARE_CRCLO (0x00)

#define ADNS6010_FIRMWARE_ID (0x00)

#define ADNS6010_FIRMWARE_CRC ($firmware_crc)

PROGMEM uint8_t adns6010_firmwareArray[$firmsize] = {
EOF

my $n=0;
for my $i (0..$#firmware_array)
{
  if($n>15)
  {
    $n=0;
    print FOUT "\n";
  }

  print FOUT "0x".$firmware_array[$i];

  print FOUT "," if($i != $#firmware_array);

  $n++;
}

print FOUT <<EOF;
};

#endif/*_ADNS6010_FIRWARE_H_*/

EOF

close(FOUT);
