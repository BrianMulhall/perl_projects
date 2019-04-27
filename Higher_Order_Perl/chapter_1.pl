use strict;
use warnings;
use v5.28.1;


sub binary{
	my $n = shift;
	say $n;
	return $n if $n == 0 || $n ==1;
	my $k = int($n/2);
	my $b = $n % 2;

     my $E = binary($k);
	return  $E . $b;
}

sub factorial{

	my ($n) = @_;
	return 1 if $n == 0;
	return factorial($n-1) * $n;

}



sub hanoi{
	my ($n, $start, $end, $extra, $move_disk) = @_;
	if ($n == 1) {
		$move_disk->(1, $start, $end);
	}
	else {
		# this is the step
		hanoi($n-1, $start, $extra, $end, $move_disk);
		$move_disk->($n,$start,$end);
		hanoi($n-1, $extra, $end, $start,  $move_disk);
	}
}


sub print_intructions{
	my ($disk, $start, $end) = @_;
	print qq(Move disk #$disk from $start to $end.\n);
}

#hanoi(3, 'A', 'C', 'B', \&print_intructions);

print binary(37);

