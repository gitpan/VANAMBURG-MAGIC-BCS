use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'VANAMBURG::MAGIC::BCS',
    AUTHOR       => q{Gordon Van Amburg <vanamburg@cpan.org>},
    VERSION_FROM => 'lib/VANAMBURG/MAGIC/BCS.pm',
    ABSTRACT =>
      "Models Richard Osterlind's Breakthrough Card System for simulations.",
    EXE_FILES => [ 'bin/eblazy.pl', 'bin/bcstrainer.pl' ],
    ( $ExtUtils::MakeMaker::VERSION >= 6.3002
        ? ( 'LICENSE' => 'perl' )
        : () ),
    PL_FILES  => {},
    PREREQ_PM => { 'Test::More' => 0, 'List::MoreUtils' => 0, 'Moose' => 0 },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES    => 'VANAMBURG-MAGIC-BCS-*' },
);
