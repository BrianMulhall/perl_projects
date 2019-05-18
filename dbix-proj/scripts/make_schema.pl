use strict;
use warnings;
use DBIx::Class::Schema::Loader qw(make_schema_at);


my @dsn = qw/DBI:mysql:database=dbix;host=localhost:3306 brian_mulhall Shuvit77!/;

my %options = (
    dump_directory => './lib'
);
make_schema_at('App::Schema' => \%options, \@dsn);