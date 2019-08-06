use strict;
use warnings;
use v5.28.1;

use File::Copy qw(copy);


rename "input.txt", "new_name.txt" || die "cannot rename this file $!";

copy "new_name.txt", "input_brians.txt";

