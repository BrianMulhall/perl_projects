use warnings;
use strict;
use Time::Piece;
use v5.28.1;

my @dates = ("3 Nov, 1989", "Nov, 1989", "1 Jan, 1999");
 
foreach my $d (@dates) {
    eval {
        my $tp = Time::Piece->strptime($d, "%d %b, %Y");
        say $tp;
        1;
    } or do {
        my $error = $@ || 'Unknown failure';
        warn "Could not parse '$d' - $error";
    };
}