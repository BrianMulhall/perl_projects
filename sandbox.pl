use strict;
use warnings;

my $lat_lower_limit = 32;
my $lat_upper_limit = 42;
my $long_lower_limit = 80;
my $long_upper_limit = 100;

my $random_long = (rand($long_upper_limit-$long_lower_limit)) + $long_lower_limit;

$random_long = $random_long * (-1);

my $random_lat = (rand($lat_upper_limit-$lat_lower_limit)) + $lat_lower_limit;

$random_lat = sprintf("%.9f", $random_lat);
$random_long = sprintf("%.9f", $random_long);

print "Longitude: "  . $random_long . "\n";
print "Longitude: "  . $random_lat . "\n";