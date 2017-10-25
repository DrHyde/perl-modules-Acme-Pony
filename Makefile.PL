use ExtUtils::MakeMaker;
WriteMakefile(
		NAME	=> 'Acme::Pony',
    META_MERGE => {
        license => 'open_source',
        resources => {
	    repository => 'https://github.com/DrHyde/perl-modules-Acme-Pony',
	    bugtracker => 'https://github.com/DrHyde/perl-modules-Acme-Pony/issues'
        }
    },
		VERSION => '1.00',

	     );
