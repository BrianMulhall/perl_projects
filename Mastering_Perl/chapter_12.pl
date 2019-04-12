use warnings;
use strict;
use v5.28.1;



# my $str = <<END;
# This is the sample text
# that is used to write to file.
# It is some lorem ipsum
# Type text but
# its prety cool how perl works
# in this way. Making it easy
# to practice my typing in this way
# so yay baby
# END

# my $filename = "sample.txt";


# open(FH, '>', $filename) or die $!;

# print FH $str;

# close(FH);

# say "Writing to a file successfully!";

# open(FH, '<' , $filename) or die $!;

# while(<FH>){
#     chomp;
# 	say $_;
# }

# while(<>){

# 	say $_;
# }

my $time = localtime;

say $time;