package WebService::Pokemon::Role::APIResource;

use utf8;
use strictures 2;
use namespace::clean;

use Moo::Role;
use Types::Standard qw(HashRef InstanceOf);

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

    $self->populate_attributes($args);

    foreach my $arg (keys %{$self->response}) {
        if (!$self->can($arg)) {
            $self->meta->add_attribute($arg => ( is => 'rw'));
            $self->$arg($self->response->{$arg});
        }
    }

    return $self;
}

sub populate_attributes {
    my ($self, $args) = @_;

    foreach my $arg (keys %$args) {
        $self->$arg($args->{$arg}) if (defined $args->{$arg});
    }
}

1;
__END__
