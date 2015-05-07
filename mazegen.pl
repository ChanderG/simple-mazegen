use strict;
use warnings;

use List::Util qw(shuffle max);

# helper subs
# simple 1d array print sub with:
# 1) spaces seperating the elements of the area
# 2) a newline at the end
sub printArray {
  my @array = @_;   # as an array is passed in
  foreach (@array) {
    print $_," ";
  }  
  print "\n";
}

# simple 1d array print sub with:
# 1) no spaces seperating the elements of the area
sub printArrayNoFormatting {
  my @array = @_;   # as an array is passed in

  # more direct alternative
  # print join('', @array);

  foreach (@array) {
    print $_;
  }  
}

# simple 2d array print sub
sub print2dArray {
  my @array = @_;
  foreach (@array) {
    printArray @$_;
  }
}

# end helper subs 

# need to use 'my' the first time a varb is used iff strict is used
my ($w, $h) = @ARGV;
$w ||= 16;
$h ||= 8;

my @row = map '0', 1 .. $w;
push @row, '1';
#printArray @row;

my @visited = map [@row], 1 .. $h;
push @visited, [map '1', 0 .. $w];

#print2dArray @visited;

my @hor = map [map '+--', 1 .. $w], 0 .. $h;
my @ver = map [map '|  ', 1 .. $w], 1 .. $h;

#print2dArray @hor;
#print2dArray @ver;

sub printMaze {
  for my $i (0 .. $h - 1) {
    printArrayNoFormatting @{$hor[$i]};
    print "+\n";
    printArrayNoFormatting @{$ver[$i]};
    print "|\n";
  }
  printArrayNoFormatting @{$hor[$h]};
  print "+\n";
}

sub visit_room {
  (my $x, my $y) = @_;
  #print $x,"\n";
  #print $y,"\n";

  if($x == -1) { $x = $w; }
  if($y == -1) { $y = $h; }

  $visited[$y][$x] = '1';

  my @neighbours = ([$x - 1, $y], [$x+1, $y], [$x, $y-1], [$x, $y+1]);
  #print2dArray @neighbours;

  # going with the shuffling as done in the Python version
  # requires external module 
  
  @neighbours = shuffle ( @neighbours );
  #print2dArray @neighbours;
  
  foreach (@neighbours) {
    #print @$_, "\n"; 
    my ($xx, $yy) = @$_;

    if ($xx == -1) { $xx = $w; }
    if ($yy == -1) { $yy = $h; }

=cut not sure about this
    SWITCH:
    for (@$_) {
      if ($visited[$y)
      ????
    }

    the switch shown here won't cut it
    we need to use a later syntax?
=cut

    if($visited[$yy][$xx] == 1){
      next;
    }
    elsif($xx == $x){
      $hor[max($yy, $y)][$x] = '+  ';
    }
    elsif($yy == $y){
      $ver[$y][max($xx, $x)] = '   ';
    }
    else{
    }

    visit_room($xx, $yy);
  }
}

visit_room(int rand $w, int rand $h);

printMaze; 
