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
is(ref $got, 'WebService::Pokemon::NamedAPIResource', 'expect data class type');
is(ref $got->api, 'WebService::Pokemon', 'expect api class type');
is($got->{name}, 'cheri', 'expect resource name match');

$got = $api->resource('berry');
is(ref $got, 'WebService::Pokemon::APIResourceList', 'expect class type');
is($got->{count}, 64, 'expect resource count tally');
is($got->{next}, 'https://pokeapi.co/api/v2/berry/?limit=20&offset=20', 'expect next URL found');
is(scalar @{$got->names}, 20, 'expect resource name count tally');
is(scalar @{$got->urls}, 20, 'expect resource url count tally');

$got = $api->resource('berry');
is($got->{count}, 64, 'expect resource count tally for second call');

done_testing;
