package WebService::Pokemon::APIResourceList;

use utf8;
use strictures 2;
use namespace::clean;

use Moo;
use Types::Standard qw(HashRef);


has api => (
    is => 'rw',
);

has response => (
    isa => HashRef,
    is  => 'rw',
);

sub _build_results {
    my $self = shift;
}

sub BUILD {
    my ($self, $args) = @_;

    foreach my $arg (keys %$args) {
        $self->$arg($args->{$arg}) if (defined $args->{$arg});
    }

    foreach my $arg (keys %{$self->response}) {
        if (!$self->can($arg)) {
            $self->meta->add_attribute($arg => ( is => 'rw'));
            $self->$arg($self->response->{$arg});
        }
    }

    return $self;
}


1;
__END__
