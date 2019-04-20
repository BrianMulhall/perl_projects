use strict;
use warnings;
use Readonly;
use v5.28.1;

Readonly my $SPACE => q{ };
Readonly my $EMPTY_STR => q{};

my $name_first = "Brian";
my $name_last = "Mulhall";


say qq{interpolated string with \'$name_first $name_last\'};

