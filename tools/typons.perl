#!perl -w

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
# Copyright 2007, Benoît Ryder <benoit@ryder.fr>, for Eirbot


# L'agencement des typons peut être représenté par un arbre binaire
#   +---++----+
#   | 1 || 2  |
#   |   |+----+       1
#   +---+            / \
#   +----+          2   3
#   | 3  |
#   +----+
#
# (On essaie d'abord d'ajouter les fils gauche.)
# On garde une liste des feuilles vides et on essaie d'y mettre des typons.
# S'il ne reste plus de feuilles vides, l'agencement est invalide.


use strict;

# Conversion mm -> pt et arrondi
sub mm2pt($)
{
  return int($_[0]*72/25.4);
}

# Marges de la page et espacement entre typons, en pt
my ($margin, $spacing, $can_rotate, $border, $corner, $fout, $eps) =
  (mm2pt(10),mm2pt(3),0,0,0,'-',0);

# Dimensions de la page (en points), avec les marges
my %page_size = ('x'=> 595, 'y'=> 842);
# Taille d'un coin
my $corner_size = mm2pt(10);

my @files = ();  # Liste des fichiers
my @sizes = ();  # Taille et offset des typons (x,y,dx,dy)

# Liste des typons (id,x0,x1,y0,y1,rot)
# Les [xy][01]ne tiennent pas compte du décalage de la BoudingBox
my @typons;

# Ids des typons pas encore placés
my @ids;


