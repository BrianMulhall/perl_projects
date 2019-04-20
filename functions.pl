use strict;
use warnings;
use 5.010;

my $name_last = "NIGGAS";


# Function definition
sub Hello {
   (my $name_first, my $name_last, my $name_middle) =  @_; 

   if ($name_middle ne "Edward" ){
         print "Hello, $name_first $name_middle $name_last!\n";
      } 
      else{
            print "Hello, $name_first  $name_last!\n";
      }
      return 1;
}






my $retVal = Hello( "Brian", "Mulhall","Edward" );

say $retVal;

Hello( "Brian", "Mulhall","Smith" );

