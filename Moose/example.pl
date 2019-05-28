use warnings;
use strict;
use v5.28.1;

use package CD;

my $cd = CD->new( title => 'Worst Hits of the Seventies',
                            id =>  1 );

say $cd->title;