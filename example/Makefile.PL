#!/usr/bin/perl -w
# IMPORTANT: if you delete this file your app will not work as
# expected.  You have been warned.

use inc::Module::Install;

name 'FormFu';
all_from 'lib/FormFu.pm';

requires 'Catalyst::Runtime' => '5.80026';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'Catalyst::Controller::HTML::FormFu';
requires 'Catalyst::Model::DBIC::Schema';
requires 'Catalyst::View::TT';
requires 'DBIx::Class::Candy';
requires 'DBIx::Class';
requires 'Path::Class';
requires 'parent';
requires 'Config::General';

catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
