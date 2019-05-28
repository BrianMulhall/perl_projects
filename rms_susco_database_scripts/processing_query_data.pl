use warnings;
use strict;



my %dep_data;

open (FILEIN, 'query_output_raw.txt');
open (FILEOUT, '>', 'deployments_query_data.txt');

while(<FILEIN>){

	my($res_id, $dep_str) = split /\t/, $_;
		
	my $deployment_count = split /,/, $dep_str; 

	$dep_data{$res_id} = $deployment_count;

}


foreach my $resource_Id  (keys %dep_data)  {
	print FILEOUT qq($resource_Id\t$dep_data{$resource_Id}\n);
}