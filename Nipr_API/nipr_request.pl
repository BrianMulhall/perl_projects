use strict;
use warnings;
use v5.28.1;
use LWP::Simple;
use Log::Log4perl;
 

   # Configuration in a string ...
my $conf = q(
  log4perl.rootLogger                = INFO, Logfile
 
  log4perl.appender.Logfile          = Log::Log4perl::Appender::File
  log4perl.appender.Logfile.filename = perl_app.log
  log4perl.appender.Logfile.layout   = Log::Log4perl::Layout::PatternLayout
  log4perl.appender.Logfile.layout.ConversionPattern = [%r] %F %L %m%n
 
);
 
   # ... passed as a reference to init()
Log::Log4perl::init( \$conf );

my $log = Log::Log4perl->get_logger("Logfile");

$log->debug("Debug Message");

 $browser->credentials(
    'reports.mybazouki.com:80',
    'web_server_usage_reports',
    'plinky' => 'banjo123'
  );