use strict;
use warnings;
use 5.028.01;



my $numbers = 1234567;
my $zero = 0;

my $empty_string = "";
my $string = "BRIAN";

my @scalar_ref_undefined = undef;
my @arr = ();



if(@scalar_ref_undefined){
  say "array ref undefined is true";
}

if(@arr){
  say "empty arr is true";
}



if($empty_string){
  say "empty string is true";
}

if($string){
  say qq(string is true $string);
  $string = lc $string;
  say qq(string is true $string);
}

#numbers and their associated boolean values
if($zero){
  say "True";
}

if($numbers){
  say "numbers is true";
}
