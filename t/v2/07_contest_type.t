use strict;
use warnings;
use utf8;

use Test::More;

use WebService::Pokemon;

my ($poke_api, $got);

$poke_api = WebService::Pokemon->new;

$got = $poke_api->contest_type(id => 1);
is($got->{name}, 'cool', 'expect cool found by id');

$got = $poke_api->contest_type(id => 9_999_999_999);
is($got, undef, 'expect cool not found');

$got = $poke_api->contest_type(id => 'cool');
is($got->{name}, 'cool', 'expect cool found by name');

my ($result_a, $result_b);

$got = $poke_api->contest_types();
$result_a = $got->{results};

$got = $poke_api->contest_types(limit => 20, offset => 0);
$result_b = $got->{results};

is_deeply($result_a, $result_b, 'expect default options set');

done_testing;
