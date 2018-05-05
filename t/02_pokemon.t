use strict;
use warnings;
use utf8;

use Test::More;

use Webservice::Pokemon;

my ($pokemon, $got);

$pokemon = Webservice::Pokemon->new;
$got = $pokemon->pokemon(id => 1);

my $content = $got->{content};
cmp_ok(scalar keys %$content, '>', 0, 'expect fields found');

done_testing;
