package MyApp::Controller::Example;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub foo {
  my $self = shift;

  # Render template "example/welcome.html.ep" with message
  $self->render('home/foo');
}

sub time {
  my $self = shift;

  # Render template "example/welcome.html.ep" with message
  $self->render('home/time');
}


1;
