use ExtUtils::MakeMaker;
WriteMakefile(
		NAME	=> 'Acme::Pony',
    META_MERGE => {
        license => 'other',
        resources => {
	    repository => 'https://github.com/DrHyde/perl-modules-Acme-Pony',
	    bugtracker => 'https://github.com/DrHyde/perl-modules-Acme-Pony/issues'
        }
    },
		VERSION => '1.00',

	     );
