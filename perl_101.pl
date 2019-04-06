use strict;
use warnings;



# create a file handlename
my $filename = "data.txt";
#this actually creates the file handle
open( my $fh, $filename ) or die "Could not open file '$filename' $!";

while (my $row = <$fh>){

	chomp $row;
	print "$row\n";
}


# close the file handle
close $fh;
