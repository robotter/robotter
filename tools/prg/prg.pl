#!/usr/bin/perl -w

# TODO : test d'erreur 'partout'

use strict;

$\ = "\n";

# Paramètres
my %param = (
  'a'=> 0,
  'r'=> 0,
  'e'=> 0,
  'f'=> 0,
	'y'=> 0,
  'm'=> 1,
  'p'=> 1,
  'u'=> 0,
  'v'=> 1,
);

my $port = 0;
my $erreur = 0;
my $boucle = "";
my ($uploadfile, $redir, $fincom, $arg, $c, $val, $ret);


foreach $arg (@ARGV)
{
  # L'aide
  if( $arg =~ /^-{0,2}h(elp)?$/ )
  {
    print <<EOF
prg -- 01/02/09 -- JDaM <brossill\@enseirb.fr>, Ryder <benoit\@ryder.fr>
Usage : prg [OPTIONS]

Les caractères de chaque argument sont interprétés successivement.
Un tiret (-) inverse la valeur qui sera affectée (initialement vrai).

   a    upload main.elf (flash+eeprom) à la place main.hex
   r    effectue un reset de la carte (par lecture des fuses)
   e    efface le programme de la carte et rien d'autre
   y    vérification du programme de la carte
   m    lance un 'make 2>error.log >make.log' (défaut : vrai)
   p    programme (envoie le main.elf sur la carte) (défaut : vrai)
   v    verbose (affiche les différentes étapes) (défaut : vrai)
	 f    ne pas vérifier le type d'ATMEGA programmé
   u    utilisation d'un port USB
 [0-9]  port sur lequel programmer (défaut : 0)

	 R    reset sans make ni programmation (équivalent à r-mp-)
	 M    make sans reset ni programmation (équivalent à m-rp-)
	 P    programmation sans make ni reset (équivalent à r-mr-)
   
	 c    suivi des paramètres pour la boucle JTAG (ex : c0,1,2,4)

Les opérations (si demandées) sont effectuées dans cet ordre :
make, programmation, verify, reset
Un clear est toujours fait 'seul' (on fait le clear et rien d'autre).
Si le make échoue, on arrête tout.
Par défaut : make, programmation, port 0, verbose.

Pour l'aide : h ou help avec 0, 1 ou 2 tirets avant (y'a le choix).
EOF
		;

    exit 0;
  }

	if( $arg =~ /^c/ )
	{
		$arg =~ s/^c//;
		$boucle = $arg;
	}
	else
	{
		# Lecture d'arguments
		$val = 1;
		$arg =~ s/R/r-mp-/;
		$arg =~ s/M/m-rp-/;
		$arg =~ s/P/p-mr-/;
		foreach $c (split(//, $arg))
		{
			if( $c eq '-' ) { $val = !$val }
			elsif( $c =~ /\d/ ) { $port = $c }
			elsif( exists($param{$c}) )
			{
				$param{$c} = $val;
			}
			else
			{
				print "ERREUR : Paramètre inconnu : $c";
				$erreur = 1;
			}
		}
	}
}


# Si erreur : on quitte
if( $erreur )
{
  print "\n'prg h' pour l'aide";
  exit -1;
}

if( $param{'a'} )
{
  $uploadfile = 'main.elf'
}
else
{ 
  $uploadfile = 'main.hex'
}

if( $param{'u'} )
{
  $fincom = " -j /dev/ttyUSB$port ";
}
else
{
  $fincom = " -j /dev/ttyS$port ";
}

if( $boucle ne "" )
{
	$fincom .= " -c $boucle ";
}

if( $param{'e'} )
{
  print "--- Effacement du uP... ---" if $param{'v'};
  system( "avarice --erase $fincom" );
	exit 0;
}


if( $param{'v'}  )
{
  print "=======================================\n";
  $redir = '';
}
else
{
  $redir = "2> /dev/null 1> /dev/null";
}

if( $param{'m'} )
{
  print " --- Compilation... ---" if $param{'v'};
  system( "make 2>error.log >make.log" );

  # Compilation réussie ok ?
  if( -s "error.log" )
  {
    $ret = $?;

    # Une erreur, c'est fatal...
    if( $ret )
    {
      print "__ERREURS___________________________________" if $param{'v'};
      system( "cat error.log" );
      print "____________________________________________" if $param{'v'};
      exit $ret;
    }

    print "__WARNINGS____________________________________" if $param{'v'};
    system( "cat error.log" );
    print "______________________________________________" if $param{'v'};
  }
  else
  {
    print "  OK :)" if $param{'v'};
  }
}
else
{
  system("cp /dev/null error.log ; cp /dev/null make.log");
}


if( $param{'p'} )
{
  print " --- Programmation du robot ---" if $param{'v'};

  # Test l'atmega qu'il y a en face
  if( !$param{'f'} )
  {
    print "Vérification du type d'ATMEGA" if $param{'v'};
    if( !open(FCONF, 'autoconf.h') )
    {
      print 'Pas de fichier autoconf.h';
      exit -1;
    }
    while( <FCONF> )
    {
      last if( ($_) = m/^#define CONFIG_MCU_(\w*)/ );
    }
    close( FCONF );
    if( $_ eq "" )
    {
      print "Type d'ATMEGA non trouvé";
      exit -1;
    }
    $_ = lc;
    system( "avarice $fincom | grep $_" );
    if( $? )
    {
      print "ERREUR : ATMEGA incompatible\n";
      exit -1;
    }
    else
    {
      print "0K :)\n"
    }
  }

  system( "avarice --erase --program --file $uploadfile $fincom $redir" );
}

if( $param{'y'} )
{
  print " --- Verification du uP... ---" if $param{'v'};
  system( "avarice --verify --file $uploadfile $fincom $redir" );
}

if( $param{'r'} )
{
  print " --- Reset du uP... ---" if $param{'v'};
  system( "avarice -r $fincom $redir" );
}


exit 0;

