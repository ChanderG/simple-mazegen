use strict;
use warnings;

# helper sub
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

# need to use my the first time a varb is used iff strict is used
my ($w, $h) = @ARGV;
$w ||= 16;
$h ||= 8;

#my @visited = map [(('1') * $w), ('')], 1 .. $h;
my @visited = map [ map '0',1 .. $w, '1'], 1 .. $h;
=example 2d arrray
my @visited = ( [1,2,3],
                [4,5,6],
		[7,8,9]);
=cut
print2dArray @visited;

sub visit_room {
  my ($x, $y) = $_;
  print $w,"\n";
  print $h,"\n";
}

visit_room 0, 0
