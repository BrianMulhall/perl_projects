use strict;
use warnings;
use DBI;
use v5.28.1;

#!/usr/bin/perl -w # # ch04/listdsns: Enumerates all data sources and all installed drivers # use DBI; 
 
### Probe DBI for the installed drivers 
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
my $mssql_dsn = qq(dbi:ODBC:desktop_mssqlserver);


# make the object you interact with the db with
my $mssql_dbh = DBI->connect($mssql_dsn,{ RaiseError => 1}) or die DBI->errstr;

my $sqlStatement = qq(select * from [dbo].[Person]);      # the query to execute

my $mssql_sth = $mssql_dbh->prepare($sqlStatement);          # prepare the query
$mssql_sth->execute();   


my $i = 0;                     # execute the query
my @row;
while (@row = $mssql_sth->fetchrow_array) {  # retrieve one row
    say "@row"	;
	$i++;
}

### Now, disconnect from the database 
$mssql_dbh->disconnect or warn "Disconnection failed: $DBI::errstr\n"; 






my $mysql_dsn = qq(dbi:ODBC:desktop_mysql);

# make the object you interact with the db with
my $mysql_dbh = DBI->connect($mysql_dsn,"root","Shuvit77!",{ RaiseError => 1}) or die DBI->errstr;

$sqlStatement = qq(select * from PerlMongersNOLADB.Members);      # the query to execute

my $mysql_sth = $mysql_dbh->prepare($sqlStatement);          # prepare the query
$mysql_sth->execute();   

$i = 0;                     # execute the query
@row;
while (@row = $mysql_sth->fetchrow_array) {  # retrieve one row
    say "@row"  ;
  $i++;
}

### Now, disconnect from the database 
$mysql_dbh->disconnect or warn "Disconnection failed: $DBI::errstr\n";