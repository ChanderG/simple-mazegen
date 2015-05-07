use strict;
use warnings;

# helper subs
sub printArray {
  my @array = @_;   # as an array is passed in
  foreach (@array) {
    print $_," ";
  }  
  print "\n";
}

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

print2dArray @visited;

sub visit_room {
  my ($x, $y) = $_;
  print $w,"\n";
  print $h,"\n";
}

visit_room 0, 0
