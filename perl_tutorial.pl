use strict;
use warnings;
use diagnostics;

use v5.28.1;

use Proc::Find qw(find_proc proc_exists);


# list all of a user's processes
my $procs = find_proc(user=>'me', detail=>1);
 
say $procs;
# check if a program is running
# die "Sorry, xscreensaver is not running" unless proc_exists(name=>'xscreensaver').













