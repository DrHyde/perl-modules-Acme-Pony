use ExtUtils::MakeMaker;
WriteMakefile(
		NAME	=> 'Acme::Pony',
    META_ADD => {
        license => 'open_source',
},
META_MERGE => {
        resources => {
	    repository => 'https://github.com/DrHyde/perl-modules-Acme-Pony',
	    bugtracker => 'https://github.com/DrHyde/perl-modules-Acme-Pony/issues'
        }
    },
		VERSION => '1.00',

	     );
