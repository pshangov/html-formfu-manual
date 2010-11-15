#!C:\strawberry\perl\bin\perl.exe -w
use strict;
use warnings;
use Test::More tests => 2;

BEGIN { use_ok 'Catalyst::Test', 'FormFu' }

ok( request('/')->is_success, 'Request should succeed' );
