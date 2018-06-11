package WebService::Pokemon::NamedAPIResource;

use utf8;
use strictures 2;
use namespace::clean;

use Moo;
use Types::Standard qw(Bool HashRef InstanceOf);

our $VERSION = '0.09';


has api => (
    isa => InstanceOf['WebService::Pokemon'],
    is => 'rw',
);

has response => (
    isa => HashRef,
    is  => 'rw',
);

sub BUILD {
    my ($self, $args) = @_;

    foreach my $arg (keys %$args) {
        $self->$arg($args->{$arg}) if (defined $args->{$arg});
    }

    foreach my $arg (keys %{$self->response}) {
        $self->meta->add_attribute($arg => ( is => 'rw', lazy => 1, builder => 1 ));
        $self->$arg($self->response->{$arg});
    }

    return $self;
}


1;
__END__
