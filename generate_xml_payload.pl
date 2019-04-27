use strict;
use warnings;

use DBI;

my @drivers = DBI->available_drivers;
for my $drivers (@drivers){
	print $drivers . "\n"; 
}

my @dsns = DBI->data_sources('ODBC');
foreach my $d (@dsns)
{
  print "$d\n";
}

my $dsn = qq(dbi:ODBC:RMS_DB);


 my $myDSN = 'RMS_DB';
 my $read_dbh = DBI->connect("DBI:ODBC:$myDSN",{ RaiseError => 1}) or die DBI->errstr;
my $update_dbh = DBI->connect("DBI:ODBC:$myDSN",{ RaiseError => 1}) or die DBI->errstr;

 my $sql = qq(select Id from dbo.ClaimAssignments where Latitude is null AND Longitude is null);      # the query to execute
 my $sth = $read_dbh->prepare($sql);          # prepare the query
 $sth->execute();   

my $update_sql = qq(update dbo.ClaimAssignments SET Latitude = ?, Longitude = ? where id = ?);
my  $update_sth =      $update_dbh->prepare($update_sql); 
 

 
my @arr_of_results; 
 
while (my @row = $sth->fetchrow_array) {  
   push @arr_of_results, $row[0];
   
}


foreach(@arr_of_results) {
print $_ . "\n";
   my $lat_lower_limit = 32;
   my $lat_upper_limit = 42;
   my $long_lower_limit = 80;
   my $long_upper_limit = 100;

   my $random_long = int(rand($long_upper_limit-$long_lower_limit)) + $long_lower_limit;
   $random_long = $random_long * (-1);
   my $random_lat = int(rand($lat_upper_limit-$lat_lower_limit)) + $lat_lower_limit;
   
   $update_sth->bind_param(1,$random_lat);
   $update_sth->bind_param(2,$random_long);
   $update_sth->bind_param(3,$_);
   
   $update_sth->execute(); 
   die $update_dbh->errstr."\n" if $update_sth->err;
      $update_sth->finish;
  

 
  
   
 }

 
 $read_dbh->disconnect();
$update_dbh->disconnect();