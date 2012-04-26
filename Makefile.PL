use ExtUtils::MakeMaker;
WriteMakefile(
		NAME	=> 'Acme::Pony',
    META_MERGE => {
        license => 'other',
        resource => {
	    repository => 'https://github.com/DrHyde/perl-modules-Acme-Pony'
        }
    },
		VERSION => '1.00',

	     );
