use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('MyApp');

$t->get_ok('/foo')->status_is(200);
$t->get_ok('/time')->status_is(200);

done_testing();
