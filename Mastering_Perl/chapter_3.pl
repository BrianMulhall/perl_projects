use warnings;
use strict;
use v5.28.1;
use Hook::LexWrap qw(wrap);


my $n = shift @ARGV;
my $m = shift @ARGV;


{
wrap add,
 pre => sub { print "I got the arguments: [@_]\n"; $_[-1] = "11";},
 post => sub { print "The return value is going to be $_[-1]\n" };
 
 print "The sum of $n and $m is " . add( $n, $m ) . "\n";
}


sub add {
 my( $n, $m ) = @_;
 my $sum = $n + $m;
 return $sum
}