use warnings;
use strict;
use List::Util qw(
      reduce any all none notall first
      max maxstr min minstr product sum sum0
      pairs unpairs pairkeys pairvalues pairfirst pairgrep pairmap
      shuffle uniq uniqnum uniqstr
    );
use v5.28.1;


my $run_sum = 0;

foreach my $i (1..999){
  if($i % 3 == 0){ 
    $run_sum += $i;
  }
  elsif ($i % 5 == 0){
   $run_sum += $i;
 }
}


print "the sum is $run_sum\n";

