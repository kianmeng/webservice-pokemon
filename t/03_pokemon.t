use strict;
use warnings;
use utf8;

use Test::More;

use WebService::Pokemon;

my ($pokemon, $got);

$pokemon = WebService::Pokemon->new;
$got = $pokemon->pokemon(id => 1);

is($got->{name}, 'bulbasaur', 'expect pokemon found');

done_testing;
