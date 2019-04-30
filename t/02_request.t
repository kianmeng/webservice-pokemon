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

$expect = undef;
$got = $api->_request();
is_deeply($got, $expect, 'expect empty response');

$got = $api->_request('berry');
is($got->{count}, 64, 'expect paginated list found');
is(scalar @{$got->{results}}, 20, 'expect default limit = 20 match');
is($got->{next}, 'https://pokeapi.co/api/v2/berry?offset=20&limit=20', 'expect default offset = 20 match');

use Data::Dumper;
$got = $api->_request('berry', 'cheri');
is($got->{name}, 'cheri', 'expect berry found');

$got = $api->_request('berry', 'cherri');
is($got, 'Not Found', 'expect berry not found');

done_testing;