if( $#ARGV < 0 )
{
  help();
  exit(0);
}

for( my $i=0; $i<=$#ARGV; $i++ )
{
  $_ = $ARGV[$i];
  if( /^(-h|--help)$/ )
  {
    help();
    exit(0);
  }
  elsif( /^(-r|--rotate(=(on|1))?)$/ )        { $can_rotate = 1; }
  elsif( /^(--no-rotate|--rotate=(off|0))$/ ) { $can_rotate = 0; }
  elsif( /^(-b|--border(=(on|1))?)$/ )        { $border = 1; }
  elsif( /^(--no-border|--border=(off|0))$/ ) { $border = 0; }
  elsif( /^(-c|--corner(=(on|1))?)$/ )        { $corner = 1; }
  elsif( /^(--no-corner|--corner=(off|0))$/ ) { $corner = 0; }
  elsif( /^(-e|--eps(=(on|1))?)$/ )           { $eps = 1; }
  elsif( /^(--no-eps|--ps|--eps=(off|0))$/ )  { $eps = 0; }
  elsif( /^(-m(.*)|--margin=(.*))$/ )
  {
    if( $2 )
    {
      $margin = $2;
    }
    elsif( $3 )
    {
      $margin = $3;
    }
    else
    {
      $i++;
      defined($ARGV[$i]) or print_err("Missing argument.");
      $margin = $ARGV[$i];
    }

    print_err("Invalid margin '$margin'.")
    unless( $margin =~ /^\d+(.\d*)?$/ );

    $margin = mm2pt($margin);
  }
  elsif( /^(-s(.*)|--spacing=(.*))$/ )
  {
    if( $2 )
    {
      $spacing = $2;
    }
    elsif( $3 )
    {
      $spacing = $3;
    }
    else
    {
      $i++;
      defined($ARGV[$i]) or print_err("Missing argument.");
      $spacing = $ARGV[$i];
    }

    print_err("Invalid spacing '$spacing'.")
    unless( $spacing =~ /^\d+(.\d*)?$/ );

    $spacing = mm2pt($spacing);
  }
  elsif( /^(-o(.*)|--output=(.*))$/ )
  {
    if( $2 )
    {
      $fout = $2;
    }
    elsif( $3 )
    {
      $fout = $3;
    }
    else
    {
      $i++;
      defined($ARGV[$i]) or print_err("Missing argument.");
      $fout = $ARGV[$i];
    }
  }
  else
  {
    push @files, $_;
  }
}

print_err("Donnez-moi au moins un eps.") if( not @files );


### Charge les tailles des eps
foreach my $f (@files)
{
  my $ok = 0;
  open(FEPS, "<$f") or die("Impossible d'ouvrir le fichier '$_'");
  while( <FEPS> )
  {
    if( m/^%%\s*BoundingBox:\s*(\S+)\s+(\S+)\s+(\S+)\s+(\S+)/ )
    {
      push @sizes, {'x'=>$3-$1, 'y'=>$4-$2, 'dx'=>$1, 'dy'=>$2};
      $ok = 1;
      last;
    }
  }
  print_err("Invalid eps file '$f'.") unless $ok;
  close(FEPS);
}



### Affiche l'aide
sub help
{
  print <<EOF;
Dispose des fichiers EPS sur une page et retourne le fichier PostScript
correspondant. Si aucune disposition n'est trouvée, retourne une erreur.
La complexité est en n!, avec n le nombre d'images.
  Copyright 2007, Benoît Ryder <benoit\@ryder.fr>, pour Eirbot

$0 [OPTIONS] [-o FILE] FILES

 -h --help             Message d'aide
 -r --rotate=[on|off]  Autoriser la rotation des images
 -b --border=[on|off]  Afficher des lignes autour de chaque typon
 -c --corner=[on|off]  Mettre un repère en bas à gauche de chaque typon (1 cm)
 -m --margin=VAL       Marges de la page, en mm (défaut : 10)
 -s --spacing=VAL      Espacement minimum entre les images, en mm (défaut : 3)
 -o --output=FILE      Fichier de sortie (par défaut, stdout)
 -e --eps              Produire un EPS (pas pleine page)

EOF
}


### Essaie de placer un nouveau typon (fonction récursive)
# Paramètre : liste des positions
sub iter
{
  # Plus rien à ajouter, on envoie le ps
  print_ps() if not @ids;

  my ($id, $rot);
  my ($x0, $y0, $x, $y);

  my $pos;
  while( $pos = pop @_ )
  {
    # Pour les ids, sorte de liste tournante
    for( my $i=0; $i<=$#ids; $i++ )
    {
      $id = pop @ids;
      ($x0,$y0) = ($pos->{'x'}, $pos->{'y'});
      ($x,$y) = ($sizes[$id]->{'x'}, $sizes[$id]->{'y'});

      # Si la position est valide...
      if( valid_pos($x0,$y0,$x0+$x,$y0+$y) )
      {
        # Place le typon
        push @typons, {'id'=>$id,'x0'=>$x0,'y0'=>$y0,'x1'=>$x0+$x,'y1'=>$y0+$y,'rot'=>0};
        # Teste
        iter(({'x'=>$x0,'y'=>$y0+$y+$spacing}, @_, {'x'=>$x0+$x+$spacing,'y'=>$y0}));
        # Le retire (si ça avait fonctionné, on ne serait pas là)
        pop @typons;
      }
      # Si on autorise les rotations...
      elsif( $can_rotate and valid_pos($x0,$y0,$x0+$y,$y0+$x) )
      {
        # Place le typon
        push @typons, {'id'=>$id,'x0'=>$x0,'y0'=>$y0,'x1'=>$x0+$y,'y1'=>$y0+$x,'rot'=>1};
        # Teste
        iter(({'x'=>$x0,'y'=>$y0+$x+$spacing}, @_, {'x'=>$x0+$y+$spacing,'y'=>$y0}));
        # Le retire (si ça avait fonctionné, on ne serait pas là)
        pop @typons;
      }

      unshift @ids, $id;
    }
  }
}


### Test de chevauchement/débordement (x0,y0,x1,y1)
sub valid_pos
{
  my ($x0,$y0,$x1,$y1) = (@_);

  # Débordement de la page
  return 0
    if( $x1 > $page_size{'x'}-$margin or $y1 > $page_size{'y'}-$margin );

  # Chevauchement
  foreach (@typons)
  {
    return 0
      if( $x0 - $_->{'x1'} < $spacing and
          $_->{'x0'} - $x1 < $spacing and
          $y0 - $_->{'y1'} < $spacing and
          $_->{'y0'} - $y1 < $spacing
      );
  }

  return 1;
}



@typons = ();
@ids = (0 .. $#files);

# Au début, une position : en bas à gauche
iter( ({'x'=>$margin, 'y'=>$margin}) );

print STDERR "Aucun agencement trouvé. Essayez avec moins de fichiers.\n";

exit(1);


### Envoie le ps en sortie et quitte
sub print_ps
{
  if( $fout ne '-' )
  {
    open(FOUT, ">$fout") or die("Impossible d'ouvrir le fichier '$fout'");
    select FOUT;
  }

  # Header PostScript, vraiment minimaliste
  if( $eps )
  {
    print "%!PS-Adobe-3.0 EPSF-3.0\n";

    my ($x) = (sort( { $b->{'x1'} <=> $a->{'x1'} } @typons))[0]->{'x1'}+$margin;
    my ($y) = (sort( { $b->{'y1'} <=> $a->{'y1'} } @typons))[0]->{'y1'}+$margin;
    print "%%BoundingBox: 0 0 $x $y\n";
  }
  else
  {
    print "%!\n";
  }

  use Data::Dumper;
  foreach (@typons)
  {
    print "gsave\n";

    # Place le repère où on veut mettre le typon
    print "$_->{'x0'} $_->{'y0'} translate\n";

    # Rotation si besoin
    if( $_->{'rot'} )
    {
      print "90 rotate\n";
      print "0 $sizes[$_->{'id'}]->{'y'} translate\n";
    }

    # Bordure
    if( $border )
    {
      print "0 0 moveto\n";
      print "0 $sizes[$_->{'id'}]->{'y'} lineto\n";
      print "$sizes[$_->{'id'}]->{'x'} $sizes[$_->{'id'}]->{'y'} lineto\n";
      print "$sizes[$_->{'id'}]->{'x'} 0 lineto\n";
      print "0 0 lineto\n";
      print "stroke \n";
    }
    # Coin de repère
    elsif( $corner )
    {
      print "0 $corner_size moveto\n";
      print "0 0 lineto\n";
      print "$corner_size 0 lineto\n";
      print "stroke \n";
    }

    # Décalage BoudingBox
    print "-1 $sizes[$_->{'id'}]->{'dx'} mul -1 $sizes[$_->{'id'}]->{'dy'} mul translate\n";

    # Envoie le fichier
    open(FEPS, "<$files[$_->{'id'}]") or die("Impossible d'ouvrir le fichier '$files[$_->{'id'}]");
    while( <FEPS> )
    {
      next if /^%/;
      # Supprimer les éventuels "showpage"
      s/\bshowpage\b//;
      print;
    }
    close(FEPS);

    print "grestore\n";
  }

  print "showpage\n" if not $eps;

  exit(0);
}


### P'tite function d'erreur
sub print_err
{
  print STDERR "@_\n";
  exit(1);
}

