use strict;
use warnings;
use v5.10;
use Person;


my $teacher = Person->new;
 
$teacher->name('Brian Mulhall');
 
say $teacher->name;