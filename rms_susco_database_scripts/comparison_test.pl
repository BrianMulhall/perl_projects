use warnings;
use strict;



my %table_data;
my %query_data;

my $table_filename;
my $query_filename;

open ($table_filename, 'deployments_table_data.txt');
open ($query_filename,  'deployments_query_data.txt');

while(<$table_filename>){

	my($res_id, $dep_count) = split /\t/, $_;
	
	$table_data{$res_id} = $dep_count;

}

while(<$query_filename>){

	my($res_id, $dep_count) = split /\t/, $_;
	
	$query_data{$res_id} = $dep_count;

}



my $same_counter = 0;
my $not_same_counter = 0;

foreach my $res (sort(keys %table_data)) {
	

	if( !exists $table_data{$res} || !exists $query_data{$res} ) {
		print qq($res doesnt exist in one of the two hashes\n);
	}
	

	if($table_data{$res} != $query_data{$res}){
		print qq($res\ntable has $table_data{$res}\nquery has $query_data{$res} \n\n\n);
		$not_same_counter++;
	}
	elsif($table_data{$res} == $query_data{$res}){
		
		$same_counter++;
	}

}

my $total_resources = $same_counter + $not_same_counter;

print qq(Not the same : $not_same_counter\t\t The same : $same_counter\t\t Total number of Resources : $total_resources);