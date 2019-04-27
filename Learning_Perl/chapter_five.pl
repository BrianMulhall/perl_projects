use strict;
use warnings;
use v5.28.1;
use Readonly;


Readonly my $EMPTY_STR => q{};
Readonly my $SPACE => q{ };



while(<STDIN>){
	chomp;
	say "this is the line of input " . $_;	
}



