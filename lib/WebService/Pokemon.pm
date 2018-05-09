package WebService::Pokemon;

use Mouse;
use Types::Standard qw/Str/;

use strictures 2;
use namespace::clean;

with 'Web::API';

use constant POKEAPI_DEFAULT_BASE_API_URL => 'http://pokeapi.co/api/';

our $VERSION = '0.03';


has 'api_version' => (
    is      => 'ro',
    isa     => Str,
    default => sub { 'v2' }
);

has 'commands' => (
    is      => 'rw',
    default => sub {
        {
            pokemon => { method => 'GET', require_id => 1, path => 'pokemon/:id/' },
        };
    },
);

around 'format_response' => sub {
    my ($method, $self, $response, $ct, $error) = @_;

    my $answer = $self->$method($response, $ct, $error);

    return ($answer->{code} == 200)
        ? $answer->{content}
        : undef;
};

sub commands {
    my ($self) = @_;

    return $self->commands;
}

sub BUILD {
    my ($self, $args) = @_;

    my $base_url = $args->{base_url} || POKEAPI_DEFAULT_BASE_API_URL;
    $base_url .= $self->api_version;

    $self->user_agent(__PACKAGE__ . ' ' . $VERSION);
    $self->base_url($base_url);
    $self->content_type('application/json');

    $self->debug(1) if ($ENV{LOGGING});

    return $self;
}


1;
__END__

=encoding utf-8

=head1 NAME

Webservice::Pokemon - A module to access the Pokémon data through RESTful API
from http://pokeapi.co.

=head1 SYNOPSIS

  use WebService::Pokemon;

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
    $ milla test --author --release
    $ AUTHOR_TESTING=1 RELEASE_TESTING=1 milla test
    $ AUTHOR_TESTING=1 RELEASE_TESTING=1 milla run prove t/01_instantiation.t
    $ LOGGING=1 milla run prove t/t/03_pokemon.t

Release the module.

    $ milla build
    $ milla release

=head1 METHODS

=head2 new([%$args])

Construct a new WebService::Pokemon instance. Optionally takes a hash or hash reference.

    # Instantiate the class.
    my $pokemon_api = WebService::Pokemon->new;

=head3 base_url

The URL of the API resource.

    # Instantiate the class by setting the URL of the API endpoints.
    my $pokemon_api = WebService::Pokemon->new({api_url => 'http://example.com/api/v2'});

=head2 api_version

Get the current API version of the web service.

    my $version = $pokemon_api->api_version();

=head2 pokemon

Get the details of a particular Pokémon.

    my $pokemon = $pokemon_api->pokemon(id => 1);

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2018 by Kian Meng, Ang.

This is free software, licensed under:

    The Artistic License 2.0 (GPL Compatible)

=head1 AUTHOR

Kian Meng, Ang E<lt>kianmeng@users.noreply.github.comE<gt>
