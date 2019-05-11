use 5.006;
use strict;
use warnings;
use Module::Build;
Module::Build->VERSION('0.4004');

my $builder = Module::Build->new(
    module_name         => 'Horse',
    license             => 'mit',
    dist_author         => q{Brian Mulhall <brian.e.mulhall@gmail.com>},
    dist_version_from   => 'lib/Horse.pm',
    release_status      => 'stable',
    configure_requires => {
        'Module::Build' => '0.4004',
    },
    test_requires => {
        'Test::More' => '0',
    },
    requires => {
        #'ABC'              => '1.6',
        #'Foo::Bar::Module' => '5.0401',
    },
    add_to_cleanup     => [ 'Horse-*' ],
);

$builder->create_build_script();
