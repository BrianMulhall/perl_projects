package MyApp;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Load configuration from hash returned by config file
  my $config = $self->plugin('Config');

  # Configure the application
  $self->secrets($config->{secrets});


  my $log = $self->log;
  $log->debug('It works');


  # Router
  my $r = $self->routes;
  # Normal route to controller
  $r->get('/')->to(controller => 'home', action => 'index');
  $r->get('/foo')->to(controller => 'home', action => 'foo');
  $r->get('/time')->to(controller => 'home', action => 'time');

  
}

1;
