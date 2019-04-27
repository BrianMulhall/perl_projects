use strict;
use warnings;
use v5.28.1;
use List::Util qw(min shuffle);


my @numbers = (1..99);

@numbers = map {$_ * 5} @numbers;

@numbers = grep { $_ > 480 && $_ < 490} @numbers;

@numbers = shuffle @numbers;

foreach my $n (@numbers){

	say "the number is " . $n;

}

