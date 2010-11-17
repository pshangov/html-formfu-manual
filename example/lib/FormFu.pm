package FormFu;

use strict;
use warnings;

use Catalyst::Runtime 5.80;
use FindBin     qw();
use Path::Class qw(file dir);
use parent      qw(Catalyst);
use Catalyst    qw(-Debug Static::Simple);

our $VERSION = '0.01';

my $dbfile = file( $FindBin::Bin, qw( .. root db books.db ) );

__PACKAGE__->config( 

	name => 'FormFu',

	'View::TT' => {
		TEMPLATE_EXTENSION => '.tt',
		INCLUDE_PATH => dir( $FindBin::Bin, qw( .. root tmpl ) ),
		CATALYST_VAR => 'c',	
	},
	
	'Model::Books' => {
		schema_class => 'Books',
		connect_info => {
			dsn => "dbi:SQLite:dbname=$dbfile"
		}
	},
    
	'Controller::HTML::FormFu' => {
		constructor => {
			config_file_path => dir( $FindBin::Bin, qw( .. root forms ) ),
		},
		model_stash => {
			schema => 'Books',
		}
	},
);

__PACKAGE__->setup();

1;
