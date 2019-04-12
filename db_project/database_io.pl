use strict;
use warnings;
use DBI;
use v5.28.1;

my @drivers = DBI->available_drivers;
print join(", ", @drivers), "\n";

my @dsns = DBI->data_sources('ODBC');
foreach my $d (@dsns)
{
  print "$d\n";
}


my $dbh = DBI->connect("DBI:ODBC:$myDSN",{ RaiseError => 1}) or die DBI->errstr;

my $sql = qq(select lastname from dbo.Resources where lastname is not null AND lastname != "" );      # the query to execute
my $sth = $dbh->prepare($sql);          # prepare the query
$sth->execute();   


my $i = 0;                     # execute the query
my @row;
while (@row = $sth->fetchrow_array) {  # retrieve one row
    print $row[0] . "\n";
	$i++;
}

print "Number of records is equal to : " . $i;
$dbh->disconnect();