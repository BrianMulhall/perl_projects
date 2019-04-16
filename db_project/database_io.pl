use strict;
use warnings;
use DBI;
use v5.28.1;

#!/usr/bin/perl -w # # ch04/listdsns: Enumerates all data sources and all installed drivers # use DBI; 
 
# ### Probe DBI for the installed drivers 
# my @drivers = DBI->available_drivers(); 

# die "No drivers found!\n" unless @drivers; # should never happen 
 
# ### Iterate through the drivers and list the data sources for each one 
# foreach my $driver ( @drivers ) {     
# 	print "Driver: $driver\n";     
# 	my @dataSources = DBI->data_sources( $driver );     
# 	foreach my $dataSource ( @dataSources ) {         
# 		print "\tData Source is $dataSource\n";    
# 	}     
# 	print "\n"; } 
 
# create the data source that we are connecting to
my $dsn = qq(dbi:ODBC:desktop_db);

# make the object you interact with the db with
my $dbh = DBI->connect($dsn,{ RaiseError => 1}) or die DBI->errstr;

my $sqlStatement = qq(select * from [dbo].[Person]);      # the query to execute

my $sth = $dbh->prepare($sqlStatement);          # prepare the query
$sth->execute();   


my $i = 0;                     # execute the query
my @row;
while (@row = $sth->fetchrow_array) {  # retrieve one row
    say "@row"	;
	$i++;
}

print "Number of records is equal to : " . $i;
### Now, disconnect from the database 
$dbh->disconnect or warn "Disconnection failed: $DBI::errstr\n"; 


