use strict;
use warnings;
use utf8;

use CHI;
use Test::More;

use WebService::Pokemon;

my ($got, $expect, $url) = ('', '', '');

my $api = WebService::Pokemon->new(
    cache => CHI->new(
        driver => 'File',
        namespace => 'restcountries',
        root_dir => $ENV{PWD} . '/t/cache/',
    )
);

$url = 'https://pokeapi.co/api/v2/berry/?limit=20&offset=20';
$got = $api->resource_by_url($url);
is(ref $got, 'WebService::Pokemon::APIResourceList', 'expect class type');
is($got->{count}, 64, 'expect resource count tally');
is($got->{next}, 'https://pokeapi.co/api/v2/berry/?limit=20&offset=40', 'expect next URL found');

$url = 'https://pokeapi.co/api/v2/berry/1';
$got = $api->resource_by_url($url);
is(ref $got, 'WebService::Pokemon::NamedAPIResource', 'expect data class type');
is(ref $got->api, 'WebService::Pokemon', 'expect api class type');
is($got->{name}, 'cheri', 'expect resource name match');

done_testing;