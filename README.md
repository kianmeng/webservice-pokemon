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

    # By id.
    my $pokemon = $pokemon_api->resource('berry', 1);

    # By name.
    my $pokemon = $pokemon_api->resource('berry', 'cheri');

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

Release the module.

    $ milla build
    $ milla release

# METHODS

## new(\[%$args\])

Construct a new WebService::Pokemon instance. Optionally takes a hash or hash reference.

    # Instantiate the class.
    my $pokemon_api = WebService::Pokemon->new;

### api\_url

The URL of the API resource.

    # Instantiate the class by setting the URL of the API endpoints.
    my $pokemon_api = WebService::Pokemon->new({api_url => 'http://example.com/api/v2'});

    # Or after the object was created.
    my $pokemon_api = WebService::Pokemon->new;
    $pokemon_api->api_url('http://example.com/api/v2');

### cache

The cache directory of the HTTP reponses. By default, all cached data is stored
as files in /tmp/cache/.

    # Default cache engine is file-based storage.
    my $pokemon_api = WebService::Pokemon->new;

    # Or we define our custom cache engine with settings.
    my $pokemon_api = WebService::Pokemon->new(
        cache => CHI->new(
            driver => 'File',
            namespace => 'restcountries',
            root_dir => $ENV{PWD} . '/tmp/cache/',
        )
    );

    # Or after the object was created.
    my $pokemon_api = WebService::Pokemon->new;
    $pokemon_api->cache(
        cache => CHI->new(
            driver => 'File',
            namespace => 'restcountries',
            root_dir => $ENV{PWD} . '/tmp/cache/',
        )
    );

## resource($resource, \[$name\], \[$limit\], \[$offset\])

Get the details of a particular resource with optional id or name; limit per
page, or offset by the record list.

    # Get paginated list of available berry resource.
    my $berry = $pokemon_api->resource('berry');

    # Or by page through limit and pagination.
    my $berry = $pokemon_api->resource('berry', undef, 60, 20);

    # Get by id.
    my $berry_firmness = $pokemon_api->resource('berry-firmnesses', 1);

    # Get by name.
    my $berry_firmness = $pokemon_api->resource('berry-firmnesses', 'very-soft');

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2018 by Kian Meng, Ang.

This is free software, licensed under:

    The Artistic License 2.0 (GPL Compatible)

# AUTHOR

Kian Meng, Ang <kianmeng@users.noreply.github.com>
