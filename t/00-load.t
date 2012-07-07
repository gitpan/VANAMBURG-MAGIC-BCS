#!perl 

use Test::More qw/no_plan/;
use FindBin;

use lib "$FindBin::Bin/../lib";
BEGIN {
    use_ok( 'VANAMBURG::MAGIC::BCS' ) || print "Bail out!";
}

my $bcs = VANAMBURG::MAGIC::BCS->new;
ok($bcs->card_count == 52, 'deck has 52 cards');


