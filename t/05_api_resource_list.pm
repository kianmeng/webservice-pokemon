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

$got = $api->resource('berry');
is(scalar %{$got->results->[0]}, 2, 'expect no autoload of each results items');

$api->autoload(1);
$got = $api->resource('berry');
is(scalar %{$got->results->[0]}, 15, 'expect autoload of each results item');

done_testing;
