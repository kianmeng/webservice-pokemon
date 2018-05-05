use strict;
use warnings;
use utf8;

use Test::More;

use Webservice::Pokemon;

my $pokemon;

$pokemon = Webservice::Pokemon->new;
is(ref $pokemon, 'Webservice::Pokemon', 'expect object instantiate through new');

done_testing;
