use strict;
use warnings;
use v5.28.1;

use XML::LibXML;


my $filename = 'carte-latin1.xml';

open my $fh, '<', $filename;


my $dom = XML::LibXML->load_xml(IO => $fh);

foreach my $course ($dom->findnodes('/carte/cours')) {
    say $course->{nom}; # gets the attribute
    foreach my $dish ($course->findnodes('./plat')) {
        say "* " . $dish->to_literal();
    }
    say '';
}

