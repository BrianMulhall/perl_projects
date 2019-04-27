#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use XML::LibXML;

my $filename = 'playlist.xml';

my $dom = XML::LibXML->load_xml(location => $filename);

#finding the nodes by an XPath query
foreach my $movie ($dom->findnodes('/playlist/movie')) {

    say $movie->to_literal();

}

