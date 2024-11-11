use strict;
use warnings;
use ExtUtils::MakeMaker 6.64;	# 6.64 for TEST_REQUIRES

my $dist = {
	COMPRESS => 'gzip -9f',
	SUFFIX => 'gz'
};

if($^O eq 'darwin') {
	$dist->{'TAR'} = 'gtar';
}

WriteMakefile(
    NAME                => 'CGI::Untaint::Twitter',
    AUTHOR              => q{Nigel Horne <njh@bandsman.co.uk>},
    VERSION_FROM        => 'lib/CGI/Untaint/Twitter.pm',
    ABSTRACT_FROM        => 'lib/CGI/Untaint/Twitter.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'GPL')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
	'CGI::Untaint' => 0,
	'Net::Twitter::Lite::WithAPIv1_1' => 0,
	}, TEST_REQUIRES => {
		'Test::DescribeMe' => 0,
		# 'Test::Kwalitee' => 0,
		'Test::Most' => 0,
		'Test::Needs' => 0,
		'Test::NoWarnings' => 0
	}, dist => $dist,
    clean               => { FILES => 'CGI-Untaint-Twitter-*' },
    META_MERGE		=> {
    	'meta-spec' => { version => 2 },
    	resources => {
    		repository => {
			type => 'git',
			url => 'git://github.com/nigelhorne/CGI-Untaint-Twitter.git',
			web => 'https://github.com/nigelhorne/CGI-Untaint-Twitter',
    		},
	},
    },
    MIN_PERL_VERSION	=> '5.6.2'	# Probably would work, but never tested on earlier versions than this
);
