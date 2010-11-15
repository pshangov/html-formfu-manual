package FormFu::Controller::Book;

use strict;
use warnings;

use parent qw(Catalyst::Controller::HTML::FormFu);

sub create :Local :FormConfig('book') {
	my ( $self, $c ) = @_;

	my $form = $c->stash->{form};

	if ( $form->submitted_and_valid ) {
		my $new_book = $c->model('Books::Book')->new_result({});
		$form->model->update($new_book);
		$c->response->redirect( $c->uri_for( $self->action_for('list')) );
 	}
}

sub edit :Local :Args(1) :FormConfig('book') {
	my ( $self, $c, $id ) = @_;

	my $form = $c->stash->{form};
	my $book = $c->model('Books::Book')->find({ id => $id });
	$c->detach('/default') unless $book;

	if ( $form->submitted_and_valid ) {
		$form->model->update($book);
		$c->response->redirect( $c->uri_for( $self->action_for('list')) );
 	} else {
		$form->model->default_values($book);
	}
}

sub list :Local {
	my ( $self, $c ) = @_;
	
	my @books = $c->model('Books::Book')->all;
	$c->stash->{books} = \@books;
}

1;
