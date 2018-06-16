use strict;
use warnings;
use utf8;

use CHI;
use Test::More;

use WebService::Pokemon;

my ($got, $expect) = ('', '');

my $api = WebService::Pokemon->new(
    cache => CHI->new(
        driver => 'File',
        namespace => 'restcountries',
        root_dir => $ENV{PWD} . '/t/cache/',
    )
);

$got = $api->resource('berry', 1);
$expect = 'WebService::Pokemon::NamedAPIResource';
is(ref $got->flavors->[0], $expect, 'expect URL convert to right class');

done_testing;
