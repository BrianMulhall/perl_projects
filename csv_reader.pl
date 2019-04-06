use warnings;
use strict;


my $file = 'financial_data.csv';
my $index = 0;


open (F, $file) || die ("Could not open $file!");

while (my $line = <F>)
{
  if($index == 0){
  	$index++;
  	next;
  } 
  else{
    chomp $line;
    (my $age, my $first_name, my $last_name) = split ',', $line;
    print "Name: $first_name $last_name\nAge: $age\n\n";
  }
}

close (F);