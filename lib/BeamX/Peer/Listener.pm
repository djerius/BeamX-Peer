package BeamX::Peer::Listener;

use Types::Standard ':all';
use Moo;

our $VERSION = '0.003';

extends 'Beam::Listener';

=attr peer

An optional reference to a peer object, allowing the emitter to
send it an event directly using L<BeamX::Emitter::send>.  The 
object must consume the B<BeamX::Emitter> role.

=cut

=method has_peer

  $bool = $self->has_peer();

This returns true if the object's peer attribute has been set

=cut

has peer => (
    is       => 'ro',
    weak_ref => 1,
    isa      => ConsumerOf ['BeamX::Peer::Emitter'],
    predicate => 1
);

1;

# COPYRIGHT

__END__

=head1 SYNOPSIS

  # optional peer
  %args = ( peer => $peer );
  $emitter->subscribe( $event_name, $subref, %args );


=head1 DESCRIPTION

This is the default Listener object created by the
L<BeamX::Emitter::subscribe> method when a callback subscription is
registered.  It sub-classes L<Beam::Listener>.
