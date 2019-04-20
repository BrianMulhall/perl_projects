use strict;
use warnings;
use v5.28.1;
use LWP::Simple;
use Log::Log4perl;
 
 
# ... passed as a reference to init()
Log::Log4perl->init("log.conf");

my $log = Log::Log4perl->get_logger("Logfile");

$log->error("First Message");
$log->error("Debug Message");
$log->error("Info message");
$log->error("Error message");

