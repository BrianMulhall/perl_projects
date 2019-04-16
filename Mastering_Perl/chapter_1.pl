use warnings;
use strict;

use v5.28.1;

my $isbn = '0-596-10206-2';


$isbn =~ m/\A(\d+)(?#group)-(\d+)(?#publisher)-(\d+)(?#item)-([\dX])\z/i;



print <<"HERE";
Group code: $1
Publisher code: $2
Item: $3
Checksum: $4
HERE
