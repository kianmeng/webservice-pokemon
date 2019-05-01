use strict;
use warnings;
use utf8;

use Test::More;

use WebService::Pokemon;

my ($got, $expect) = ('', '');

my $api = WebService::Pokemon->new;

$got = $api->resource('berry', 1);
$expect = 'WebService::Pokemon::NamedAPIResource';
is(ref $got->flavors->[0], $expect, 'expect URL convert to right class');

done_testing;
