use warnings;
use strict;
use v5.28.1;


my $name = "brian";

say "Name: $name";

my $name_ref = \$name;

say "Name ref: $name_ref";
say "Name ref: $$name_ref";

my @names = qw(brian jessica edward robin dorothy ralph beth austin);

my $name_ref = \@names;

foreach my $el (@$name_ref){

  say $el;
}
print "\n\n\n\n";

my %names = ( "1" => "brian", "2" => "jessica", "3" => "edward");

my $hash_ref = \%names;

foreach my $i (sort keys %names){

    say $$hash_ref{$i};
}