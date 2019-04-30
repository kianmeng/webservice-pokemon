[![Build Status](https://travis-ci.org/kianmeng/webservice-pokemon.svg?branch=master)](https://travis-ci.org/kianmeng/webservice-pokemon)
[![Cpan license](https://img.shields.io/cpan/l/WebService-Pokemon.svg)](https://metacpan.org/release/WebService-Pokemon)
[![Cpan version](https://img.shields.io/cpan/v/WebService-Pokemon.svg)](https://metacpan.org/release/WebService-Pokemon)

# NAME

WebService::Pokemon - Perl library for accessing the Pokémon data,
http://pokeapi.co.

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

Source repository at [https://github.com/kianmeng/webservice-pokemon](https://github.com/kianmeng/webservice-pokemon).

How to contribute? Follow through the [CONTRIBUTING.md](https://github.com/kianmeng/webservice-pokemon/blob/master/CONTRIBUTING.md) document to setup your development environment.

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

### autoload

Set this if you want to expand all fields point to external URL.

    # Instantiate the class by setting the URL of the API endpoints.
    my $pokemon_api = WebService::Pokemon->new({autoload => 1});

    # Or after the object was created.
    my $pokemon_api = WebService::Pokemon->new;
    $pokemon_api->autoload(1);
    $pokemon_api->resource('berry');

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

## resource\_by\_url($url)

Get the details of a particular resource by full URL.

    # Get paginated list of available berry resource with default item size.
    my $berries = $pokemon_api->resource_by_url('https://pokeapi.co/api/v2/berry/');

    # Get paginated list of available berry resource with explicit default item size.
    my $berries = $pokemon_api->resource_by_url('https://pokeapi.co/api/v2/berry/?limit=20&offset=40');

    # Get particular berry resource.
    my $berry = $pokemon_api->resource_by_url('https://pokeapi.co/api/v2/berry/1');

# AUTHOR

Kian Meng, Ang <kianmeng@cpan.org>

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2018-2019 by Kian Meng, Ang.

This is free software, licensed under:

    The Artistic License 2.0 (GPL Compatible)
