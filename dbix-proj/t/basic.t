use strict;
use warnings;

use Test::More;

# Check the schema exists
use_ok('App::Schema');

my $schema  = App::Schema->connect(qw/dbi:mysql:dbname=dbix  brian_mulhall  Shuvit77!/);

my $users_rs = $schema->resultset('User');

my $newname = $schema->resultset('User')->create(
{
   age => 35,
   firstname => 'Brian',
   lastname => 'Mulhall',
});

ok($newname->in_storage(), "New record was created successfully");

# Check custom accessors are defined
can_ok($users_rs->result_class, qw(fullname));
is($users_rs->find(2)->fullname, 'Sarah Connor', 'Should read from set using custom accessor');

# Check custom methods are defined
can_ok($users_rs, qw(age_less_than));
is($users_rs->age_less_than(34)->fullname,'Sarah Connor', 'Should perform search using custom method');
done_testing;