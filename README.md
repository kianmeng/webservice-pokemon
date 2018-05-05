[![Build Status](https://travis-ci.org/kianmeng/webservice-pokemon.svg?branch=master)](https://travis-ci.org/kianmeng/webservice-pokemon)
[![codecov](https://codecov.io/gh/kianmeng/webservice-pokemon/branch/master/graph/badge.svg)](https://codecov.io/gh/kianmeng/webservice-pokemon)
[![Coverage Status](https://coveralls.io/repos/kianmeng/webservice-pokemon/badge.svg?branch=master)](https://coveralls.io/r/kianmeng/webservice-pokemon?branch=master)
[![Kwalitee status](http://cpants.cpanauthors.org/dist/Webservice-Pokemon.png)](http://cpants.charsbar.org/dist/overview/Webservice-Pokemon)
[![Cpan license](https://img.shields.io/cpan/l/Webservice-Pokemon.svg)](https://metacpan.org/release/Webservice-Pokemon)
[![Cpan version](https://img.shields.io/cpan/v/Webservice-Pokemon.svg)](https://metacpan.org/release/Webservice-Pokemon)

# NAME

Webservice::Pokemon - A module to access the Pokémon data through RESTful API
from http://pokeapi.co.

# SYNOPSIS

    use WebService::Pokemon;

# DESCRIPTION

Webservice::Pokemon is a Perl client helper library for the Pokemon API (pokeapi.co).

# DEVELOPMENT

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

Release the module.

    $ milla build
    $ milla release

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2018 by Kian Meng, Ang.

This is free software, licensed under:

    The Artistic License 2.0 (GPL Compatible)

# AUTHOR

Kian Meng, Ang <kianmeng@users.noreply.github.com>
