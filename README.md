[![Build Status](https://travis-ci.org/kianmeng/webservice-pokemon.svg?branch=master)](https://travis-ci.org/kianmeng/webservice-pokemon)
[![codecov](https://codecov.io/gh/kianmeng/webservice-pokemon/branch/master/graph/badge.svg)](https://codecov.io/gh/kianmeng/webservice-pokemon)
[![Coverage Status](https://coveralls.io/repos/kianmeng/webservice-pokemon/badge.svg?branch=master)](https://coveralls.io/r/kianmeng/webservice-pokemon?branch=master)
[![Kwalitee status](http://cpants.cpanauthors.org/dist/WebService-Pokemon.png)](http://cpants.charsbar.org/dist/overview/WebService-Pokemon)
[![Cpan license](https://img.shields.io/cpan/l/WebService-Pokemon.svg)](https://metacpan.org/release/WebService-Pokemon)
[![Cpan version](https://img.shields.io/cpan/v/WebService-Pokemon.svg)](https://metacpan.org/release/WebService-Pokemon)

# NAME

WebService::Pokemon - A module to access the Pokémon data through RESTful API
from http://pokeapi.co.

# SYNOPSIS

    use WebService::Pokemon;

    my $pokemon_api = WebService::Pokemon->new;
    my $pokemon = $pokemon_api->pokemon(id => 1);

# DESCRIPTION

WebService::Pokemon is a Perl client helper library for the Pokemon API (pokeapi.co).

# DEVELOPMENT

Source repo at [https://github.com/kianmeng/webservice-pokemon](https://github.com/kianmeng/webservice-pokemon).

## Docker

If you have Docker installed, you can build your Docker container for this
project.

    $ docker build -t webservice-pokemon .
    $ docker run -it -v $(pwd):/root webservice-pokemon bash
    # cpanm --installdeps --notest .

## Milla

Setting up the required packages.

    $ milla authordeps --missing | cpanm
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

# METHODS

## new(\[%$args\])

Construct a new WebService::Pokemon instance. Optionally takes a hash or hash reference.

    # Instantiate the class.
    my $pokemon_api = WebService::Pokemon->new;

### base\_url

The URL of the API resource.

    # Instantiate the class by setting the URL of the API endpoints.
    my $pokemon_api = WebService::Pokemon->new({api_url => 'http://example.com/api/v2'});

### api\_version

The API version of the API endpoints. By default, the API version was set to
'v2'.

    # Instantiate the class by setting the API version.
    my $pokemon_api = WebService::Pokemon->new({api_version => 'v1'});

## api\_version

Get the current API version of the web service.

    my $version = $pokemon_api->api_version();

    # Change the API version.
    $pokemon_api->api_version('v1');

## pokemon

Get the details of a particular Pokémon either by id or name.

    my $pokemon = $pokemon_api->pokemon(id => 1);
    my $pokemon = $pokemon_api->pokemon(id => 'bulbasaur');

## berry

Get the details of a particular berry either by id or name.

    my $pokemon = $pokemon_api->berry(id => 1);
    my $pokemon = $pokemon_api->berry(id => 'cheri');

## berry\_firmness

Get the details of a particular berry firmness either by id or name.

    my $pokemon = $pokemon_api->berry_firmness(id => 1);
    my $pokemon = $pokemon_api->berry_firmness(id => 'very-soft');

## berry\_flavor

Get the details of a particular berry flavor either by id or name.

    my $pokemon = $pokemon_api->berry_firmness(id => 1);
    my $pokemon = $pokemon_api->berry_firmness(id => 'spicy');

## commands

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2018 by Kian Meng, Ang.

This is free software, licensed under:

    The Artistic License 2.0 (GPL Compatible)

# AUTHOR

Kian Meng, Ang <kianmeng@users.noreply.github.com>
