use warnings;
use strict;
use 5.010;



my $path = $ENV{'PATH'};
my @line = split /;/, $path;

foreach(@line){

	say $_;

}

my $value;
my $key;

foreach $key (keys %ENV)
{
  # do whatever you want with $key and $value here ...
  my $value = $ENV{$key};
  print "$key: $value\n";
}