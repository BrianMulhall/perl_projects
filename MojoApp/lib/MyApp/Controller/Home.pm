package MyApp::Controller::Home;
use Mojo::Base 'Mojolicious::Controller';



sub index {
  my $self = shift;
  my $id     = $self->req->request_id;
  my $method = $self->req->method;
  my $url    = $self->req->url->to_abs;
  my $host   = $self->req->url->to_abs->host;

  $self->app->log->debug(qq/ request id: $id -- method: $method -- url: $url -- host: $host/ );
  # Render template "home/index.html.ep"
  $self->render('home/index');
}

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
