
package VANAMBURG::MAGIC::BCS;
use v5.10;
use Moose;
extends 'VANAMBURG::MAGIC::DECK::SHoCkeD';

our $VERSION = '1.0.1';

=head1 VANAMBURG::MAGIC::BCS

Models Richard Osterlinds Breakthrough Card System for the purpose
of providing a training system and trick simulations.

=cut

sub BUILD {
    my $self       = shift;

    my $first_card = VANAMBURG::MAGIC::Card->new(
        value => $self->ace,
        suit  => $self->spades,
        stack_number => 1
    );
    $self->add_card($first_card);
    my $last_card = $first_card;
    for ( 2 .. 52 ) {
        $DB::single = 2;
        $last_card  = $self->calc_next_card($last_card);
        $self->add_card($last_card);
    }

}

sub _calc_suit {
    my ( $self, $prev_card, $new_value ) = @_;
    given ( $new_value->value ) {
        when ( [ 1, 2, 3 ] ) { return $prev_card->suit; }
        when ( [ 4, 5, 6 ] ) {
            return $self->_opposite_suit( $prev_card->suit );
        }
        when ( [ 7, 8, 9 ] ) {
            return $self->_previous_suit( $prev_card->suit );
        }
        when ( [ 10, 11, 12, 13 ] ) {
            return $self->_next_suit( $prev_card->suit );
        }
    }
}

sub calc_next_card {
    my ( $self, $card ) = @_;

    my $next_val_index =
      ( ( ( ( $card->value->value * 2 ) % 13 ) + $card->suit->value ) % 13 ) -
      1;
    $DB::single = 2;

    my $next_value = $self->value_cycle->[$next_val_index];
    my $next_suit = $self->_calc_suit( $card, $next_value );
    VANAMBURG::MAGIC::Card->new(
        value => $next_value,
        suit  => $next_suit,
        stack_number => $card->stack_number + 1,
    );
}

1;
