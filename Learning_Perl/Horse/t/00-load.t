#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Horse' ) || print "Bail out!\n";
}

diag( "Testing Horse $Horse::VERSION, Perl $], $^X" );
