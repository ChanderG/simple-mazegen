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

# need to use my the first time a varb is used iff strict is used
my ($w, $h) = @ARGV;
$w ||= 16;
$h ||= 8;

my @visited = (1,2,3);  #[(('1') * $w), ('')];
printArray @visited;

sub visit_room {
  my ($x, $y) = $_;
  print $w,"\n";
  print $h,"\n";
}

visit_room 0, 0
