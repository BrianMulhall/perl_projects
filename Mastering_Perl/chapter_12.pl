use warnings;
use strict;
use v5.28.1;
use Log::Log4perl qw(:easy);

Log::Log4perl->easy_init( $ERROR );

ERROR( "I've got something to say!" );
