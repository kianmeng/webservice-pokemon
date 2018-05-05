package Webservice::Pokemon;

use 5.008_005;
use strict;
use warnings;

use Moo;

with 'Web::API';

our $VERSION = '0.01';

sub commands {
    my ($self) = @_;
    return $self->commands;
}


1;
__END__

=encoding utf-8

=head1 NAME

Webservice::Pokemon - A module to access the Pokémon data through RESTful API
from http://pokeapi.co.

=head1 SYNOPSIS

  use Webservice::Pokemon;

=head1 DESCRIPTION

Webservice::Pokemon is a Perl client helper library for the Pokemon API (pokeapi.co).

=head1 DEVELOPMENT

Setting up the required packages.

    $ cpanm Dist::Milla
    $ milla listdeps --missing | cpanm

Check you code coverage.

    $ milla cover

Several ways to run the test.

    $ milla test
    $ milla test --release
    $ RELEASE_TESTING=1 milla test
    $ RELEASE_TESTING=1 milla run prove t/01_instantiation.t

Release the module.

    $ milla build
    $ milla release

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2018 by Kian Meng, Ang.

This is free software, licensed under:

    The Artistic License 2.0 (GPL Compatible)

=head1 AUTHOR

Kian Meng, Ang E<lt>kianmeng@users.noreply.github.comE<gt>
