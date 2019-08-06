use strict;
use warnings;
use utf8;
use diagnostics;
use DBI;
use v5.28.1;

binmode STDOUT, ':utf8';

use File::Copy qw(move copy);

#data source defined here
my $dsn = qq(dbi:ODBC:NCA_Adjuster_Perl);

my $dbh   = DBI->connect($dsn,{ RaiseError => 1}) or die DBI->errstr;

my $sql = qq(SELECT [Lesson_Documents] .[Filename],[Lesson_Documents] .[Description],[Lessons_Document_Folders].[Name] as FolderName,[Lessons_Clients].[Name] as ClientName 
             FROM [Lesson_Documents] 
             left join [Lessons_Document_Folders] on [Lesson_Documents].FolderID = Lessons_Document_Folders.ID
             left join [Lessons_Clients] on [Lessons_Document_Folders].ClientID = [Lessons_Clients].ID);      # the query to execute

my $sth = $dbh->prepare($sql);                          # prepare the query
$sth->execute();   


my @file_records;

while (my @row = $sth->fetchrow_array) { 

   push (@file_records, {file_name => $row[0], client_name => $row[3] } );

 }


my $read_dir = q(C:\Users\bmulhall\Desktop\NewAdjusterFileShares\\);
my $write_dir = q(C:\Users\bmulhall\Desktop\LibraryDocuments\\);

opendir (READDIR, $read_dir) or die $!;

my @files = readdir(READDIR);


foreach my $el (@file_records){

     foreach my $file (@files) {

            if( $file eq $el->{"file_name"} ){
              
              my $folder_path = qq($write_dir$el->{"client_name"});

              $folder_path =~ s/\//-/;

              unless (-d $folder_path) {mkdir $folder_path; }
                  

              my $write_path = qq($folder_path\\$el->{"file_name"});
              my $read_path = qq($read_dir$file);

              say qq($folder_path);
              copy ($read_path,  $write_path) || warn "$!";
              
              last;
            }
      }
}

closedir(READDIR);


# close the database connections
$dbh->disconnect();
