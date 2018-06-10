package WebService::Pokemon::APIResourceList;

use utf8;
use strictures 2;
use namespace::clean;

use Moo;
use Types::Standard qw(ArrayRef);
use Test::More;

with 'WebService::Pokemon::Role::APIResource';

our $VERSION = '0.09';


has names => (
    isa => ArrayRef,
    is  => 'ro',
    lazy => 1,
    builder => 1,
);

sub _build_names {
    my ($self) = @_;

    return [ map { $_->{name} } @{$self->results} ];
}

has urls => (
    isa => ArrayRef,
    is  => 'ro',
    lazy => 1,
    builder => 1,
);

sub _build_urls {
    my ($self) = @_;

    return [ map { $_->{url} } @{$self->results} ];
}


1;
__END__
