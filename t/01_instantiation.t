use strict;
use warnings;
use utf8;

use Test::More;

use WebService::Pokemon;

my $pokemon;

$pokemon = WebService::Pokemon->new;
is(ref $pokemon, 'WebService::Pokemon', 'expect object instantiate through new');
is($pokemon->api_url, 'https://pokeapi.co/api/v2', 'expect API URL match');

$pokemon = WebService::Pokemon->new(api_url => 'http://localhost/api/v2');
is($pokemon->api_url, 'http://localhost/api/v2', 'expect new API URL match');

done_testing;
