use strict;
use warnings;
use 5.010;

# Function definition
sub Hello {
   print "Hello, World!\n";
}

sub Average {
   # get total number of arguments passed.
   my $n = scalar(@_);
   say $n;
   my $sum = 0;

   foreach my $item (@_) {
      $sum += $item;
      say $sum;
   }
   my $average = $sum / $n;

   return $average;
}





# Function call
Hello();

my $av = Average(10,20,30);
say 'the average is ' . $av;

