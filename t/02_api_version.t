use strict;
use warnings;
use utf8;

use Test::More;

use WebService::Pokemon;

my ($pokemon, $got);

$pokemon = WebService::Pokemon->new;

$got = $pokemon->api_version;
is($got, 'v2', 'expect API version match');

done_testing;
