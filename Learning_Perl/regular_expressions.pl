use strict;
use warnings;
use v5.28.1;


#unlink("learning_perl.pl");

opendir(DIR, ".") || die "cannot open the current directory $!";
my @files = readdir(DIR);

foreach my $file (@files){

  say $file;

}



my $file_name = "index.html";
my $new_file_name = "learning_perl.pl";

open FILE, '>'.$file_name;
close FILE;

rename $file_name, $new_file_name || warn "Cannot rename the file $!";


rewinddir DIR;
@files = readdir(DIR);
foreach my $file (@files){

  say $file;

}




#close FILE;
close DIR;



