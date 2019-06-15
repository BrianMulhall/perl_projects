use warnings;
use strict;
use v5.28.1;

my @palindromes = ();
foreach my $i (100..999){
  foreach my $j (100..999){
      my $product = $i * $j;
      if(check_palindrome($product)){
          push @palindromes, $product;
      }

  }
  
}

say @palindromes[-1];


sub check_palindrome{
  my($i) = @_;
  my $str_len = length $i;

  if($str_len % 2 == 0){
    my $m;
    my $n;
    while($m < $n){
      if()
    }
  }


}


