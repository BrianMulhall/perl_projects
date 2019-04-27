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
my $read_dbh = DBI->connect($dsn,{ RaiseError => 1}) or die DBI->errstr;
my $update_dbh = DBI->connect($dsn,{ RaiseError => 1}) or die DBI->errstr;

my $read_sql = qq(select Id from dbo.ClaimAssignments);      # the query to execute
my $read_sth = $read_dbh->prepare($read_sql);          # prepare the query
$read_sth->execute();   

my $update_sql = qq(update dbo.ClaimAssignments SET Latitude = ?, Longitude = ? where id = ?);
my  $update_sth =      $update_dbh->prepare($update_sql); 
 

# loop over the claimassignments record ids 
# and update each one's lat and longitude values with a randomly
# generated values   
my $index = 1;
while (my @row = $read_sth->fetchrow_array) {  

   my $lat_lower_limit = 32;
   my $lat_upper_limit = 42;
   my $long_lower_limit = 80;
   my $long_upper_limit = 100;

   my $random_long = (rand($long_upper_limit-$long_lower_limit)) + $long_lower_limit;
   $random_long = $random_long * (-1);
   my $random_lat = (rand($lat_upper_limit-$lat_lower_limit)) + $lat_lower_limit;
   
   $random_lat = sprintf("%.6f", $random_lat);
   $random_long = sprintf("%.6f", $random_long);
   
   $update_sth->bind_param(1,$random_lat);
   $update_sth->bind_param(2,$random_long);
   $update_sth->bind_param(3,$row[0]);
   
   $update_sth->execute(); 
   die $update_dbh->errstr."\n" if $update_sth->err;
   $update_sth->finish;
  
	print "reacord number " . $index . "\n";
	$index++;
 }

 # close the database connections
$read_dbh->disconnect();
$update_dbh->disconnect();